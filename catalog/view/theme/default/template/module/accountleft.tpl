<?php $route=$self -> request -> get['route']; ?>
<div class="left side-menu">
        <div class="sidebar-inner slimscrollleft">
            <!--- Divider -->
            <div class="col-md-12 user_left_colum text-left">
                <img src="<?php echo ($customer['img_profile'] == "") ?
                      HTTPS_SERVER ."catalog/view/theme/default/images/notFound.png" : $customer['img_profile'] ?>"">
                <div style="margin-top: 5px;"><?php echo $customer['firstname'] ?></div>

                <div><?php echo $customer['username'] ?></div>
                <div class="clearfix"></div>
                
            </div>

            <div class="clearfix" ></div>
            <div id="sidebar-menu" style="margin-top: 10px;">
                <ul>
                    
                    <li class="has_sub">
                        <a href="home.html" class="waves-effect"> <i class="fa fa-dashboard"></i> <span> Dashboard </span> </a>  
                    </li>
                    <li class="has_sub">
                        <a href="deposit.html" class="waves-effect"> <i class="fa fa-cloud-download"></i> <span>Deposit History</span> </a>  
                    </li>
                    <li class="has_sub">
                        <a href="transfer.html" class="waves-effect"> <i class="fa fa-recycle"></i> <span>Transfer</span> </a>  
                    </li>
                    <li class="has_sub">
                        <a href="withdraw.html" class="waves-effect"> <i class="fa fa-cloud-upload"></i> <span>Withdrawal History</span> </a>  
                    </li>
                    <li  class="has_sub"> <a href="investing.html" class="waves-effect"> <i class="fa fa-cubes"></i> <span> Investing </span> </a> </li>

                    <li  class="has_sub"> <a href="refferal.html" class="waves-effect"> <i class="fa fa-group"></i> <span>My Referral </span> </a> </li>
                    <li  class="has_sub"> <a href="genealogy.html" class="waves-effect"> <i class="fa fa-sitemap"></i> <span> Genealogy </span> </a> </li>

                    <li  class="has_sub"> <a href="letter.html" class="waves-effect"> <i class="fa fa-envelope"></i> <span> Welcome Letter </span> </a> </li>

                    <li  class="has_sub"> <a href="stock.html" class="waves-effect"> <i class="fa fa-database"></i> <span> Stock </span> </a> </li>
                    <li class="has_sub">
                        <a href="javascript:void(0);" class="waves-effect"> <i class="fa fa-history"></i> <span> Profit History </span> <span class="fa fa-angle-right cb-nav-arrow"></span> </a>
                        <ul class="list-unstyled">
                            <li><a href="week-profit.html">Weekly profit</a> </li>
                            <li><a href="network-profit.html">Network Commision</a> </li>
                            <li><a href="direct-profit.html">Direct commission</a> </li>
                            <li><a href="resonance-profit.html">Resonance Commision</a> </li>
                        </ul>
                    </li>
                    <li  class="has_sub"> <a href="your-profile.html" class="waves-effect"> <i class="fa fa-cogs"></i> <span> Account Settings</span> </a> </li>
                    <li  class="has_sub"> <a href="logout.html" class="waves-effect"> <i class="fa fa-power-off"></i> <span> Logout</span> </a> </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
            
        </div>
    </div>
    <!-- Left Sidebar End --> 
