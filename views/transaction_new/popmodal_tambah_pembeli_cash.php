<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <div class="popmodal_title" style="font-size: 18px; margin-bottom:0;text-align:center;">Tambah Pembeli Cash</div>
</div>
<form class="" action="<?= $action?>" method="post">
  <div class="modal-body">
    <div class="form-group">
      <label for="">Nama Pembeli</label>
      <input type="text" name="i_name" class="form-control" value="">
      <input type="hidden" name="transaction_id" class="" value="<?= $transaction_id?>">
    </div>
    <div class="form-group">
      <label for="">NIK</label>
      <input type="text" name="i_nik" class="form-control" value="">
    </div>
    <div class="form-group">
      <label for="">Alamat</label>
      <input type="text" name="i_alamat" class="form-control" value="">
    </div>
    <div class="form-group">
      <label for="">No. Telepon</label>
      <input type="text" name="i_phone" class="form-control" value="">
    </div>
  </div>
  <div class="modal-footer">
    <button type="submit" name="button" class="btn btn-primary">Simpan</button>
    <button type="button" name="button" class="btn btn-danger" data-dismiss="modal">Keluar</button>
  </div>
</form>
