<?php
$self -> document -> setTitle('Create New User');
 echo $header; ?>
<?php echo $self->load->controller('common/column_left');  ?>
<div class="content-page">
    <div class="content">
         <div class="page-title-group" style="border: none;">
            
        </div>
        <div class="cb-page-content">
            <div class="container" >
                <div class="row">
               <div class="panel panel-default">
                  <div class="register-login-form page-login-image" >
                     <div class="main-login-form register-page">
                           <div class="content-login">
                              <div class="login-page">
                                 <div class="logo-title col-md-6 col-md-push-3 text-center">
                                    <!-- Template Logo -->
                                    <img src="catalog/view/theme/default/img/logo.png" alt="logo" style=" width:150px; margin-top: 30px; margin-bottom: 40px;">
                                 </div>
                                 <div class="clearfix"></div>
                              </div>
                        </div>
               <!-- Start Register Form -->
               <?php if(!$p_binary) { ?>
      <form id="register-account " action="<?php echo $self -> url -> link('account/register', '', 'SSL'); ?>" class="form-horizontal form-login" method="post" novalidate="novalidate">
         <?php  } else { ?>
      <form id="register-account" action="<?php echo $self -> url -> link('account/personal/register_submit', '', 'SSL'); ?>" class="form-horizontal form-login col-md-6 col-md-push-3" method="post" novalidate="novalidate" style="margin-bottom: 70px;" >
         <?php }?>
         <?php if($p_binary) { ?>
         <input type="hidden" name="p_binary" value="<?php echo $p_binary ?>"/>
         <input type="hidden" name="postion" value="<?php echo $postion ?>">
         <?php } ?>
         <?php 
            $token = explode("_", $self -> request -> get['id']);
            if(intval($self -> checkBinaryLeft($token[0], $token[1])) === 1) { ?>
            <div class="input-box">
               
               <div class="textbox-login">
                  <input type="hidden" name="node" value="<?php echo $self->request->get['ref']; ?>">
                  <input class="form-control" placeholder="Full name" name="username" id="username" value="" data-link="<?php echo $actionCheckUser; ?>">
                 
               </div>
            </div>

            <div class="input-box">
               
               <div class="textbox-login">
                 
                  <input class="form-control" placeholder="Email Address" name="email" id="email" data-link="<?php echo $actionCheckEmail; ?>">
                  
               </div>
            </div>

            <div class="input-box">
               
               <div class="textbox-login">
                  <input class="form-control" placeholder="Phone Number" name="telephone" id="phone" data-link="<?php echo $actionCheckPhone; ?>">
                  
               </div>
            </div>

            <div class="input-box">
               
               <div class="textbox-login">
                  <select class="form-control" id="country" name="country_id">
                     <option value="">-- Choose your Country --</option>
                     <?php foreach ($country as $key=> $value) {?>
                     <option value="<?php echo $value['id'] ?>">
                        <?php echo $value[ 'name'] ?>
                     </option>
                     <?php } ?>
                  </select>
                  
               </div>
            </div>

            <div class="input-box">
               
               <div class="textbox-login">
                  <input class="form-control" placeholder="Password For Login" id="password" name="password" type="password">
                 
               </div>
            </div>
            <div class="bottom-login">
               <div class="remember-text-login">
                  <span class="checkbox-custom checkbox-primary">
                  <input id="agreeTerm" type="checkbox" value="true">
                  <label for="requiredCheckbox">I agree to the <a href="javascript:void(0)">Terms and Conditions</a> and <a href="javascript:void(0)">Privacy Policy. </a></label>
                  </span>
               </div>
            </div>
            <div class="bottom-login">
              <button disabled="true" style="margin: 0 auto" type="submit" class="btn btn-danger btn-md">Register</button>
            </div>
            
            </div>
      
      
                  
         <?php } else { ?>
         <div class="alert alert-danger" style="margin-top:100px;">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <strong>Warning!</strong> This branch has had! Please choose another branch!
         </div>
         <?php } ?>
         <div class="clearfix"></div>

      </form>
               
               <!-- End Register Form -->
              
            </div>
         </div>
      </div>

</div>
<?php echo $footer; ?>

<script type="text/javascript">
   if (location.hash === '#success') {
      alertify.set('notifier','delay', 100000000);
      alertify.set('notifier','position', 'top-right');
      alertify.success('Create user successfull !!!');
   }
   
</script>
