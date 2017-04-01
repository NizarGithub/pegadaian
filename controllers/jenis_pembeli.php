<?php

include '../lib/config.php';
include '../lib/function.php';
include '../models/jenis_pembeli_model.php';
$page = null;
$page = (isset($_GET['page'])) ? $_GET['page'] : "list";
$title = ucwords("Jenis Pembeli");

$_SESSION['menu_active'] = 1;
$_SESSION['sub_menu_active'] = 45;
$permit = get_akses_permits($_SESSION['user_type_id'],$_SESSION['sub_menu_active']);

switch ($page) {
  case 'list':
    get_header();
    $where = '';
    $query = select_config('jenis_pembeli',$where);
    $add_button = "jenis_pembeli.php?page=form";
    include '../views/jenis_pembeli/jenis_pembeli_list.php';
    get_footer();
    break;

  case 'form':
    get_header();
    $id = (isset($_GET['id'])) ? $_GET['id'] : null;
    if ($id) {
      $where_jenis_pembeli_id = "WHERE jenis_pembeli_id = '$id'";
      $row = select_object_config('jenis_pembeli', $where_jenis_pembeli_id);
      $action = "jenis_pembeli.php?page=edit&id=$id";
    } else {
      $row = new stdClass();
      $row->jenis_pembeli_id = false;
      $row->jenis_pembeli_name = false;
      $row->jumlah_terlambat_bayar = false;
      $row->jenis_pembeli_color = false;
      $action = "jenis_pembeli.php?page=save";
    }
    $close_button = "jenis_pembeli.php?page=list";
    include '../views/jenis_pembeli/jenis_pembeli_form.php';
    get_footer();
    break;

    case 'save':
      $i_name = $_POST['i_name'];
      $i_jumlah = $_POST['i_jumlah'];
      $jenis_pembeli_color = $_POST['jenis_pembeli_name_color'];
      $data = "'',
               '$i_name',
               '$i_jumlah',
               '$jenis_pembeli_color'";
      create_config('jenis_pembeli', $data);
      header("Location: jenis_pembeli.php?page=list&did=1");
      break;

    case 'edit':
      $id = $_GET['id'];
      $i_name = $_POST['i_name'];
      $i_jumlah = $_POST['i_jumlah'];
      $jenis_pembeli_name_color = $_POST['jenis_pembeli_name_color'];
      $data_update = "jenis_pembeli_name        = '$i_name',
                      jumlah_terlambat_bayar    = '$i_jumlah',
                      jenis_pembeli_color  = '$jenis_pembeli_name_color'";
      $param = "jenis_pembeli_id = '$id'";
      update_config2('jenis_pembeli', $data_update, $param);
      header("Location: jenis_pembeli.php?page=list&did=2");
      break;

    case 'delete':
      $id = $_GET['id'];
      $param = "jenis_pembeli_id = '$id'";
      delete_config('jenis_pembeli', $param);
      header("Location: jenis_pembeli.php?page=list&did=3");
      break;
}
 ?>
