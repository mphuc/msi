<?php 
   $self -> document -> setTitle('My Referral'); 
   echo $self -> load -> controller('common/header'); 
   echo $self -> load -> controller('common/column_left'); 
   ?>
<div class="content-page">
    <div class="content">
        <div class="section-heading row">
       <div class=" col-lg-9 col-md-8 col-sm-7 col-xs-12">
          <h1 class="title text-uppercase">
             My Referral
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
     
    </div>
    <?php if (count($refferals_pnode) > 0) { ?>
       <div class="panel panel-default">
            <div class="card-box">
                <div class="card-box-head  border-b m-t-0">
                    <h4 class="header-title"><b>My Introducer Detail</b></h4>
                    <div id="no-more-tables" style="margin-top: 30px;">
                     <table id="" class="table table-striped table-bordered">
                        <thead>
                           <tr>
                              <th class="text-center">#</th>
                              <th>ID</th>
                              
                              <th>Phone</th>
                              <th>Email</th>
                              <th>Country</th>
                              <!-- <th>Date Create</th> -->
                           </tr>
                        </thead>
                        <tbody>
                           <?php $count = 1; foreach ($refferals_pnode as $key => $value) { ?>
                           <tr>
                              <td data-title="#" align="center"><?php echo $count ?></td>
                              <td data-title="ID"><?php echo $value['username'] ?></td>
                            
                              <td data-title="Phone" >
                                 <?php echo $value['telephone']; ?>
                              </td>
                              <td data-title="Email"><?php echo $value['email'] ?></td>
                              <td data-title="Country"><?php echo $self->getCountry($value['country_id']); ?></td>
                             <!--  <td data-title="DATE CREATED"><?php echo date("d/m/Y H:i A", strtotime($value['date_added'])); ?></td> -->
                           </tr>
                           <?php $count++; } ?>
                        </tbody>
                     </table>

                  </div>
                </div>
                
            </div>
        </div>
      <?php } ?>
            <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
        <div class="card-box">
                <div class="card-box-head  border-b m-t-0">
                    <h4 class="header-title"><b>  </b></h4>
                    
                  <div id="no-more-tables">
                     <table id="datatable" class="table table-striped table-bordered">
                        <thead>
                           <tr>
                              <th class="text-center">#</th>
                              <th>ID</th>
                              <!-- <th>Level</th> -->
                             
                              <th>Phone</th>
                              <th>Email</th>
                              <th>Country</th>
                              <!-- <th>Date Create</th> -->
                           </tr>
                        </thead>
                        <tbody>
                            <?php if (count($refferals) > 0) { ?>
                           <?php $count = 1; foreach ($refferals as $key => $value) { ?>
                           <tr>
                              <td data-title="#" align="center"><?php echo $count ?></td>
                              <td data-title="ID"><?php echo $value['username'] ?></td>
                              <!-- <td data-title="LEVEL">
                                 <?php echo "L".(intval($value['level']) - 1) ?>
                              </td> -->
                              
                              <td data-title="Phone" >
                                 <?php echo $value['telephone']; ?>
                              </td>
                              <td data-title="Email"><?php echo $value['email'] ?></td>
                              <td data-title="Country"><?php echo $self->getCountry($value['country_id']); ?></td>
                             <!--  <td data-title="DATE CREATED"><?php echo date("d/m/Y H:i A", strtotime($value['date_added'])); ?></td> -->
                           </tr>

                           <?php $count++; } ?>
                           <?php } else { ?>
                            <tr>
                              <td colspan="5"> No Data</td>
                            </tr>
                           <?php } ?>
                        </tbody>
                     </table>
                     <div class="clearfix"></div>
                      <div class="text-center">
                        <?php echo $pagination; ?>
                      </div>
                  </div>
               </div>
            </div>
      </div>
   </div>
   <!-- End Row -->
   <!-- End row -->
</div>
<?php echo $self->load->controller('common/footer') ?>