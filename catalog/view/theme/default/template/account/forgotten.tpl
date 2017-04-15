<!DOCTYPE html>
<html lang="en">

<head>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Mackayshieldslife.com">
<meta name="author" content="SmartBox">


<title>Login | Mackayshieldslife.com </title>

<link rel="shortcut icon" href="catalog/view/theme/default/assets/images/favicon.png">

<link rel="stylesheet" href="catalog/view/theme/default/assets/plugins/morris/morris.css">
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/core.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/components.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/icons.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/pages.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/default/assets/css/responsive.css" type="text/css" />

<link href="catalog/view/theme/default/css/customer.css" rel="stylesheet">
<script src="catalog/view/theme/default/assets/js/modernizr.min.js"></script>

</head>

<body class="loreg-page close-it">
<!-- Begin page -->
<div id="logreg-wrapper" class="login-style2 text-center" style="width: 400px"> 
   <div class="container">
      <a href="#"><img src="catalog/view/theme/default/images/logo.png" style="width: 150px; margin-bottom: 70px;" class="img-responsive center-block" alt=""/></a>


          <h3 class="forgot-heading" style="color: #fff">Reset Password</h3>
          <p style="color: #fff">Enter your ID to reset your password</p>
          <!-- Start Forgot password Form -->
          
          <form action="forgot.html" method="post" >
            <div class="form-group">
              <label>Your ID</label>
              
              <div class="textbox-forgot"><input type="text" name="email" value="" id="input-email" placeholder="Your ID" id="input-password" class="form-control" /></div>
           </div>
            
            <?php
              $ranStr = md5(microtime());
              $ranStr = hexdec( crc32($ranStr));
              $ranStr = substr($ranStr, 0, 6);
              $_SESSION['cap_code'] = $ranStr;
            ?>
            <div class="form-group" style="position: relative;">
              <label>Capcha</label>
              <img class="img_capcha" style="float: right; height: 45px;position: absolute;right: 0; top: 2px;right: 1px;" src="captcha_code.php"/>
              <input style="float: left" autocomplete="off" type="text" name="capcha" placeholder="Capcha" id="input-password" value="" class="form-control" />
              </div>
            </div>
            <div class="row" style="margin-bottom: 20px;">
              <?php if ($error_warning) { ?>
               <div class="text-warning"><i class="fa fa-exclamation-circle"></i>
                  <?php echo $error_warning; ?>
               </div>
               <?php } ?>
            </div>
            <div class="row">
              <div class="col-sm-6 for-left-btn">
                <a class="btn" href="<?php echo $back; ?>.html">GO BACK</a>
            </div>
               

              <div class="col-sm-6">
                <button class="btn btn-success btn-md" type="submit">RESET</button>
              </div>
            </div>
          </form>
          
          <!-- End Forgot password Form -->
        </div>
      </div>
    </div>
    <!-- Global Plugin JavaScript -->
    
  </body>
<script type="text/javascript">
   if (location.hash === '#success') {
      alertify.set('notifier','delay', 100000000);
      alertify.set('notifier','position', 'top-right');
      alertify.success('Create user successfull !!!');
   }
   jQuery(document).ready(function($) {
      jQuery('.cap_code_new').click(function(){
         jQuery('.img_capcha').attr({'src':'<?php echo HTTPS_SERVER;?>captcha_code.php'});

      });
   });
</script>