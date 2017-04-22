<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
   <head>
      <meta charset="UTF-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title><?php echo $title; ?> </title>
      <meta http-equiv="cache-control" content="no-cache"/>
      <base href="<?php echo $base; ?>"/>
      <?php if ($description){ ?>
      <meta name="description" content="<?php echo $description; ?>"/>
      <?php } ?><?php if ($keywords){ ?>
      <meta name="keywords" content="<?php echo $keywords; ?>"/>
      <?php } ?>
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <link rel="icon" href="catalog/view/theme/default/images/logo_icon.png">
      
      <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
      
      <script src="catalog/view/javascript/bootstrap.min.js"></script>
    
      <!---  -->
      <link rel="stylesheet" href="catalog/view/theme/default/assets/plugins/morris/morris.css">
      <link rel="stylesheet" href="catalog/view/theme/default/assets/css/bootstrap.css" type="text/css" />
      <link rel="stylesheet" href="catalog/view/theme/default/assets/css/core.css" type="text/css" />
      <link rel="stylesheet" href="catalog/view/theme/default/assets/css/components.css" type="text/css" />
      <link rel="stylesheet" href="catalog/view/theme/default/assets/css/icons.css" type="text/css" />
      <link rel="stylesheet" href="catalog/view/theme/default/assets/css/pages.css" type="text/css" />
      <link rel="stylesheet" href="catalog/view/theme/default/assets/css/responsive.css" type="text/css" />
      <script src="catalog/view/theme/default/assets/js/modernizr.min.js"></script>
      <!---  -->  
      
      
      <link href="catalog/view/theme/default/css/customer.css" rel="stylesheet">
      <?php foreach ($styles as $style) { ?>
      <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
      <?php } ?>
      <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
      <script type="text/javascript" src="catalog/view/javascript/jquery.simplyscroll.js"></script>
      <?php foreach ($scripts as $script) { ?>
      <script src="<?php echo $script; ?>" type="text/javascript"></script>
      <?php } ?>
      <?php echo $google_analytics; ?>
      <script type="text/javascript"> 
        window.funLazyLoad = {
            start: function() {
                $('.page-loader').show();
            },
            reset: function() {
                $('.page-loader').hide();
            },
            show: function() {
                $('.page-loader').show();
            }
        };
        
      </script>
      <script src="catalog/view/javascript/jquery.form.min.js" type="text/javascript"></script><script src="catalog/view/javascript/alertifyjs/alertify.js" type="text/javascript"></script>
      <link href="catalog/view/theme/default/css/al_css/alertify.css" rel="stylesheet">
      <script src="catalog/view/javascript/changeLang.js" type="text/javascript"></script><script type="text/javascript" src="catalog/view/javascript/bxslider/jquery.bxslider.js"></script>
    
   </head>
<body class="fixed-left close-it widescreen">
  <div id="wrapper">
   
    <div class="topbar">
    <!-- LOGO -->
    <div class="topbar-left">
      <a href="javascript:void(0)" class="logo d-logo hidden-xs hidden-sm">
         <img src="catalog/view/theme/default/images/logo_home.png" alt="" style="width: 84%; margin: -11px auto;" class="img-responsive hidden-xs" height="0">
      </a> 
      <a href="javascript:void(0)" class="logo d-logo visible-xs visible-sm">
        <img src="catalog/view/theme/default/images/logo_icon.png" alt="" style="width: 50px;" class="img-responsive" height="0">
      </a> 
      <!-- Image Logo here --> 
    </div>
    
    <!-- Button mobile view to collapse sidebar menu -->
    <div class="navbar navbar-default" role="navigation">
      <div class="container">
        <div class="top-fix-navbar">
          <div class="pull-left">
            <button class="button-menu-mobile open-left waves-effect waves-light hidden-sm hidden-md hidden-lg"> <i class="fa fa-align-justify" aria-hidden="true"></i> </button>
            <span class="clearfix"></span> 
          </div>
          

          
          <div class="text-right">
            
            <div class="pull-right logout">
              <a href="logout.html"><i class="ti-power-off m-r-10 text-danger"></i> LogOut</a>
            </div>

            <div class="pull-right logout" style="margin-right: 10px;">
              <a href="message.html"><i class="fa fa-envelope" aria-hidden="true"></i></a>
            </div>

            
          </div>
        </div>
        <!--/.nav-collapse --> 
      </div>
    </div>
  </div>
  <!-- Top Bar End --> 

                                  
                                  