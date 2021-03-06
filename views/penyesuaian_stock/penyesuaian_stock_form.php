<!-- Content Header (Page header) -->
<?php if(isset($_GET['did']) && $_GET['did'] == 1){ ?>
<section class="content_new">
  <div class="alert alert-info alert-dismissable">
    <i class="fa fa-check"></i>
    <button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>
    <b>Simpan gagal !</b>
    Password dan confirm password tidak sama
  </div>
</section>
<?php }?>
<!-- Main content -->
<section class="content">
  <div class="row">
  <!-- right column -->
  <div class="row">

  </div>
    <div class="col-md-12">
    <!-- general form elements disabled -->
      <div class="title_page"> <?= $title ?> <?= $row->branch_name?></div>
      <form id="form_penyesuaian_stock">
        <div class="box box-cokelat">
          <div class="box-body">
            <div class="row">
              <div class="col-md-12">
                <input required type="hidden" name="i_branch_id" id="i_branch_id" class="form-control" value="<?= $row->branch_id?> "/>
                <div class="form-group">
                  <input type="hidden" id="i_item_id" name="i_item_id" value="<?= $id?>"/>
                  <!-- <input type="hidden" id="i_rak_id" name="i_rak_id" value="<?= $rak_id?>"/> -->
                  <label>Nama Item</label>
                  <input required type="text" name="i_name" id="i_name" class="form-control"
                  placeholder="Masukkan nama ..." value="<?= $row->item_name ?> " disabled/>
                </div>
                <div class="form-group">
                  <label>Kategori Item</label>
                  <input required type="text" name="" id="" class="form-control"
                  placeholder="Masukkan kategori buku ..." value="<?= $row->kategori_name?> " disabled/>
                </div>
                <div class="form-group">
                  <label>Jumlah Stock</label>
                  <input required type="" name="i_item_qty" id="i_item_qty" class="form-control"
                  placeholder="Masukkan jumlah ..." value="<?= $row->item_stock_qty?> " disabled/>
                  <input type="hidden" required name="item_qty_lama" id="item_qty_lama" class="form-control"
                  placeholder="Masukkan jumlah ..." value="<?= $row->item_stock_qty?>"/>
                </div>
                <div class="form-group">
                  <input type="hidden" id="penyesuaian_stock" name="penyesuaian_stock" value="2" required>
                  <button type="button" name="button" class="btn btn-warning btn-stock" onclick="tambah_stock()">
                    Tambah
                  </button>
                  <button type="button" name="button" class="btn btn-default btn-stock" onclick="kurangi_stock()">
                    Kurang
                  </button>
                </div>
                <label>Jumlah Stock</label>
                <input required type="number" name="edit_item_qty" id="edit_item_qty" class="form-control"
                placeholder="Masukkan jumlah ..."/>
              </div>
              </div>
            </div>
          <div style="clear:both;"></div>
          <div class="box-footer">
            <?php if (strpos($permit, 'u') !== false ): ?>
              <input type="submit" class="btn btn-primary" value="Simpan" onclick=""/>
            <?php endif; ?>
            <a href="<?= $close_button?>" class="btn btn-danger">Keluar</a>
          </div>
          </div><!-- /.box-body -->
        </div><!-- /.box -->
      </form>
    </div><!--/.col (right) -->
  </div>   <!-- /.row -->
</section><!-- /.content -->
<script type="text/javascript">
  $("#form_penyesuaian_stock").submit(function(e) {

    var url = "<?php echo $action;?>";

    $.ajax({
           type: "POST",
           url: url,
           data: $("#form_penyesuaian_stock").serialize(), // serializes the form's elements.
           dataType:"json",
           success: function(data)
           {
               popmodal_keterangan(data.item_id, data.item_qty);
           }
         });

    e.preventDefault(); // avoid to execute the actual submit of the form.
  });

  function popmodal_keterangan(item_id, item_qty){
    $('#medium_modal').modal();
  	var url = 'penyesuaian_stock.php?page=add_keterangan_popmodal&item_id='+item_id+'&item_qty='+item_qty;
  		$('#medium_modal_content').load(url,function(result){
  	});
  }

  function kurangi_stock(){
    $('#penyesuaian_stock').val(1);
  }

  function tambah_stock(){
    $('#penyesuaian_stock').val(2);
  }

  $('.btn-stock').click(function(){
    $('.btn-stock').removeClass('btn-warning');
    $('.btn-stock').addClass('btn-default');
    $(this).removeClass('btn-default');
    $(this).addClass('btn-warning');
  });

</script>
