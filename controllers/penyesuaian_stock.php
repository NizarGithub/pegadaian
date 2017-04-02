<?php
include '../lib/config.php';
include '../lib/function.php';
include '../models/penyesuaian_stock_model.php';
$page = null;
$page = (isset($_GET['page'])) ? $_GET['page'] : "list";
$title = ucfirst("penyesuaian STOCK");

$_SESSION['menu_active'] = 1;
$_SESSION['sub_menu_active'] = 39;

$s_cabang = $_SESSION['branch_id'];
$branch_active = get_branch($s_cabang);
$permit = get_akses_permits($_SESSION['user_type_id'],$_SESSION['sub_menu_active']);
switch ($page) {
  case 'list':
  get_header($title);
  if ($_SESSION['branch_id'] == 3) {
			$where_branch = "";
		}else{
			$where_branch = " where branch_id = '".$_SESSION['branch_id']."' ";
		}
  $query = select($where_branch);
  include '../views/penyesuaian_stock/penyesuaian_stock_list.php';
  get_footer();
    break;
    case 'form':
  		get_header($title);
  		$close_button = "penyesuaian_stock.php?page=list";
  		$id = (isset($_GET['id'])) ? $_GET['id'] : null;
      $branch_id = (isset($_GET['branch_id'])) ? $_GET['branch_id'] : null;
      $row = read_id($id,$branch_id);
      $action = "penyesuaian_stock.php?page=edit";
  		include '../views/penyesuaian_stock/penyesuaian_stock_form.php';
  		get_footer();
  		break;

	case 'delete':
		$id = get_isset($_GET['id']);
    $branch_id = get_isset($_GET['branch_id']);
		delete($id,$branch_id);
		header('Location: penyesuaian_stock.php?page=list&did=3');
		break;

  case 'edit':
    $item_id = $_POST['i_item_id'];
    $i_branch_id = $_POST['i_branch_id'];
    $item_qty_lama = $_POST['item_qty_lama'];
    $edit_item_qty = $_POST['edit_item_qty'];
    $penyesuaian_stock = $_POST['penyesuaian_stock'];
    $tanggal = new_date();
    $data_penyesuaian = "'',
                        '".$_SESSION['user_id']."',
                        '$i_branch_id',
                        '$tanggal',
                        '$item_id',
                        '$item_qty_lama',
                        '$edit_item_qty'
                        ";
    create_config("penyesuaian_stock_cabang",$data_penyesuaian);
    update_stok($edit_item_qty, $i_branch_id, $item_id, $penyesuaian_stock);

    $data = array('item_id' => intval($item_id),
                  'item_qty'=> intval($edit_item_qty));

    echo json_encode($data);
		// header('Location: penyesuaian_stock.php?page=form&id='.$item_id.'&branch_id='.$i_branch_id);
		break;

  case 'add_keterangan_popmodal':
    $item_id = $_GET['item_id'];
    $item_qty = $_GET['item_qty'];
    $where_item_id = "WHERE item_id = '$item_id'";
    $kategori_id = select_config_by('items', 'kategori_id', $where_item_id);
    $where_kategori_id = "WHERE kategori_id = '$kategori_id'";
    $q_kategori_keterangan = select_config('kategori_keterangan', $where_kategori_id);
    $where_kategori_id = "WHERE kategori_id = '$kategori_id'";

    $action = "penyesuaian_stock.php?page=save_keterangan";

    include '../views/penyesuaian_stock/penyesuaian_stock_popmodal.php';
    break;

  case 'save_keterangan':

    $item_id = $_POST['item_id'];
    $field_keterangan = $_POST['field_keterangan'];
    $baris = $_POST['baris'];
    $purchase_id = '';

    $where_item_id = "WHERE item_id = '$item_id'";
    $kategori_id = select_config_by('items', 'kategori_id', $where_item_id);
    $where_kategori_id = "WHERE kategori_id = '$kategori_id'";
    $q_kategori_keterangan = select_config('kategori_keterangan', $where_kategori_id);
    $no = 0;
    $kategori_keterangan[] = 0;
    while ($r_kategori_keterangan = mysql_fetch_array($q_kategori_keterangan)) {
        $kategori_keterangan[$no] = $r_kategori_keterangan['kategori_keterangan_id'];
    $no++;}
    $item_keterangan_details_id = 0;
    $on=0;
    for ($i=0; $i < $baris; $i++) {
      $data_keterangan = "'',
                          '$purchase_id',
                          '$item_id',
                          '$kategori_id',
                          '".$kategori_keterangan[$on]."',
                          '".$field_keterangan[$i]."',
                          '',
                          ''";
                            var_dump($field_keterangan);
      create_config('item_keterangan_details',$data_keterangan);
      $on++;
      if ($on>=$no) {
        $on=0;
      }
    }
    header('location:penyesuaian_stock.php?page=list');
    break;

}


?>
