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
        <div class="box">
          <br>
          <div class="title_page"><?= $title ?></div>
          <div class="box-body2 table-responsive">
            <table id="example1" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th style="text-align:center;" width="5%">No</th>
                  <th style="text-align:center;">Jenis Pembeli</th>
                  <th style="text-align:center;">Config</th>
                </tr>
              </thead>
            <tbody>
            <?php
            $no = 1;
            while($row = mysql_fetch_array($query)){ ?>
              <tr>
                <td><?= $no?></td>
                <td><?= $row['jenis_pembeli_name']?></td>
                <td style="text-align:center;">
                  <a href="jenis_pembeli.php?page=form&id=<?= $row['jenis_pembeli_id']?>" class="btn btn-default" >
                    <i class="fa fa-pencil"></i>
                  </a>
                  <a href="javascript:void(0)" onclick="confirm_delete(<?= $row['jenis_pembeli_id']; ?>,'jenis_pembeli.php?page=delete&id=')"
                    class="btn btn-default" ><i class="fa fa-trash-o"></i>
                  </a>
                </td>
              </tr>
            <?php $no++; } ?>
            </tbody>
            <tfoot>
              <tr>
                <?php if (strpos($permit, 'c') !== false): ?>
                  <td colspan="3"><a href="<?= $add_button ?>" class="btn btn-danger " >Tambah</a></td>
                <?php endif; ?>
              </tr>
          </tfoot>
            </table>
          </div><!-- /.box-body -->
        </div><!-- /.box -->
    </div>
  </div>
</section><!-- /.content -->
