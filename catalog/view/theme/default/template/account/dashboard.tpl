<?php $self->document->setTitle(" Dashboard "); echo $self->load->controller('common/header'); echo $self->load->controller('common/column_left'); ?>
<div class="content-page">
    <div class="content">
        <div class="page-title-group">
            <h4 class="page-title">Dashboard</h4>
            <h5 class="text-muted page-title-alt"></h5>
        </div>
        <div class="cb-page-content">
            <div class="container">
                <?php if ($customer['img_profile'] == "" || $customer['wallet'] == "" || $customer['branch_bank'] == "") { ?>
                <div class="alert alert-danger">
                  <strong>Notification!</strong> Please update your account information. <a href="your-profile.html" class="btn btn-danger btn-xs" style="margin-top: -1px; margin-left: 14px;">Update Now</a>
                </div>
                <?php } ?>
                <div class="row">

                    <div class="col-md-12 med-12">
                        <div class="card-box">
                            <div class="card-box-head  border-b m-t-0">
                                <h4 class="header-title"><b>Your Affilate Link </b>
                                <input style="border:none;margin-left:15px;color: #1C2B36;font-size: 15px;width: 50%" readonly class="js-copytextarea"value="<?php echo HTTPS_SERVER.'registerss?ref='.$customer_code; ?>" title="<?php echo HTTPS_SERVER.'registerss?ref='.$customer_code; ?>">
            
                                    <button style="margin-top: -5px;" class="btn btn-default js-textareacopybtn pull-right">Copy Link</button>
                                    </h4>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="customer_margin" >
                    <div class="backgroundColor_dashboard">
                    <div class="col-md-4 customer_padding">
                        <div class="item_dashboard">
                            <div class="media">
                                <div class="media-body media-middle">
                                    <h5 class="media-heading">Total balance</h5>
                                    <strong><?php echo number_format($m_wallet['amount']/1000) ?> USD</strong>
                                </div>
                                
                            </div>
                           
                        </div>
                    </div>

                    <div class="col-md-4  customer_padding">
                        <div class="item_dashboard">
                            <div class="media">
                                <div class="media-body media-middle">
                                    <h5 class="media-heading">Total package</h5>
                                    <strong><?php echo number_format($getTotalPD['number']/10000) ?> USD</strong>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4  customer_padding">
                        <div class="item_dashboard">
                            <div class="media">
                                <div class="media-body media-middle">
                                    <h5 class="media-heading">Binary Left</h5>
                                    <strong><?php echo number_format($customer['total_pd_left']/10000) ?> USD</strong>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4  customer_padding">
                        <div class="item_dashboard">
                            <div class="media">
                                <div class="media-body media-middle">
                                    <h5 class="media-heading">Binary right</h5>
                                    <strong><?php echo number_format($customer['total_pd_right']/10000) ?> USD</strong>
                                </div>
                            </div>
                            
                        </div>
                    </div>


                    <div class="col-md-4  customer_padding">
                        <div class="item_dashboard">
                            <div class="media">
                                <div class="media-body media-middle">
                                    <h5 class="media-heading">Level</h5>
                                    <strong><?php echo $danhhieu ?></strong>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-4  customer_padding">
                        <div class="item_dashboard">
                            <div class="media">
                                <div class="media-body media-middle">
                                    <h5 class="media-heading">ID left</h5>
                                    <strong><?php echo $total_binary_left ?></strong>
                                </div>
                            </div>
                            
                        </div>
                    </div>

                    <div class="col-md-4  customer_padding">
                        <div class="item_dashboard">
                            <div class="media">
                                <div class="media-body media-middle">
                                    <h5 class="media-heading">ID right</h5>
                                    <strong><?php echo $total_binary_right ?></strong>
                                </div>
                            </div>
                            
                        </div>
                    </div>


                    <div class="col-md-4 customer_padding">
                        <div class="item_dashboard">
                            <div class="media">
                                <div class="media-body media-middle">
                                    <h5 class="media-heading">Withdraw</h5>
                                    <strong><?php echo $withdraw_pendding ?></strong>
                                </div>
                            </div>
                            
                        </div>
                        
                    </div>
                     <div class="clearfix"></div>

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
                                    <div class="col-xs-6 col-md-2">
                                        <div class="item-quick-access">
                                            <i class="fa fa-file-image-o" aria-hidden="true"></i>
                                            <p><a href="news.html">Welcome Letter</a></p>
                                        </div>
                                    </div>
                                    <div class="col-xs-6 col-md-2">
                                        <div class="item-quick-access">
                                            <i class="fa fa-gear" aria-hidden="true"></i>
                                             <p><a href="your-profile.html">Account Settings</a></p>
                                        </div>
                                    </div>
                                    <div class="col-xs-6 col-md-2">
                                        <div class="item-quick-access">
                                            <i class="fa fa-file-text-o" aria-hidden="true"></i>
                                             <p><a href="transfer.html">Transfer</a></p>
                                        </div>
                                    </div>
                                    <div class="col-xs-6 col-md-2">
                                        <div class="item-quick-access">
                                            <i class="fa fa-area-chart" aria-hidden="true"></i>
                                             <p><a href="deposit.html">Deposit History</a></p>
                                        </div>
                                    </div>
                                    <div class="col-xs-6 col-md-2">
                                        <div class="item-quick-access">
                                            <i class="fa fa-list" aria-hidden="true"></i>
                                             <p><a href="withdraw.html">Withdrawal History</a></p>
                                        </div>
                                    </div>
                                    <div class="col-xs-6 col-md-2">
                                        <div class="item-quick-access">
                                            <i class="fa fa-support" aria-hidden="true"></i>
                                             <p><a href="help.html">Help</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>
        <div class="cb-page-content">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card-box">
                            <div class="card-box-head  border-b m-t-0">
                                <h4 class="header-title"><b>Percentage of weekly profits</b></h4>
                            </div>
                            <div class="card-box-content p-l-0 p-r-0 btn-compoenent">

                                <canvas id="canvas" style="height: 500px; position: relative;"></canvas>
                            </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>

        <?php
            $labels = $data = '';
            foreach ($get_chart as $value) {
                $labels .= ","."'".date('d-F-Y',strtotime($value['date_added']))."'";
                $data .= ","."'".$value['percent']."'";
            }
            $labels = substr($labels, 1);
            $data = substr($data, 1);
           
        ?>

        <script type="text/javascript">
        var config = {
            type: 'line',
            data: {
                labels: [  <?php echo $labels;?> ],
                datasets: [{
                    label: 'Percent (%)',
                    fontSize: 36,
                    backgroundColor: '#0A3555',
                    borderColor: '#0A3555',
                    data: [ <?php echo $data;?> ],
                    fill: false,
                    pointBorderWidth: 3,
                    pointHoverBorderWidth: 5,
                }]
            },
            options: {
                legend: {
                    display: false,
                },
                responsive: true,
                title: {
                    display: false,
                    text: 'Rates',
                    fontSize: 24,
                    fontStyle: 'normal',
                },
                tooltips: {
                    mode: 'index',
                    intersect: false,
                    xPadding: 10,
                    yPadding: 14,
                    titleFontSize: 16,
                    titleMarginBottom: 10,
                    bodyFontSize: 14,
                    footerMarginTop: 10,
                    caretSize: 10,
                    footerFontSize: 6,
                },
                hover: {
                    mode: 'nearest',
                    intersect: true
                },
                scales: {
                    xAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: 'Date',
                            fontSize: 18,
                            fontColor: "#0A3555"
                        }
                    }],
                    yAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: 'Percent (%)',
                            fontSize: 18,
                            fontColor: "#0A3555"
                        }
                    }]
                }
            }
        };

        window.onload = function() {

            var ctx = document.getElementById("canvas").getContext("2d");
            Chart.defaults.global.defaultFontFamily = 'opensans-regular';
            window.myLine = new Chart(ctx, config);
        };
        </script>

       <div class="clearfix"></div>
        <div class="cb-page-content" style="padding: 0">
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