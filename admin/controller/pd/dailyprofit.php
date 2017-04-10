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
				
			}

		}
	}
}