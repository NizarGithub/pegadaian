<?php

function select(){
	$query = mysql_query("select a.*
							from members a
							order by member_id");
	return $query;
}

function select_type_member(){
	$query = mysql_query("select a.*
							from type_pembeli a
							order by type_id_pembeli");
	return $query;
}
function select_type_item($id){
	$query = mysql_query("select a.*
							from items_types a
							WHERE item_type_id = '$id'");
	return $query;
}

function select_type_diskon1212(){
	$query = mysql_query("select a.*
							from items_types a
							order by item_type_id");
	return $query;
}

function select_type_diskon1($member_id){
	$query = mysql_query("SELECT a.*
												FROM items_types a
												JOIN type_diskon_pembeli b ON b.type_item = a.item_type_id
												WHERE b.member_id = '$member_id'
												group by a.item_type_id");
	return $query;
}

function get_type_pembeli(){
  $query = mysql_query("SELECT * FROM type_pembeli");
  return $query;
}
function select_partner(){
	$query = mysql_query("select a.*
							from partners a
							order by partner_id");
	return $query;
}

function select_menu($partner_id){
	$query = mysql_query("select a.*
							from menus a
							where partner_id = '$partner_id'
							order by menu_id");
	return $query;
}

function select_item($id){
	$query = mysql_query("select a.*, b.menu_name
							from member_items a
							join menus b on b.menu_id = a.menu_id
							where member_id = '$id'
							order by member_item_id");
	return $query;
}

function select_member(){
	$query = mysql_query("select * from members order by member_id ");
	return $query;
}


function read_id($id){
	$query = mysql_query("select a.*, b.*, c.* from members a
												LEFT JOIN members_darurat b on b.member_id = a.member_id
												LEFT JOIN members_pekerjaan c on c.member_id = a.member_id
												where a.member_id = '$id'");
	$result = mysql_fetch_object($query);
	return $result;
}


function create($id,$data,$data_update){
	$query = mysql_query("SELECT count(*) as result FROM members WHERE member_id = $id");
	$row = mysql_fetch_array($query);
	if ($row['result'] > 0) {
	mysql_query("update members set ".$data_update." where member_id = '$id'");
	}else {
		mysql_query("insert into members values(".$data.")");
	}
}

function create_item($data){
	mysql_query("insert into member_items values(".$data.")");
}

function update($data, $id){
	mysql_query("update members set ".$data." where member_id = '$id'");
}

function check_exist($member_id, $menu_id){
	$query = mysql_query("select count(member_item_id) as jumlah
							  from member_items
							  where member_id = '".$member_id."' and menu_id = '".$menu_id."'
							  ");
	$row = mysql_fetch_array($query);

	$jumlah = $row['jumlah'];
	return $jumlah;
}

function create_type_pembeli_diskon($data){
  mysql_query("insert into type_diskon_pembeli values(".$data.")");
}

function select_type_diskon2($type_item,$member_id){
	$query = mysql_query("select a.*
							from type_diskon_pembeli a
							WHERE a.member_id = '$member_id' AND a.type_item = '$type_item'");
	return $query;
}
function read_diskon($id,$r_type_pembeli){
  $query=mysql_query("SELECT * from type_diskon_pembeli WHERE type_id_pembeli = $r_type_pembeli AND type_item = $id");
  $result = mysql_fetch_object($query);
  return $result;
}

function get_type_item($id){
		$query=mysql_query("SELECT a.* FROM items_types a
												WHERE a.item_type_id NOT IN
												(SELECT b.type_item FROM type_diskon_pembeli b WHERE b.member_id = '$id')");
		return $query;
}

function get_type_item_new(){
	$query=mysql_query("SELECT * FROM items_types");
	return $query;
}

function update_diskon($data, $member_id, $type_item_id, $type_id_pembeli){
	mysql_query("update type_diskon_pembeli set $data WHERE member_id = '$member_id' AND type_item = '$type_item_id' AND type_id_pembeli = '$type_id_pembeli'");
}

function select_tipe_pembeli($where){
	$query = mysql_query("SELECT * FROM type_pembeli $where");
	return $query;
}

function update_member($id, $u_data_pribadi, $u_data_darurat, $u_data_kerja){
	mysql_query("update members set ".$u_data_pribadi." where member_id = '$id'");
	mysql_query("update members_darurat set ".$u_data_darurat." where member_id = '$id'");
	mysql_query("update members_pekerjaan set ".$u_data_kerja." where member_id = '$id'");
}

function select_history_transaksi($id){
	$query = mysql_query("select a.*, d.user_name from transactions a
												left join transaction_details b on b.transaction_id = a.transaction_id
												left join kredit c on c.transaction_id = a.transaction_id
												left join users d on d.user_id =a.user_id
												where a.member_id = '$id'");
	return $query;
}

function select_transactions_and_kredit($id){
	$query = mysql_query("SELECT a.*, b.*, c.user_name FROM transactions a
												LEFT JOIN kredit b on b.transaction_id = a.transaction_id
												LEFT JOIN users c on c.user_id = a.user_id
												WHERE a.member_id = '$id'");
	return $query;
}

function select_transaction_detail($id){
	$query = mysql_query("SELECT a.* , b.item_name, d.unit_name, f.keterangan_details FROM transaction_details a
												LEFT JOIN items b on b.item_id = a.item_id
												LEFT join kredit c on c.transaction_id = a.transaction_id
												LEFT JOIN units d on d.unit_id = a.transaction_detail_unit
												LEFT JOIN transaction_details_item e on e.transaction_id = a.transaction_id
												LEFT JOIN item_keterangan_details f on f.item_keterangan_details_id = e.keterangan_item
												WHERE a.transaction_id = '$id'
											");
	return $query;
}

function select_pembeli_detail(){
	$query = mysql_query("SELECT a.*, b.jml_telat, c.jenis_pembeli_name, c.jenis_pembeli_color FROM members a
												LEFT JOIN (
													SELECT a.member_id, COUNT(*) AS jml_telat FROM members a
													LEFT JOIN angsuran_kredit b ON b.member_id = a.member_id
													LEFT JOIN angsuran_kredit_details c ON c.angsuran_kredit_id = b.angsuran_kredit_id
													WHERE c.ket = 1
												) AS b ON b.member_id = a.member_id
												LEFT JOIN (
													SELECT a.jenis_pembeli_name, a.jumlah_terlambat_bayar as klasifikasi_jml, a.jenis_pembeli_color
													FROM jenis_pembeli a
												) AS c ON c.klasifikasi_jml <= b.jml_telat");
	return $query;
}
?>
