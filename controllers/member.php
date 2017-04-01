<?php
include '../lib/config.php';
include '../lib/function.php';
include '../models/member_model.php';
$page = null;
$page = (isset($_GET['page'])) ? $_GET['page'] : "list";
$title = ucwords("DETAIL PEMBELI");

$_SESSION['menu_active'] = 1;
$_SESSION['sub_menu_active'] = 15;
$permit = get_akses_permits($_SESSION['user_type_id'],$_SESSION['sub_menu_active']);
switch ($page) {
	case 'list':
		get_header($title);

		$query = select_pembeli_detail();
		$add_button = "member.php?page=form";

		include '../views/member/list.php';
		get_footer();
	break;

	case 'form':
		get_header();

		$id = (isset($_GET['id'])) ? $_GET['id'] : null;
		$gadai_id = (isset($_GET['gadai_id'])) ? $_GET['gadai_id'] : null;
		if ($gadai_id) {
			$close_button = "stock_gadai.php?page=form&id=$gadai_id";
		} else {
			$close_button = "member.php?page=list";
		}
		$where = "WHERE branch_id = '$s_cabang'";
		$q_tipe_pembeli = select_tipe_pembeli($where);
		if($id != 0){
			$row = read_id($id);
			$where = " where member_id = '$id'";
			$row_2 = select_object_config('members_darurat',$where);
			$row_3 = select_object_config('members_pekerjaan',$where);
			$q_history = select_history_transaksi($id);

			$action = "member.php?page=edit&id=$id";
		} else {
			//inisialisasi
			$row = new stdClass();
			$row_2 = new stdClass();
			$row_3 = new stdClass();

			$row->member_id = false;
			$row->member_name = false;
			$row->member_phone = false;
			$row->member_email = false;
			$row->member_alamat = false;
			$row->member_discount = false;
			$row->member_nik = false;
			$row->kelurahan = false;
			$row->kecamatan = false;
			$row->RT = false;
			$row->RW = false;
			$row->kode_pos = false;
			$row->kota = false;
			$row->nama_ibu = false;
			$row->tempat_lahir = false;
			$row->tanggal_lahir = false;
			$row->status_perkawinan = false;
			$row->jumlah_tanggungan = false;
			$row->telp_rumah = false;
			$row->status_rumah = false;
			$row->lama_tinggal = false;
			$row->pendidikan = false;
			$row->tipe_pembeli = false;

			$row_2->nama_darurat = false;
			$row_2->hubungan = false;
			$row_2->alamat = false;
			$row_2->no_telp = false;

			$row_3->nama_perusahaan = false;
			$row_3->alamat_perusahaan = false;
			$row_3->kode_pos = false;
			$row_3->RT = false;
			$row_3->RW = false;
			$row_3->kelurahan = false;
			$row_3->kecamatan = false;
			$row_3->kota = false;
			$row_3->telp_kantor = false;
			$row_3->jenis_pekerjaan = false;
			$row_3->jabatan = false;
			$row_3->lama_bekerja_tahun = false;
			$row_3->lama_bekerja_bulan = false;
			$row_3->penghasilan = false;
			$row_3->pengeluaran = false;
			$row_3->penghasilan_lain = false;
			$row_3->sumber_penghasilan = false;
			$action = "member.php?page=save";
		}
		include '../views/member/form.php';
		get_footer();
	break;

	case 'save':
	extract($_POST);

	$id = $_GET['id'];

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
	if (!$id) {
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
	} else {
		$where = "member_id = '$id'";
		delete_config('members', $where);
		delete_config('members_darurat', $where);
		delete_config('members_pekerjaan', $where);
		$data = "'$id',
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
										 '$id',
										 '$nama_darurat',
										 '$i_hubungan',
										 '$alamat_darurat',
										 '$telp_darurat'";

		create_config('members_darurat', $data_darurat);
		$data_kerja = "'',
									 '$id',
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
	}
		break;

	case 'delete':
		$id = get_isset($_GET['id']);
		$where = "member_id = '$id'";
		delete_config('members', $where);
		delete_config('members_darurat', $where);
		delete_config('members_pekerjaan', $where);
		unset($_SESSION['member_id']);
		header('Location: member.php?page=list&did=3');

	break;

	case 'select2_get_data':
	$type_item = $_POST['x'];
	$member_id = $_POST['id'];
	$q_type_pembeli2 = select_type_member();
	while ($r_type_pembeli = mysql_fetch_array($q_type_pembeli2)) {
		$data[] = array('type_id_pembeli' => $r_type_pembeli['type_id_pembeli'],
										'type_pembeli_name' => $r_type_pembeli['type_pembeli_name']);
	};
		$q_type_diskon = select_type_diskon2($type_item,$member_id);
			while ($r_type_diskon = mysql_fetch_array($q_type_diskon)) {
				$data2[] = array(
					'type_item' => $r_type_diskon['type_item'],
					'diskon' => $r_type_diskon['diskon']
				);
			}
			echo json_encode(array($data,$data2));
		break;

	case 'history_member_popmodal':
		$transaction_code = $_GET['code'];
		$where_transaction_code = "WHERE transaction_code = '$transaction_code'";
		$q_transaction = select_config('transactions', $where_transaction_code);
		$r_transaction = mysql_fetch_array($q_transaction);
		$transaction_id = select_config_by('transactions', 'transaction_id', $where_transaction_code);
		$where_transaction_id = "WHERE transaction_id = '$transaction_id'";
		$q_transaction_detail = select_transaction_detail($transaction_id);

		$member_id = select_config_by('transactions', 'member_id', $where_transaction_code);
		$where_member_id = "WHERE member_id = '$member_id'";
		$member_name = select_config_by('members', 'member_name', $where_member_id);

		$payment_method_id 	=	select_config_by('transactions', 'payment_method_id', $where_transaction_code);
		$where_payment_method_id 	= "WHERE payment_method_id = '$payment_method_id'";
		$payment_method_name 			= select_config_by('payment_methods','payment_method_name', $where_payment_method_id);

		$where_transaction_id = "WHERE transaction_id = $transaction_id";
		$q_kredit = select_config('kredit' , $where_transaction_id);
		$r_kredit = mysql_fetch_array($q_kredit);

		$kredit_id = select_config_by('kredit', 'kredit_id', $where_transaction_id);
		include '../views/member/history_member_popmodal.php';
		break;

// 8-2-2017
case 'history_member':
	get_header();
	$member_id = $_GET['id'];
	$where_member_id = "WHERE member_id = '$member_id'";
	$member_name = select_config_by('members', 'member_name', $where_member_id);
	$query = select_transactions_and_kredit($member_id);
	include '../views/member/history_member.php';
	get_footer();
	break;

}
?>
