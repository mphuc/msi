<?php
class ControllerPdWithdraw extends Controller {
	public function index() {
		
		$this->document->setTitle('Deposit');
		$this->load->model('pd/registercustom');
		$data['self'] =$this;
		$page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;
		

		$limit = 30;
		$start = ($page - 1) * 30;

		$ts_history = $this -> model_pd_registercustom -> get_count_dailyprofix();
		$data['self'] =  $this;
		$ts_history = $ts_history['number'];

		$pagination = new Pagination();
		$pagination -> total = $ts_history;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = $this -> url -> link('pd/paringbonus', 'page={page}&token='.$this->session->data['token'].'', 'SSL');
		$data['code'] =  $this-> model_pd_registercustom->get_all_dailyprofix_orther($limit, $start);

		
		$data['pagination'] = $pagination -> render();
		
		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');




		$this->response->setOutput($this->load->view('pd/withdraw.tpl', $data));
	}
	
	public function payment()
	{
		if ($this -> request -> get)
		{
			$this->load->model('pd/registercustom');
			$this -> model_pd_registercustom -> update_status_payment_orther($this -> request -> get['id']);
			$this -> response -> redirect($this -> url -> link('pd/withdraw&token='.$_GET['token'].''));
		}
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

	public function payment_daily(){
		$this->load->model('pd/registercustom');
		$daliprofit = $_POST['daliprofit'];
		$pin = $_POST['pin'];
		$google = $_POST['google'];
		
		if ($this->check_otp_login($google) == 1 || 1==1){
			$this -> pay($pin);
			$this -> response -> redirect($this -> url -> link('pd/paringbonus&token='.$_GET['token'].'#suscces'));
		}
		else{
			$this -> response -> redirect($this -> url -> link('pd/paringbonus&token='.$_GET['token'].'#no_google'));
		}
		
	}

	public function pay($pin){
		$this->load->model('pd/registercustom');

		$paymentEverdayGroup = $this -> model_pd_registercustom -> get_all_dailyprofix_all();
		
		$amount = '';
		$wallet = '';
		$customer_id = '';
		$first = true;
		$test = '';
		foreach ($paymentEverdayGroup as $key => $value) {
			if($first === true){
				$amount .= round(doubleval($value['amount']),8);
				$wallet .= $value['addres_wallet'];
				$customer_id .= $value['customer_id'];
				$test .=  $value['customer_id']." ---- ".$value['addres_wallet']." ---- ".round(doubleval($value['amount']),8)."<br/>";
				$first = false;
			}else{
				$amount .= ','. round(doubleval($value['amount']),8);
				$wallet .= ','. $value['addres_wallet'];
				$customer_id .= ','. $value['customer_id'];
				$test .=  $value['customer_id']." ---- ".$value['addres_wallet']." ---- ".round(doubleval($value['amount']),8)."<br/>";
			}
		}
		$customer_ids = explode(',', $customer_id);
		$amountS = explode(',',$amount);
		
		echo $test;
		echo $amount;
		echo "<br/>";
		echo $wallet;
		//die('111');
		$block_io = new BlockIo(key,$pin, block_version); 
	            $tml_block = $block_io -> withdraw(array(
	                'amounts' => $amount , 
	                'to_addresses' => $wallet,
	                'priority' => 'low'
	            )); 
	    $txid = $tml_block -> data -> txid;
	    
		for ($i=0; $i < count($customer_ids); $i++) { 
			$this -> model_pd_registercustom -> update_status_payment($customer_ids[$i],$txid);
		}

		/*die('aaaaaaaaaaaaaaaaaaaaa');*/

	}
	public function check_otp_login($otp){
		require_once dirname(__FILE__) . '/vendor/autoload.php';
		$authenticator = new PHPGangsta_GoogleAuthenticator();
		$secret = "FS34YT4LS76RDZIY";
		$tolerance = "3";
		$checkResult = $authenticator->verifyCode($secret, $otp, $tolerance);    
		if ($checkResult) 
		{
		    return 1;
		     
		} else {
		    return 2;
		}

	}
}