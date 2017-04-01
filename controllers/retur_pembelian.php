<?php
include '../lib/config.php';
include '../lib/function.php';
include '../models/retur_pembelian_model.php';
$page = null;
$page = (isset($_GET['page'])) ? $_GET['page'] : "list";
$title = ucfirst("RETUR PEMBELIAN");

$_SESSION['menu_active'] = 4;
$_SESSION['sub_menu_active'] = 35;
$permit = get_akses_permits($_SESSION['user_type_id'],$_SESSION['sub_menu_active']);
switch ($page) {
  case 'list':
  get_header($title);
  $query = select();
  include '../views/retur_pembelian/retur_pembelian.php';
  get_footer();
  break;

  case 'search':
    $id = $_POST['x'];
    $q_total=mysql_query("SELECT sum(purchase_total) as total_all FROM purchases_details WHERE purchase_detail_id =".$id);
    $r_total=mysql_fetch_array($q_total);
    $query = select_purchase($id);
    while($r_purch = mysql_fetch_array($query)){
      if ($r_purch['lunas']==1) {
        $lunas = 'Belum lunas';
      }elseif ($r_purch['lunas']==2) {
        $lunas = 'Sudah lunas';
      }else {
        $lunas = 'Lunas';
      }
      $data[] = array(
        'purchases_id'             => $r_purch['purchases_id'],
        'lunas'                    => $lunas,
        'supplier_name'            => $r_purch['supplier_name'],
        'supplier_addres'          => $r_purch['supplier_addres'],
        'supplier_phone'           => $r_purch['supplier_phone'],
        'supplier_email'           => $r_purch['supplier_email'],
        'supplier_id'              => $r_purch['supplier_id'],
        'item_name'                => $r_purch['item_name'],
        'purchase_price'           => $r_purch['purchase_price'],
        'purchase_qty'             => $r_purch['purchase_qty']-$r_purch['item_qty'],
        'purchase_total'           => $r_purch['purchase_total'],
        'purchases_code'           => $r_purch['purchases_code'],
        'unit_name'                => $r_purch['unit_name'],
        'purchase_detail_id'       => $r_purch['purchase_detail_id'],
        'total_all'                => $r_total['total_all'],
      );
    };
    // unset($_SESSION['transaction_id']);
    // session_destroy($_SESSION['transaction_id']);
    $menu['status'] = '200';
    echo json_encode($data);
    break;

    case 'retur_item_popmodal':

    $id = $_GET['id'];
    $purchase_id = $_GET['purchase_id'];
    $item_id = get_item_id($id);
    $q_item = get_item_name($item_id);
    $r_item = mysql_fetch_array($q_item);
    $unit_id_beli = get_unit_beli($id);
    $item_name = $r_item['item_name'];
    $purchase_qty = get_purchase_qty($id);
    $retur = get_purchase_retur($id);
    $retur = $retur ? $retur : 0;
    $stock_retur_tmp = get_stock_retur_tmp($id);
    $stock_retur_tmp = $stock_retur_tmp ? $stock_retur_tmp : 0;
    $unit_beli_name = get_unit_name_beli($id);
    $harga_beli = get_harga_beli($id);
    $q_item_satuan = select_satuan_item($item_id,$id);
    $qty = $purchase_qty - ($retur + $stock_retur_tmp);
    include '../views/retur_pembelian/popmodal.php';
    break;

    case 'save_tmp':
      $id = $_POST['purchase_detail_id'];
      $purchase_id = $_POST['purchase_id'];
      $i_qty_popmodal = $_POST['i_qty_popmodal'];
      $i_desc = $_POST['i_desc'];
      $item_id = $_POST['i_item_id_popmodal'];
      $i_unit = $_POST['i_unit'];
      if ($i_unit == 0) {
        $i_unit = get_unit_beli($id);
      }
      $harga_beli_retur = $_POST['harga_beli_retur'];
      $data="'',
            '$purchase_id',
            '$id',
            '".$_SESSION['user_id']."',
            '$item_id',
            '$i_qty_popmodal',
            '$i_unit',
            '$harga_beli_retur',
            '$i_desc'
            ";
      $_SESSION['purchase_id'] = $purchase_id;
      create_config("wr_pembelian_tmp", $data);

      $wr_pembelian_tmp_id = mysql_insert_id();
      $wr_pembelian_tmp_id = intval($wr_pembelian_tmp_id);

      $item_id = intval($item_id);

      $data = array('wr_pembelian_tmp_id' => $wr_pembelian_tmp_id,
                    'item_id' => $item_id
                    );

      echo json_encode($data);;
      // header("Location: retur_pembelian.php?page=list");
    break;

    case 'keterangan_popmodal':
      $purchase_id = $_GET['purchase_id'];
      $item_id = $_GET['item_id'];
      $wr_pembelian_tmp_id = $_GET['wr_pembelian_tmp_id'];

      $where_item_id = "WHERE item_id = '$item_id'";
      $where_wr_pembelian_tmp_id = "WHERE retur_tmp_id = '$wr_pembelian_tmp_id'";


      $kategori_id = select_config_by('items', 'kategori_id', $where_item_id);

      $item_qty = select_config_by('wr_pembelian_tmp', 'item_qty', $where_wr_pembelian_tmp_id);

      $where_kategori_id = "WHERE kategori_id = '$kategori_id'";

      $q_kategori_keterangan = select_config('kategori_keterangan', $where_kategori_id);

      $action = "retur_pembelian.php?page=save_keterangan";

      include '../views/retur_pembelian/keterangan_popmodal_retur_pembelian.php';
      break;

    case 'kategori_keterangan':
      $item_id = $_POST['item_id'];
      $purchase_id = $_POST['purchase_id'];
      $kategori_keterangan_id = $_POST['kategori_keterangan_id'];
      $q_kk = select_keterangan_details_retur($item_id, $kategori_keterangan_id, $purchase_id);
      while ($r_kk = mysql_fetch_array($q_kk)) {
        $data[] = array('item_keterangan_details_id'  => $r_kk['item_keterangan_details_id'],
                        'keterangan_details' 				  => $r_kk['keterangan_details'] );
      }
      echo json_encode($data);
      break;

    case 'save_keterangan':
      $kategori_keterangan_id = $_POST['kategori_keterangan_id'];
      $wr_pembelian_tmp_id = $_POST['wr_pembelian_tmp_id'];
      $field_keterangan = $_POST['field_keterangan'];
      $purchase_id = $_POST['purchase_id'];

      $item_qty = $_POST['item_qty'];
      $item_id = $_POST['item_id'];

      var_dump($field_keterangan);

      for ($i=0; $i <$item_qty ; $i++) {
        $data = "'',
                 '$purchase_id',
                 '$wr_pembelian_tmp_id',
                 '$item_id',
                 '".$field_keterangan[$i]."'
                 ";
        create_config('wr_pembelian_details_tmp',$data);
      }
      header('Location:retur_pembelian.php?page=list');
      break;


    case 'delete_widget':

    $id = get_isset($_GET['id']);
    var_dump($id);
    delete_config("wr_pembelian_tmp", "retur_tmp_id = '$id'");
    delete_config("wr_pembelian_details_tmp", "retur_tmp_id = '$id'");
    header("Location: retur_pembelian.php?page=list");

    break;

    case 'reset':
      $purchase_id = get_isset($_GET['id']);
      delete_config("retur_pembelian_tmp","purchase_id = '$purchase_id'");
      delete_config("retur_details_pembelian_tmp","purchase_id = '$purchase_id'");
      delete_config("wr_pembelian_tmp","purchase_id = '$purchase_id'");
      delete_config("wr_pembelian_details_tmp","purchase_id = '$purchase_id'");
      header("Location: retur_pembelian.php?page=list");
      break;

    case 'save_retur':

    $purchase_id = get_isset($_GET['purchase_id']);
    $retur_price = get_isset($_GET['retur_price']);
    $q_wr_pembelian = select_wr_pembelian_tmp($purchase_id);
    $r_wr_pembelian_tmp = mysql_fetch_array($q_wr_pembelian);
    $now_date = date("Y-m-d m:i:s");
    if ($retur_price>0) {
      $data = "'',
      '".$r_wr_pembelian_tmp['purchases_id']."',
      '".$now_date."',
      '".$r_wr_pembelian_tmp['purchases_date']."',
      '".$retur_price."',
      '".$_SESSION['user_id']."',
      '".$r_wr_pembelian_tmp['lunas']."'
      ";
      var_dump($data);
      create_config("retur_pembelian_tmp",$data);
      $q_wr_pembelian_tmp_detail = select_wr_pembelian_tmp_detail($purchase_id);
      while ($r_wr_pembelian_tmp_detail = mysql_fetch_array($q_wr_pembelian_tmp_detail)) {
        $total = $r_wr_pembelian_tmp_detail['harga_retur'] * $r_wr_pembelian_tmp_detail['item_qty'];
        $data_detail = "'',
                      '".$r_wr_pembelian_tmp_detail['purchase_id']."',
                      '".$r_wr_pembelian_tmp_detail['purchase_detail_id']."',
                      '".$r_wr_pembelian_tmp_detail['item_id']."',
                      '".$r_wr_pembelian_tmp_detail['item_qty']."',
                      '".$r_wr_pembelian_tmp_detail['unit_id']."',
                      '".$r_wr_pembelian_tmp_detail['harga_retur']."',
                      '$total',
                      '".$r_wr_pembelian_tmp_detail['retur_desc']."'
                      ";
          create_config("retur_details_pembelian_tmp",$data_detail);
      }
      $_SESSION['purchase_id'] = $purchase_id;
      header("Location: retur_pembelian.php?page=pay_retur&purchase_id=$purchase_id");
    }else {
      header("Location: retur_pembelian.php?page=list&err=1&purchase_id=$purchase_id");
    }
    break;

    case 'pay_retur':
      $purchase_id = $_GET['purchase_id'];
      $q_supplier = select_supplier_retur($purchase_id);
      $r_supplier = mysql_fetch_array($q_supplier);
      $q_retur_tmp = select_retur_tmp($purchase_id);
      $r_retur_tmp = mysql_fetch_array($q_retur_tmp);
      $total_harga = $r_retur_tmp['total'];
      $action = "retur_pembelian.php?page=pay_retur2";
      $close = "retur_pembelian.php?page=close&purchase_id=$purchase_id";
      include '../views/retur_pembelian/pay_retur.php';
      break;

    case 'close':
      $purchase_id = $_GET['id'];
      delete_config("retur_pembelian_tmp","purchase_id = '$purchase_id'");
      delete_config("retur_details_pembelian_tmp","purchase_id = '$purchase_id'");
      delete_config("wr_pembelian_tmp","purchase_id = '$purchase_id'");
      header("Location: retur.php?page=list");
      break;

    case 'pay_retur2':
        $i_purchase_id = $_POST['i_purchase_id'];
        $i_payment_method = $_POST['i_payment_method'];
        $retur_price = $_POST['i_payment'];
        $q_retur_pembelian_tmp = select_retur_pembelian_tmp($i_purchase_id);
        $r_retur_pembelian_tmp = mysql_fetch_array($q_retur_pembelian_tmp);
        $data_url='retur_pembelian.php?page=pay_retur';
        if ($i_payment_method==1) {
          $i_bank_id = '';
          $i_bank_id_to = '';
          $i_bank_account = '';
          $i_bank_account_to = '';
          $data = "'',
                  '".$r_retur_pembelian_tmp['purchase_id']."',
                  '".$r_retur_pembelian_tmp['purchase_date']."',
                  '".$r_retur_pembelian_tmp['retur_date']."',
                  '1',
                  '0',
                  '0',
                  '0',
                  '0',
                  '".$_SESSION['user_id']."',
                  '".$r_retur_pembelian_tmp['retur_total_price']."',
                  '".$r_retur_pembelian_tmp['lunas']."'
                  ";
        }elseif ($i_payment_method==2||$i_payment_method==3) {
                  $i_bank_id = $_POST['i_bank_id'];
                  $i_bank_id_to = $_POST['i_bank_id_to'];
                  $i_bank_account = $_POST['i_bank_account'];
                  $i_bank_account_to = $_POST['i_bank_account_to'];
                  $data = "'',
                          '".$r_retur_pembelian_tmp['purchase_id']."',
                          '".$r_retur_pembelian_tmp['purchase_date']."',
                          '".$r_retur_pembelian_tmp['retur_date']."',
                          '$i_payment_method',
                          '$i_bank_id',
                          '$i_bank_account',
                          '$i_bank_id_to',
                          '$i_bank_account_to',
                          '".$_SESSION['user_id']."',
                          '".$r_retur_pembelian_tmp['retur_total_price']."',
                          '".$r_retur_pembelian_tmp['lunas']."'
                          ";
        }

        create_config("retur_pembelian", $data);
        $retur_id = mysql_insert_id();

        if($r_retur_pembelian_tmp['lunas']==0||$r_retur_pembelian_tmp['lunas']==2){
          create_journal($i_transaction_id,$data_url,'7', $i_payment_method,$r_retur_tmp['retur_total_price'],
          $r_retur_tmp['retur_date'],$_SESSION['user_id'],$i_bank_id,$i_bank_account,$i_bank_id_to,$i_bank_account_to);
        }else {
          create_journal($i_transaction_id,$data_url,'7', $i_payment_method,'',$r_retur_tmp['retur_date'],$_SESSION['user_id'],'','','','');
        }
        $q_retur_pembelian_detail = select_retur_pembelian_detail_tmp($i_purchase_id);

        while ($r_retur_pembelian_detail=mysql_fetch_array($q_retur_pembelian_detail)) {
          $data_detail = "'',
                          '$retur_id',
                          '".$r_retur_pembelian_detail['purchase_id']."',
                          '".$r_retur_pembelian_detail['purchase_detail_id']."',
                          '".$r_retur_pembelian_detail['item_id']."',
                          '".$r_retur_pembelian_detail['item_qty']."',
                          '".$r_retur_pembelian_detail['unit_id']."',
                          '".$r_retur_pembelian_detail['item_price']."',
                          '".$r_retur_pembelian_detail['retur_desc']."'
                          ";
          create_config("retur_pembelian_details",$data_detail);
          $retur_pembelian_details_id = mysql_insert_id();
          $wr_pembelian_details_tmp_id = $r_retur_pembelian_detail['wr_pembelian_details_id'];
          $item_id = $r_retur_pembelian_detail['item_id'];
          $unit_id = $r_retur_pembelian_detail['unit_id'];
          $qty = $r_retur_pembelian_detail['item_qty'];
          $qty_real = konversi_qty($item_id, $unit_id,$qty);
          $q_purchase_detail_id = select_purchase($i_purchase_id);
          $r_purchase_detail_id = mysql_fetch_array($q_purchase_detail_id);
          $i_purchase_detail_id = $r_purchase_detail_id['purchase_detail_id'];
          $supplier_id = $r_purchase_detail_id['supplier_id'];

          $data_stock_retur = "'',
                               '$item_id',
                               '$qty_real',
                               '$s_cabang'
                               ";

          $data_stock_retur_detail = "'',
                                      '$item_id',
                                      '$supplier_id',
                                      '$i_purchase_id',
                                      '$i_purchase_detail_id',
                                      '$qty_real',
                                      '$qty',
                                      '$unit_id',
                                      '".$r_retur_pembelian_tmp['purchase_date']."'
                                      ";

          $where_wr_pembelian_details_id = "WHERE wr_pembelian_details_id = '$wr_pembelian_details_tmp_id'";
          $q_kategori_keterangan = select_config('wr_pembelian_details_tmp', $where_wr_pembelian_details_id);
          while ($r_kategori_keterangan = mysql_fetch_array()) {
            $item_keterangan_details_id = $r_kategori_keterangan['kategori_keterangan_id'];
            $data_retur_pembelian_details_item = "'',
                                                  '$i_purchase_id',
                                                  '$retur_pembelian_details_id',
                                                  '$item_id',
                                                  '$item_keterangan_details_id'
                                                  ";
            create_config('retur_pembelian_details_item' ,$data_retur_pembelian_details_item);
            $where_keterangan_item = "item_keterangan_details_id = '$item_keterangan_details_id'";
            $data_status = "status = '3'";
            update_config2('item_keterangan_details', $data_status, $where_keterangan_item);
                                                }
          update_stock($qty, $item_id, $data_stock_retur, $data_stock_retur_detail);
        }
        delete_config("retur_pembelian_tmp","purchase_id = '$purchase_id'");
        delete_config("retur_details_pembelian_tmp","purchase_id = '$purchase_id'");
        delete_config("wr_pembelian_tmp","purchase_id = '$purchase_id'");
        unset($_SESSION['purchase_id']);
        header("Location: print.php?page=print_retur_pembelian&purchase_id=$i_purchase_id&retur_id=$retur_id");
    break;

    case 'bank_to':

    $id = $_POST['x'];
    $query=mysql_query("SELECT * from banks WHERE bank_id = ".$id);
    $r_bank=mysql_fetch_array($query);
    $bank['data'][] = array(
      'bank_name'   => $r_bank['bank_name'],
      'bank_account_number' => $r_bank['bank_account_number'],
    );
    $menu['status'] = '200';
    echo json_encode($bank);
    break;

    case 'get_konversi':
      $i_unit_jual = $_POST['a'];
      $i_unit = $_POST['x'];
      $i_stock = $_POST['y'];
      $item_id = $_POST['z'];
      $unit_id_utama = get_unit_id_utama($item_id);
      $qty = konversi_qty_retur($item_id,$i_unit,$i_stock,$i_unit_jual, $unit_id_utama);
      $harga_konversi = get_harga_konversi($item_id,$i_unit,$i_stock,$i_unit_jual, $unit_id_utama);
      $data= array(
                    'qty'          	 => $qty,
                    'harga_konversi' => $harga_konversi,
                 );
      echo json_encode($data);
      break;

    case 'kembali':
      $purchase_id = $_GET['id'];
      delete_config("retur_pembelian_tmp","purchase_id = '$purchase_id'");
      $q_retur_tmp = select_retur_details_pembelian_tmp($purchase_id);
      while($r_retur_tmp = mysql_fetch_array($q_retur_tmp)){
        delete_config("retur_details_pembelian_tmp","purchase_id = '$purchase_id'");
      }
      header("Location: retur_pembelian.php?page=list");
      break;

    case 'retur_widget_popmodal':
      $purchase_id = $_GET['id'];
      include '../views/retur_pembelian/retur_widget_popmodal.php';
      break;
  }
  ?>
