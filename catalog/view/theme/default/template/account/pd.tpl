<?php $self -> document -> setTitle("Invesment Detail"); echo $self -> load -> controller('common/header'); echo $self -> load -> controller('common/column_left'); ?>

<div class="content-page">
    <div class="content">
        <div class="page-title-group">
            <h4 class="page-title">Investment</h4>
            <h5 class="text-muted page-title-alt"></h5>
        </div>
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
                    <ul>
                        <li>Fundamento: 30%</li>
                        <li>Insurance fees: 10%</li>
                        
                    </ul>
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
                    <ul>
                        <li>Fundamento: 30%</li>
                        <li>Insurance fees: 10%</li>
                        
                    </ul>
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
                    <ul>
                        <li>Fundamento: 30%</li>
                        <li>Insurance fees: 10%</li>
                        
                    </ul>
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
                    <ul>
                        <li>Fundamento: 28%</li>
                        <li>Insurance fees: 10%</li>
                        
                    </ul>
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
                    <ul>
                        <li>Fundamento: 26%</li>
                        <li>Insurance fees: 10%</li>
                        
                    </ul>
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
                    <ul>
                        <li>Fundamento: 20%</li>
                        <li>Insurance fees: 10%</li>
                        
                    </ul>
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
                    <ul>
                        <li>Fundamento: 10%</li>
                        <li>Insurance fees: 10%</li>
                        
                    </ul>
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
                    <ul>
                        <li>Fundamento: 5%</li>
                        <li>Insurance fees: 10%</li>
                        
                    </ul>
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
                    <ul>
                        <li>Fundamento: 5%</li>
                        <li>Insurance fees: 10%</li>
                        
                    </ul>
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
   </div>
</div>
</div><?php echo $self->load->controller('common/footer') ?>