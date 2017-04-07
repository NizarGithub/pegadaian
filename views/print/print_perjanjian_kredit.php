<?php
require('../lib/fpdf/fpdf.php');

class PDF extends FPDF
{
	//Page header
	function Header()
	{
		//Logo
		$this->Image('../img/twiin.jpg','55',8,100,"","","home.php");
		//pindah ke posisi ke tengah untuk membuat judul
		$this->Cell(80);
		//pindah baris
		$this->Ln(14);
		//buat garis horisontal
	}

	//Page footer
	function Footer()
	{
		//atur posisi 1.5 cm dari bawah
		$this->SetY(-25);
		//buat garis horizontal
		$this->Line(0,$this->GetY(),0,$this->GetY());
		//Arial italic 9
		$this->SetFont('Times', '', 9);

		$this->Image('../img/footertwin.jpg','5','300',100,20,"","home.php");
		// $pdf->Image("../img/white.png",50,250,100,0,"","home.php");
		$this->Cell(0,20);
		$this->Cell(0,20,'JL. SUROJENGGOLO NO. 66 WATES KEDUNG PRING',0,0,'R');
		$this->Cell(0,28,'BALONG PANGGANG GRESIK',0,0,'R');
		$this->Cell(0,36,'TLP : 031 79260972 ',0,0,'R');
		// BALONG PANGGANG – GRESIK
	}

}



$pdf = new PDF('P','mm',array(210,330));
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetFont('Times','',12);

$x = $pdf->GetX();
$y = $pdf->GetY();
$pdf->SetXY($x+150,$y+5);
$pdf->SetFont('Times','',10);
$pdf->Cell(15, 5, 'NOMOR  : 2in1 / '.$transaction_code, 0, 'L');
$pdf->SetXY(0,$y+10);
$pdf->SetFont('Times','',14);
$pdf->Cell(210, 5, 'SURAT PERJANJIAN SEWA BELI', 0, 0, 'C');
$pdf->SetXY(0,$y+20);
$pdf->SetFont('Times','',12);
$pdf->MultiCell(200, 5, 'Pada hari ini, '.$hari_ini.' Tanggal '.get_tanggal_saja($transaction_date).' Bulan '.$bulan_ini.' Tahun '.$tahun_ini.' Kami yang bertanda tangan di bawah ini',0,'L');
$pdf->SetXY(0,$y+28);
$pdf->Cell(0, 5, 'Nama', 0, 0, 'L');;
$pdf->SetX(60);
$pdf->Cell(0, 5, ': '.$r_office['office_owner'], 0, 0, 'L');
$pdf->SetXY(0, $y+33);
$pdf->Cell(0, 5, 'Jabatan', 0, 0, 'L');;
$pdf->SetX(60);
$pdf->Cell(0, 5, ': DIREKTUR ', 0, 0, 'L');
$pdf->SetXY(0, $y+38);
$pdf->Cell(0, 5, 'Alamat', 0, 0, 'L');;
$pdf->SetX(60);
$pdf->Cell(0, 5, ': '.$r_office['office_owner_address'], 0, 0, 'L');
$pdf->SetXY(0, $y+43);
$pdf->Cell(0, 5, 'Telepon', 0, 0, 'L');;
$pdf->SetX(60);
$pdf->Cell(0, 5, ': '.$r_office['office_owner_phone'], 0, 0, 'L');
$pdf->SetXY(0, $y+50);

$pdf->MultiCell(200, 5, 'Dalam hal ini bertindak untuk dan atas nama Two in One by PT. Tiana Group yang selanjutnya disebut PIHAK PERTAMA : ',0,'L');
$pdf->SetXY(0,$y+63);
// $pdf->SetX(5);
$pdf->Cell(0, 5, 'Nama', 0, 0, 'L');;
$pdf->SetX(60);
$pdf->Cell(0, 5, ': '.$r_member['member_name'], 0, 0, 'L');
$pdf->SetXY(0, $y+68);
$ttl = $r_member['tempat_lahir'].', '. format_date_only($r_member['tanggal_lahir']);
$pdf->Cell(0, 5, 'Tempat, Tanggal Lahir', 0, 0, 'L');;
$pdf->SetX(60);
$pdf->Cell(0, 5, ': '.$ttl, 0, 0, 'L');
$pdf->SetXY(0, $y+72);
$pdf->Cell(0, 5, 'Alamat', 0, 0, 'L');;
$pdf->SetX(60);
$pdf->Cell(0, 5, ': '.$r_member['member_alamat'], 0, 0, 'L');
$pdf->SetXY(0, $y+76);
$pdf->Cell(0, 5, 'Pekerjaan', 0, 0, 'L');;
$pdf->SetX(60);
$pdf->Cell(0, 5, ': '.$r_member['jenis_pekerjaan'], 0, 0, 'L');
$pdf->SetXY(0, $y+80);
$pdf->Cell(0, 5, 'Nik', 0, 0, 'L');;
$pdf->SetX(60);
$pdf->Cell(0, 5, ': '.$r_member['member_nik'], 0, 0, 'L');
$pdf->SetXY(0, $y+84);
$pdf->Cell(0, 5, 'Telepon', 0, 0, 'L');;
$pdf->SetX(60);
$pdf->Cell(0, 5, ': '.$r_member['member_phone'], 0, 0, 'L');

$pdf->SetXY(0, $y+90);
$pdf->MultiCell(200, 5, 'Bahwa pihak pertama dengan ini menjual dan menyerahkan kepada PIHAK KEDUA, dan PIHAK KEDUA sepakat membeli dan menerima penyerahan dari PIHAK PERTAMA berupa : ',0,'L');
$pdf->SetXY(0,$y+105);
$pdf->Cell(0, 5, 'Jenis Barang', 0, 0, 'L');;
$pdf->SetX(60);
$pdf->Cell(0, 5, ': '.$r_item['kategori_name'], 0, 0, 'L');
$pdf->SetXY(0, $y+110);
$pdf->Cell(0, 5, 'Merk', 0, 0, 'L');;
$pdf->SetX(60);
$pdf->Cell(0, 5, ': '.$r_item['item_merk'], 0, 0, 'L');
$pdf->SetXY(0, $y+115);
$pdf->Cell(0, 5, 'Tipe', 0, 0, 'L');;
$pdf->SetX(60);
$pdf->Cell(0, 5, ': '.$r_item['item_tipe'], 0, 0, 'L');

$where_item_id = "WHERE item_id = '".$r_item['item_id']."' AND transaction_id = '$transaction_id'";
$q_item_keterangan_details = select_config('transaction_details_item' ,$where_item_id);
while ($r_item_keterangan_details = mysql_fetch_array($q_item_keterangan_details)) {
				$keterangan_item = $r_item_keterangan_details['keterangan_item'];
				$where_keterangan_item = "WHERE item_keterangan_details_id = '$keterangan_item'";
				$item_keterangan_details_id = select_config_by('item_keterangan_details', 'keterangan_details', $where_keterangan_item);
				}
$pdf->SetXY(0, $y+120);
$pdf->Cell(0, 5, 'No. Seri', 0, 0, 'L');;
$pdf->SetX(60);
$pdf->Cell(0, 5, ': '.$item_keterangan_details_id, 0, 0, 'L');

$pdf->SetXY(0, $y+128);
$pdf->MultiCell(200, 5, 'Dalam hal ini bertindak untuk dan atas namanya sendiri, yang selanjutnya disebut sebagai PIHAK KEDUA Para Pihak menerangkan terlebih dahulu hal-hal sebagai berikut : ',0,'J');

$pdf->SetXY(0, $y+140);
$pdf->Cell(210, 5, 'Pasal 1', 0, 0, 'C');
$pdf->SetXY(0, $y+145);
$pdf->MultiCell(200, 5, 'Harga Barang tersebut disepakati oleh kedua belah pihak sebesar Rp.'.format_rupiah($r_item['harga_item']).',00'.' ('.terbilang($r_item['harga_item']).')',0,'J');

$pdf->SetXY(0, $y+150);
$pdf->Cell(105, 5, 'Pasal 2', 0, 0, 'C');
$pdf->Cell(105, 5, 'Pasal 3', 0, 0, 'C');
$pdf->SetXY(0, $y+155);
$pdf->MultiCell(100, 5, 'PIHAK PERTAMA menyerahkan barang tersebut kepada PIHAK KEDUA pada saat serah terima dan telah terjadi kesepakatan kedua belah pihak ', 0, 'J');

$pdf->SetXY(105, $y+155);
$pdf->MultiCell(100, 5, 'Jangka waktu pembayaran disepakati oleh kedua belah pihak selama bulan terhitung sejak di tandatangani Perjanjian ini.', 0, 'J');

$pdf->SetXY(0, $y+163);
$pdf->Cell(210, 20, 'Pasal 4', 0, 0, 'C');
$pdf->SetXY(0, $y+175);
$pdf->MultiCell(210, 5, 'PIHAK KEDUA menyetujui melakukan pembayaran dengan cara-cara berikut ini : ', 0, 'L');
$pdf->SetXY(0, $y+180);
$pdf->Cell(0, 5, 'a.', 0, 0, 'L');
$pdf->SetXY(10,$y+180);
$pdf->MultiCell(210, 5, 'PIHAK KEDUA membayar uang muka sebesar Rp. '.format_rupiah($r_kredit['uang_muka_barang']).',00', 0, 'L');
$pdf->SetXY(0, $y+185);
$pdf->Cell(0, 5, 'b.', 0, 0, 'L');
$pdf->SetXY(10, $y+185);
$pdf->MultiCell(200, 5, 'Pembayaran harus diangsur oleh PIHAK KEDUA selama '.$r_item['lama_angsuran'].' '.$periode_name.' sejak penyerahan Barang yang besarnya Rp. '.format_rupiah($r_item['angsuran_per_bulan']).',00'.' / '.$periode_name, 0, 'J');
//
$pdf->SetXY(0, $y+185);
$pdf->Cell(210, 20, 'Pasal 5', 0, 0, 'C');
$pdf->SetXY(0, $y+198);
$pdf->MultiCell(200, 5, 'PIHAK PERTAMA akan memberikan kuitansi untuk setiap angsuran, dan pembayaran angsuran tersebut dianggap sah apabila PIHAK KEDUA telah menerima bukti kwitansi resmi dengan dibubuhi tanda tangan PIHAK PERTAMA dan stampel resmi perusahaan. Contoh dan bukti kwitansi resmi adalah sama dengan kuitansi uang muka yang dicap resmi.', 0, 'J');

$pdf->SetXY(0, $y+212);
$pdf->Cell(200, 20, 'Pasal 6', 0, 0, 'C');
$pdf->SetXY(0,$y+225);
$pdf->MultiCell(200, 5, 'PIHAK KEDUA tidak diperbolehkan memindahtangankan, mengoperkan, menjual, menggadaikan dan/atau melakukan perbuatan-perbuatan lain yang bertujuan untuk menguntungkan diri sendiri maupun orang lain dengan cara memindah tangankan kepemilikan barang milik PIHAK PERTAMA tersebut sebelum angsuran dibayar lunas.', 0, 'J');

$pdf->SetXY(0, $y+305);
$pdf->Cell(100, 20, 'Pasal 7', 0, 0, 'C');
$pdf->SetXY(0, $y+13);
$pdf->Cell(0, 5, 'a.', 0, 0, 'L');
$pdf->SetXY(5,$y+13);
$pdf->MultiCell(95, 5, 'Selama Barang tersebut belum dibayar lunas, maka Barang tersebut masih milik PIHAK PERTAMA. Dan, PIHAK PERTAMA sewaktu-waktu dapat mengecek keadaan barang tersebut, karena status barang tersebut masih merupakan titipan PIHAK PERTAMA di alamat PIHAK KEDUA.', 0, 'J');

$pdf->SetXY(0, $y+42);
$pdf->Cell(0, 5, 'b.', 0, 0, 'L');
$pdf->SetXY(5,$y+42);
$pdf->MultiCell(95, 5, 'Apabila PIHAK KEDUA telah melunasi semua pembayaran angsuran Barang tersebut, maka PIHAK PERTAMA akan menyerahkan hak kepemilikan barang tersebut kepada PIHAKKEDUA dalam bentuk Surat Tanda Bukti Lunas (STBL).', 0, 'J');
//
$pdf->SetXY(0,$y+67);
$pdf->Cell(5, 5, 'c.', 0, 0, 'L');
$pdf->SetXY(5,$y+67);
$pdf->MultiCell(95, 5, 'Jika barang tersebut dibeli secara diangsur maka keterlambatan angsuran akan di kenakan biaya sebesar 0,5 % dari biaya angsuran tersebut sesuai dengan jumlah angsuran yang harus di bayar oleh PIHAK KEDUA dan denda keterlambatan ini dihitung per-hari sejak jatuh tempo pembayaran berlangsung', 0, 'J');

$pdf->SetXY(100, 40);
$pdf->Cell(5, 5, 'd.', 0, 0, 'L');
$pdf->SetXY(105, 40);
$pdf->MultiCell(100, 5, 'TWO IN ONE tidak menerima perbaikan atau garansi atas kerusakan barang tersebut karena disengaja atau tidak disengaja dari PIHAK KEDUA.', 0, 'J');

$pdf->SetXY(100, 55);
$pdf->Cell(5, 5, 'e.', 0, 0, 'L');
$pdf->SetXY(105, 55);
$pdf->MultiCell(100, 5, 'Apabila barang dimaksud telah diserahkan dan/atau telah dipergunakan oleh PIHAK KEDUA, maka jika terjadi kerusakan Barang baik yang disengaja maupun tidak disengaja, PIHAK KEDUA hanya bisa mengklaim di garansi resmi barang tersebut.', 0, 'J');

$pdf->SetXY(100, 80);
$pdf->Cell(5, 5, 'f.', 0, 0, 'L');
$pdf->SetXY(105, 80);
$pdf->MultiCell(100, 5, 'Apabila terjadi kerusakan akibat dari kelalaian PIHAK KEDUA dan masa angsuran tersebut belum lunas, maka PIHAK KEDUA wajib melunasi angsuran tersebut, serta untuk menjamin kepastian terpenuhinya hak PIHAK PERTAMA maka PIHAK KEDUA wajib memberikan jaminan kepada PIHAK PERTAMA yang dapat berupa barang berharga dan/atau surat beharga.', 0, 'J');

$pdf->SetXY(0, 115);
$pdf->Cell(210, 20, 'Pasal 8', 0, 0, 'C');
$pdf->SetXY(0, 130);
$pdf->MultiCell(210, 5, 'Selama Barang tersebut belum dibayar lunas, maka Barang tersebut masih milik PIHAK PERTAMA. Dan, PIHAK PERTAMA sewaktu-waktu dapat mengecek keadaan barang tersebut, karena status barang tersebut masih merupakan titipan PIHAK PERTAMA di alamat PIHAK KEDUA.', 0, 'J');
//
$pdf->SetXY(0, 135);
$pdf->Cell(210, 20, 'Pasal 9', 0, 0, 'C');
$pdf->SetXY(0, 150);
$pdf->MultiCell(210, 5, 'Selama Barang tersebut belum dibayar lunas, maka Barang tersebut masih milik PIHAK PERTAMA. Dan, PIHAK PERTAMA sewaktu-waktu dapat mengecek keadaan barang tersebut, karena status barang tersebut masih merupakan titipan PIHAK PERTAMA di alamat PIHAK KEDUA.', 0, 'J');
//
$pdf->SetXY(0, 160);
$pdf->Cell(210, 20, 'Pasal 10', 0, 0, 'C');
$pdf->SetXY(0, 175);
$pdf->MultiCell(210, 5, 'Apabila terjadi perselisihan dari Perjanjian ini akan diselesaikan dengan jalan musyawarah, dan apabila tidak terjadi kesepakatan antara kedua belah pihak dalam musyawarah, maka kedua belah pihak sepakat untuk menyelesaikan dengan jalur hokum dengan mengambil tempat tinggal (domisili) yang umum dan tetap di Kantor Pengadilan Negeri. Demikianlah Perjanjian ini dibuat dan ditandatangani padahari, tanggal, bulan, tahun seperti yang disebutkan dalam awal Perjanjian ini, dibuat rangkap 2 dan bermeterai cukup yang berkekuatan hukum yang sama untuk masing masing pihak.', 0, 'J');

$pdf->SetXY(5, 205);
$pdf->Cell(90, 20, 'Pihak Kedua', 0, 0, 'C');
$pdf->SetXY(5, 240);
$pdf->Cell(90, 20, $r_member['member_name'] ? $r_member['member_name'] : ".................", 0, 0, 'C');

$pdf->SetXY(100, 200);
$pdf->Cell(90, 20, 'Gresik, '.format_date_only(new_date()), 0, 0, 'C');
$pdf->SetXY(100, 205);
$pdf->Cell(90, 20, 'Pihak Pertama', 0, 0, 'C');
$pdf->SetXY(100, 210);
$pdf->Cell(90, 20, $r_office['office_name'], 0, 0, 'C');
$pdf->SetXY(100, 240);
$pdf->Cell(90, 20, $r_office['office_owner'], 0, 0, 'C');

// $pdf->SetXY(5, 185);
// $pdf->Cell(210, 20, 'Penjamin', 0, 0, 'C');
// $pdf->SetXY(5, 190);
// $pdf->Cell(210, 20, 'Pihak Kedua', 0, 0, 'C');
// $pdf->SetXY(5, 220);
// $pdf->Cell(210, 20, $partner_name ? $partner_name : ".................", 0, 0, 'C');


$pdf->Output();

 ?>
