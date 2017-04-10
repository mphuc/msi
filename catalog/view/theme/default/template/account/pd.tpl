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
 							    <th>Code</th>
                              <th>Date Created</th>
                              <th>Packet</th>
                              <th>Profit</th>
                              <th>Time</th>
                           </tr>
                        </thead>
                        <tbody>
                           <?php foreach ($pds as $value=> $key){?> 
                           <tr>
        					<td data-title="Code">#<?php echo $key['pd_number'] ?></td>
                            <td data-title="Date Created"><?php echo date("Y-m-d H:i:A", strtotime($key['date_added'])); ?></td>
                              
                            <td data-title="Packet">
                              	<?php echo (doubleval($key['filled']) / 100000000) ?> BTC
                            </td>
                            <td data-title="Profit"> <?php echo (doubleval($key['max_profit']) / 100000000) ?> BTC</td>
                      
                            <td data-title="Time"> <span style="color:; font-size:15px;" class="text-warning countdown" data-countdown="<?php echo  $key['date_finish'] ?>"> </span> </td>
                           </tr>
                           <?php }?> 
                        </tbody>
                     </table>
                  </div>
               </div>
              
               
            </div>
         </div>
         <?php } ?>

         </div>
        
      <div class="row">

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
                    <span class="price-value"><span class="currency">$</span>100<span class="mo"> 8 Week</span></span>
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
                    <button disabled="true" class="btn btn-block btn-default">Active</button>
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
                    <span class="price-value"><span class="currency">$</span>500<span class="mo"> 8 Week</span></span>
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
                    <button disabled="true" class="btn btn-block btn-default">Active</button>
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
                    <span class="price-value"><span class="currency">$</span>1000<span class="mo"> 8 Week</span></span>
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
                    <button disabled="true" class="btn btn-block btn-default">Active</button>
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
                    <span class="price-value"><span class="currency">$</span>2000<span class="mo"> 8 Week</span></span>
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
                    <button disabled="true" class="btn btn-block btn-default">Active</button>
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
                    <span class="price-value"><span class="currency">$</span>5000<span class="mo"> 8 Week</span></span>
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
                    <button disabled="true" class="btn btn-block btn-default">Active</button>
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
                    <span class="price-value"><span class="currency">$</span>10.000<span class="mo"> 8 Week</span></span>
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
                    <button disabled="true" class="btn btn-block btn-default">Active</button>
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
                    <span class="price-value"><span class="currency">$</span>50.000<span class="mo"> 8 Week</span></span>
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
                    <button disabled="true" class="btn btn-block btn-default">Active</button>
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
                    <span class="price-value"><span class="currency">$</span>100.000<span class="mo"> 8 Week</span></span>
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
                    <button disabled="true" class="btn btn-block btn-default">Active</button>
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
                    <span class="price-value"><span class="currency">$</span>200.000<span class="mo"> 8 Week</span></span>
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
                    <button disabled="true" class="btn btn-block btn-default">Active</button>
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