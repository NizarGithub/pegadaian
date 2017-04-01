<!-- stock form -->
<!-- Content Header (Page header) -->
                <!-- Main content -->
<style media="screen">
  .form-input{
    height: 35px;
    padding: 10px;
    margin: 10px;
  }
  .col-md-6{
    top:30px;
    padding-bottom: 30px;
  }
</style>
<section class="content">
	<div class="row">
	<!-- right column -->
		<div class="col-md-12">
		<!-- general form elements disabled -->
			<div class="title_page"> <?= $title ?></div>
			<form id="form" method="post" enctype="multipart/form-data" role="form" novalidate>
				<div class="box box-cokelat">
					<div class="box-body">
            <div class="col-md-12">
              <div class="col-md-6">
                <div class="form-group">
                  <label>Nama</label>
                  <input type="hidden" name="id" id="id" value="<?= $id?>">
                  <input required type="text" name="i_name" class="form-control"
                  placeholder="Masukkan nama item..." value="<?= $row->item_name ?>"/>
                </div>
                <div class="form-group">
                  <label>Kode Item</label>
                  <input required type="text" name="kode_item" id="kode_item" class="form-control"
                  placeholder="Masukkan kode item..." value="<?= $row->kode_barang ?>"/>
                </div>
                <div class="form-group" style="display:none">
                  <label>Penerbit</label>
                  <input required type="" name="item_penerbit" id="item_penerbit" class="form-control"
                  placeholder="Masukkan penerbit..." value="<?= $row2->item_penerbit?>"/>
                </div>
                <div class="form-group">
                  <div style="width:250px;width: 250px;left: 0px;top: 30px;">
                      <label>Gambar</label>
                      <?php if($id){
                      $gambar = ($row->stock_img) ? $row->stock_img : "default.jpg"; ?>
                      <br />
                      <img src="<?= "../img/menu/".$gambar ?>" id="output_1" style="width:200px;"/>
                      <?php } ?>
                      <img id="output" style="width:200px;">
                    <input type="file" name="i_img" id="i_img" accept="image/*"  onchange="loadFile(event)"/>
                  </div>
                </div>
                <div class="form-group">
                  <label>Merk Item</label>
                  <input required type="text" name="merk_item" id="merk_item" class="form-control"
                  placeholder="Masukkan merk item..." value="<?= $row2->item_merk?>"/>
                </div>
                <div class="form-group">
                  <label>Tipe Item</label>
                  <input required type="text" name="tipe_item" id="tipe_item" class="form-control"
                  placeholder="Masukkan tipe item..." value="<?= $row2->item_tipe?>"/>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Panjang </label>
                      <input required type="number" name="item_p" id="item_p" class="form-control"
                      placeholder="cm..." value="<?= $row2->item_p?>"/>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Lebar </label>
                      <input required type="number" name="item_l" id="item_" class="form-control"
                      placeholder="cm..." value="<?= $row2->item_l?>"/>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Tinggi </label>
                      <input required type="number" name="item_t" id="item_t" class="form-control"
                      placeholder="cm..." value="<?= $row2->item_t?>"/>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Berat </label>
                      <input required type="number" name="item_berat" id="item_berat" class="form-control"
                      placeholder="gr..." value="<?= $row2->item_berat?>"/>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label>keterangan</label>
                  <br>
                  <textarea name="item_desc" rows="4" cols="40"><?= $row2->item_desc?></textarea>
                </div>
                <div style="clear:both;"></div>
                <div class="form-group" id="barang_stok">
                  <label>Kategori Item</label>
                    <select name="kategori_id" id="kategori_id" class="selectpicker show-tick form-control"
                    data-live-search="true"
                    value="0" onchange="kategori_item()">
                      <option value="0"></option>
                      <?php while($r_kategori_id = mysql_fetch_array($q_kategori_id)){ ?>
                      <option value="<?= $r_kategori_id['kategori_id'] ?>"
                      <?php if($row->kategori_id == $r_kategori_id['kategori_id']){ ?> selected="selected"<?php } ?>>
                      <?= $r_kategori_id['kategori_name'] ?>
                      </option>
                    <?php } ?>
                    </select>
                </div>
                <div class="form-group" id="sub_kategori">
                  <label>Sub Kategori Item</label>
                  <select id="sub_kategori_item" name="sub_kategori_item" size="1"
                  class="selectpicker show-tick form-control" data-live-search="true" />
                  </select>
                  <div id="abs"></div>
                </div>
                <div class="form-group" id="barang_stok" style="display:none;">
                  <label>Tipe Item</label>
                  <select id="i_item_type" name="i_item_type" size="1" class="selectpicker show-tick form-control"
                  data-live-search="true" />
                    <option value="0"></option>
                    <?php while($r_item_type = mysql_fetch_array($query_item_type)){ ?>
                    <option value="<?= $r_item_type['item_type_id'] ?>" <?php
                    if($row->item_type == $r_item_type['item_type_id']){ ?> selected="selected"<?php } ?>>
                    <?= $r_item_type['item_type_name'] ?>
                    </option>
                    <?php } ?>
                  </select>
                </div>
                <div class="form-group">
                  <label>Batas Jumlah</label>
                  <input required type="text" name="i_item_limit" class="form-control"
                  placeholder="Masukkan limit stok..." value="<?= $row->item_limit ?>"/>
                </div>
              </div>
              <div class="col-md-6" style="display:;">
                <div class="form-group">
                  <label>Tanggal Beli Terakhir</label>
                  <input required type="date" name="" id=""
                  class="form-control" value="<?=$get_new_date?>" disabled/>
                </div>
                <div class="form-group">
                  <?php  $harga_akhir = format_rupiah($stock_buy);
                  echo $harga_akhir;
                  ?>
                  <label>Harga Beli Terakhir ( <?=  strtoupper($unit_id_new_buy)?> )</label>
                  <input type="text" name="i_original_buy_price" id="i_original_buy_price" class="form-control"
                  value="<?= $harga_akhir?>" readonly/>
                </div>
                <div class="form-group">
                  <label>Harga Pokok Produksi</label>
                  <input type="text" id="i_hpp_currency" name="i_hpp_currency" class="form-control"
                  value="Rp.<?= format_rupiah($row->item_hpp_price)?>">
                  <input type="hidden" id="i_hpp" name="i_hpp" class="form-control"
                  value="<?= $row->item_hpp_price?>">
                </div>
                <div class="form-group">
                  <label>Satuan Utama</label>
                  <select id="i_unit" name="i_unit" size="1" class="selectpicker show-tick form-control"
                  data-live-search="true" onchange="konversi()"/>
                    <option value="0"></option>
                    <?php
                    if ($_SESSION['unit_id']) {
                      $unit_id_old = $_SESSION['unit_id'];
                    }else {
                      $unit_id_old = $row->unit_id;
                    }
                    while ($r_unit = mysql_fetch_array($q_unit)) {?>
                      <option value="<?= $r_unit['unit_id']?>"
                        <?php if ($unit_id_old == $r_unit['unit_id']){echo "Selected";}?>
                        ><?= strtoupper($r_unit['unit_name'])?></option>
                    <?}?>
                  </select>
                </div>
                <div class="form-group">
                  <label>Harga Jual Dalam Satuan Utama</label>
                  <input type="text" id="i_harga_jual_currency" name="i_harga_jual_currency" class="form-control"
                  value="Rp.<?= format_rupiah($row->item_price)?>">
                  <input type="hidden" id="i_harga_jual" name="i_harga_jual" class="form-control"
                  value="<?= $row->item_price?>">
                </div>
                <div class="box-body2 table-responsive" id="mytable">
                  <table id="konversi_list" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th style="width:5%;" align="center">No.</th>
                        <th>Satuan Utama</th>
                        <th>Jumlah</th>
                        <th>Satuan</th>
                        <th>Konversi</th>
                        <th>Harga</th>
                        <th style="text-align:center;">Config.</th>
                      </tr>
                    </thead>
                    <tbody id="konversi_list_body">
                    </tbody>
                    <tfoot>
                      <tr>
                        <?php if (strpos($permit, 'c') !== false): ?>
                          <td colspan="7">
                            <a href="javascript:void(0)" onclick="konversi_popmodal(1,'')"
                            class="btn btn-primary">
                              Tambah
                            </a>
                          </td>
                        <?php endif; ?>
                      </tr>
                    </tfoot>
                  </table>
                </div>
              </div>
            </div>
            <div style="clear:both;"></div>
					</div><!-- /.box-body -->
					<div class="box-footer">
            <?php if (strpos($permit, 'c') !== false || strpos($permit, 'u') !== false){ ?>
						<button type="button" class="btn btn-primary" onclick="check_nama()">
              Simpan
            </button>
            <?php } ?>
						<a href="<?= $close_button?>" class="btn btn-danger" >Keluar</a>
					</div>
				</div><!-- /.box -->
			</form>
		</div><!--/.col (right) -->
	</div>   <!-- /.row -->
</section><!-- /.content -->
<div id="konversi_popmodal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content" id="konversi_popmodal_content" style="border-radius:0;">

    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script type="text/javascript">


$(function(){
    $("#i_hpp_currency").keyup(function(e){

        var price = $("#i_hpp_currency").val();
        var str = price.toString().replace("Rp. ", "");
        var str = str.toString().replace(/[^0-9\.]+/g, "");

        $("#i_hpp").val(str);

        $(this).val(format_rupiah($(this).val()));
    });

    $("#i_harga_jual_currency").keyup(function(e){

        var price = $("#i_harga_jual_currency").val();
        var str = price.toString().replace("Rp. ", "");
        var str = str.toString().replace(/[^0-9\.]+/g, "");

        $("#i_harga_jual").val(str);

        $(this).val(format_rupiah($(this).val()));
    });

  });

  function kategori_item(){
    var x = $('#kategori_id').val();
    var y = $('#id').val();
    var select = $('#sub_kategori_item');
    var z = '';
    $.ajax({
      type:'POST',
      data:{x:x,y:y},
      url:'stock.php?page=sub_kategori_item',
      dataType:'json',
    }).done(function(data){
      select.html("");
      select.append('<option value="0"></option>');
      for (var i = 0; i < data.length; i++) {
        var str = '';
      if (data[i].sub_kategori_id == data[i].id) {
        str = 'selected';
      }
        select.append('<option value="'+data[i].sub_kategori_id+'"'+str+'>'+data[i].sub_kategori_name+'</option>');
      }
        $('.selectpicker').selectpicker('refresh');
    });
  }

  $(document).ready(function() {
      var x = $('#kategori_id').val();
      var y = $('#id').val();
      var select = $('#sub_kategori_item');
      var z = '';
      $.ajax({
        type:'POST',
        data:{x:x,y:y},
        url:'stock.php?page=sub_kategori_item',
        dataType:'json',
      }).done(function(data){
        select.html("");
        select.append('<option value="0"></option>');
        for (var i = 0; i < data.length; i++) {
          var str = '';
        if (data[i].sub_kategori_id == data[i].id) {
          str = 'selected';
        }
          select.append('<option value="'+data[i].sub_kategori_id+'"'+str+'>'+data[i].sub_kategori_name+'</option>');
        }
          $('.selectpicker').selectpicker('refresh');
      });
    });

    $(document).ready(function() {
    $('#konversi_list').DataTable( {
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "sDom": 'lfrtip'
      } );
    } );

    $(document).ready(function(){
      var i_unit = $('#i_unit').val();
      var item_id = $('#id').val();
      var no = 1;
      $.ajax({
        type:'POST',
        data:{x:i_unit,y:item_id},
        url:'stock.php?page=konversi_list',
        dataType:'json',
      }).done(function(data) {
          $('#konversi_list_body').html('');
          for (var i = 0; i < data.length; i++) {
            $('#konversi_list_body').append('\
            <tr>\
              <td>'+no+'</td>\
              <td>'+data[i].unit_utama.toUpperCase()+'</td>\
              <td>'+data[i].unit_jml+'</td>\
              <td>'+data[i].unit_konversi_name.toUpperCase()+'\
                <input type="hidden" id="unit_konversi_'+no+'" value="'+data[i].unit_konversi_id+'">\
              </td>\
              <td>'+data[i].unit_konversi_jml+'</td>\
              <td>'+data[i].harga_konversi+'</td>\
              <td style="text-align:center;">\
              <a href="javascript:void(0);"\
                onclick="konversi_popmodal(2,'+data[i].unit_konversi_id+')"\
                class="btn btn-default" ><i class="fa fa-pencil"></i>\
              </a>\
              <a href="javascript:void(0)"\
              onclick="delete_diskon('+data[i].unit_konversi_id+','+data[i].item_id+')"\
                class="btn btn-default">\
                <i class="fa fa-trash-o"></i>\
              </a>\
              </td>\
            </tr>\
            ');
            no++;
          }
      });
    });

    function konversi_popmodal(x,y){
      var i_unit = $('#i_unit').val();
      var item_id = $('#id').val();
      if (i_unit!=0) {
        $('#konversi_popmodal').modal();
        $(function () {
          var url = "stock.php?page=popmodal_konversi&id="+x+"&item_id="+item_id+"&unit_id="+i_unit+"&unit_konversi="+y;
            $('#konversi_popmodal_content').load(url,function(result){});
        })
      }else {
        alert("Pilih satuan utama terlebih dahulu");
      }
    }

    function konversi() {
      var i_unit = $('#i_unit').val();
      var item_id = $('#id').val();
      var no = 1;
      $('#konversi_list_body').html('');
      $.ajax({
        type:'POST',
        data:{x:i_unit,y:item_id},
        url:'stock.php?page=konversi_list',
        dataType:'json',
      }).done(function(data) {
          $('#konversi_list_body').html('');
          for (var i = 0; i < data.length; i++) {
            $('#konversi_list_body').append('\
            <tr>\
              <td>'+no+'</td>\
              <td>'+data[i].unit_utama+'</td>\
              <td>'+data[i].unit_jml+'</td>\
              <td>'+data[i].unit_konversi_name+'\
                <input type="hidden" id="unit_konversi_'+no+'" value="'+data[i].unit_konversi_id+'">\
              </td>\
              <td>'+data[i].unit_konversi_jml+'</td>\
              <td>'+data[i].harga_konversi+'</td>\
              <td style="text-align:center;">\
              <a href="javascript:void(0);"\
                onclick="konversi_popmodal(2,'+data[i].unit_konversi_id+')"\
                class="btn btn-default" ><i class="fa fa-pencil"></i>\
              </a>\
              <a href="javascript:void(0)"\
              onclick="delete_diskon('+data[i].unit_konversi_id+','+data[i].item_id+')"\
                class="btn btn-default" >\
                <i class="fa fa-trash-o"></i>\
              </a>\
              </td>\
            </tr>\
            ');
            no++;
          }
      });
    }
    var loadFile = function(event) {
      var reader = new FileReader();
      reader.onload = function(){
        var output = document.getElementById('output');
        $('#output_1').empty();
        output.src = reader.result;
      };
      reader.readAsDataURL(event.target.files[0]);
    };

function delete_diskon(x,y) {
  var url = "stock.php?page=delete_diskon&id="+x+"&item_id="+y;
  window.location.href = url;
}

function check_nama() {
  var kode_item = $('#kode_item').val();
  var item_id = $('#id').val();

    if (item_id == false) {
      var url = 'stock.php?page=save';
    } else {
      var url = 'stock.php?page=edit&id='+item_id;
    }
  $.ajax({
    type:'POST',
    data:{x:kode_item,item_id:item_id},
    url: 'stock.php?page=strcmp',
    dataType:'json',
  }).done(function(data){
      if (data !== null) {
        var a = confirm(kode_item+" sudah ada, Simpan atau tidak ?");
        if(a==true){
          submitForm(url);
        }
      }else {
          submitForm(url);
        }
  });
}

function submitForm(action){
  document.getElementById('form').action = action;
  document.getElementById('form').submit();
}
</script>
