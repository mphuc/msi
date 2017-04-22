<?php $self -> document -> setTitle("Investing"); echo $self -> load -> controller('common/header'); echo $self -> load -> controller('common/column_left'); ?>
<div class="content-page">
    <div class="content">
        <div class="section-heading row">
       <div class=" col-lg-9 col-md-8 col-sm-7 col-xs-12">
          <h1 class="title text-uppercase">
             Investing
          </h1>
       </div>
       
    </div>
  </div>
</div>
<div class="content-page">
    <div class="content">
        
        <div class="cb-page-content">
            <div class="container">
                <div class="row">
      <div class="col-md-12">
      <?php if(count($pds) > 0){?> 
         <div class="panel panel-default">
            <div class="panel-body">
               <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12" id="no-more-tables">
                     <table id="datatable" class="table table-striped table-bordered">
                        <thead>
                           <tr>
                              <th>#</th>
 							                <th>Transaction Number</th>
                              <th>Date</th>
                              <th>Package</th>
                              <th>Number of weeks</th>
                              <th>Details</th>
                           </tr>
                        </thead>
                        <tbody>
                           <?php $i=0; foreach ($pds as $value=> $key){ $i++?> 
                           <tr>
                            <td data-title="#"><?php echo $i ?></td>
        					           <td data-title="Transaction Number">#<?php echo $key['pd_number'] ?></td>
                            <td data-title="Date"><?php echo date("d-F-Y H:i:A", strtotime($key['date_added'])); ?></td>
                              
                            <td data-title="Package">
                              	<?php echo (number_format($key['filled'] / 10000)) ?> USD
                            </td>
                            <td class="text-center text-danger" data-title="Number of weeks"> <?php echo (($key['count_profit'])) ?> Week</td>
                      
                            <td class="text-center" data-title="Details">
                              <a href="#" data-toggle="modal" data-target="#myModal<?php echo $key['pd_number'] ?>" class="btn btn-info btn-sm">View Detail
                                </a>
                            </td>
                           </tr>
                           <div class="modal fade" id="myModal<?php echo $key['pd_number'] ?>" role="dialog">
                              <div class="modal-dialog">
                              
                                <!-- Modal content-->
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 id="myModalLabelSTAR2017040554482">Transaction Details for $<?php echo (number_format($key['filled'] / 10000)) ?></h4>
                                  </div>
                                  <div class="modal-body">
                                    <div class="row-fluid">
                                       <div class="span8">
                                          <p>
                                             <strong>Transaction  Date</strong><br>
                                             <?php echo date("d-F-Y H:i:A", strtotime($key['date_added'])); ?>
                                          </p>
                                          <p>
                                             <strong>Transaction  Number</strong>
                                             <br>
                                             #<?php echo $key['pd_number'] ?>
                                          </p>
                                          <p>
                                             <strong>Details</strong>
                                             <br>
                                             Active package <?php echo (number_format($key['filled'] / 10000)) ?> USD
                                          </p>
                                       </div>
                                       <div class="span4">
                                          <div style="border-radius: 3px; background: #59AD7B; text-align: center; padding: 10px; color: #fff; font-size: 14px;">
                                             <p><strong>Amount</strong> </p>
                                             <h3>$<?php echo (number_format($key['filled'] / 10000)) ?></h3>
                                          </div>
                                       </div>
                                    </div>
                                    </div>
                                  </div>
                                  <div class="clearfix"></div>
                                 
                                </div>
                                
                              </div>
                            </div>
                           <?php }?> 
                        </tbody>
                     </table>
                  </div>
               </div>
              
               
            </div>
         </div>
         <?php } ?>

         </div>
        
      <div class="">

        <div class="col-md-4 col-sm-6">
            <div class="pricingTable">
                <div class="pricingTable-header">
                    <span class="heading">
                      <?php $packet = $self -> check_packet_pd (1000000) ;?>
                      <?php if(count($packet) > 0) { ?>
                        <?php if (intval($packet['status']) === 0) {?>
                          <h3>Not active</h3>
                        <?php } else { ?>
                          <h3>active</h3>
                        <?php } } else { ?>
                          <h3>Not active</h3>
                      <?php } ?>
                    </span>
                    <span class="price-value"><span class="currency">$</span>100<span class="mo"> 80 Week</span></span>
                </div>
 
                <div class="pricingContent">
                  <img src="catalog/view/theme/default/images/100copy.png" style="margin: 15px auto">  
                </div>
                <?php if(count($packet) > 0) { ?>
                  <?php if (intval($packet['status']) === 0) {?>
                    <form class="packet-invest" action="index.php?route=account/pd/pd_investment">
                      <input type="hidden" name="packet" value="100">
                      <div class="pricingTable-sign-up ">
                          <button type="submit" class="btn btn-block btn-default">Upgrade</button>
                      </div>
                    </form>
                  <?php } else { ?>
                  <div class="pricingTable-sign-up ">
                    <button disabled="true" class="btn btn-block btn-default">Active</button>
                  </div>
                  <?php } } else { ?>
                    <form class="packet-invest" action="index.php?route=account/pd/pd_investment">
                      <input type="hidden" name="packet" value="100">
                      <div class="pricingTable-sign-up ">
                          <button type="submit" class="btn btn-block btn-default">Upgrade</button>
                      </div>
                    </form>
                <?php } ?>
            </div>
        </div>
        
        <div class="col-md-4 col-sm-6">
            <div class="pricingTable">
                <div class="pricingTable-header">
                    <span class="heading">
                      <?php $packet = $self -> check_packet_pd (5000000) ;?>
                      <?php if(count($packet) > 0) { ?>
                        <?php if (intval($packet['status']) === 0) {?>
                          <h3>Not active</h3>
                        <?php } else { ?>
                          <h3>active</h3>
                        <?php } } else { ?>
                          <h3>Not active</h3>
                      <?php } ?>
                    </span>
                    <span class="price-value"><span class="currency">$</span>500<span class="mo"> 80 Week</span></span>
                </div>
 
                <div class="pricingContent">
                    <img src="catalog/view/theme/default/images/500copy.png" style="margin: 15px auto">
                </div>
                <?php if(count($packet) > 0) { ?>
                  <?php if (intval($packet['status']) === 0) {?>
                    <form class="packet-invest" action="index.php?route=account/pd/pd_investment">
                      <input type="hidden" name="packet" value="500">
                      <div class="pricingTable-sign-up ">
                          <button type="submit" class="btn btn-block btn-default">Upgrade</button>
                      </div>
                    </form>
                  <?php } else { ?>
                    <div class="pricingTable-sign-up ">
                    <button disabled="true" class="btn btn-block btn-default">Active</button>
                  </div>
                  <?php } } else { ?>
                    <form class="packet-invest" action="index.php?route=account/pd/pd_investment">
                      <input type="hidden" name="packet" value="500">
                      <div class="pricingTable-sign-up ">
                          <button type="submit" class="btn btn-block btn-default">Upgrade</button>
                      </div>
                    </form>
                <?php } ?>
            </div>
        </div>

        <div class="col-md-4 col-sm-6">
            <div class="pricingTable">
                <div class="pricingTable-header">
                    <span class="heading">
                      <?php $packet = $self -> check_packet_pd (10000000) ;?>
                      <?php if(count($packet) > 0) { ?>
                        <?php if (intval($packet['status']) === 0) {?>
                          <h3>Not active</h3>
                        <?php } else { ?>
                          <h3>active</h3>
                        <?php } } else { ?>
                          <h3>Not active</h3>
                      <?php } ?>
                    </span>
                    <span class="price-value"><span class="currency">$</span>1000<span class="mo"> 80 Week</span></span>
                </div>
 
                <div class="pricingContent">
                    <img src="catalog/view/theme/default/images/1000copy.png" style="margin: 15px auto">
                </div>
                <?php if(count($packet) > 0) { ?>
                  <?php if (intval($packet['status']) === 0) {?>
                    <form class="packet-invest" action="index.php?route=account/pd/pd_investment">
                      <input type="hidden" name="packet" value="1000">
                      <div class="pricingTable-sign-up ">
                          <button type="submit" class="btn btn-block btn-default">Upgrade</button>
                      </div>
                    </form>
                  <?php } else { ?>
                    <div class="pricingTable-sign-up ">
                    <button disabled="true" class="btn btn-block btn-default">Active</button>
                  </div>
                  <?php } } else { ?>
                    <form class="packet-invest" action="index.php?route=account/pd/pd_investment">
                      <input type="hidden" name="packet" value="1000">
                      <div class="pricingTable-sign-up ">
                          <button type="submit" class="btn btn-block btn-default">Upgrade</button>
                      </div>
                    </form>
                <?php } ?>
            </div>
        </div>

        <div class="col-md-4 col-sm-6">
            <div class="pricingTable">
                <div class="pricingTable-header">
                    <span class="heading">
                      <?php $packet = $self -> check_packet_pd (20000000) ;?>
                      <?php if(count($packet) > 0) { ?>
                        <?php if (intval($packet['status']) === 0) {?>
                          <h3>Not active</h3>
                        <?php } else { ?>
                          <h3>active</h3>
                        <?php } } else { ?>
                          <h3>Not active</h3>
                      <?php } ?>
                    </span>
                    <span class="price-value"><span class="currency">$</span>2000<span class="mo"> 80 Week</span></span>
                </div>
 
                <div class="pricingContent">
                   <img src="catalog/view/theme/default/images/2000copy.png" style="margin: 15px auto">
                </div>
                <?php if(count($packet) > 0) { ?>
                  <?php if (intval($packet['status']) === 0) {?>
                    <form class="packet-invest" action="index.php?route=account/pd/pd_investment">
                      <input type="hidden" name="packet" value="2000">
                      <div class="pricingTable-sign-up ">
                          <button type="submit" class="btn btn-block btn-default">Upgrade</button>
                      </div>
                    </form>
                  <?php } else { ?>
                    <div class="pricingTable-sign-up ">
                    <button disabled="true" class="btn btn-block btn-default">Active</button>
                  </div>
                  <?php } } else { ?>
                    <form class="packet-invest" action="index.php?route=account/pd/pd_investment">
                      <input type="hidden" name="packet" value="2000">
                      <div class="pricingTable-sign-up ">
                          <button type="submit" class="btn btn-block btn-default">Upgrade</button>
                      </div>
                    </form>
                <?php } ?>
            </div>
        </div>

        <div class="col-md-4 col-sm-6">
            <div class="pricingTable">
                <div class="pricingTable-header">
                    <span class="heading">
                      <?php $packet = $self -> check_packet_pd (50000000) ;?>
                      <?php if(count($packet) > 0) { ?>
                        <?php if (intval($packet['status']) === 0) {?>
                          <h3>Not active</h3>
                        <?php } else { ?>
                          <h3>active</h3>
                        <?php } } else { ?>
                          <h3>Not active</h3>
                      <?php } ?>
                    </span>
                    <span class="price-value"><span class="currency">$</span>5000<span class="mo"> 80 Week</span></span>
                </div>
 
                <div class="pricingContent">
                   <img src="catalog/view/theme/default/images/5000copy.png" style="margin: 15px auto">
                </div>
                <?php if(count($packet) > 0) { ?>
                  <?php if (intval($packet['status']) === 0) {?>
                    <form class="packet-invest" action="index.php?route=account/pd/pd_investment">
                      <input type="hidden" name="packet" value="5000">
                      <div class="pricingTable-sign-up ">
                          <button type="submit" class="btn btn-block btn-default">Upgrade</button>
                      </div>
                    </form>
                  <?php } else { ?>
                   <div class="pricingTable-sign-up ">
                    <button disabled="true" class="btn btn-block btn-default">Active</button>
                  </div>
                  <?php } } else { ?>
                    <form class="packet-invest" action="index.php?route=account/pd/pd_investment">
                      <input type="hidden" name="packet" value="5000">
                      <div class="pricingTable-sign-up ">
                          <button type="submit" class="btn btn-block btn-default">Upgrade</button>
                      </div>
                    </form>
                <?php } ?>
            </div>
        </div>

        <div class="col-md-4 col-sm-6">
            <div class="pricingTable">
                <div class="pricingTable-header">
                    <span class="heading">
                      <?php $packet = $self -> check_packet_pd (100000000) ;?>
                      <?php if(count($packet) > 0) { ?>
                        <?php if (intval($packet['status']) === 0) {?>
                          <h3>Not active</h3>
                        <?php } else { ?>
                          <h3>active</h3>
                        <?php } } else { ?>
                          <h3>Not active</h3>
                      <?php } ?>
                    </span>
                    <span class="price-value"><span class="currency">$</span>10.000<span class="mo"> 80 Week</span></span>
                </div>
 
                <div class="pricingContent">
                   <img src="catalog/view/theme/default/images/10000copy.png" style="margin: 15px auto">
                </div>
                <?php if(count($packet) > 0) { ?>
                  <?php if (intval($packet['status']) === 0) {?>
                    <form class="packet-invest" action="index.php?route=account/pd/pd_investment">
                      <input type="hidden" name="packet" value="10000">
                      <div class="pricingTable-sign-up ">
                          <button type="submit" class="btn btn-block btn-default">Upgrade</button>
                      </div>
                    </form>
                  <?php } else { ?>
                    <div class="pricingTable-sign-up ">
                    <button disabled="true" class="btn btn-block btn-default">Active</button>
                  </div>
                  <?php } } else { ?>
                    <form class="packet-invest" action="index.php?route=account/pd/pd_investment">
                      <input type="hidden" name="packet" value="10000">
                      <div class="pricingTable-sign-up ">
                          <button type="submit" class="btn btn-block btn-default">Upgrade</button>
                      </div>
                    </form>
                <?php } ?>
            </div>
        </div>

        <div class="col-md-4 col-sm-6">
            <div class="pricingTable">
                <div class="pricingTable-header">
                    <span class="heading">
                      <?php $packet = $self -> check_packet_pd (50000000) ;?>
                      <?php if(count($packet) > 0) { ?>
                        <?php if (intval($packet['status']) === 0) {?>
                          <h3>Not active</h3>
                        <?php } else { ?>
                          <h3>active</h3>
                        <?php } } else { ?>
                          <h3>Not active</h3>
                      <?php } ?>
                    </span>
                    <span class="price-value"><span class="currency">$</span>50.000<span class="mo"> 80 Week</span></span>
                </div>
 
                <div class="pricingContent">
                   <img src="catalog/view/theme/default/images/50000copy.png" style="margin: 15px auto">
                </div>
                <?php if(count($packet) > 0) { ?>
                  <?php if (intval($packet['status']) === 0) {?>
                    <form class="packet-invest" action="index.php?route=account/pd/pd_investment">
                      <input type="hidden" name="packet" value="50000">
                      <div class="pricingTable-sign-up ">
                          <button type="submit" class="btn btn-block btn-default">Upgrade</button>
                      </div>
                    </form>
                  <?php } else { ?>
                    <div class="pricingTable-sign-up ">
                    <button disabled="true" class="btn btn-block btn-default">Active</button>
                  </div>
                  <?php } } else { ?>
                    <form class="packet-invest" action="index.php?route=account/pd/pd_investment">
                      <input type="hidden" name="packet" value="50000">
                      <div class="pricingTable-sign-up ">
                          <button type="submit" class="btn btn-block btn-default">Upgrade</button>
                      </div>
                    </form>
                <?php } ?>
            </div>
        </div>

        <div class="col-md-4 col-sm-6">
            <div class="pricingTable">
                <div class="pricingTable-header">
                    <span class="heading">
                      <?php $packet = $self -> check_packet_pd (1000000000) ;?>
                      <?php if(count($packet) > 0) { ?>
                        <?php if (intval($packet['status']) === 0) {?>
                          <h3>Not active</h3>
                        <?php } else { ?>
                          <h3>active</h3>
                        <?php } } else { ?>
                          <h3>Not active</h3>
                      <?php } ?>
                    </span>
                    <span class="price-value"><span class="currency">$</span>100.000<span class="mo"> 80 Week</span></span>
                </div>
 
                <div class="pricingContent">
                  <img src="catalog/view/theme/default/images/100000copy.png" style="margin: 15px auto">
                </div>
                <?php if(count($packet) > 0) { ?>
                  <?php if (intval($packet['status']) === 0) {?>
                    <form class="packet-invest" action="index.php?route=account/pd/pd_investment">
                      <input type="hidden" name="packet" value="100000">
                      <div class="pricingTable-sign-up ">
                          <button type="submit" class="btn btn-block btn-default">Upgrade</button>
                      </div>
                    </form>
                  <?php } else { ?>
                    <div class="pricingTable-sign-up ">
                    <button disabled="true" class="btn btn-block btn-default">Active</button>
                  </div>
                  <?php } } else { ?>
                    <form class="packet-invest" action="index.php?route=account/pd/pd_investment">
                      <input type="hidden" name="packet" value="100000">
                      <div class="pricingTable-sign-up ">
                          <button type="submit" class="btn btn-block btn-default">Upgrade</button>
                      </div>
                    </form>
                <?php } ?>
            </div>
        </div>

        <div class="col-md-4 col-sm-6">
            <div class="pricingTable">
                <div class="pricingTable-header">
                    <span class="heading">
                      <?php $packet = $self -> check_packet_pd (2000000000) ;?>
                      <?php if(count($packet) > 0) { ?>
                        <?php if (intval($packet['status']) === 0) {?>
                          <h3>Not active</h3>
                        <?php } else { ?>
                          <h3>active</h3>
                        <?php } } else { ?>
                          <h3>Not active</h3>
                      <?php } ?>
                    </span>
                    <span class="price-value"><span class="currency">$</span>200.000<span class="mo"> 80 Week</span></span>
                </div>
 
                <div class="pricingContent">
                  <img src="catalog/view/theme/default/images/200000copy.png" style="margin: 15px auto">
                </div>
                <?php if(count($packet) > 0) { ?>
                  <?php if (intval($packet['status']) === 0) {?>
                    <form class="packet-invest" action="index.php?route=account/pd/pd_investment">
                      <input type="hidden" name="packet" value="200000">
                      <div class="pricingTable-sign-up ">
                          <button type="submit" class="btn btn-block btn-default">Upgrade</button>
                      </div>
                    </form>
                  <?php } else { ?>
                    <div class="pricingTable-sign-up ">
                    <button disabled="true" class="btn btn-block btn-default">Active</button>
                  </div>
                  <?php } } else { ?>
                    <form class="packet-invest" action="index.php?route=account/pd/pd_investment">
                      <input type="hidden" name="packet" value="200000">
                      <div class="pricingTable-sign-up ">
                          <button type="submit" class="btn btn-block btn-default">Upgrade</button>
                      </div>
                    </form>
                <?php } ?>
            </div>
        </div>

      </div>


      <div class="col-md-12">
   <?php if(count($histotys) > 0){?> 

   <div class="panel panel-default">
      <div class="panel-body">
        <h3 class="text-center">History Active Package</h3>
         <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12" id="no-more-tables">
                <table id="datatable" class="table table-striped table-bordered">
                     <thead>
                        <tr>
                           <th class="text-center">#</th>
                           <th>Transaction Number</th>
                           <th>Date</th>
                           <th>Amount</th>
                           <th>Type</th>
                           <th>Balance</th>
                           <th>Detail</th>
                        </tr>
                     </thead>
                     <tbody>
                        <?php if (count($histotys) > 0) { ?>
                        <?php $i = 0; foreach ($histotys as $value) { $i++; ?>
                        <?php 
                           $text_amount = explode(" ", $value['text_amount']);
                           ?>
                        <tr>
                           <td data-title="#" align="center">
                              <?php echo $i ?>
                           </td>
                           <td data-title="Transaction Number" align="center">
                              <?php echo $value['code'] ?>
                           </td>
                           <td data-title="Date" align="center">
                              <?php echo date('d-F-Y H:i A',strtotime($value['date_added'])) ?>
                           </td>
                           <td data-title="Amount" align="center">
                              <?php echo $text_amount[1] ?> USD
                           </td>
                           <td data-title="Type" align="center">
                              <?php if ($value['type'] == "1") { ?>
                              <span class="badge badge-success"><i class="fa fa-plus"></i>Received</span>
                              <?php } else { ?>
                              <span class="badge badge-dranger "><i class="fa fa-minus"></i>Sent</span>
                              <?php } ?>
                           </td>
                           <td data-title="Balance" align="center">
                              <?php echo number_format($value['balance']) ?> USD
                           </td>
                           <td class="text-center" data-title="Details">
                              <a href="#" data-toggle="modal" data-target="#myModal<?php echo $value['code'] ?>" class="btn btn-info btn-sm">View Detail
                              </a>
                           </td>
                        </tr>
                        <div class="modal fade" id="myModal<?php echo $value['code'] ?>" role="dialog">
                           <div class="modal-dialog">
                              <!-- Modal content-->
                              <div class="modal-content">
                                 <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 >Weekly profit $<?php echo $text_amount[1] ?> USD</h4>
                                 </div>
                                 <div class="modal-body">
                                    <div class="row-fluid">
                                       <div class="span8">
                                          <p>
                                             <strong>Transaction Date</strong><br>
                                             <?php echo date('d-F-Y H:i A',strtotime($value['date_added'])) ?>
                                          </p>
                                          <p>
                                             <strong>Transaction  Number</strong>
                                             <br>
                                             #<?php echo $value['code'] ?>
                                          </p>
                                          <p>
                                             <strong>Transaction Type</strong>
                                             <br>
                                             <?php if ($value['type'] == "1") { ?>
                                             <span class="badge badge-success"><i class="fa fa-plus"></i>Received</span>
                                             <?php } else { ?>
                                             <span class="badge badge-dranger "><i class="fa fa-minus"></i>Sent</span>
                                             <?php } ?>
                                          </p>
                                          <p>
                                             <strong>Details</strong>
                                             <br>
                                             <?php echo ($value['system_decsription']) ?>
                                          </p>
                                       </div>
                                       <div class="span4">
                                          <div style="border-radius: 3px; background: <?php echo ($value['type'] == "1") ? '#81c868' : '#e84f4c'?>; text-align: center; padding: 10px; color: #fff; font-size: 14px;">
                                             <p><strong>Amount</strong> </p>
                                             <h3>$<?php echo $text_amount[1] ?></h3>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="clearfix"></div>
                           </div>
                        </div>
               </div>
               <?php } ?>
               <?php } else { ?>
               <tr>
               <td colspan="7" align="center">No data
               </td>
               </tr>
               <?php } ?>
               </tbody>
            </table>
          </div>
      </div>
   </div>
</div>
<?php } ?>
</div>


   </div>
</div>
</div><?php echo $self->load->controller('common/footer') ?>