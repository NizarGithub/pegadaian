<?php if(isset($_GET['did']) && $_GET['did'] == 1){ ?>
<section class="content_new">
  <div class="alert alert-info alert-dismissable">
    <i class="fa fa-check"></i>
    <button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>
    <b>Sukses !</b>
    Simpan Berhasil
  </div>
</section>
<?php }else if(isset($_GET['did']) && $_GET['did'] == 2){ ?>
<section class="content_new">
  <div class="alert alert-info alert-dismissable">
    <i class="fa fa-check"></i>
    <button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>
    <b>Sukses !</b>
    Edit Berhasil
  </div>
</section>
<?php }else if(isset($_GET['did']) && $_GET['did'] == 3){ ?>
<section class="content_new">
  <div class="alert alert-info alert-dismissable">
    <i class="fa fa-check"></i>
    <button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>
    <b>Sukses !</b>
    Delete Berhasil
  </div>
</section>
<?php } ?>
<!-- Main content -->
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="title_page"> <?= $title ?></div>
        <div class="box">
          <div class="box-body2 table-responsive">
            <table id="example27" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th width="5%">No</th>
                  <th>Tipe Pembeli</th>
                  <th style="text-align:center;">Config</th>
                </tr>
              </thead>
            <tbody>
            <?php
            $no = 1;
            while($row = mysql_fetch_array($query)){ ?>
              <tr>
                <td><?= $no?></td>
                <td><?= $row['type_pembeli_name']?></td>
                <td style="text-align:center;">
                  <a href="tipe_pembeli.php?page=form&id=<?= $row['type_id_pembeli']?>&branch_id=<?= $s_cabang?>"
                    class="btn btn-default" >
                    <i class="fa fa-pencil"></i>
                  </a>
                  <?php if (strpos($permit, 'd') !== false): ?>
                    <a href="javascript:void(0)"
                    onclick="confirm_delete_3(<?= $row['type_id_pembeli']; ?>,<?= $row['branch_id']?>,'tipe_pembeli.php?page=delete&id=','&branch_id=')"
                    class="btn btn-default" >
                      <i class="fa fa-trash-o"></i>
                    </a>
                  <?php endif; ?>
                </td>
              </tr>
            <?php $no++; } ?>
            </tbody>
            <tfoot>
              <tr>
                <?php if (strpos($permit, 'c') !== false): ?>
                  <td colspan="3"><a href="<?= $add_button ?>" class="btn btn-danger " >Add</a></td>
                <?php endif; ?>
              </tr>
            </tfoot>
            </table>
          </div><!-- /.box-body -->
        </div><!-- /.box -->
    </div>
  </div>
</section><!-- /.content -->
