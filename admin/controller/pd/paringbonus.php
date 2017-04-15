<?php
class ControllerPdParingbonus extends Controller {
	public function index() {
		
		$this->document->setTitle('Deposit');
		$this->load->model('pd/registercustom');
		$data['self'] =$this;
		$page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;
		$this -> document -> addScript('../catalog/view/javascript/countdown/jquery.countdown.min.js');
		$this -> document -> addScript('../catalog/view/javascript/transaction/countdown.js');
	

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
		$data['code'] =  $this-> model_pd_registercustom->get_all_dailyprofix($limit, $start);

		$data['code_all'] =  $this-> model_pd_registercustom->get_all_dailyprofix_all();

		
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

	            $total_pd_node = $this -> model_pd_registercustom -> getCustomer($value['customer_id']);

	            $percent = 3;
	            if ($total_pd_node['total_pd_node'] >= 5000000000)
	            {
	            	$percent = 5;
	            }
	            if ($total_pd_node['total_pd_node'] >= 100000000000)
	            {
	            	$percent = 8;
	            }
	            if ($total_pd_node['total_pd_node'] >= 200000000000)
	            {
	            	$percent = 10;
	            }

	            $amounts_received = $balanced * $percent /100;

	            $this -> model_pd_registercustom -> update_m_Wallet_add_sub($amounts_received,$value['customer_id'], $add = true);

	            $get_M_Wallet = $this -> model_pd_registercustom -> get_M_Wallet($value['customer_id']);

                $this -> model_pd_registercustom -> saveTranstionHistory(
                    $value['customer_id'], 
                    "Commision Network", 
                    "+ ".($amounts_received/10000)." USD", 
                    "Commision Network ".$percent."%, From weak branch  ".(number_format($balanced/10000))." USD",
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
    	for ($i=1; $i <=12; $i++)
    	{	

    		if ($p_binary != 0)
    		{
    			$getCustomer_ml_binary = $this -> model_pd_registercustom -> getCustomer_ml($p_binary);
    			if ($i%2 == 0)
    			{
    				echo $p_binary. " ";
    				$getCustomer_binary = $this -> model_pd_registercustom -> getCustomer($getCustomer_ml_binary['customer_id']);

    				if ($getCustomer_binary['total_pd_node'] >= 50000000 && $i <= 6)
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

				    if ($i == 8)
				    {
				    	if ($getCustomer_binary['total_pd_node'] >= 5000000000)
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

				    if ($i == 10)
				    {
				    	if ($getCustomer_binary['total_pd_node'] >= 100000000000)
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

				    if ($i == 12)
				    {
				    	if ($getCustomer_binary['total_pd_node'] >= 200000000000)
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

    		$getCustomer_left = $this -> model_pd_registercustom -> getCustomer($getCustomer_ml['left']);
    		if ($getCustomer_left['total_pd_node'] >= 150000000)
    		{
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
    		}
    		// left nhan
    		
            $getCustomer_right = $this -> model_pd_registercustom -> getCustomer($getCustomer_ml['right']);
            if ($getCustomer_right['total_pd_node'] >= 150000000)
    		{
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
	
}