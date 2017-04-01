<style media="screen">
  .btn-bullet{
    border-radius:18px;
  }
  .field-on-tb{
    width: 100%;
    height: 35px;
    padding-left: 5px;
    padding-right: 5px;
    background-color: transparent;
  }
</style>
<form class="" action="<?= $action?>" method="post">
  <div class="modal-body">
      <table id="tb_kategori_keterangan" class="table-bordered table-striped" style="width:100%;">
        <thead>
          <tr>
            <th style="text-align:center;width:5%;">No</th>
            <?php
            $no = 1;
            $r_th_keterangan = mysql_fetch_array($q_kategori_keterangan);
            $kategori_keterangan_id = $r_th_keterangan['kategori_keterangan_id'];?>
            <th style="text-align:center;"><?= $r_th_keterangan['kategori_keterangan_name']?></th>
          </tr>
        </thead>
        <tbody>
          <input type="" id="kategori_keterangan_id" name="kategori_keterangan_id" value="<?= $kategori_keterangan_id?>" style="display:none;">
          <input type="" id="item_id" name="item_id" value="<?= $item_id?>" style="display:none;">
          <input type="" id="item_qty" name="item_qty" value="<?= $item_qty?>" style="display:none;">
          <input type="" id="wt_id" name="wt_id" value="<?= $wt_id?>" style="display:none;">
          <?php
          $no_row=1;
          $no_col=0;
          for ($i=1; $i <= $item_qty; $i++) { ?>
            <tr>
              <td style="text-align:center;"><?= $no_row?></td>
                <td>
                  <select class="selectpicker show-thick form-control" data-live-search="true"
                  id="selectpicker_<?= $i?>" name="field_keterangan[]" onchange="set_input_keterangan(<?= $i?>)">
                  </select>
                </td>
            </tr>
          <?$no_row++;}?>
          <input type="hidden" name="baris" value="<?= $no_col?>">
        </tbody>
      </table>
  </div>
  <div class="modal-footer">
    <button type="submit" name="button" class="btn btn-primary">Simpan Keterangan</button>
  </div>
</form>
<script type="text/javascript">
$(document).ready(function() {
  $('#tb_kategori_keterangan').dataTable({
    "paging": false,
    "lengthChange": false,
    "searching": false,
    "ordering": false,
    "info": false,
    "autoWidth": false,
    "sDom": 'lfrtip',
    "scrollCollapse": true,
    lengthMenu: [
        [ 5 ]
    ]
      });
});

  $(function(){
    var item_qty = $('#item_qty').val();
    for (var i = 1; i <= item_qty; i++) {
      select_picker(i);
    }
  });

  function select_picker(id) {
    var item_id = $('#item_id').val();
    var kategori_keterangan_id = $('#kategori_keterangan_id').val();
      $.ajax({
        type:'POST',
        data:{item_id:item_id,kategori_keterangan_id:kategori_keterangan_id},
        url: 'transaction_new.php?page=kategori_keterangan',
        dataType:'json',
      }).done(function(data){
        $('#selectpicker_'+id).empty();
        $('#selectpicker_'+id).append('<option value="0"></option>');
        for (var i = 0; i < data.length; i++) {
          $('#selectpicker_'+id).append('<option value="'+data[i].item_keterangan_details_id+'">'+data[i].keterangan_details+'</option>');
        }
        $('.selectpicker').selectpicker('refresh');
      });
  }

  // function set_input_keterangan(id){
  //   var selectpicker_val = $('#selectpicker_'+id).val();
  //   $('#input_keterangan_'+id).val(selectpicker_val);
  // }
  $('.selectpicker').selectpicker('refresh');
</script>
