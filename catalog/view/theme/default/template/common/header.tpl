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
      <link rel="icon" href="catalog/view/theme/default/img/logo_favi.png">
      
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
<body class="fixed-left close-it">
  <div id="wrapper">
   
    <div class="topbar">
    <!-- LOGO -->
    <div class="topbar-left">
      <a href="javascript:void(0)" class="logo d-logo hidden-xs hidden-sm">
      </a> 
      <a href="javascript:void(0)" class="logo d-logo hidden visible-xs visible-sm">
        <img src="assets/images/m-logo.png" alt="SmartBox" class="img-responsive hidden-xs" height="0">
      </a> 
      <!-- Image Logo here --> 
    </div>
    
    <!-- Button mobile view to collapse sidebar menu -->
    <div class="navbar navbar-default" role="navigation">
      <div class="container">
        <div class="top-fix-navbar">
          <div class="pull-left">
            <button class="button-menu-mobile open-left waves-effect waves-light"> <i class="fa fa-outdent"></i> </button>
            <span class="clearfix"></span> 
          </div>
          
          <ul class="nav navbar-nav navbar-right pull-right">
           
            <li class="dropdown top-menu-item-xs"> <a href="javascript:void(0)" class="right-bar-toggle profile waves-effect waves-light dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="user-name"><?php echo $customer['firstname'] ?></span> <span class="caret"></span> 
            
            <?php if ($customer['img_profile'] == "") { ?>
              <img src="catalog/view/theme/default/images/logo.png" alt="user-img" class="img-circle"> 
            <?php } else { ?>

            <img src="<?php echo $customer['img_profile'] ?>" alt="user-img" class="img-circle"> 
            <?php } ?>
          </a> 

              <ul class="dropdown-menu">
                <li><a href="your-profile.html"><i class="ti-settings m-r-10 text-custom"></i> Settings</a> </li>
                <li><a href="logout.html"><i class="ti-lock m-r-10 text-custom"></i> Lock screen</a> </li>
                <li class="divider"></li>
                <li><a href="logout.html"><i class="ti-power-off m-r-10 text-danger"></i> Logout</a> </li>
              </ul>
            </li>
          </ul>
        </div>
        <!--/.nav-collapse --> 
      </div>
    </div>
  </div>
  <!-- Top Bar End --> 

                                  
                                  