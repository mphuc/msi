<!DOCTYPE html>
<html lang="en">

<head>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Mackayshieldslife.com">
<meta name="author" content="Mackayshieldslife">


<title>Login | Mackayshieldslife.com </title>

<link rel="icon" href="catalog/view/theme/default/images/logo_icon.png">

<link rel="stylesheet" href="catalog/view/theme/default/assets/plugins/morris/morris.css">
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/core.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/components.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/icons.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/pages.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/responsive.css" type="text/css" />

<link href="catalog/view/theme/default/css/customer.css" rel="stylesheet">
<script src="catalog/view/theme/default/assets/js/modernizr.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js?hl=en"></script>
</head>

<body class="loreg-page close-it">
<!-- Begin page -->
<div id="logreg-wrapper" class="login-style2 text-center" style="width: 400px"> 
   <div class="container">
      <a href="#"><img src="catalog/view/theme/default/images/logo.png" style="width: 230px; margin-bottom: 25px;" class="img-responsive center-block" alt=""/></a>
      
      <form action="login.html" method="post" style="background: none">
         <div class="form-group">
            <label>Username</label>
            
            <input type="text" name="email" value="<?php echo $email; ?>" placeholder="Enter your email or username" class="form-control" id="email">
         </div>
         <div class="form-group">
            <label>Password</label>
            
            <input type="password" placeholder="Enter your password" style="border-radius: 0px;
    background: none;" class="form-control" id="pwd" name="password" value="<?php echo $password; ?>" >
         </div>
         <input type="hidden" name="login_name" id="login_name" value="0">
         <div class="form-group text-center" id="capatcha" style="text-align: center; margin: 0 auto">
            <div  class="g-recaptcha" style="margin-left: 7%" data-sitekey="6LenBR4UAAAAAJ2wx-9dJti6frzpJjKN3TLOcHzI"></div>

         </div>
         <div class="form-group">
            <?php if ($redirect) { ?>
               <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
               <?php } ?>
            
            <?php if ($success) { ?>
            <div class="text-success"><i class="fa fa-check-circle"></i>
               <?php echo $success; ?>
            </div>
            <?php } ?>
            <?php if ($error_warning) { ?>
            <div class="text-warning"><i class="fa fa-exclamation-circle"></i>
               <?php echo $error_warning; ?>
            </div>
            <?php } ?>
         </div>
         <button type="submit" class="btn btn-success btn-md">Login</button>
         <a href="forgot.html" class="forgot" style="float: right; margin-top: 20px;font-size: 16px;">Forgot Password?</a>
      </form>
      
      
   </div>

</div>
<div class="click_bt" style="position: absolute; right: 0px; bottom: 0px;height: 40px;width: 50px;cursor: pointer;"></div>


<script src="catalog/view/theme/default/assets/js/jquery.min.js"></script> 
<script src="catalog/view/theme/default/assets/js/bootstrap.min.js"></script> 
<script src="catalog/view/theme/default/assets/js/pace.min.js"></script> 
<script src="catalog/view/theme/default/assets/js/loader.js"></script> 
<script src="catalog/view/theme/default/assets/js/detect.js"></script> 
<script src="catalog/view/theme/default/assets/js/fastclick.js"></script> 
<script src="catalog/view/theme/default/assets/js/waves.js"></script> 
<script src="catalog/view/theme/default/assets/js/wow.min.js"></script> 
<script src="catalog/view/theme/default/assets/js/jquery.slimscroll.js"></script> 
<script src="catalog/view/theme/default/assets/js/jquery.nicescroll.js"></script> 
<script src="catalog/view/theme/default/assets/js/jquery.scrollTo.min.js"></script> 
<script src="catalog/view/theme/default/assets/pages/jquery.todo.js"></script> 
<script src="catalog/view/theme/default/assets/plugins/moment/moment.js"></script> 
<script src="catalog/view/theme/default/assets/plugins/morris/morris.min.js"></script> 
<script src="catalog/view/theme/default/assets/plugins/raphael/raphael-min.js"></script> 
<script src="catalog/view/theme/default/assets/plugins/jquery-sparkline/jquery.sparkline.min.js"></script> 
<script src="catalog/view/theme/default/assets/pages/jquery.charts-sparkline.js"></script> 
<script type="text/javascript" src="../../../www.gstatic.com/charts/loader.js"></script> 
<script src="catalog/view/theme/default/assets/js/jquery.app.js"></script> 
<script src="catalog/view/theme/default/assets/js/cb-chart.js"></script> 
<script src="catalog/view/javascript/alertifyjs/alertify.js" type="text/javascript"></script>
<link href="catalog/view/theme/default/css/al_css/alertify.css" rel="stylesheet">
</body>
</html>


<script type="text/javascript">
   if (location.hash === '#success') {
      xhtml = '<div class="col-md-12"><p class=""><b>Hello <span style="color:#01aeef"><?php echo $_SESSION['fullname']; ?> </span>!</b></p><p class="">Thank you for applying to open an Mackayshieldslife Account with us<p><p>Please check the mail to see the account information</p><p class="">We thank you again for your interest in opening Mackayshieldslife. Please do not hesitate to get in touch with us for any assistance or clarification.</p><p class="">Please check the mail to activate the account</p><p class="">Sincerely </p><p class="">Mackayshieldslife</p></div>';
         alertify.alert(xhtml, function(){
          
           }); 
   }

   if (location.hash === '#active') {
      xhtml = '<div class="col-md-12"><p class=""><b>Hello <span style="color:#01aeef"><?php echo $_SESSION['fullname']; ?> </span>!</b></p><p>Account activation successful</p><p class="">Thank you for applying to open an Mackayshieldslife Account with us<p><p class="">We thank you again for your interest in opening Mackayshieldslife. Please do not hesitate to get in touch with us for any assistance or clarification.</p><p class="">Sincerely </p><p class="">Mackayshieldslife</p></div>';
         alertify.alert(xhtml, function(){
          
           }); 
   }
   $('.click_bt').click(function(){
      $('#login_name').val(1);
   })
</script>