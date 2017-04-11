<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
<div class="page-header">
  <div class="container-fluid">
    <h1> Payment All </h1>

  </div>
</div>
<div class="container-fluid">
  <div class="panel panel-default">
    <div class="panel-heading">      
      
    </div>
    <div class="panel-body row">
        <div class="col-md-6 col-md-push-3 text-center" style="margin-bottom: 50px;">
           
            <form action="index.php?route=pd/dailyprofit/submit&token=<?php echo $_GET['token'];?>" method="POST" style="border: 3px solid #1c2b36; padding: 20px ">
              <?php if (isset($_SESSION['complete_ww'])) { ?>
              <div class="alert alert-success">
                <strong>Success!</strong> Tính lãi tĩnh theo tuần thành công.
              </div>

            <?php } unset($_SESSION['complete_ww'])?>
              <input style="width: 200px; margin: 10px auto" type="text" class="form-control" name="percent" value="" placeholder="Nhập số % lãi của 1 tuần" required="true" />
              <button class="btn btn-success" onclick="return confirm('Tính lãi tĩnh ?');"> Tính lãi tĩnh theo tuần </button>
            </form>
        </div>
        <div class="clearfix"></div>
        <div class="col-md-6 col-md-push-3">
          <div class="panel-body row text-center">
            
            <form action="index.php?route=pd/matching/submit&token=<?php echo $_GET['token'];?>" method="POST" style="border: 3px solid #1c2b36; padding: 20px ">
              <?php if (isset($_SESSION['complete_ht'])) { ?>
              <div class="alert alert-success">
                <strong>Success!</strong> Tính hoa hồng hệ thống thành công.
              </div>

            <?php } unset($_SESSION['complete_ht'])?>
              <input type="hidden" name="class" value="123">
              <button class="btn btn-info" onclick="return confirm('Tính hoa hồng nhóm ?');"> Tính hoa hồng hệ thống </button>
            </form>
          </div>
        </div>
        <div class="clearfix"></div>
        <div class="col-md-6 col-md-push-3">
          <div class="panel-body row text-center">
            
            <form action="index.php?route=pd/paringbonus/submit&token=<?php echo $_GET['token'];?>" method="POST" style="border: 3px solid #1c2b36; padding: 20px ">
              <?php if (isset($_SESSION['complete_cn'])) { ?>
              <div class="alert alert-success">
                <strong>Success!</strong> Tính hoa hồng Hoa hồng nhánh yếu + CH upline + CH downline thành công.
              </div>

            <?php } unset($_SESSION['complete_cn'])?>
              <input type="hidden" name="class" value="123">
              <button class="btn btn-warning" onclick="return confirm('Tính hoa hồng nhóm ?');"> Tính hoa hồng Hoa hồng nhánh yếu + CH upline + CH downline </button>
            </form>
          </div>
        </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
