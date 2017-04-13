<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
<div class="page-header">
  <div class="container-fluid">
    <h1>Withdraw Orther</h1>

  </div>
</div>
<div class="container-fluid">
  <div class="panel panel-default">
    <div class="panel-heading">      
      
    </div>
    <div class="panel-body row">
        <div class="clearfix" style="margin-top:10px;"></div>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <th>TT</th>
            <th>Username</th>
            <th>Wallet</th>
            <th>Amount USD</th>
            <th>Payment Method</th>
            <th>Date</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
        <?php 
          $i = 0;
          //print_r($_SESSION); die;
          foreach ($code as $value) {
            $i++;
        ?>
          <tr>
            <td><?php echo $i; ?></td>
            <td><?php echo $value['username'] ?></td>
            <td><a target="_blank" href="https://blockchain.info/address/<?php echo $value['addres_wallet'] ?>"><?php echo $value['addres_wallet'] ?> <i class="fa fa-external-link" aria-hidden="true"></i></a></td>
            <td><?php echo $value['amount_usd']; ?> USD</td>
            <td><?php echo $value['method_payment']; ?> BTC</td>
            <td><?php echo date('d/m/Y H:i:s',strtotime($value['date_added'])) ?></td>
            <td>
              <a href="index.php?route=pd/withdraw/payment&token=<?php echo $_GET['token'] ?>&id=<?php echo $value['id'] ?>">
                <button type="button" onclick="return confirm('Payment ?');" class="btn btn-success">Payment</button>
              </a>
            </td>
          </tr>
         <?php
          }
         ?>
        </tbody>
      </table>
      <?php echo $pagination; ?>
    </div>
  </div>
</div>
<?php echo $footer; ?>
<style>
  form label{
    width: 130px;
    height: 30px;
  }
  form input{
    padding: 7px;
    font-weight: bold;
    border: 1px solid #e4e4e4;
    width: 300px;
    border-radius: 3px;
  }
</style>
<script>
  var balace_btc = parseFloat(<?php echo $blance_blockio; ?>);
  var total = parseFloat(<?php echo $total; ?>);
  $('#forn_payment').on('submit',function(){
    /*if (parseFloat(balace_btc) < parseFloat(total)+0.00021)
    {
      var html = '<div class="col-md-12">';
        html += '<p class="text-center" style="font-size:23px;text-transform: uppercase;height: 20px;color:red">ERROR !</p><p class="text-center" style="font-size:20px;height: 20px">You need '+(parseFloat(total+0.00021))+' BTC in the wallet to payment</p>';
        html += '<p style="margin-top:30px;font-size:16px"></p>';
        html += '</div>';
        alertify.alert(html, function(){
           
        });
        return false;
    }*/
       
  })
  if (location.hash === '#no_google') {
      var html = '<div class="col-md-12">';
        html += '<p class="text-center" style="font-size:23px;text-transform: uppercase;height: 20px;color:red">ERROR !</p><p class="text-center" style="font-size:20px;height: 20px">Faild Googleauthenticator</p>';
        html += '<p style="margin-top:30px;font-size:16px"></p>';
        html += '</div>';
        alertify.alert(html, function(){
           
        });
    }
    if (location.hash === '#suscces') {
      var html = '<div class="col-md-12">';
        html += '<p class="text-center" style="font-size:23px;text-transform: uppercase;height: 20px;color:#053636">SUSCCES !</p><p class="text-center" style="font-size:20px;height: 20px">Payment successful</p>';
        html += '<p style="margin-top:30px;font-size:16px"></p>';
        html += '</div>';
        alertify.alert(html, function(){
           
        });
    }
</script>