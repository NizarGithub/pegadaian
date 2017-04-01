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
<div class="modal-header">

</div>
<form class="" action="<?= $action?>" method="post">
  <div class="modal-body">
    <div class="box-body2 table-responsive">
      <table id="tb_kategori_keterangan" class="table-bordered table-striped" style="width:100%;">
        <thead>
          <tr>
            <th style="text-align:center;width:5%;">No</th>
            <?php
            $no = 1;
            while ($r_th_keterangan = mysql_fetch_array($q_kategori_keterangan)) {?>
              <th style="text-align:center;"><?= $r_th_keterangan['kategori_keterangan_name']?></th>
            <? $no++;}?>
          </tr>
        </thead>
        <tbody>
          <input type="" name="purchase_id" value="<?= $purchase_id?>" style="display:none;">
          <input type="" name="item_id" value="<?= $item_id?>" style="display:none;">
          <?php
          $no_row=1;
          $no_col=0;
          for ($i=0; $i < $item_qty; $i++) { ?>
            <tr>
              <td style="text-align:center;"><?= $no_row?></td>
              <?php
              for ($j=1; $j < $no; $j++) {?>
                <td style="text-align:center;"><input type="text" name="field_keterangan[]" class="no-border field-on-tb" value=""></td>
              <?$no_col++;}?>
            </tr>
          <?$no_row++;}?>
          <input type="" name="baris" value="<?= $no_col?>" style="display:none;">
        </tbody>
      </table>
    </div>
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
</script>
