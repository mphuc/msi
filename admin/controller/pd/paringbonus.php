<?php
class ControllerPdParingbonus extends Controller {
	public function index() {
		
		$this->document->setTitle('Deposit');
		$this->load->model('pd/registercustom');
		$data['self'] =$this;
		$page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;
		$this -> document -> addScript('../catalog/view/javascript/countdown/jquery.countdown.min.js');
		$this -> document -> addScript('../catalog/view/javascript/transaction/countdown.js');
		$limit = 10;
		$start = ($page - 1) * 10;

		$ts_history = $this -> model_pd_registercustom -> get_count_paringbonus();
		$data['self'] =  $this;
		$ts_history = $ts_history['number'];

		$pagination = new Pagination();
		$pagination -> total = $ts_history;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = $this -> url -> link('pd/paringbonus', 'page={page}&token='.$this->session->data['token'].'', 'SSL');
		$data['code'] =  $this-> model_pd_registercustom->get_all_paringbonus($limit, $start);
		$data['code_all'] =  $this-> model_pd_registercustom->get_all_paringbonus_all();
		$data['pagination'] = $pagination -> render();
		$block_io = new BlockIo(key, pin, block_version);
		$balances = $block_io->get_balance();
		$data['wallet'] = wallet; 
		$data['blance_blockio'] = $balances->data->available_balance;
		$data['blance_blockio_pending'] = $balances->data->pending_received_balance;


		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('pd/paringbonus.tpl', $data));
	}
	

	public function submit(){
        
        $this->load->model('pd/registercustom');
        $getCustomer = $this -> model_pd_registercustom -> getCustomer_commission();
        //print_r($getCustomer);die;
        foreach ($getCustomer as $value) {
       
	        if ((doubleval($value['total_pd_left']) > 0 && doubleval($value['total_pd_right'])) > 0)
	        {
	            if (doubleval($value['total_pd_left']) > doubleval($value['total_pd_right'])){

	                $balanced = doubleval($value['total_pd_right']);

	                $this -> model_pd_registercustom -> update_total_pd_left(doubleval($value['total_pd_left']) - doubleval($value['total_pd_right']), $value['customer_id']);
		                
		            $this -> model_pd_registercustom -> update_total_pd_right(0, $value['customer_id']);
	            }
	            else
	            {
	                $balanced = doubleval($value['total_pd_left']);

	                $this -> model_pd_registercustom -> update_total_pd_right(doubleval($value['total_pd_right']) - doubleval($value['total_pd_left']), $value['customer_id']);

		            $this -> model_pd_registercustom -> update_total_pd_left(0, $value['customer_id']);

	            }

	            $amounts_received = $balanced * 3 /100;

	            $this -> model_pd_registercustom -> update_m_Wallet_add_sub($amounts_received,$value['customer_id'], $add = true);

	            $get_M_Wallet = $this -> model_pd_registercustom -> get_M_Wallet($value['customer_id']);

                $this -> model_pd_registercustom -> saveTranstionHistory(
                    $value['customer_id'], 
                    "Commision Network", 
                    "+ ".($amounts_received/10000)." USD", 
                    "Commision Network 3%, From weak branch  ".(number_format($balanced/10000))." USD",
                    1,
                    $get_M_Wallet['amount']/10000, 
                    $url = ''
                ); 

                $this -> ch_downline($value['customer_id'],$amounts_received);
	            $this -> ch_upline($value['customer_id'],$amounts_received);
	        }
	    }

	    $this -> session -> data['complete_cn'] = "complete";
		$this -> response -> redirect($this -> url -> link('pd/dailyprofit&token='.$_GET['token']));
	     
    }

    public function ch_downline($customer_id,$amounts_received)
    {	
    	
    	$getCustomer = $this -> model_pd_registercustom -> getCustomer($customer_id);
    	$getCustomer_ml = $this -> model_pd_registercustom -> getCustomer_ml($customer_id);
    	$p_binary = $getCustomer_ml['p_binary'];
    	for ($i=1; $i <=6; $i++)
    	{
    		if ($p_binary != 0)
    		{
    			$getCustomer_ml_binary = $this -> model_pd_registercustom -> getCustomer_ml($p_binary);
    			if ($i%2 == 0)
    			{
		    		if ($getCustomer_ml_binary['level'] >= 2)
		    		{

	    				$amounts_receiveds = $amounts_received * 8 /100;

	    				$this -> model_pd_registercustom -> update_m_Wallet_add_sub($amounts_receiveds,$getCustomer_ml_binary['customer_id'], $add = true);

			            $get_M_Wallet = $this -> model_pd_registercustom -> get_M_Wallet($getCustomer_ml_binary['customer_id']);

			            $this -> model_pd_registercustom -> saveTranstionHistory(
			                $getCustomer_ml_binary['customer_id'], 
			                "Commision Resonance", 
			                "+ ".($amounts_receiveds/10000)." USD", 
			                "Commision Resonance Downline 8%, From ID ".$getCustomer['username']." F ".$i."receive  ".($amounts_received/10000)." USD",
			                1,
			                $get_M_Wallet['amount']/10000, 
			                $url = ''
			            ); 
			        }
    			}
    			
    		}
    		if ($p_binary == 0)
    		{
    			break;
    		}
    		$p_binary = $getCustomer_ml_binary['p_binary'];
    		
    	}
    }

    public function ch_upline($customer_id,$amounts_received)
    {
    	$getCustomer = $this -> model_pd_registercustom -> getCustomer($customer_id);
    	$getCustomer_ml = $this -> model_pd_registercustom -> getCustomer_ml($customer_id);

    	if ($getCustomer_ml['left'] != 0 && $getCustomer_ml['right'] != 0)
    	{

    		$amounts_receiveds = $amounts_received * 4 /100;

    		// left nhan
    		$getCustomer_ml_left = $this -> model_pd_registercustom -> getCustomer_ml($getCustomer_ml['left']);
    		if ($getCustomer_ml_left['level'] >= 2)
    		{
    			$this -> model_pd_registercustom -> update_m_Wallet_add_sub($amounts_receiveds,$getCustomer_ml['left'], $add = true);

	            $get_M_Wallet = $this -> model_pd_registercustom -> get_M_Wallet($getCustomer_ml['left']);

	            $this -> model_pd_registercustom -> saveTranstionHistory(
	                $getCustomer_ml['left'], 
	                "Commision Resonance", 
	                "+ ".($amounts_receiveds/10000)." USD", 
	                "Commision Resonance Upline 4%, From ID ".$getCustomer['username']." receive  ".($amounts_received/10000)." USD",
	                1,
	                $get_M_Wallet['amount']/10000, 
	                $url = ''
	            ); 
    		}
            

            // right nhan
    		$getCustomer_ml_right = $this -> model_pd_registercustom -> getCustomer_ml($getCustomer_ml['right']);
    		if ($getCustomer_ml_right['level'] >= 2)
    		{
	            $this -> model_pd_registercustom -> update_m_Wallet_add_sub($amounts_receiveds,$getCustomer_ml['right'], $add = true);

	            $get_M_Wallet = $this -> model_pd_registercustom -> get_M_Wallet($getCustomer_ml['right']);

	            $this -> model_pd_registercustom -> saveTranstionHistory(
	                $getCustomer_ml['right'], 
	                "Commision Resonance", 
	                "+ ".($amounts_receiveds/10000)." USD", 
	                "Commision Resonance Downline 4%, From ID ".$getCustomer['username']." receive  ".($amounts_received/10000)." USD",
	                1,
	                $get_M_Wallet['amount']/10000, 
	                $url = ''
	            ); 
	        }
    	}
    }
	
}