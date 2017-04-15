<?php
class ControllerPdLevel extends Controller {
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
			$get_all_user_all  = $this -> model_pd_registercustom -> get_all_user_all();
			
			foreach ($get_all_user_all as  $value) {
				$count_p_node = $this -> model_pd_registercustom -> count_p_node_pd_node($value['customer_id'],150000000);
				$star = 0;
				if (intval($count_p_node) >= 3)
				{
					$star = 1;
				}
				if (intval($count_p_node) >= 5)
				{
					$star = 2;
				}
				if (intval($count_p_node) >= 10)
				{
					$star = 3;
				}
				if (intval($count_p_node) >= 20)
				{
					$star = 4;
				}
				if (intval($count_p_node) >= 50)
				{
					$star = 5;
				}
				if (intval($count_p_node) >= 100)
				{
					$star = 6;
				}
				$this -> model_pd_registercustom -> update_star_customer_ml($value['customer_id'],$star);
				$count_p_node_star = $this -> model_pd_registercustom -> count_p_node_star($value['customer_id'],6);
				if (intval($count_p_node_star) >= 3)
				{
					$star = 7;
				}
				if (intval($count_p_node_star) >= 5)
				{
					$star = 8;
				}
				$this -> model_pd_registercustom -> update_star_customer_ml($value['customer_id'],$star);


				$getCustomer_ml = $this -> model_pd_registercustom -> getCustomer_ml($value['customer_id']);
				$amounts_receiveds = 0;
				if (intval($getCustomer_ml['star']) == 1)
				{
					$amounts_receiveds = 10000000;
				}
				if (intval($getCustomer_ml['star']) == 2)
				{
					$amounts_receiveds = 20000000;
				}
				if (intval($getCustomer_ml['star']) == 3)
				{
					$amounts_receiveds = 50000000;
				}
				if (intval($getCustomer_ml['star']) == 4)
				{
					$amounts_receiveds = 100000000;
				}
				if (intval($getCustomer_ml['star']) == 5)
				{
					$amounts_receiveds = 200000000;
				}
				if (intval($getCustomer_ml['star']) == 6)
				{
					$amounts_receiveds = 500000000;
				}
				if (intval($getCustomer_ml['star']) == 7)
				{
					$amounts_receiveds = 1500000000;
				}
				if (intval($getCustomer_ml['star']) == 8)
				{
					$amounts_receiveds = 5000000000;
				}
				if ($amounts_receiveds > 0)
				{
					$this -> model_pd_registercustom -> update_m_Wallet_add_sub($amounts_receiveds,$value['customer_id'], $add = true);

		            $get_M_Wallet = $this -> model_pd_registercustom -> get_M_Wallet($value['customer_id']);

		            $this -> model_pd_registercustom -> saveTranstionHistory(
		                $value['customer_id'], 
		                "Commision Rank", 
		                "+ ".($amounts_receiveds/10000)." USD", 
		                "Commision Rank ".($amounts_receiveds/10000)." USD",
		                1,
		                $get_M_Wallet['amount']/10000, 
		                $url = ''
		            );
				}
				 
			}

			$this -> session -> data['complete_lv'] = "complete";
			$this -> response -> redirect($this -> url -> link('pd/dailyprofit&token='.$_GET['token']));
		}
	}

	
}