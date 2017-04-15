<!DOCTYPE HTML PUBLIC>
<html>
   <head>
      <title>Bitcoin Pay-Per-Product Cryptocoin Payment Example</title>
      <link rel="icon" href="catalog/view/theme/default/images/logo_icon.png">
      <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
      
       <link rel="stylesheet" href="catalog/view/theme/default/assets/plugins/morris/morris.css">
      <link rel="stylesheet" href="catalog/view/theme/default/assets/css/bootstrap.css" type="text/css" />
      <link rel="stylesheet" href="catalog/view/theme/default/assets/css/core.css" type="text/css" />
      <link rel="stylesheet" href="catalog/view/theme/default/assets/css/components.css" type="text/css" />
      <link rel="stylesheet" href="catalog/view/theme/default/assets/css/icons.css" type="text/css" />
      <link rel="stylesheet" href="catalog/view/theme/default/assets/css/pages.css" type="text/css" />
      <link rel="stylesheet" href="catalog/view/theme/default/assets/css/responsive.css" type="text/css" />
      <link href="catalog/view/theme/default/css/customer.css" rel="stylesheet">
      <script src="catalog/view/theme/default/assets/js/modernizr.min.js"></script>
      <script type="text/javascript" src="catalog/view/javascript/deposit/deposit.js"></script>
   </head>
   <body class="confirm_deposit" style='font-family:Arial,Helvetica,sans-serif;font-size:13px;color:#666;margin:0;'>
      <div align='center'>
        <br>
        <br>
         <h2 style="margin-top: -13px;">Pay Invoice Now</h2>
        <div class="" style="border-radius:15px;box-shadow:0 0 12px #aaa;-moz-box-shadow:0 0 12px #aaa;-webkit-box-shadow:0 0 12px #aaa;padding:13px 16px;max-width:580px">
         <table width="500" cellpadding="0" cellspacing="7" >
           <tbody>
              <tr>
                 <td colspan="2">
                    <div class="refresh" style="display:none"><a onclick="return location.reload(true); "><img border="0" width="150" height="150" alt="Refresh" src="catalog/view/theme/default/images/refresh.png"></a></div>
                    <table width="100%" cellpadding="0" cellspacing="5" style="margin-bottom: 10px;">
                       <tbody>
                          <tr>
                             <td valign="bottom" class="sum">Total: <span class="font12"><?php echo $invoice['amount']/100000000 ?></span> BTC</td>
                             <td><a target="_blank" href="https://gourl.io/" class="tooltip-bottom" title=""><img class="logo" border="0" alt="Bitcoin Payment System" src="catalog/view/theme/default/images/payment.png"></a></td>
                          </tr>
                       </tbody>
                    </table>
                 </td>
              </tr>
              <tr class="coin_yes" style="<?php echo ($invoice['confirmations'] == 3) ? "" :'display:none;' ?>">
                 <td width="170" class="top5" align="center"><img border="0" alt="Payment Successfully Received!" src="catalog/view/theme/default/images/paid.png"></td>
                 <td align="center" valign="top" style="">
                    <div class="result1">Payment Successfully <br>Received!</div>
                    <div class="result2" style="margin: 10px 0;">Received on&nbsp; <span id="dt"><b></b></span></div>
                    <div class="top15"><a href="deposit.html"><button class="btn-res tooltip-top2" title="">Go Back</button></a></div>
                 </td>
              </tr>
              <tr class="coin_no" style="<?php echo ($invoice['confirmations'] != 3) ? "" :'display:none;' ?>">
                 <td width="110"><a class="tooltip-right" title=""><img style="margin-right:10px" border="0" width="110" height="110" src="https://chart.googleapis.com/chart?chs=110x110&chld=L|0&cht=qr&chl=bitcoin:<?php echo $invoice['input_address'];?>?amount=<?php echo $invoice['amount']/100000000;?>"></a></td>
                 <td valign="top">
                    <div class="intro">
                       1. Get Bitcoins (BTC) at <a target="_blank" href="https://localbitcoins.com/?ch=4rwv">localbitcoins.com</a> if you don't already have any.<br>
                       2. <a target="_blank" class="tooltip-right2" title="" href="https://bitcoin.org/#download">Send</a> <?php echo $invoice['amount']/100000000 ?> Bitcoins (in ONE payment) to the address below.<br>
                       &nbsp; &nbsp; If you send <b>any other bitcoin amount</b>, payment system will <b>ignore it</b> !<br>
                    </div>
                    <div class="intro_send">Send EXACTLY <span class="font12"><?php echo $invoice['amount']/100000000 ?></span> BTC (<a class="tooltip-fee" href="#" title="" style="font-weight: normal;">plus fees</a>) to:</div>
                    <div align="right">
                       <table cellpadding="0" cellspacing="0" style="margin:0px 0">
                          <tbody>
                             <tr>
                                <td>
                                  <input style="width: 255px" readonly class="js-copytextarea addr tooltip-top "value="<?php echo $invoice['input_address'];?>" title=">">
                                </td>

                                <td style="min-width:80px"><button class="btn-wallet tooltip-top4" title="">Open Wallet</button></td>
                             </tr>
                          </tbody>
                       </table>

                    </div>

                 </td>
              </tr>
           </tbody>
        </table>
        <div class="coin_no top12"  style="<?php echo ($invoice['confirmations'] != 3) ? "" :'display:none;' ?>"><button class="btn-copy tooltip-top js-textareacopybtn" title="">Copy Address</button> &nbsp; &nbsp; <button class="btn-wait tooltip-top3" title=""> &nbsp; <span class="btn-spinner"></span><i style="font-size: 13px;" class="fa fa-circle-o-notch fa-spin fa-3x fa-fw"></i> Awaiting Payment From You &nbsp; </button></div>
        </div>
         
         <div>
           
         </div>
         
            <div align='center'>
            <a href="check_payment.html?invoid_id=<?php echo $_GET['invoid_id'];?>">
            <button style='color:#555;border-color:#ccc;background:#f7f7f7;-webkit-box-shadow:inset 0 1px 0 #fff,0 1px 0 rgba(0,0,0,.08);box-shadow:inset 0 1px 0 #fff,0 1px 0 rgba(0,0,0,.08);vertical-align:top;display:inline-block;text-decoration:none;font-size:13px;line-height:26px;min-height:28px;margin:20px 0 25px 0;padding:0 10px 1px;cursor:pointer;border-width:1px;border-style:solid;-webkit-appearance:none;-webkit-border-radius:3px;border-radius:3px;white-space:nowrap;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;font-family:"Open Sans",sans-serif;font-size: 13px;font-weight: normal;text-transform: none;'>&#160; Click Here if you have already sent Bitcoins &#187; &#160;</button></div>
         
         <br><br><br><br>
         <h3>Message :</h3>
         <h2 style='color:#999' id="message_no"><?php echo ($invoice['confirmations'] == 3) ? "This invoice has been paid!" :'This invoice has not been paid yet!' ?></h2>
      </div>
      <br><br><br><br><br><br>
   </body>
</html>
<style type="text/css">
  body{
    background: #FFF;
    width: 100%;
    height: 100%;
  }
</style>
<script type="text/javascript">
  checkPayment("<?php echo $_GET['invoid_id']; ?>");

  var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

  copyTextareaBtn.addEventListener('click', function(event) {
    var copyTextarea = document.querySelector('.js-copytextarea');
    copyTextarea.select();

    try {
      var successful = document.execCommand('copy');
      var msg = successful ? 'successful' : 'unsuccessful';
      console.log('Copying text command was ' + msg);
    } catch (err) {
      console.log('Oops, unable to copy');
    }
  });
</script>