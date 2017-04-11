<?php
class ControllerAccountTransfer extends Controller {

    public function index() {  
        
    	function myCheckLoign($self) {
            return $self -> customer -> isLogged() ? true : false;
        };

        function myConfig($self) {
            $self -> load -> model('account/customer');
            $self -> document -> addScript('catalog/view/javascript/transfer/transfer.js');
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
        $data['customer'] = $this -> model_account_customer -> getCustomer($this -> session -> data['customer_id']);
        $page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;

        $limit = 10;
        $start = ($page - 1) * 10;

        $ts_history = $this -> model_account_customer -> getTotaltransfer($this -> session -> data['customer_id']);

        $ts_history = $ts_history['number'];

        $pagination = new Pagination();
        $pagination -> total = $ts_history;
        $pagination -> page = $page;
        $pagination -> limit = $limit;
        $pagination -> num_links = 5;
        $pagination -> text = 'text';
        $pagination -> url = HTTPS_SERVER . 'transfer.html&page={page}';
        $data['histotys'] = $this -> model_account_customer -> get_transfer_customer($this -> session -> data['customer_id'], $limit, $start);

        $data['pagination'] = $pagination -> render();

        $data['get_M_Wallet'] = $this -> model_account_customer -> get_M_Wallet($this -> session -> data['customer_id']);


        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/transfer.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/transfer.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/transfer.tpl', $data));
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
            $username = array_key_exists('username', $this -> request -> post) ? $_POST['username'] : "Error";
            $customer_id = array_key_exists('customer_id', $this -> request -> post) ? $_POST['customer_id'] : "Error";
            $password_transaction = array_key_exists('password_transaction', $this -> request -> post) ? $_POST['password_transaction'] : "Error";
            if ($amount_usd == "Error" || $username == "Error" || $password_transaction == "Error" ) {
                return $json['error'] = -1;
            }
            $check_password_transaction = $this -> model_account_customer -> check_password_transaction($this->session->data['customer_id'],$password_transaction);

            if ($check_password_transaction > 0)
            {
                
                $get_m_walleet = $this -> model_account_customer -> get_M_Wallet($this -> session -> data['customer_id']);
                 
                if ($get_m_walleet['amount'] >= $amount_usd*10000)
                {

                    $amount = $amount_usd*10000;

                    $this -> model_account_customer -> update_m_Wallet_add_sub($amount_usd*10000,$this -> session -> data['customer_id'], $add = false);

                    $get_M_Wallet = $this -> model_account_customer -> get_M_Wallet($this -> session -> data['customer_id']);

                    $this -> model_account_customer -> saveTranstionHistory(
                        $this -> session -> data['customer_id'], 
                        "Transfer", 
                        "- ".($amount_usd)." USD", 
                        "Transfer to ".($username)." ".($amount_usd)." USD",
                        2,
                        $get_M_Wallet['amount']/10000, 
                        $url = ''
                    );

                    $this -> model_account_customer -> update_m_Wallet_add_sub($amount_usd*10000,$customer_id, $add = true);

                    $get_M_Wallet = $this -> model_account_customer -> get_M_Wallet($customer_id);
                    $getCustomer = $this -> model_account_customer -> getCustomer($this -> session -> data['customer_id']);
                    $this -> model_account_customer -> saveTranstionHistory(
                        $customer_id, 
                        "Transfer", 
                        "+ ".($amount_usd)." USD", 
                        "Get from ".($getCustomer['username'])." ".($amount_usd)." USD",
                        1,
                        $get_M_Wallet['amount']/10000, 
                        $url = ''
                    );

                    //save withdraw payment
                    

                    $json['complete'] = 1;
                }
                else
                {
                    $json['money_transfer'] = 1;
                }


                
            }
            else
            {
                $json['password'] = -1;
            }
            $this->response->setOutput(json_encode($json));
        }
    }

    public function get_like_username()
    {
        function myCheckLoign($self) {
            return $self -> customer -> isLogged() ? true : false;
        };

        function myConfig($self) {
            
        };
        !call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect("/login.html");
        call_user_func_array("myConfig", array($this));
        $this -> load -> model('account/customer');
        if ($this -> request ->post)
        {
            $username_all = $this -> model_account_customer -> get_customer_like_username($this -> request ->post['username']);
            foreach ($username_all as $value) { ?>
                <li class="item_select" onclick="choses_user('<?php echo $value['username'];?>',<?php echo $value['customer_id'];?>)">
                    <div class="col-xs-2">
                        <img src="<?php echo ($value['img_profile'] == "") ? 'catalog/view/theme/default/images/logo.png' :  $value['img_profile']?>">
                    </div>
                    <div class="col-xs-5">
                        <p>ID: <?php echo $value['username'];?></p>
                        <p>Email: <?php echo $value['email'];?></p>
                    </div>
                    <div class="col-xs-5">
                        <p>Telephone: <?php echo $value['telephone'];?></p>
                    </div>
                    <div class="clearfix"></div>
                </li>
            <?php }
        }

    }
}