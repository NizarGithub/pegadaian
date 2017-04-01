<!-- Content Header (Page header) -->
<!-- Main content -->
<section class="content">
  <div class="row">
  <!-- right column -->
    <div class="col-md-12">
    <!-- general form elements disabled -->
      <form action="<?= $action?>" method="post" enctype="multipart/form-data" role="form" novalidate>
        <div class="box">
          <div class="box-body">
            <div class="title_page"> <?= $title ?></div>
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label>Jenis Pembeli Name</label>
                  <input required type="text" name="i_name" class="form-control" placeholder="Masukkan jenis pembeli nama ..."
                  value="<?= $row->jenis_pembeli_name?>"/>
                </div>
                <div class="form-group">
                  <label>Jumlah Terlambat</label>
                  <input required type="number" name="i_jumlah" class="form-control" placeholder="Masukkan jumlah terlambat..."
                  value="<?= $row->jumlah_terlambat_bayar ?>"/>
                </div>
                <div class="form-group">
                  <label>Color picker:</label>
                  <!-- <input id="jenis_pembeli_name_color" name="jenis_pembeli_name_color" type="text" class="form-control"
                  value="<?= $row->jenis_pembeli_name_color?>" /> -->
                  <div id="colorpicker" class="input-group colorpicker-component">
                    <input type="text" id="jenis_pembeli_name_color" name="jenis_pembeli_name_color" value="<?= $row->jenis_pembeli_color?>" class="form-control" />
                    <span class="input-group-addon"><i></i></span>
                </div>
                </div>
              </div>
            </div>
          </div>
          <div class="box-footer">
            <?php if (strpos($permit, 'c') !== false || strpos($permit, 'u') !== false): ?>
              <input class="btn btn-primary" type="submit" value="Simpan"/>
            <?php endif; ?>
          <a href="<?= $close_button?>" class="btn btn-danger" >Keluar</a>
          </div>
        </div><!--/.col (right) -->
      </form>
  </div>   <!-- /.row -->
</section><!-- /.content -->
<script type="text/javascript">
  $(function() {
      $('#colorpicker').colorpicker();
  });
</script>
