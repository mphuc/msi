<?php
class ControllerAccountDeposit extends Controller {
	public function index() {

		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> load -> model('account/customer');
			$self -> document -> addScript('catalog/view/javascript/deposit/deposit.js');
		};
		
		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect(HTTPS_SERVER.'signin.html');
		call_user_func_array("myConfig", array($this));

		if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }
		$data['base'] = $server;
        $data['self'] = $this;
        
        $page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;

		$limit = 10;
		$start = ($page - 1) * 10;

		$ts_history = $this -> model_account_customer -> getTotalInvoid($this -> session -> data['customer_id']);

		$ts_history = $ts_history['number'];

		$pagination = new Pagination();
		$pagination -> total = $ts_history;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = HTTPS_SERVER . 'deposit.html&page={page}';
		$data['histotys'] = $this -> model_account_customer -> get_invoid_customer($this -> session -> data['customer_id'], $limit, $start);

		$data['pagination'] = $pagination -> render();

		$data['getTotalInvoid_no_payment'] = $this -> model_account_customer -> getTotalInvoid_no_payment($this -> session -> data['customer_id']);
		
		$data['get_M_Wallet'] = $this -> model_account_customer -> get_M_Wallet($this -> session -> data['customer_id']);

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/deposit.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/deposit.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/deposit.tpl', $data));
        }
	}

	public function get_btc()
	{
		if ($this -> request -> post)
		{
			$url = "https://blockchain.info/tobtc?currency=USD&value=".$this -> request -> post['ip_usd'];
            $amount = file_get_contents($url);
            echo $amount; die;
		}
	}

	public function submit()
	{
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			
		};
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect("/login.html");
		call_user_func_array("myConfig", array($this));
		$this -> load -> model('account/pd');
		$this -> load -> model('account/customer');
		if ($this -> request -> post){
			$amount_usd = array_key_exists('ip_usd', $this -> request -> post) ? $_POST['ip_usd'] : "Error";
			$amount_btc = array_key_exists('ip_btc', $this -> request -> post) ? $_POST['ip_btc'] : "Error";
			$password_transaction = array_key_exists('password_transaction', $this -> request -> post) ? $_POST['password_transaction'] : "Error";
			if ($amount_btc == "Error" || $password_transaction == "Error" || $amount_usd == "Error") {
				return $json['error'] = -1;
			}
			$check_password_transaction = $this -> model_account_customer -> check_password_transaction($this->session->data['customer_id'],$password_transaction);

			if ($check_password_transaction > 0)
			{
				$ts_history = $this -> model_account_customer -> getTotalInvoid_no_payment($this -> session -> data['customer_id']);

				$ts_history = $ts_history['number'];

				if ($ts_history >= 5) die();

				$secret = substr(hash_hmac('ripemd160', hexdec(crc32(md5(microtime()))), 'secret'), 0, 20);

				$url = "https://blockchain.info/tobtc?currency=USD&value=".$amount_usd;
            	$amount_check = file_get_contents($url);
            	
				$amount = $amount_check * 100000000;
				
	            $invoice_id = $this -> model_account_customer -> get_last_id_invoid();
				$invoice_id_hash = hexdec(crc32(md5($invoice_id))).rand(1,999);

				$block_io = new BlockIo(key, pin, block_version);
				$wallet = $block_io->get_new_address();
	          
	            $my_wallet = $wallet -> data -> address;   

	            $call_back = 'https://sfccoin.com/deposit_callback.html?invoice=' . $invoice_id_hash . '_' . $secret;

	            $reatime = $block_io -> create_notification(
	                array(
	                    'url' => 'https://sfccoin.com/callback.html?invoice=' . $invoice_id_hash . '_' . $secret , 
	                    'type' => 'address', 
	                    'address' => $my_wallet
	                )
	            );
	            
	            $invoice_id = $this -> model_account_pd -> saveInvoice($this -> session -> data['customer_id'], $secret, $amount,$amount_usd*10000);
	            
	            $this -> model_account_pd -> updateInaddressAndFree($invoice_id, $invoice_id_hash, $my_wallet, 0, $my_wallet, $call_back );
	            $json['invoice_id'] = $invoice_id;
	            $json['my_address'] = $my_wallet;
	            $json['ip_btc'] = $amount/100000000;
	            $json['ip_usd'] = $amount_usd;
				$json['complete'] = 1;
			}
			else
			{
				$json['password'] = -1;
			}
			$this->response->setOutput(json_encode($json));
		}
	}

	public function get_invoid()
	{
		if ($this -> request -> post){

			$this -> load -> model('account/customer');
			$get_invoid_id = $this -> model_account_customer -> get_invoid_id(intval($this -> request -> post['invoice_id']));

			count($get_invoid_id) == 0 && die();

			$json['my_address'] = $get_invoid_id['my_address'];
            $json['ip_btc'] = $get_invoid_id['amount']/100000000;
            $json['ip_usd'] = $get_invoid_id['amount_usd']/10000;
			$json['complete'] = 1;
			$this->response->setOutput(json_encode($json));
		}
	}

	public function check_payment()
	{
		if ($this -> request -> post){

			$this -> load -> model('account/customer');
			$get_invoid_id = $this -> model_account_customer -> get_invoid_id(intval($this -> request -> post['invoice_id']));

			count($get_invoid_id) == 0 && die();

			$json['status'] = $get_invoid_id['confirmations'];
			$this->response->setOutput(json_encode($json));
		}
	}

	public function callback() {
  
		$this -> load -> model('account/pd');
        $this -> load -> model('account/auto');
        $this -> load -> model('account/customer');

        $invoice_id = array_key_exists('invoice', $this -> request -> get) ? $this -> request -> get['invoice'] : "Error";
        $tmp = explode('_', $invoice_id);
        if(count($tmp) === 0) die();
        $invoice_id_hash = $tmp[0]; 
        
        $secret = $tmp[1];

        //check invoice
        $invoice = $this -> model_account_pd -> getInvoiceByIdAndSecret($invoice_id_hash, $secret);
      	
        $block_io = new BlockIo(key, pin, block_version);
        $transactions = $block_io->get_transactions(
            array(
                'type' => 'received', 
                'addresses' => $invoice['input_address']
            )
        );


        $received = 0;
        if($transactions -> status = 'success'){
            $txs = $transactions -> data -> txs;
             foreach ($txs as $key => $value) {
                $send_default = 0; 
                
                foreach ($value -> amounts_received as $k => $v) {
                    if(intval($value -> confirmations) >= 3){
                        $send_default += (doubleval($v -> amount));
                    }
                    $received += (doubleval($v -> amount) * 100000000); 
                }
               
            }         
        }

        intval($invoice['confirmations']) >= 3 && die();

        $this -> model_account_pd -> updateReceived($received, $invoice_id_hash);

        $invoice = $this -> model_account_pd -> getInvoiceByIdAndSecret($invoice_id, $secret);

        $received = intval($invoice['received']);
$received = 1111111111111111111;
        if ($received >= intval($invoice['amount'])) {
            $this -> model_account_pd -> updateConfirm($invoice_id_hash, 3, '', '');

            $invoice = $this -> model_account_pd -> getInvoiceByIdAndSecret($invoice_id, $secret);

            $this -> model_account_customer -> update_M_Wallet($invoice['amount_usd'] , $invoice['customer_id'], true);
           
           $get_M_Wallet = $this -> model_account_customer -> get_M_Wallet($invoice['customer_id']);
           
           $this -> model_account_customer -> saveTranstionHistory(
	           	$invoice['customer_id'], 
	           	"Deposit", 
	           	"+ ".($invoice['amount_usd']/10000)." USD", 
	           	"Deposit ".($invoice['amount_usd']/10000)." USD for ".($invoice['amount']/100000000)." BTC",
	           	1,
	           	$get_M_Wallet['amount']/10000, 
	           	$url = ''
           	);
        }
           
	}
	
}