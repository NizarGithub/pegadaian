<?php
include '../lib/config.php';
include '../lib/function.php';
include '../models/transaction_new_model.php';

$page = null;
$page = (isset($_GET['page'])) ? $_GET['page'] : "list";
$title = ucfirst("");

$_SESSION['menu_active'] = 2;
$menu_active = $_SESSION['menu_active'];
$s_cabang = $_SESSION['branch_id'];
$permit = get_akses_permits($_SESSION['user_type_id'],$_SESSION['menu_active']);

switch ($page) {
	case 'list':
		get_header($title);
		$date = format_date(date("Y-m-d"));

		if(isset($_GET['date'])){
			$date = format_date($_GET['date']);
		}

		$transaction_id = "";
		if(isset($_GET['transaction_id'])){
			$transaction_id = $_GET['transaction_id'];
			$query_history = select_history($transaction_id);
		}
		if($transaction_id == ""){
			$check_transaction_id = 0;
		}else{
			$check_transaction_id = check_transaction_id($transaction_id);
		}
		if(isset($_GET['mt_id'])){
			$param = $_GET['mt_id'];
		}else{
			$param = '';
		}
		$query_cat = select_cat($param);
		$query = select($param);
		$query2 = select($param);
		$query_find = select($param);
		$query_widget = select_widget_tranksasi($transaction_id);

		$where = "";
		$q_member = select_config('members', $where);
		$q_partner = select_config('partners',$where);

		$action = "transaction_new.php?page=save";
		include '../views/transaction_new/list.php';
		get_footer($query_find);
	break;

 case 'popmodal_widget':
 	$transaction_id = $_GET['id'];
	$query_widget = select_widget_tranksasi($transaction_id);
	include '../views/transaction_new/popmodal_widget.php';
 	break;

	case 'note':
		$title = ucfirst("Global Note");
		get_header($title);

		$transaction_id = get_isset($_GET['transaction_id']);
		$wt_id = get_isset($_GET['wt_id']);
		$menu_name = get_menu_name_widget($wt_id);
		$jumlah = get_jumlah_widget($wt_id);

		$get_note_desc = get_note_desc($wt_id);

		$action = "transaction_new.php?page=save_note&wt_id=$wt_id&transaction_id=$transaction_id";
		$close_button = "transaction_new.php?page=list&transaction_id=$transaction_id";

		include '../views/transaction_new/note.php';
		get_footer();
		break;

	case 'save':
		extract($_POST);
		$i_date = get_isset($i_date);
		$i_date = format_back_date($i_date);
		$i_jam = date("H:i:s");
		$i_transaction_id = get_isset($i_transaction_id);
		$action1="transaction_new.php?page=save_payment";
		$tanggal = $i_date." ".$i_jam;
		$close = "transaction_new.php?page=close&transaction_id=$i_transaction_id";
		$i_total_harga = get_isset($i_total_harga);
		$i_member_id = get_isset($i_member_id);
		$i_partner = get_isset($i_partner);
		$i_branch_id = get_isset($i_branch_id);
		if($i_total_harga > 0){
			$check_transaction_id = check_transaction_id($i_transaction_id);
			if($check_transaction_id > 0){
				$transaction_id = get_transaction_id_old($i_transaction_id);
			}else{
					$data = "
						'$i_transaction_id',
						'".$_SESSION['user_id']."',
						'$tanggal',
						'".time()."',
						'$i_member_id',
						'$i_partner'
							";
			create_config("transactions_tmp", $data);
				$transaction_id = mysql_insert_id();
				$transaction_code = time();
			}
			$query = select_widget($_SESSION['user_id'], $i_transaction_id);
			while($row = mysql_fetch_array($query)){
				$jumlah_real = $row['jml_real_tiap_item'];
				$jumlah = $row['jml_tiap_item'];
				$item_price = get_item_price($row['stock_id']);
				$total = $jumlah_real * $item_price;
				$q_kategori = mysql_query("SELECT kategori_id FROM items WHERE item_id = ".$row['stock_id']);
				$r_kategori = mysql_fetch_array($q_kategori);
				$data_detail = "'',
												'$i_transaction_id',
												'".$r_kategori['kategori_id']."',
												'".$row['stock_id']."',
												'".$item_price."',
												'0',
												'".$item_price."',
												'0',
												'".$item_price."',
												'$jumlah_real',
												'$jumlah',
												'".$row['unit_id']."',
												'$total',
												'0'
												";
				create_config("transaction_tmp_details", $data_detail);
			}
				 $total_price2 = 0;
				 $total_price3 = 0;
				 $total_price5 = 0;
				 $total_tiap_item = 0;
				 $total_price[0] = 0;
				 $nominal_diskon[0] = 0;
				 $diskon[0] = 0;
				 $kategori = '';
				 $tipe_pembeli = '';
				 $nominal_diskon_tot = 0;
				 $diskon_tot = 0;
				 $query_transaction = select_transaction_tmp($i_transaction_id);
				 while ($r_transaction = mysql_fetch_array($query_transaction)){
					 $total_price2 = $total_price2 + $r_transaction['transaction_detail_total'];
						 if ($r_transaction['member_id']) {
							 $q_diskon =select_diskon_member($r_transaction['member_id'],$r_transaction['kategori']);
							 $r_diskon = mysql_fetch_array($q_diskon);
							 if ($r_diskon['tipe_pembeli_diskon_id']) {
								 $nominal_diskon[] 		= $r_diskon['nominal_diskon'];
								 $diskon[] 						= $r_diskon['nilai_diskon'];
								 $kategori[] 					= $r_transaction['kategori'];
								 $tipe_pembeli 				= $r_diskon['tipe_pembeli'];
								 $nominal_diskon_tot 	=
								 $nominal_diskon_tot + $r_transaction['transaction_detail_total'] * $r_diskon['nilai_diskon'] / 100;
								 $diskon_tot 					=
								 $nominal_diskon_tot + $r_transaction['transaction_detail_total'] - $r_diskon['nominal_diskon'];
							 }
						 }
						 $total_price5 = $nominal_diskon_tot;
					 }
				 $total_asli = ceil($total_price2);
				 $totalawal  = $total_price2;
				 $totalkedua =	$totalawal;
				 $total_kedua = ceil($totalkedua);
				 if (substr($totalkedua,-2)!=00){
					 if(substr($totalkedua,-2)<50){
						 $totalkedua=round($totalkedua,-2)+100;
					 }else{
						 $totalkedua=round($totalkedua,-2);
					 } }
				 if (substr($total_asli,-2)!=00){
							 if(substr($total_asli,-2)<50){
								 $total_asli2=round($total_asli,-2)+100;
							 }else{
								 $total_asli2=round($total_asli,-2);
							 }
				}
			 $q_member = select_member($i_member_id);
			 $row_member = mysql_fetch_array($q_member);
			 $_SESSION['member_id'] = $i_member_id;
			include '../views/payment/list.php';
			}else{
			header("Location: transaction_new.php?page=list&err=1&transaction_id=$i_transaction_id");
		}
	break;

	case 'close':
		$transaction_id = get_isset($_GET['transaction_id']);
		//hapus retur_tmp
		$q_close_detail = mysql_query("select * from transaction_tmp_details where transaction_id = ".$transaction_id);
		while($r_close_detail = mysql_fetch_array($q_close_detail)){
			delete_config("transaction_tmp_details", "transaction_id = ".$transaction_id);
		}
		delete_config("transactions_tmp", "transaction_id = '$transaction_id'");
		header("Location: home.php");
		break;

	case 'create_note':
		$i_qty 				= $_POST['i_qty_popmodal'];
		$i_unit 			= $_POST['i_unit'];
		$item_id 			= $_POST['i_item_id_popmodal'];
		$i_stock_real = $_POST['i_stock_real'];
		$i_partner 		= $_POST['i_partner'];

		$tanggal = $_POST['tanggal'];
		$qty_asli 		= get_qty_asli($item_id,$i_unit,$i_qty);
		if ($i_unit==0) {
			$i_unit = get_unit_utama_id($item_id);
			$qty_asli = $i_qty;
		}
		$transaction_id = $_POST['transaction_id'];
		$member_id 			= $_POST['test1'];
		$branch_id 			= $_POST['branch_id'];
		$data = "'',
						'".$_SESSION['user_id']."',
						'$item_id',
						'$qty_asli',
						'$i_qty',
						'$i_unit',
						'$transaction_id',
						'',
						'',
						''
				";
		create_config("widget_tmp", $data);
		$wt_id = mysql_insert_id();
		$_SESSION['member_id'] = $member_id;
		$_SESSION['branch_id_1'] = $branch_id;
		$_SESSION['tanggal'] = $tanggal;
		$_SESSION['partner_id'] = $i_partner;
		$item_id = intval($item_id);
		$wt_id = intval($wt_id);
		$data = array('item_id' => $item_id,
	 								'wt_id' => $wt_id);
		echo json_encode($data);
		// header("Location: transaction_new.php?page=list&transaction_id=$transaction_id");
	break;

	case 'keterangan_popmodal':
		$item_id = $_GET['item_id'];
		$transaction_id = $_GET['transaction_id'];
		$wt_id = $_GET['wt_id'];

		$where_item_id = "WHERE item_id = '$item_id'";
		$where_stock_id = "WHERE stock_id = '$item_id'";
		$kategori_id = select_config_by('items', 'kategori_id', $where_item_id);

		$item_qty = select_config_by('widget_tmp', 'jumlah', $where_stock_id);
		$where_kategori_id = "WHERE kategori_id = '$kategori_id'";
		$q_kategori_keterangan = select_config('kategori_keterangan', $where_kategori_id);
		$action = "transaction_new.php?page=save_keterangan";
		include '../views/transaction_new/keterangan_popmodal_penjualan.php';
		break;

	case 'kategori_keterangan':

		$kategori_keterangan_id = $_POST['kategori_keterangan_id'];
		$item_id = $_POST['item_id'];

		$where_item_keterangan_details = "WHERE item_id = '$item_id' AND kategori_keterangan_id = '$kategori_keterangan_id' AND status = 0 ";

		$q_kk = select_keterangan_details($item_id, $kategori_keterangan_id);
		while ($r_kk = mysql_fetch_array($q_kk)) {
			$data[] = array('item_keterangan_details_id'=> $r_kk['item_keterangan_details_id'],
											'keterangan_details' 				=> $r_kk['keterangan_details']);
		}
		echo json_encode($data);
		break;

	case 'save_keterangan':
		$field_keterangan = $_POST['field_keterangan'];
		$item_id = $_POST['item_id'];
		$wt_id = $_POST['wt_id'];
		$item_qty = $_POST['item_qty'];
		for ($i=0; $i < $item_qty; $i++) {
			$data = "'',
							 '$wt_id',
							 '$item_id',
							 '$field_keterangan[$i]'";
			create_config('widget_tmp_details' ,$data);
		}
		header('location:transaction_new.php?page=list');
		break;

	case 'form_widget':
		$menu_id = $_GET['menu_id'];
		$jumlah = $_GET['jumlah'];
		$transaction_id = $_GET['transaction_id'];
		$get_widget = get_widget($menu_id, $transaction_id);
		if($jumlah == 0){
			delete_config("widget_tmp", "menu_id = '$menu_id' and user_id = '".$_SESSION['user_id']."' and transaction_id = '$transaction_id'");
		}else{
			if($get_widget==0){
				$data = "'',
						'".$_SESSION['user_id']."',
						'$menu_id',
						'$jumlah',
						'$transaction_id',
						'',
						''
							";
				create_config("widget_tmp", $data);
			}else{
				$data = "jumlah = '$jumlah'						";
				update_config2("widget_tmp", $data, "menu_id = '$menu_id' and user_id = '".$_SESSION['user_id']."' and transaction_id = '$transaction_id'");
			}
		}
		include '../views/transaction_new/widget.php';

	break;

	case 'popmodal':
		$item_id = $_GET['item_id'];
		$member_id = $_GET['member_id'];
		$transaction_id = $_GET['transaction_id'];
		$branch_id = $_GET['branch_id'];
		$q_item = get_item_name($item_id);
		$r_item = mysql_fetch_array($q_item);
		$item_name = $r_item['item_name'];
		$item_stock_qty = get_item_stock_now($item_id,$branch_id);
		$stock_tmp = get_stock_tmp($transaction_id,$item_id);
    $qty = $item_stock_qty-$stock_tmp;
		$q_item_detail = get_item_detail($item_id);
		$unit_utama_name = get_unit_utama_name($item_id);
		$q_item_satuan = select_satuan_item($item_id);
		$tanggal = $_GET['tanggal'];

		$i_partner = $_GET['i_partner'];

		$action = 'transaction_new.php?page=create_note';
		include '../views/transaction_new/popmodal.php';
	break;

	case 'get_konversi':
		$i_unit = $_POST['x'];
		$i_stock = $_POST['y'];
		$item_id = $_POST['z'];

		$qty_beta = konversi_qty($item_id,$i_unit,$i_stock);
		$qty = floor($qty_beta);
		$sisa = get_sisa_satuan_utama($i_unit,$item_id,$qty,$qty_beta);
		$harga_konversi = get_harga_konversi($i_unit,$item_id);
		$harga_satuan_utama = get_harga($item_id);
		if ($harga_konversi != 0) {
			$harga_konversi = $harga_konversi;
		}else {
			$harga_konversi = $harga_satuan_utama;
		}
		 $data= array('qty' 						=> $qty,
	  							'sisa' 						=> $sisa,
									'harga_konversi'	=> $harga_konversi,
								);
		echo json_encode($data);
		break;

	case 'menu_search':
		$transaction_id = $_POST['x'];
		$word = $_POST['z'];
		$query = select_same_word($word, $s_cabang);
		while ($row = mysql_fetch_array($query)) {
			$item_stock_qty = get_item_stock_now($row['item_id'],$s_cabang);
			$stock_tmp = get_stock_tmp($transaction_id,$row['item_id']);
	    $qty = $item_stock_qty-$stock_tmp;
			$item_price = $row['item_price'];
			if ($item_price == null) {
				$item_price = 0;
			}
			if ($row['stock_img']) {
			$stock[] = array(
				'item_id'   	=> $row['item_id'],
				'item_name' 	=> $row['item_name'],
				'stock_img' 	=> $row['stock_img'],
				'item_price' 	=> $item_price,
				'kode_barang' => $row['kode_barang'],
				'qty' 				=> $qty
				);
			}	else {
				$stock[] = array(
			'item_id'   => $row['item_id'],
			'item_name' => $row['item_name'],
			'stock_img' => 'default.jpg',
			'item_price' => $item_price,
			'kode_barang' => $row['kode_barang'],
			'qty' 				=> $qty
				);
			}
		}
		echo json_encode($stock);
		break;

	case 'delete_widget':

		$id = get_isset($_GET['id']);
		$transaction_id = get_isset($_GET['transaction_id']);

		delete_config("widget_tmp", "wt_id = '$id'");
		delete_config("widget_tmp_details", "wt_id = '$id'");

		header("Location: transaction_new.php?transaction_id=$transaction_id&did=3");

	break;

	case 'delete_note':

		$id = get_isset($_GET['id']);
		$transaction_id = get_isset($_GET['transaction_id']);
		$wt_id = get_isset($_GET['wt_id']);

		delete_config("widget_tmp_details", "wtd_id = '$id'");

		header("Location: transaction_new.php?page=note&transaction_id=$transaction_id&wt_id=$wt_id");

	break;

	case 'reset':

		$transaction_id = get_isset($_GET['transaction_id']);
		$q_detail = mysql_query("select * from transactions_tmp
														 where transaction_id = '$transaction_id'
														 and user_id = '".$_SESSION['user_id']."'");
		while($r_detail = mysql_fetch_array($q_detail)){
			delete_config("transaction_tmp_details", "transaction_id = '".$r_detail['transaction_id']."'");
		}

		delete_config("transactions_tmp", "transaction_id = '$transaction_id'");
		$q_widget_detail = mysql_query("select * from widget_tmp_details
																		where transaction_id = '$transaction_id'
																		and user_id = '".$_SESSION['user_id']."'");
		while($r_widget_detail = mysql_fetch_array($q_widget_detail)){
			delete_config("widget_tmp_details", "wt_id = '".$r_widget_detail['wt_id']."'");
		}

		unset($_SESSION['member_id']);
		unset($_SESSION['branch_id_1']);
		unset($_SESSION['tanggal']);

		delete_config("widget_tmp", "transaction_id = '$transaction_id'");
		header("Location: transaction_new.php?page=list&transaction_id=$transaction_id");
	break;

	case 'menu';
		$transaction_id = $_POST['z'];
		$query = select_all_stock($s_cabang);
		while($r_stocks = mysql_fetch_array($query)){
			$item_stock_qty = get_item_stock_now($r_stocks['item_id'],$s_cabang);
			$stock_tmp = get_stock_tmp($transaction_id,$r_stocks['item_id']);
	    $qty = $item_stock_qty-$stock_tmp;
			$item_price = $r_stocks['item_price'];
			if ($item_price == null) {
				$item_price = 0;
			}
			if ($r_stocks['stock_img']) {
			$stock[] = array(
				'item_id'   	=> $r_stocks['item_id'],
				'item_name' 	=> $r_stocks['item_name'],
				'stock_img' 	=> $r_stocks['stock_img'],
				'item_price' 	=> $item_price,
				'kode_barang' => $r_stocks['kode_barang'],
				'qty' 				=> $qty
			);
		}else {
				$stock[] = array(
			'item_id'   => $r_stocks['item_id'],
			'item_name' => $r_stocks['item_name'],
			'stock_img' => 'default.jpg',
			'item_price' => $item_price,
			'kode_barang' => $r_stocks['kode_barang'],
			'qty' 				=> $qty
				);
		}
		};
		$menu['status'] = '200';
		echo json_encode($stock);
		break;

	case 'select_satuan':
		$item_id = $_POST['item_id'];
		$query = select_satuan_item($item_id);
		$response = array();
		while($row = mysql_fetch_array($query)) {
			$response[] = array(
				'unit_id'   => $row['unit_id'],
				'unit_name' => $row['unit_name']
			);
		};
		echo json_encode($response);
		break;

	case 'sub_menu_2':
		$id = $_POST['x'];
		$query = mysql_query("select * from sub_kategori where kategori_utama_id = ".$id);
		while($r_submenu = mysql_fetch_array($query)) {
			$response[] = array(
				'sub_kategori_id'   => $r_submenu['sub_kategori_id'],
				'sub_kategori_name' => $r_submenu['sub_kategori_name'],
			);
		};
		echo json_encode($response);
		break;

	case 'menu_sub':
		$transaction_id = $_POST['z'];
		$id = $_POST['x'];
		$q_item = select_item($id,$s_cabang);
		while($menu_sub = mysql_fetch_array($q_item)){
			$item_stock_qty = get_item_stock_now($menu_sub['item_id'],$s_cabang);
			$stock_tmp = get_stock_tmp($transaction_id,$menu_sub['item_id']);
	    $qty = $item_stock_qty-$stock_tmp;
			$item_price = $menu_sub['item_price'];
			if ($item_price == null) {
				$item_price = 0;
			}
			if ($menu_sub['stock_img']) {
			$menu['data'][] = array(
				'item_id'   => $menu_sub['item_id'],
				'item_name' => $menu_sub['item_name'],
				'stock_img' => $menu_sub['stock_img'],
				'item_price' => $item_price,
				'kode_barang' => $menu_sub['kode_barang'],
				'qty' 				=> $qty
			);
		}else {
				$menu['data'][] = array(
					'item_id'   => $menu_sub['item_id'],
					'item_name' => $menu_sub['item_name'],
					'stock_img' => 'default.jpg',
					'item_price' => $item_price,
					'kode_barang' => $menu_sub['kode_barang'],
					'qty' 				=> $qty
				);
			}
		};
		$menu['status'] = '200';
		echo json_encode($menu);
		break;

		case 'menu_sub_2':
			$transaction_id = $_POST['z'];
			$id = $_POST['x'];
			$q_item = select_item_2($id,$s_cabang);
			while($menu_sub = mysql_fetch_array($q_item)){
				$item_stock_qty = get_item_stock_now($menu_sub['item_id'],$s_cabang);
				$stock_tmp = get_stock_tmp($transaction_id,$menu_sub['item_id']);
				$qty = $item_stock_qty-$stock_tmp;
				$item_price = $menu_sub['item_price'];
				if ($item_price == null) {
					$item_price = 0;
				}
				if ($menu_sub['stock_img']) {
				$menu['data'][] = array(
					'item_id'   => $menu_sub['item_id'],
					'item_name' => $menu_sub['item_name'],
					'stock_img' => $menu_sub['stock_img'],
					'item_price' => $item_price,
					'kode_barang' => $menu_sub['kode_barang'],
					'qty' 				=> $qty,
				);}else {
					$menu['data'][] = array(
						'item_id'   => $menu_sub['item_id'],
						'item_name' => $menu_sub['item_name'],
						'stock_img' => 'default.jpg',
						'item_price' => $item_price,
						'kode_barang' => $menu_sub['kode_barang'],
						'qty' 				=> $qty,
					);
				}
			};
			$menu['status'] = '200';
			echo json_encode($menu);
			break;

	case 'save_payment':
		$i_payment 					= $_POST['i_payment'];
		$i_transaction_id 	= $_POST['i_transaction_id'];
		$i_change 					= $_POST['i_change'];
		$i_discount 				= "";
		$i_total 						= $_POST['i_total'];
		$i_grand_total 			= $_POST['i_grand_total'];
		$i_payment_method 	= $_POST['i_payment_method'];
		$i_total_desc 			= $_POST['i_payment_method'];
		$i_bank_id 					= "";
		$i_bank_account 		= "";
		$i_bank_id_to 			= "";
		$i_bank_account_to	= "";
		$i_totaltax 				= '';
		$i_member_id 				= get_isset($_POST['i_member']);
		$transactions_desc 	= $_POST['transactions_desc'];
		$branch_id 					= $_POST['branch_id'];
		$total 							= 0;
		$print_tipe 				= $_GET['print_tipe'];
		$i_diskon_persen 		= $_POST['i_diskon_persen'];
		$i_diskon_nominal 	= $_POST['i_diskon_nominal'];

		if($i_payment_method == 2 || $i_payment_method == 3){
			$i_bank_id  				= $_POST['i_bank_id'];
			$i_bank_account  		= $_POST['i_bank_account'];
			$i_bank_id_to  			= $_POST['i_bank_id_to'];
			$i_bank_account_to	= get_bank_account($i_bank_id_to);
		}
		$where_trans_tmp 	= "where transaction_id = '$i_transaction_id'";
		$q_trans_tmp 		 	= select_config('transactions_tmp', $where_trans_tmp);
		$r_trans_tmp		 	= mysql_fetch_array($q_trans_tmp);

		$data = "'',
							'$i_member_id',
							'".$r_trans_tmp['partner_id']."',
							'".$r_trans_tmp['transaction_date']."',
							'$i_total',
							'$i_diskon_persen',
							'',
							'$i_diskon_nominal',
							'$i_grand_total',
							'$i_payment',
							'$i_change',
							'$i_payment_method',
							'$i_bank_id',
							'$i_bank_account',
							'$i_bank_id_to',
							'$i_bank_account_to',
							'".$_SESSION['user_id']."',
							'".$r_trans_tmp['transaction_code']."',
							'$i_totaltax',
							'$i_grand_total',
							'$transactions_desc',
							'0',
							'$branch_id'
							";
		create_config("transactions", $data);
		$transaction_id_new = mysql_insert_id();

		create_journal($r_trans_tmp['transaction_code'], "transaction_new.php?page=save(lunas)", 1,
										$i_payment_method, $i_grand_total, $i_bank_id,$i_bank_account,
										$i_bank_id_to,$i_bank_account_to,$branch_id);

		$where_trans_tmp_details = "where transaction_id = '$i_transaction_id'";
		$query_detail = select_config('transaction_tmp_details', $where_trans_tmp_details);

		$tipe_pembeli  = get_tipe_pembeli($i_member_id);
		$diskon_berlaku = get_diskon_berlaku($tipe_pembeli);
		$total_discount_persen = 0;
		$diskon_persen = 0;
		$diskon_nominal = 0;

		while($row_detail 	= mysql_fetch_array($query_detail)){
					$item_id 				=	$row_detail['item_id'];
					$where_item_id 	= "where item_id = '$item_id'";
					$kategori_id 	= select_config_by('items', 'kategori_id', $where_item_id);
					$total = $total + $row_detail['transaction_detail_total'] - $diskon_nominal - $total_discount_persen;
					$data_detail 	= "'',
													'$transaction_id_new',
													'$kategori_id',
													'".$row_detail['item_id']."',
													'".$row_detail['transaction_detail_original_price']."',
													'".$row_detail['transaction_detail_margin_price']."',
													'".$row_detail['transaction_detail_price']."',
													'',
													'',
													'',
													'".$row_detail['transaction_detail_qty_real']."',
													'".$row_detail['transaction_detail_qty']."',
													'".$row_detail['transaction_detail_unit']."',
													'".$row_detail['transaction_detail_total']."',
													''
													";
					create_config("transaction_details", $data_detail);
					$transaction_detail_id = mysql_insert_id();
					$i_unit = $row_detail['transaction_detail_unit'];
					$i_item_id = $row_detail['item_id'];
					$i_qty = $row_detail['transaction_detail_qty_real'];
					update_stock($row_detail['item_id'],$i_qty,$branch_id);

					$q_widget_detail_tmp = select_config('widget_tmp_details', $where_item_id);
					while ($r_widget_detail_tmp = mysql_fetch_array($q_widget_detail_tmp)) {
						$keterangan_item = $r_widget_detail_tmp['keterangan_item'];
						$data_transaction_details_item = "'',
																					 		'$transaction_id_new',
																							'$transaction_detail_id',
																							'$i_item_id',
																							'$keterangan_item'";
						create_config('transaction_details_item', $data_transaction_details_item);
						$where_keterangan_item = "item_keterangan_details_id = '$keterangan_item'";
						$data_status = "status = '1'";
						update_config2('item_keterangan_details', $data_status, $where_keterangan_item);
					}

		}
			delete_widget_tmp_details($i_transaction_id);
			delete_widget_tmp($i_transaction_id);
			delete_tmp($i_transaction_id);
			unset($_SESSION['member_id']);
			unset($_SESSION['branch_id_1']);
			unset($_SESSION['tanggal']);
			unset($_SESSION['partner_id']);
			header("location: print.php?transaction_id=$transaction_id_new&branch_id=$branch_id&print_tipe=$print_tipe");
	break;

	case 'ket_member';
		$id = $_POST['z'];
		$query = select_member($id);
		while($rmember = mysql_fetch_array($query)){
			$member[] = array(
												'member_id'   => $rmember['member_id'],
												'member_name' => $rmember['member_name'],
												'member_phone' => $rmember['member_phone'],
												'member_alamat' => $rmember['member_alamat'],
												'type_id_pembeli' => $rmember['type_id_pembeli'],
												'type_pembeli_name' => $rmember['type_pembeli_name'],
											);
		};
		$menu['status'] = '200';
		echo json_encode($member);
		break;

	case 'hitungbulat':
		$totalkedua=ceil($_POST['price']);
		if (substr($totalkedua,-2)!=00){
			if(substr($totalkedua,-2)<50){
				$totalkedua=round($totalkedua,-2)+100;
			}else{
				$totalkedua=round($totalkedua,-2);
			}
		}
		echo $totalkedua;
	break;

	case 'bank_to':

		$id = $_POST['x'];
		$query=mysql_query("SELECT * from banks WHERE bank_id = ".$id);
		$r_bank=mysql_fetch_array($query);
		$bank['data'][] = array(
			'bank_name'   => $r_bank['bank_name'],
			'bank_account_number' => $r_bank['bank_account_number'],
		);
	echo json_encode($bank);
		break;

	case 'delete_transaction_tmp':
		$transaction_id = get_isset($_GET['id']);
		$q_back = mysql_query("select * from transaction_tmp_details where transaction_id = ".$transaction_id);
		while($r_close_detail = mysql_fetch_array($q_back)){
			delete_config("transaction_tmp_details", "transaction_id = ".$transaction_id);
		}
		delete_config("transactions_tmp", "transaction_id = '$transaction_id'");
		header("Location: transaction_new.php?page=list&transaction_id=$transaction_id");
		break;

	case 'tambah_pembeli_popmodal':
		$transaction_id = $_GET['transaction_id'];
		$branch_id = $_GET['branch_id'];
		$tanggal = $_GET['tanggal'];
		$where = "WHERE branch_id = '$s_cabang'";
		$q_tipe_pembeli = select_tipe_pembeli($where);
		$_SESSION['tanggal'] = $tanggal;
		$action = "transaction_new.php?page=save_pembeli";
		include '../views/transaction_new/tambah_pembeli_popmodal.php';
		break;

	case 'save_pembeli':
		 extract($_POST);
		 $transaction_id = get_isset($transaction_id);
	   $i_name = get_isset($i_name);
	   $i_phone = get_isset($i_phone);
	   $i_email = get_isset($i_email);
	   $i_discount = '';
	   $i_nik = get_isset($i_nik);
	   $i_alamat = get_isset($i_alamat);
	   $i_kode_pos = get_isset($i_kode_pos);
	   $i_rt = get_isset($i_rt);
	   $i_rw = get_isset($i_rw);
	   $i_kelurahan = get_isset($i_kelurahan);
	   $i_kecamatan = get_isset($i_kecamatan);
	   $i_kota = get_isset($i_kota);
	   $i_ibu = get_isset($i_ibu);
	   $i_tanggal_lahir = get_isset($i_tanggal_lahir);
	   $i_tanggal_lahir = format_back_date($i_tanggal_lahir);
	   $i_tempat_lahir = get_isset($i_tempat_lahir);
	   $i_status_kawin = get_isset($i_status_kawin);
	   $i_tanggungan = get_isset($i_tanggungan);
	   $i_phone_rumah = get_isset($i_phone_rumah);
	   $i_phone = get_isset($i_phone);
	   $i_status_rumah = get_isset($i_status_rumah);
	   $i_lama_tinggal = get_isset($i_lama_tinggal);
	   $i_pendidikan = get_isset($i_pendidikan);
	   $i_email = get_isset($i_email);

	   $nama_darurat = get_isset($nama_darurat);
	   $i_hubungan = get_isset($i_hubungan);
	   $alamat_darurat = get_isset($alamat_darurat);
	   $telp_darurat = get_isset($telp_darurat);

	   $nama_perusahaan = get_isset($nama_perusahaan);
	   $alamat_perusahaan = get_isset($alamat_perusahaan);
	   $i_kode_pos_perusahaan = get_isset($kode_pos_perusahaan);
	   $i_rt_perusahaan = get_isset($rt_perusahaan);
	   $i_rw_perusahaan = get_isset($rw_perusahaan);
	   $kel_perusahaan = get_isset($kel_perusahaan);
	   $kec_perusahaan = get_isset($kec_perusahaan);
	   $kota_perusahaan = get_isset($kota_perusahaan);
	   $telp_perusahaan = get_isset($telp_perusahaan);
	   $jenis_pekerjaan = get_isset($jenis_pekerjaan);
	   $jabatan = get_isset($jabatan);
	   $lama_bekerja_tahun = get_isset($lama_bekerja_tahun);
	   $lama_bekerja_bulan = get_isset($lama_bekerja_bulan);
	   $penghasilan = get_isset($penghasilan);
	   $pengeluaran = get_isset($pengeluaran);
	   $penghasilan_lain = get_isset($penghasilan_lain);
	   $sumber_penghasilan_lain = get_isset($sumber_penghasilan_lain);
	   $tipe_pembeli = '';
	   $data = "'',
	           '$i_name',
	           '$i_phone',
	           '$i_email',
	           '$i_alamat',
	           '$i_discount',
	           '$i_nik',
	           '$i_kelurahan',
	           '$i_kecamatan',
	           '$i_rt',
	           '$i_rw',
	           '$i_kode_pos',
	           '$i_kota',
	           '$i_ibu',
	           '$i_tempat_lahir',
	           '$i_tanggal_lahir',
	           '$i_status_kawin',
	           '$i_tanggungan',
	           '$i_phone_rumah',
	           '$i_status_rumah',
	           '$i_lama_tinggal',
	           '$i_pendidikan',
	           '$tipe_pembeli'";

	   create_config('members', $data);
	   $member_id = mysql_insert_id();

	   $data_darurat = "'',
	                    '$member_id',
	                    '$nama_darurat',
	                    '$i_hubungan',
	                    '$alamat_darurat',
	                    '$telp_darurat'";

	   create_config('members_darurat', $data_darurat);
	   $data_kerja = "'',
	                  '$member_id',
	                  '$nama_perusahaan',
	                  '$alamat_perusahaan',
	                  '$i_rt_perusahaan',
	                  '$i_rw_perusahaan',
	                  '$i_kode_pos_perusahaan',
	                  '$kel_perusahaan',
	                  '$kec_perusahaan',
	                  '$kota_perusahaan',
	                  '$telp_perusahaan',
	                  '$jenis_pekerjaan',
	                  '$jabatan',
	                  '$lama_bekerja_tahun',
	                  '$lama_bekerja_bulan',
	                  '$penghasilan',
	                  '$pengeluaran',
	                  '$penghasilan_lain',
	                  '$sumber_penghasilan_lain'
	                  ";

	   create_config('members_pekerjaan', $data_kerja);
	   $_SESSION['member_id'] = $member_id;
		header("Location:transaction_new.php?page=list&transaction_id=$transaction_id");
		break;


	case 'anguran_popmodal':
		$transaction_id = $_GET['id'];
		$payment_method_id = $_GET['payment_method_id'];
		$branch_id = $_GET['branch_id'];
		$i_member = $_GET['i_member'];
		$query = select_transaction_tmp($transaction_id);
		$q_item_id = select_transaction_tmp($transaction_id);
		$r_item_id = mysql_fetch_array($q_item_id);
		$item_id = $r_item_id['item_id'];
		$item_name = $r_item_id['item_name'];
		$where_item = "WHERE item_id = '$item_id'";
		$row = select_object_config('item_harga',$where_item);
		$row_detail = select_object_config('item_details',$where_item);
		$where_trans = "WHERE transaction_id = '$transaction_id'";
		$row2 = select_object_config('transaction_tmp_details',$where_item);

		$q_item_detail = get_item_detail($item_id);
		$r_item_detail = mysql_fetch_array($q_item_detail);
		$kategori_id = $r_item_detail['kategori_id'];
		$where = "WHERE kategori_id = '$kategori_id'";
		$q_kategori = select_config('kategori',$where);
		$r_kategori = mysql_fetch_array($q_kategori);
		$where = "WHERE payment_method_id = 1 or payment_method_id = 3";
		$q_payment_method = select_config('payment_methods',$where);

		$where='';
		$q_periode = select_config('periode',$where);

		$action = 'transaction_new.php?page=save_kredit';
		include '../views/payment/angsuran_popmodal.php';
		break;

		case 'save_kredit':
			$i_payment 					= '';
			$i_transaction_id 	= $_POST['transaction_id'];
			$i_change 					= '';
			$i_discount 				= '';
			$i_grand_total 			= $_POST['i_harga_barang'];
			$i_payment_method 	= 5;
			$i_total_desc 			= '';
			$i_bank_id 					= '';
			$i_bank_account 		= '';
			$i_bank_id_to 			= '';
			$i_bank_account_to	= '';
			$i_totaltax 				= '';
			$i_member_id 				= $_POST['member_id'];
			$transactions_desc 	= '';
			$branch_id 					= $_POST['branch_id'];
			$total 							= $_POST['i_harga_barang'];

			$i_diskon_persen 		= '';
			$i_diskon_nominal 	= '';
			$potongan_diskon_persen = '';

			$i_bank_id_angsuran = '';
			$i_bank_account_angsuran = '';
			$i_bank_id_to_angsuran = '';
			$i_bank_account_to_angsuran = '';

					$query = select_transaction_tmp($i_transaction_id);
					$row = mysql_fetch_array($query);
						$i_nama_barang = $_POST['i_nama_barang'];
						$i_item_id = $_POST['i_item_id'];
						$i_jenis_barang = $_POST['i_jenis_barang'];
						// $i_kode_program = $_POST['i_kode_program'];
						$merk_barang = $_POST['merk_barang'];
						$i_tipe_barang = $_POST['i_tipe_barang'];
						$i_adminstrasi = $_POST['i_adminstrasi'];
						$i_uang_muka_barang = $_POST['i_uang_muka_barang'];
						$i_cara_pembayaran = $_POST['i_cara_pembayaran'];
						$i_sisa = $total - $i_uang_muka_barang;
						$i_nilai_pembiayaan = $_POST['i_nilai_pembiayaan'];
						$i_periode_angsuran = $_POST['i_periode_angsuran'];
						$i_lama_angsuran = $_POST['i_lama_angsuran'];
						$i_angsuran_per_bulan = $_POST['i_angsuran_per_bulan'];
						$i_date_pembayaran = $_POST['i_date_pembayaran'];

			$data = "'',
							'$i_member_id',
							'".$row['partner_id']."',
							'".$row['transaction_date']."',
							'$total',
							'$i_diskon_persen',
							'$potongan_diskon_persen',
							'$i_diskon_nominal',
							'$total',
							'$i_uang_muka_barang',
							'0',
							'$i_payment_method',
							'$i_bank_id',
							'$i_bank_account',
							'$i_bank_id_to',
							'$i_bank_account_to',
							'".$_SESSION['user_id']."',
							'".$row['transaction_code']."',
							'$i_totaltax',
							'$i_grand_total',
							'$transactions_desc',
							'1',
							'$branch_id'
							";
		var_dump($data);
		create_config("transactions", $data);
		$transaction_id_new = mysql_insert_id();

    $i_date_pembayaran = $_POST['i_date_pembayaran'];
    $i_date = explode("-",$i_date_pembayaran);
    $i_date1 = $i_date[0];
    $i_date2 = $i_date[1];

		$gadai_code = 'K_'.time();
		if ($i_cara_pembayaran == 3) {
			$i_bank_id_angsuran = $_POST['i_bank_id_angsuran'];
			$i_bank_account_angsuran = $_POST['i_bank_account_angsuran'];
			$i_bank_id_to_angsuran = $_POST['i_bank_id_to_angsuran'];
			$i_bank_account_to_angsuran = $_POST['i_bank_account_to_angsuran'];
			$i_periode_angsuran = $_POST['i_periode_angsuran'];
		}
    $data_kredit = "'',
									 '$transaction_id_new',
                   '$gadai_code',
                   '".$_SESSION['user_id']."',
                   '$i_member_id',
                   '$i_item_id',
                   '$i_jenis_barang',
                   '$i_adminstrasi',
                   '$total',
                   '$i_uang_muka_barang',
                   '$i_cara_pembayaran',
									 '$i_bank_id_angsuran',
									 '$i_bank_account_angsuran',
									 '$i_bank_id_to_angsuran',
									 '$i_bank_account_to_angsuran',
                   '$i_nilai_pembiayaan',
                   '$i_lama_angsuran',
									 '$i_periode_angsuran',
                   '$i_angsuran_per_bulan',
                   '$i_date1',
                   '$i_date2',
                   '".$row['transaction_date']."',
                   '',
									 '1'";
    create_config('kredit',$data_kredit);
		create_journal2($row['transaction_code'], "transaction_new.php?page=save(hutang)", 1,$i_payment_method,
										$i_uang_muka_barang, $i_sisa,  $i_bank_id,$i_bank_account,$i_bank_id_to,$i_bank_account_to, $branch_id);
		$where = "WHERE transaction_id = '$i_transaction_id'";
		$query_detail =  select_config('transaction_tmp_details',$where);
		$tipe_pembeli  = get_tipe_pembeli($i_member_id);
		$diskon_berlaku = get_diskon_berlaku($tipe_pembeli);
		$total_discount_persen = 0;
		$diskon_persen = 0;
		$diskon_nominal = 0;

		while($row_detail 	= mysql_fetch_array($query_detail)){

				  $item_id 			= $row_detail['item_id'];
					$where 				= "WHERE item_id = '$item_id'";
					$q_kategori 	= select_config('items',$where);
					$r_kategori 	= mysql_fetch_array($q_kategori);
					$kategori 		= get_kategori($item_id);

					$total = '';
					$data_detail 	= "'',
													'$transaction_id_new',
													'".$r_kategori['kategori_id']."',
													'".$row_detail['item_id']."',
													'".$row_detail['transaction_detail_original_price']."',
													'".$row_detail['transaction_detail_margin_price']."',
													'".$row_detail['transaction_detail_price']."',
													'$diskon_persen',
													'$diskon_nominal',
													'$total',
													'".$row_detail['transaction_detail_qty_real']."',
													'".$row_detail['transaction_detail_qty']."',
													'".$row_detail['transaction_detail_unit']."',
													'".$row_detail['transaction_detail_total']."',
													''
													";
					create_config("transaction_details", $data_detail);
					$transaction_detail_id = mysql_insert_id();
					$i_unit = $row_detail['transaction_detail_unit'];
					$i_item_id = $row_detail['item_id'];
					$i_qty = $row_detail['transaction_detail_qty_real'];
					update_stock($row_detail['item_id'],$i_qty,$branch_id);

					$q_widget_detail_tmp = select_config('widget_tmp_details', $where_item_id);
					while ($r_widget_detail_tmp = mysql_fetch_array($q_widget_detail_tmp)) {
						$keterangan_item = $r_widget_detail_tmp['keterangan_item'];
						$data_transaction_details_item = "'',
																							'$transaction_id_new',
																							'$transaction_detail_id',
																							'$i_item_id',
																							'$keterangan_item'";
						create_config('transaction_details_item', $data_transaction_details_item);
						$where_keterangan_item = "item_keterangan_details_id = '$keterangan_item'";
						$data_status = "status = '1'";
						update_config2('item_keterangan_details', $data_status, $where_keterangan_item);
					}
		}
		delete_tmp($i_transaction_id);
		delete_widget_tmp_details($i_transaction_id);
		delete_widget_tmp($i_transaction_id);
		unset($_SESSION['member_id']);
		unset($_SESSION['branch_id_1']);
		unset($_SESSION['tanggal']);
		unset($_SESSION['partner_id']);
		header("location: print.php?page=perjanjian_kredit&id=$transaction_id_new");
		break;

		case 'validasi_item':
			$transaction_id = $_POST['id'];
			$query = select_validasi_transaction($transaction_id);
			$row = mysql_fetch_array($query);
			$data = array('jml' => $row['jml'],
										'pcs' => $row['transaction_detail_qty']);
			echo json_encode($data);
			break;

	case 'btn_add_pembeli_cash':
		$transaction_id = $_GET['id'];
		$action = "transaction_new.php?page=save_pembeli_cash";
		include '../views/transaction_new/popmodal_tambah_pembeli_cash.php';
		break;

	case 'save_pembeli_cash':
		$i_name = $_POST['i_name'];
		$transaction_id = $_POST['transaction_id'];
		$i_nik = $_POST['i_nik'];
		$i_alamat = $_POST['i_alamat'];
		$i_phone = $_POST['i_phone'];

		$data = "'',
						'$i_name',
						'$i_phone',
						'',
						'$i_alamat',
						'',
						'$i_nik',
						'',
						'',
						'',
						'',
						'',
						'',
						'',
						'',
						'',
						'',
						'',
						'',
						'',
						'',
						'',
						''";
		create_config('members', $data);
		$member_id = mysql_insert_id();
		$_SESSION['member_id'] = $member_id;
		header("Location:transaction_new.php?page=list&transaction_id=$transaction_id");
		break;
}

?>
