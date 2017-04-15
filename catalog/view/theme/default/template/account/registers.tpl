<!DOCTYPE html>
<html lang="en">

<head>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
<meta name="author" content="SmartBox">


<title>Create New User | Mackayshieldslife.com </title>

<!-- FAVICON -->
<link rel="icon" href="catalog/view/theme/default/images/logo_icon.png">

<link rel="stylesheet" href="catalog/view/theme/default/assets/plugins/morris/morris.css">
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/core.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/components.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/icons.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/pages.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/responsive.css" type="text/css" />
<link href="catalog/view/theme/default/css/customer.css" rel="stylesheet">
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>

<script src="catalog/view/javascript/register/register.js" type="text/javascript"></script>
<script src="catalog/view/theme/default/assets/js/modernizr.min.js"></script>

</head>

<body class="loreg-page close-it customer">
<div id="logreg-wrapper" class="login-style2 text-center customer"> 
   <div class="container">

               <?php if(!$p_binary) { ?>
      <form id="register-account" action="<?php echo $self -> url -> link('account/register', '', 'SSL'); ?>" class="form-horizontal" method="post" novalidate="novalidate">
         <?php  } else { ?>
      <button onclick="goBack()" type="button" style="position: absolute;left: 10px;color: #fff" class="close" data-dismiss="alert" aria-hidden="true"><i class="fa fa-angle-double-left" aria-hidden="true"></i>  Back</button>
      <form id="register-account" action="<?php echo $self -> url -> link('account/personal/register_submit', '', 'SSL'); ?>" class="form-horizontal" method="post" novalidate="novalidate" style="margin-bottom: 70px;padding-right: 35px;" >
         <?php }?>
         <?php if($p_binary) { ?>
         <input type="hidden" name="p_binary" value="<?php echo $p_binary ?>"/>
         <input type="hidden" name="postion" value="<?php echo $postion ?>">
         <?php } ?>
         <?php 
            $token = explode("_", $self -> request -> get['id']);
            if(intval($self -> checkBinaryLeft($token[0], $token[1])) === 1) { ?>
            <a href="#" ><img style="margin-bottom: 20px;width: 300px" src="catalog/view/theme/default/images/logo.png" class="img-responsive center-block" alt=""/></a>

            <div class="form-group">
               <div class="textbox-login">
                  <label>Full name</label>
                  <input type="hidden" name="node" value="<?php echo $token['2']; ?>">
                  <input class="form-control" placeholder="Full name" name="username" id="username" value="" data-link="<?php echo $actionCheckUser; ?>">
               </div>
            </div>

            <div class="form-group">
                  <div class="textbox-login">
                  <label>Email</label>
                  <input class="form-control" placeholder="Email Address" name="email" id="email" data-link="<?php echo $actionCheckEmail; ?>">
                  
               </div>
            </div>

             <div class="form-group">
                  <div class="textbox-login">
                  <label>Phone</label>
                  <input class="form-control" placeholder="Phone Number" name="telephone" id="phone" data-link="<?php echo $actionCheckPhone; ?>">
                  
               </div>
            </div>
            <div class="form-group">
                  <div class="textbox-login">
                     <label>Sponser</label>
                     <input class="form-control" placeholder="sponser" name="sponser" id="" readonly value="<?php echo $customercode['username'];?>">
                     
                  </div>
                  
            </div>

            <div class="form-group">
                  <div class="textbox-login">
                     <label>Position</label>
                     <input class="form-control" placeholder="position" name="position" id="" value="<?php echo $token['1'] ?>" readonly>
                  </div>
                  
            </div>

             <div class="form-group">
                  <div class="textbox-login">
                  <label>Country</label>
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

           <div class="form-group">
                  <div class="textbox-login">
                  <label>Password</label>
                  <input class="form-control" placeholder="Password For Login" id="password" name="password" type="password">
                 
               </div>
            </div>


            <div class="clearfix"></div>   
            <div class="bottom-login">
               <div class="remember-text-login text-left">
                  <span class="checkbox-custom checkbox-primary">
                  <input id="agreeTerm" type="checkbox" value="true" style="width: 20px; float: left;padding: 0px;margin-top: -14px; margin-right: 10px;">
                  <label for="requiredCheckbox" class="text-left">I agree to the <a href="terms.html">Terms and Conditions</a></label>
                  </span>
               </div>
            </div>
            <div class="bottom-login" style="margin-top: 30px;">
              <button disabled="true" style="margin: 0 auto" type="submit" class="btn btn-info mobile-btn-login btn-sign waves-effect waves-dark">Register</button>
            </div>
            
            </div>

             
         <?php } else { ?>
         <div class="alert alert-danger" style="margin-top:100px;">
            
            <strong>Warning!</strong> This branch has had! Please choose another branch!

            <button onclick="goBack()" type="button" style="margin-top: 40px; width: 100%; float: left;" class="close" data-dismiss="alert" aria-hidden="true"><i class="fa fa-angle-double-left" aria-hidden="true"></i>  Back</button>
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
