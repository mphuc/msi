<?php
class ControllerPdDailyprofit extends Controller {
	public function index() {
		error_reporting(0);
		
		$this->document->setTitle('Deposit');
		$this->load->model('pd/registercustom');
		$data['self'] =$this;
		

		
		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view('pd/dailyprofit.tpl', $data));
	}
	
	public function submit()
	{
		if ($this-> request -> post)
		{
			$percent = $this-> request -> post['percent'];
			if ($percent < 4 || $percent > 10)
			{
				die("Error");
			}
			$this->load->model('pd/registercustom');

			$get_all_pd = $this -> model_pd_registercustom -> get_all_pd();
			foreach ($get_all_pd as $value) {
				
				switch ($value['filled']) {
                case 1000000:
                    $package = 100;
                    $fee_ql = 30;
                    $fee_bh = 10;
                    break;
                case 5000000:
                    $package = 500;
                    $fee_ql = 30;
                    $fee_bh = 10;
                    break;
                case 10000000:
                    $package = 1000;
                    $fee_ql = 30;
                    $fee_bh = 10;
                    break;
                case 20000000:
                    $package = 2000;
                    $fee_ql = 28;
                    $fee_bh = 10;
                    break;
                case 50000000:
                    $package = 5000;
                    $fee_ql = 26;
                    $fee_bh = 10;
                    break;
                case 100000000:
                    $package = 10000;
                    $fee_ql = 20;
                    $fee_bh = 10;
                    break;
                case 500000000:
                    $package = 50000;
                    $fee_ql = 10;
                    $fee_bh = 10;
                    break;
                case 1000000000:
                    $package = 100000;
                    $fee_ql = 5;
                    $fee_bh = 10;
                    break;
                case 2000000000:
                    $package = 200000;
                    $fee_ql = 5;
                    $fee_bh = 10;
                    break;
                default:
                    $package = 0;
                    $fee_ql = 0;
                    $fee_bh = 0;
                    break;
            }

				$amounts_received = $value['filled'] * ($percent / 100) * ((100-$fee_ql) / 100) * ((100-$fee_bh) / 100);

	            $this -> model_pd_registercustom -> update_m_Wallet_add_sub($amounts_received,$value['customer_id'], $add = true);

	                $get_M_Wallet = $this -> model_pd_registercustom -> get_M_Wallet($value['customer_id']);

	                $this -> model_pd_registercustom -> saveTranstionHistory(
	                    $value['customer_id'], 
	                    "Weekly profit", 
	                    "+ ".($amounts_received/10000)." USD", 
	                    "Weekly profit ".$percent."%, From package ".(number_format($value['filled']/10000))." USD. Management fee ".$fee_ql."%, Insurance fees ".$fee_bh."%",
	                    1,
	                    $get_M_Wallet['amount']/10000, 
	                    $url = ''
	                ); 
				$this -> model_pd_registercustom -> update_pd_count_profit($value['id']);
				
			}

            $this -> model_pd_registercustom -> insertchart($this-> request -> post['percent']);

			$this -> session -> data['complete_ww'] = "complete_ww";
			$this -> response -> redirect($this -> url -> link('pd/dailyprofit&token='.$_GET['token']));
		}
	}
}