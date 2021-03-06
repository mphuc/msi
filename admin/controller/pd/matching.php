<?php
class ControllerPdMatching extends Controller {
	public function index() {
		
		$this->document->setTitle('Deposit');
		$this->load->model('pd/registercustom');
		$data['self'] =$this;
		
		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('pd/matching.tpl', $data));
	}
	
	public function get_username($customer_id){
		$this->load->model('pd/registercustom');
		return $this -> model_pd_registercustom -> get_username($customer_id);
	}
	public function get_blance_coinmax($customer_id){
		$this->load->model('pd/registercustom');
		$get_blance_coinmax = $this -> model_pd_registercustom -> get_wallet_coinmax_buy_customer_id($customer_id);
		return $get_blance_coinmax['amount'];
	}

	public function submit()
	{	
		if ($this -> request->post)
		{
			// get all user active
			$this->load->model('pd/registercustom');
			$get_all_user_active  = $this -> model_pd_registercustom -> get_all_user_active();
			foreach ($get_all_user_active as  $value) {
				
				// level child
				$percent_child = $this -> get_percent($value['total_pd_node'],$value['customer_id']);
				

				$getCustomer = $this -> model_pd_registercustom -> getCustomer_ml($value['customer_id']);
				$getCustomer_parent = $this -> model_pd_registercustom -> getCustomer_ml($getCustomer['p_node']);

				if (count($getCustomer_parent) > 0 && $getCustomer_parent['level'] >= 2)
				{
					// level parent
					$getCustomer_parent_customer  = $this -> model_pd_registercustom -> getCustomer($getCustomer['p_node']);

					$percent_parent = $this -> get_percent($getCustomer_parent_customer['total_pd_node'],$$getCustomer_parent_customer['customer_id']);

					if ($percent_parent - $percent_child > 0)
					{
						$percent = $percent_parent - $percent_child;

						$get_filled_by_id = $this -> model_pd_registercustom -> get_filled_by_id($getCustomer_parent['customer_id']);

						$amounts_received = $percent * ($getCustomer_parent_customer['p_node_pd'] - $get_filled_by_id['sum_filled'])/ 100;

						$this -> model_pd_registercustom -> update_m_Wallet_add_sub($amounts_received,$getCustomer_parent['customer_id'], $add = true);

		                $get_M_Wallet = $this -> model_pd_registercustom -> get_M_Wallet($getCustomer_parent['customer_id']);

		                $this -> model_pd_registercustom -> saveTranstionHistory(
		                    $getCustomer_parent['customer_id'], 
		                    "System commission", 
		                    "+ ".($amounts_received/10000)." USD", 
		                    "System commission ".$percent."%, total sales "." (".(($getCustomer_parent_customer['p_node_pd'] - $get_filled_by_id['sum_filled'])/10000)." USD)",
		                    1,
		                    $get_M_Wallet['amount']/10000, 
		                    $url = ''
		                );
					}

					if (($percent_parent == 15 && $percent_child == 15) || ($percent_parent == 18 && $percent_child == 18))
					{
						$percent = 1;
						
						$get_filled_by_id = $this -> model_pd_registercustom -> get_filled_by_id($getCustomer_parent['customer_id']);

						$amounts_received = $percent * ($getCustomer_parent_customer['p_node_pd'] - $get_filled_by_id['sum_filled'])/ 100;

						$this -> model_pd_registercustom -> update_m_Wallet_add_sub($amounts_received,$getCustomer_parent['customer_id'], $add = true);

		                $get_M_Wallet = $this -> model_pd_registercustom -> get_M_Wallet($getCustomer_parent['customer_id']);

		                $this -> model_pd_registercustom -> saveTranstionHistory(
		                    $getCustomer_parent['customer_id'], 
		                    "System commission", 
		                    "+ ".($amounts_received/10000)." USD", 
		                    "System commission ".$percent."%, total sales "." (".(($getCustomer_parent_customer['p_node_pd'] - $get_filled_by_id['sum_filled'])/10000)." USD)",
		                    1,
		                    $get_M_Wallet['amount']/10000, 
		                    $url = ''
		                );
					}

				}
			}

			$this -> model_pd_registercustom -> update_p_node_pd0();
			$this -> session -> data['complete_ht'] = "complete";
			$this -> response -> redirect($this -> url -> link('pd/dailyprofit&token='.$_GET['token']));
		}
	}

	public function get_percent($total_pd_node,$customer_id)
	{
		$percent = 5;
        if (doubleval($total_pd_node) >= 50000000)
        {
            $percent = 6;
        }
        if (doubleval($total_pd_node) >= 150000000)
        {
            $percent = 7;
        }
        if (doubleval($total_pd_node) >= 500000000)
        {
            $percent = 8;
        }
        if (doubleval($total_pd_node) >= 1000000000)
        {
            $percent = 9;
        }
        if (doubleval($total_pd_node) >= 2000000000)
        {
            $percent = 10;
        }
        if (doubleval($total_pd_node) >= 5000000000)
        {
            $percent = 11;
        }
        if (doubleval($total_pd_node) >= 10000000000)
        {
            $percent = 12;
        }
        if (doubleval($total_pd_node) >= 50000000000)
        {
            $percent = 13;
        }
        if (doubleval($total_pd_node) >= 100000000000)
        {
            $percent = 15;
        }
        if (doubleval($total_pd_node) >= 200000000000)
        {
            $percent = 18;
        }

        if ($percent ==15)
        {
            $percent = $this -> get_percent_langer($customer_id,15);
        }

        if ($percent ==18)
        {
            $percent = $this -> get_percent_langer($customer_id,18);
        }


        return $percent;
	}

	// percent 15 and 18
    public function get_percent_langer($customer_id,$percent)
    {
        //$this->load->model('account/customer');
        $get_childrend_all_tree = $this -> model_pd_registercustom -> count_child_langer($customer_id);
       
        $customer_curent = $this -> model_pd_registercustom ->getCustomer($customer_id);


        if (count($get_childrend_all_tree) > 0)
        {
            $total_child_pd = 0;
            foreach ($get_childrend_all_tree as  $value) {
                $customer = $this -> model_pd_registercustom ->getCustomer($value['customer_id']);
                $total_child_pd += $customer['total_pd_node'];
            }
            if (($customer_curent['total_pd_node'] - $total_child_pd) >= 30000000000)
            {
                $percents = $percent;
            }  
            else
            {
                if ($percent == 15)
                {
                    $percents = 13;
                }
                if ($percent == 18)
                {
                    $percents = 15;
                }
            } 
        }
        else
        {
            $percents = $percent;
        }
        return $percents;
    }
}