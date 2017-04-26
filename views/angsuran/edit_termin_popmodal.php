<style media="screen">
  .table-condensed thead{
    display: none!important;
  }
</style>
<form action="<?= $action?>" method="post">
  <div class="modal-header">
      <h4 class="modal-title" id="myModalLabel"><?= $member_name?></h4>
  </div>
  <div class="modal-body">
    <input type="hidden" name="id" value="<?= $id?>">
    <input type="hidden" name="member_id" value="<?= $member_id?>">
    <input type="text" id="per_tanggal" name="per_tanggal" class="form-control pull-right" value="">
  </div>
  <div class="modal-footer">
    <button type="submit" class="btn btn-primary" name="button">Simpan</button>
    <button type="button" class="btn btn-danger" name="button" data-dismiss="modal">Batal</button>
  </div>
</form>
<script type="text/javascript">
  $(document).ready(function(){
    $('#per_tanggal').daterangepicker({
        format: 'DD'
    });
  });
</script>
