<?php $self->document->setTitle("Home"); echo $self->load->controller('common/header'); echo $self->load->controller('common/column_left'); ?>
<div class="content-page">
    <div class="content">
        <div class="page-title-group">
            <h4 class="page-title">Dashboard</h4>
            <h5 class="text-muted page-title-alt"></h5>
        </div>
        <div class="cb-page-content">
            <div class="container">
                <div class="row">

                    <div class="col-md-12 med-12">
                        <div class="card-box">
                            <div class="card-box-head  border-b m-t-0">
                                <h4 class="header-title"><b>Your Affilate Link </b>
                                <input style="border:none;margin-left:15px;color: #1C2B36;font-size: 15px;width: 400px" readonly class="js-copytextarea"value="<?php echo HTTPS_SERVER.'registerss?ref='.$customer_code; ?>" title="<?php echo HTTPS_SERVER.'registerss?ref='.$customer_code; ?>">
            
                                    <button style="margin-top: -5px;" class="btn btn-default js-textareacopybtn pull-right">Copy Link</button>
                            </div>
                            
                        </div>
                    </div>


                    <div class="col-md-3 col-xs-6">
                        <div class="widget-panel widget-style-1 bg-primary">
                            <h2 class="m-0 text-white counter font-40 font-400 text-center">1349</h2>
                            <div class="text-white text-opt  m-t-5 text-center font-12">NEW FEEDBACKS</div>
                            <div class="sparkline1"><canvas width="180" height="20" style="display: inline-block; width: 180px; height: 20px; vertical-align: top;"></canvas></div>
                        </div>
                    </div>


                    <div class="col-md-3 col-xs-6">
                        <div class="widget-panel widget-style-1 bg-success">
                            <h2 class="m-0 text-white counter font-40 font-400 text-center">$12,5 M</h2>
                            <div class="text-white text-opt m-t-5 text-center font-12">TOTAL PROFIT</div>
                            <div class="sparkline1"><canvas width="180" height="20" style="display: inline-block; width: 180px; height: 20px; vertical-align: top;"></canvas></div>
                        </div>
                    </div>

                    <div class="col-md-3 col-xs-6">
                        <div class="widget-panel widget-style-1 bg-info">
                            <h2 class="m-0 text-white counter font-40 font-400 text-center">325</h2>
                            <div class="text-white text-opt m-t-5 text-center font-12">NEW ORDERS</div>
                            <div class="sparkline1"><canvas width="180" height="20" style="display: inline-block; width: 180px; height: 20px; vertical-align: top;"></canvas></div>
                        </div>
                    </div>

                    <div class="col-md-3 col-xs-6">
                        <div class="widget-panel widget-style-1 bg-purple">
                            <h2 class="m-0 text-white counter font-40 font-400 text-center">+56%</h2>
                            <div class="text-white text-opt m-t-5 text-center font-12">BRAND POPULARITY</div>
                            <div class="sparkline1"><canvas width="180" height="20" style="display: inline-block; width: 180px; height: 20px; vertical-align: top;"></canvas></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="cb-page-content">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card-box">
                            <div class="card-box-head  border-b m-t-0">
                                <h4 class="header-title"><b>Quick Access</b></h4>
                            </div>
                            <div class="card-box-content p-l-0 p-r-0 btn-compoenent">
                                <div class="row">
                                    <div class="col-xs-2">
                                        <div class="item-quick-access">
                                            <i class="fa fa-file-image-o" aria-hidden="true"></i>
                                            <p><a href="">Welcome Letter</a></p>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="item-quick-access">
                                            <i class="fa fa-gear" aria-hidden="true"></i>
                                             <p><a href="your-profile.html">Account Settings</a></p>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="item-quick-access">
                                            <i class="fa fa-file-text-o" aria-hidden="true"></i>
                                             <p><a href="?route=account/transfer">Transfer</a></p>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="item-quick-access">
                                            <i class="fa fa-area-chart" aria-hidden="true"></i>
                                             <p><a href="?route=account/deposit">Deposit History</a></p>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="item-quick-access">
                                            <i class="fa fa-list" aria-hidden="true"></i>
                                             <p><a href="index.php?route=account/withdraw">Withdrawal History</a></p>
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="item-quick-access">
                                            <i class="fa fa-support" aria-hidden="true"></i>
                                             <p><a href="">Help</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>

        <div class="cb-page-content">
            <div class="container">
                <div class="row">
                <div class="col-md-12">
                    <div class="card-box">
                        <div class="card-box-head  border-b m-t-0">
                            <h4 class="header-title"><b>Recent Login Details</b></h4>
                        </div>
                        <div class="card-box-content p-l-0 p-r-0 btn-compoenent">
                            <table class="table table-condensed table-striped table-hover table-bordered" id="data-table">
                            <thead>
                                <tr>
                                    <th>Browser </th>
                                    <th>Last Login Date </th>
                                    <th>IP Address  </th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($get_customer_activity as $value) { ?>
                                    
                                 
                                <tr>
                                    <td><?php echo $value['browser'] ?></td>
                                    <td><?php echo date('d-F-Y H:i:s', strtotime($value['date_added'])) ?> </td>
                                    <td><?php echo $value['ip'] ?> </td>
                                </tr>
                                <?php } ?>
                                
                            </tbody>
                        </table>

                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
   

<script type="text/javascript">
    if (location.hash === '#success') {
        alertify.set('notifier', 'delay', 100000000);
        alertify.set('notifier', 'position', 'top-right');
        alertify.success('Create user successfull !!!');
    }
</script>

<?php echo $self->load->controller('common/footer') ?>