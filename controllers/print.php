<?php
include '../lib/config.php';
include '../lib/function.php';
include '../models/print_model.php';
$page = null;
$page = (isset($_GET['page'])) ? $_GET['page'] : "list";
$title = ucwords("Pembayaran");

$_SESSION['table_active'] = 1;
$q_office = select_office();
$r_office = mysql_fetch_array($q_office);
$user_name = get_user_name($_SESSION['user_id']);
switch ($page) {
	case 'list':
	$transaction_id = get_isset($_GET['transaction_id']);
	$branch_id = get_isset($_GET['branch_id']);

	$q_office= select_office();
	$r_office = mysql_fetch_array($q_office);

	$q_member = select_member($transaction_id);
	$r_member = mysql_fetch_array($q_member);

	$query = select($transaction_id);
	$r_invoice = mysql_fetch_array($query);

	$query_item = select_item($transaction_id);
	$r_name = get_branch_name($branch_id);

	$where_transaction_id = "where transaction_id = '$transaction_id'";
	$q_kredit = select_config('kredit', $where_transaction_id);
	$r_kredit = mysql_fetch_array($q_kredit);

	$uang_muka = '';
	$uang_sisa = '';
	$uang_sisa = '';

	$potongan_diskon_persen = $r_invoice['total_discount_persen'];
	$print_tipe = $_GET['print_tipe'];
		include '../views/print/list.php';
	break;

	case 'bydate':
	$date 	= explode("-", $_GET["date"]);
	$date1 	= $date[0];
	$date2 	= $date[1];
	$date1 	= str_replace("/","-", $date1);
	$date2 	= str_replace("/","-", $date2);
	$query 	= selectbydate($date1, $date2);
	// var_dump($date);
	include '../views/print/listreport.php';
	break;

	case 'excelreport':
	$date 	= explode("-", $_GET["date"]);
	$date1 	= $date[0];
	$date2 	= $date[1];
	$date1 	= str_replace("/","-", $date1);
	$date2 	= str_replace("/","-", $date2);
	$query 	= selectbydate($date1, $date2);
	include '../views/print/exceldownload.php';
	break;

	case 'excelreportmenu':
	$date 	= explode("-", $_GET["date"]);
	$date1 	= $date[0];
	$date2 	= $date[1];
	$date1 	= str_replace("/","-", $date1);
	$date2 	= str_replace("/","-", $date2);
	$query 	= selectitembydate($date1, $date2);
	include '../views/print/excelmenudownload.php';
	break;

	case 'print_purchase':
	$purchases_id = get_isset($_GET['id']);
	$query = select_purchases($purchases_id);
	$r_purchases = mysql_fetch_array($query);
	$query_tot = select_purchases_tot($purchases_id);
	$r_purchases_t = mysql_fetch_array($query_tot);
	$q_purchases_supplier = select_purchases_supplier($purchases_id);
  $r_purchases_supplier = mysql_fetch_array($q_purchases_supplier);
	$q_hutang = select_hutang($purchases_id);
	$r_hutang = mysql_fetch_array($q_hutang);
	include '../views/print/list_purchases.php';
	break;

	case 'print_retur_penjualan':
	$retur_id = get_isset($_GET['retur_id']);
	$i_transaction_id = get_isset($_GET['transaction_id']);
	// var_dump($retur_id);
	$q_retur = select_retur_penjualan($i_transaction_id);
	$r_retur_penjualan = mysql_fetch_array($q_retur);
	$query_detail = select_retur_detail($i_transaction_id);
	$q_member = select_member_retur($i_transaction_id);
	$r_member = mysql_fetch_array($q_member);
	include '../views/print/retur_print.php';
	break;

	case 'print_retur_pembelian':
	$retur_id = get_isset($_GET['retur_id']);
	$purchase_id = get_isset($_GET['purchase_id']);
	$q_retur_pembelian = select_retur_pembelian($purchase_id);
	$r_retur_pembelian = mysql_fetch_array($q_retur_pembelian);
	$query_detail = select_retur_pembelian_detail($retur_id);
	$q_supplier = select_supplier_retur($purchase_id);
	$r_supplier = mysql_fetch_array($q_supplier);
	include '../views/print/retur_print_pembelian.php';
	break;

	case 'print_gudang':
		$id_mutasi = get_isset($_GET['mutasi_id']);
		$q_mutasi = get_mutasi($id_mutasi);
		$q_mutasi_details = get_mutasi_details($id_mutasi);
		$q_mutasi2 = get_mutasi($id_mutasi);
		$row=mysql_fetch_array($q_mutasi2);
		if($row['kirim_status']==2){
			$gudang_asal=$row['gudang_asal'];
			$gudang_tujuan=$row['tujuan'];
			$q_gudang_asal = get_gudang($gudang_asal);
			$q_gudang_tujuan = get_gudang($gudang_tujuan);
		}else {
			$gudang_asal=$row['gudang_asal'];
			$tujuan=$row['tujuan'];
			$q_gudang_asal = get_gudang($gudang_asal);
			$q_cabang_tujuan = get_cabang($tujuan);
		}
		include '../views/print/print_gudang.php';
		break;

		case 'print_struk':
		$transaction_id = get_isset($_GET['transaction_id']);
		$q_member = select_member($transaction_id);
		$r_member = mysql_fetch_array($q_member);
		$query = select($transaction_id);
		$r_invoice = mysql_fetch_array($query);
		$query_item = select_item($transaction_id);
		include '../views/print/print_struk.php';
			break;

		case 'perjanjian_kredit':

			$transaction_id = $_GET['id'];
			$where_transaction_id = "WHERE transaction_id = '$transaction_id'";
			$transaction_date = select_config_by('transactions', 'transaction_date', $where_transaction_id);
			$user_id = select_config_by('transactions', 'user_id', $where_transaction_id);
			$transaction_code = select_config_by('transactions', 'transaction_code', $where_transaction_id);
			$branch_id = select_config_by('transactions', 'branch_id', $where_transaction_id);
			$member_id =	select_config_by('transactions', 'member_id', $where_transaction_id);
			$item_id = select_config_by('transaction_details', 'item_id', $where_transaction_id);
			$partner_id = select_config_by('transactions', 'partner_id', $where_transaction_id);

			$where_partner_id = "WHERE partner_id = '$partner_id'";
			$partner_name = select_config_by('partners', 'partner_name', $where_partner_id);

			$hari_ini = get_nama_hari($transaction_date);
			$bulan_ini = get_nama_bulan($transaction_date);
			$tahun_ini = get_tahun($transaction_date);

			$where_user = "WHERE user_id = '$user_id'";
			$user_name = select_config_by('users', 'user_name', $where_user);
			$user_type_id = select_config_by('users', 'user_type_id', $where_user);

			$where_user_type = "WHERE user_type_id = '$user_type_id'";
			$user_type_name = select_config_by('user_types', 'user_type_name', $where_user_type);

			$q_kredit = select_config('kredit', $where_transaction_id);
			$r_kredit = mysql_fetch_array($q_kredit);

			$periode_id = $r_kredit['periode'];
			$where_periode_id = "WHERE periode_id = '$periode_id'";
			$periode_name = select_config_by('periode', 'periode_name', $where_periode_id);

			$where_jenis_denda = "WHERE jenis_denda = '$periode_id'";
			$denda = select_config_by('denda', 'denda_nominal', $where_jenis_denda);

			$q_member = select_member_detail($member_id);
			$r_member = mysql_fetch_array($q_member);
			$q_item = select_item_detail($item_id);
			$r_item = mysql_fetch_array($q_item);


			include '../views/print/print_perjanjian_kredit.php';
			break;

	case 'print_angsuran_piutang':

		$kredit_id = $_GET['id'];
		$angsuran_kredit_details_code = $_GET['angsuran_kredit_details_code'];
		$where_kredit_id = "WHERE kredit_id = '$kredit_id'";
		$q_kredit = select_config('kredit', $where_kredit_id);
		$r_kredit = mysql_fetch_array($q_kredit);

		$angsuran_kredit_id = select_config_by('angsuran_kredit', 'angsuran_kredit_id', $where_kredit_id);
		$q_angsuran_kredit = select_angsuran_kredit($kredit_id, $angsuran_kredit_details_code);
		$r_angsuran_kredit = mysql_fetch_array($q_angsuran_kredit);

		$where_kredit_code = "WHERE angsuran_kredit_details_code = '$angsuran_kredit_details_code'";
		$q_angsuran = select_config('angsuran_kredit_details', $where_kredit_code);

		$transaction_id = select_config_by('angsuran_kredit', 'transaction_id', $where_kredit_id);
		$where_transaction_id = "WHERE transaction_id = '$transaction_id'";
		$transaction_detail_id = select_config_by('transaction_details', 'transaction_detail_id', $where_transaction_id);
		$q_transaction_details_item = select_transaction_details_item($transaction_detail_id);
		$r_transaction_details_item = mysql_fetch_array($q_transaction_details_item);

		$where = "WHERE payment_method_id = '".$r_angsuran_kredit['cara_bayar_angsuran']."'";
		$q_payment_method = select_config('payment_methods', $where);
		$r_payment_method = mysql_fetch_array($q_payment_method);
		$where_bank_id = "WHERE bank_id = '".$r_angsuran_kredit['bank_id_to']."'";
		$q_bank = select_config('banks', $where_bank_id);
		$r_bank = mysql_fetch_array($q_bank);

		$get_count_angsuran = get_count_yang_sudah_diangsur($angsuran_kredit_id);

		$lama_angsuran = select_config_by('kredit', 'lama_angsuran', $where_kredit_id);
		$sisa_lama_angsuran = $lama_angsuran - $get_count_angsuran;
		$q_kredit_ = select_config('kredit', $where_kredit_id);
		$r_kredit_ = mysql_fetch_array($q_kredit_);

		$total_yang_sudah_dibayar = total_yang_sudah_dibayar($kredit_id);

		$total_pembiayaan = $r_kredit_['angsuran_per_bulan']*$lama_angsuran;
		$sisa_kredit = $total_pembiayaan-$total_yang_sudah_dibayar;
		// echo $total_pembiayaan;


		$row_span = 4;
		include '../views/print/list_angsuranpiutang.php';
		break;

		case 'print_buku_angsuran':
	    $transaction_id = $_GET['transaction_id'];
	    $member_id = $_GET['member_id'];
			$where_member_id = "WHERE member_id = '$member_id'";
			$r_member = select_object_config('members', $where_member_id);
			$where_transaction_id =  "WHERE transaction_id = '$transaction_id'";
			$kredit_id = select_config_by('kredit','kredit_id',$where_transaction_id);

			$where =  "WHERE kredit_id = '$kredit_id'";
	    $item_id = select_config_by('kredit','item_id',$where);
	    $member_id = select_config_by('kredit','member_id',$where);
	    $transaction_id = select_config_by('kredit','transaction_id',$where);
	    $where_item_id =  "WHERE item_id = '$item_id'";
	    $item_name = select_config_by('items','item_name',$where_item_id);
	    $item_gambar = select_config_by('items','stock_img',$where_item_id);
	    $q_item_kredit = select_trans_kredit($kredit_id);
	    $r_item_kredit = mysql_fetch_array($q_item_kredit);

	    $periode = $r_item_kredit['periode'];
	    $where_periode = "WHERE periode_id = '$periode'";
	    $periode_name = select_config_by('periode', 'periode_name', $where_periode);

	    $q_piutang_pembeli_detail = select_piutang_pembeli_detail($kredit_id);

	    $where_angsuran_kredit_id = "WHERE kredit_id = '$kredit_id'";
	    $angsuran_kredit_id = select_config_by('angsuran_kredit', 'angsuran_kredit_id', $where_angsuran_kredit_id);

			$transaction_date = select_config_by('transactions', 'transaction_date', $where_transaction_id);
			$user_id = select_config_by('transactions', 'user_id', $where_transaction_id);

			$where_user_id = "WHERE user_id = '".$_SESSION['user_id']."'";
			$user_name = select_config_by('users', 'user_name', $where_user_id);


	    $where_telah_diangsur = "WHERE angsuran_kredit_id = '$angsuran_kredit_id'";
	    $telah_diangsur = select_config_by('angsuran_kredit_details', 'COUNT(*)', $where_telah_diangsur);

			// $transaction_detail_id = select_config_by('transaction_details', 'transaction_detail_id', $where_transaction_id);
			// $q_transaction_details_item = select_transaction_details_item($transaction_detail_id);
			// $r_transaction_details_item = mysql_fetch_array($q_transaction_details_item);
			//
			// $r_transaction_details_item['item_keterangan_details'];
			// echo $r_transaction_details_item['item_keterangan_details'];

			$hari_ini = get_nama_hari($transaction_date);
			$bulan_ini = get_nama_bulan($transaction_date);
			$tahun_ini = get_tahun($transaction_date);

			$transaction_date_akhir = explode("-", $transaction_date);
			$tahun_akhir = $transaction_date_akhir[0];
			$bulan_akhir = $transaction_date_akhir[1]+$r_item_kredit['lama'];
			$hari_akhir = $transaction_date_akhir[2]+$r_item_kredit['lama'];

			$transaction_date_akhir = $tahun_ini.'-'.$bulan_akhir.'-'.$hari_akhir;
			// echo $transaction_date_akhir;

			$bulan_akhir = get_nama_bulan($transaction_date_akhir);
			$where_item_id = "WHERE item_id = '$item_id' AND transaction_id = '$transaction_id'";
			$q_item_keterangan_details = select_config('transaction_details_item' ,$where_item_id);
			while ($r_item_keterangan_details = mysql_fetch_array($q_item_keterangan_details)) {
							$keterangan_item = $r_item_keterangan_details['keterangan_item'];
							$where_keterangan_item = "WHERE item_keterangan_details_id = '$keterangan_item'";
							$item_keterangan_details_id = select_config_by('item_keterangan_details', 'keterangan_details', $where_keterangan_item);
							}

			include '../views/print/print_buku_angsuran.php';

	    break;
}

?>
