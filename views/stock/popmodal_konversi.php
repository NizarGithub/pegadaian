<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
  <h4 class="modal-title" id="myModalLabel"><?= $item_name?></h4>
</div>
<div class="modal-body">
  <form class="" action="<?= $action?>" method="post">
    <input type="hidden" name="item_id" value="<?= $item_id?>">
    <input type="hidden" name="unit_id" value="<?= $unit_id?>">
    <input type="hidden" name="unit_konversi_id" value="<?= $r_unit->unit_konversi_id?>">
    <div class="form-group">
      <label>Satuan Utama:</label>
      <h4 class="form-control"><?= strtoupper($unit_name)?></h4>
        <label>Jumlah Satuan Utama</label>
        <input type="number" name="i_jumlah_utama"
        value="<?= $r_unit->unit_jml?>" class="form-control">
    </div>
    <div class="form-group">
      <label>Konversi Satuan</label>
      <?php $unit_id = $r_unit->unit_id ?>
      <select id="i_unit_2" name="i_unit_2" class="selectpicker show-tick form-control"
      data-live-search="true" value="0">
        <option value="0"></option>
        <?php
        $unit_id = $r_unit->unit_konversi;
        while ($row = mysql_fetch_array($query)) {?>
          <option value="<?= $row['unit_id']?>"
            <?php if ($unit_id == $row['unit_id']){echo "selected";}?>>
            <?= strtoupper($row['unit_name'])?>
          </option>
        <?}?>
      </select>
        <label>Jumlah Satuan Konversi</label>
        <input type="number" name="i_jumlah_turunan"
        value="<?=$r_unit->unit_konversi_jml?>" class="form-control"/>
    </div>
    <div class="form-group">
      <label>Harga / Satuan Konversi</label>
      <input type="number" id="i_harga_konversi" name="i_harga_konversi"
      value="<?=$r_unit->harga_konversi?>" class="form-control"/>
    </div>
    <div class="modal-footer">
      <input class="btn btn-primary" href="<?= $action?>" type="submit" value="Simpan"/>
      <a data-dismiss="modal"class="btn btn-danger" >Batal</a>
    </div>
  </form>
</div>
<script type="text/javascript">
  $('.selectpicker').selectpicker('refresh');
</script>
