<!-- Content Header (Page header) -->
<!-- Main content -->
<section class="content">
  <div class="row">
  <!-- right column -->
    <div class="col-md-12">
    <!-- general form elements disabled -->
      <div class="title_page"> <?= $title ?></div>
      <form action="<?= $action?>" method="post" enctype="multipart/form-data" role="form" novalidate>
        <div class="box box-cokelat">
          <div class="box-body">
            <div class="col-md-12">
              <div class="form-group">
                <label>Nama</label>
                <input required type="text" name="i_name" class="form-control" placeholder="Masukkan nama ..." value="<?= strtoupper($row->tutorial_name)?>"/>
              </div>
              <div class="form-group">
                <center>
                  <video width="400" controls>
                    <source src="<?php echo $path.$row->tutorial_video?>" id="video_here">
                      Your browser does not support HTML5 video.
                  </video>
                </center>
                <label>Video</label>
                <input required type="file" accept="video/*" id="browseVideos" name="i_video" class="form-control" />
              </div>
            </div>
          <div style="clear:both;"></div>
          </div><!-- /.box-body -->
        <div class="box-footer">
          <?php if (strpos($permit, 'c') !== false || strpos($permit, 'u') !== false): ?>
            <input class="btn btn-primary" type="submit" value="Simpan"/>
          <?php endif; ?>
        <a href="<?= $close_button?>" class="btn btn-danger" >Keluar</a>
        </div>
        </div><!-- /.box -->
      </form>
    </div><!--/.col (right) -->
  </div>   <!-- /.row -->
</section><!-- /.content -->
<script type="text/javascript">
  $(document).on("change", "#browseVideos", function(evt) {
    var $source = $('#video_here');
    $source[0].src = URL.createObjectURL(this.files[0]);
    $source.parent()[0].load();
  });
</script>
