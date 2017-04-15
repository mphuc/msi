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
			$get_all_user_active  = $this -> model_pd_registercustom -> get_all_user_active();
			foreach ($get_all_user_active as  $value) {
				
				// level child
				
			}

			
			$this -> session -> data['complete_lv'] = "complete";
			$this -> response -> redirect($this -> url -> link('pd/dailyprofit&token='.$_GET['token']));
		}
	}

	
}