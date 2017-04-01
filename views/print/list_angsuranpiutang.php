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
		$this->Ln(20);
		//buat garis horisontal
	}
}


$pdf = new PDF();
$pdf->AddPage();
$pdf->SetFont('Arial','',8);
$x = $pdf->GetX();
$y = $pdf->GetY()+5;

$pdf->SetXY(0, $y);
$pdf->MultiCell(70, 5, 'ANGSURAN KREDIT', 0, 'C');
$pdf->SetX(0);
$pdf->MultiCell(70, 5, $r_office['office_name'], 0, 'C');
$pdf->SetX(0);
$pdf->MultiCell(70, 5, $r_office['office_address'], 0, 'C');
$pdf->SetXY(70, $y);

$pdf->Cell(35, 5, 'PRINTED DATE', 0, 'L');
$pdf->Cell(5, 5, ':	'.format_date_only($r_angsuran_kredit['angsuran_date']), 0, 'L');
$pdf->SetXY(70, $y+5);
$pdf->Cell(35, 5, 'NO. NOTA ANGSURAN', 0, 'L');
$pdf->Cell(5, 5, ':	'.$r_angsuran_kredit['angsuran_kredit_details_code'], 0, 'L');
$pdf->SetXY(70, $y+10);
$pdf->Cell(35, 5, 'NO. NOTA TRANSAKSI', 0, 'L');
$pdf->Cell(5, 5, ':	'.$r_angsuran_kredit['transaction_code'], 0, 'L');

$pdf->SetXY(140, $y);
$pdf->Cell(20, 5, 'NAMA', 0, 'L');
$pdf->Cell(5, 5, ':	'.$r_angsuran_kredit['member_name'], 0, 'L');
$pdf->SetXY(140, $y+5);
$pdf->Cell(20, 5, 'ALAMAT', 0, 'L');
$pdf->Cell(5, 5, ':	'.$r_angsuran_kredit['member_alamat'], 0, 'L');
$pdf->SetXY(140, $y+10);
$pdf->Cell(20, 5, 'TELEPON', 0, 'L');
$pdf->Cell(5, 5, ':	'.$r_angsuran_kredit['member_phone'], 0, 'L');

$pdf->SetXY(5, $y+20);
$pdf->Cell(30, 5, 'NAMA ITEM', 0, 'L');
$pdf->Cell(5, 5, ':	'.$r_transaction_details_item['item_name'], 0, 'L');
$pdf->SetXY(5, $y+25);
$pdf->Cell(30, 5, 'JUMLAH', 0, 'L');
$pdf->Cell(5, 5, ':	'.$r_transaction_details_item['transaction_detail_qty'].' ( '.$r_transaction_details_item['unit_name'].' ) ', 0, 'L');
$pdf->SetXY(5, $y+30);
$pdf->Cell(30, 5, 'UANG MUKA', 0, 'L');
$pdf->Cell(5, 5, ':	Rp. '.format_rupiah($r_kredit['uang_muka_barang']).',00', 0, 'L');
$pdf->SetXY(5, $y+35);
$pdf->Cell(30, 5, 'JUMLAH ANGSURAN', 0, 'L');
$pdf->Cell(5, 5, ':	Rp. '.format_rupiah($r_kredit['angsuran_per_bulan']).',00', 0, 'L');
$pdf->SetXY(5, $y+40);
$pdf->Cell(30, 5, 'DENDA', 0, 'L');
$pdf->Cell(5, 5, ':	'.$r_angsuran_kredit['denda_persen'].' % ', 0, 'L');
$pdf->SetXY(5, $y+45);
$pdf->Cell(30, 5, 'CARA PEMBAYARAN', 0, 'L');
$pdf->Cell(5, 5, ':	'.$r_payment_method['payment_method_name'], 0, 'L');
$pdf->SetXY(5, $y+50);
$pdf->Cell(30, 5, 'BANK', 0, 'L');
$pdf->Cell(5, 5, ':	'.$r_bank['bank_name'], 0, 'L');
$pdf->SetXY(5, $y+55);
$pdf->Cell(30, 5, 'REKENING', 0, 'L');
$pdf->Cell(5, 5, ':	'.$r_angsuran_kredit['bank_account_id_to'], 0, 'L');

$pdf->SetXY(80, $y+20);
$pdf->Cell(10, 5, 'NO.', 1, 0,'C');
$pdf->Cell(40, 5, 'JUMLAH ANGSURAN', 1, 0, 'C');
$pdf->Cell(20, 5, 'DENDA', 1, 0, 'C');
$pdf->Cell(40, 5, 'TOTAL DENDA', 1, 0, 'C');
$no = 1;
$total_denda = 0;
$total_angsuran = 0;
$hh = 25;
while ($r_angsuran_kredit = mysql_fetch_array($q_angsuran)) {
	$pdf->SetXY(80, $y+$hh);
	$pdf->Cell(10, 5, $no, 1, 0, 'C');
	$pdf->Cell(40, 5, format_rupiah($r_angsuran_kredit['angsuran_nominal']), 1, 0, 'R');
	$pdf->Cell(20, 5, $r_angsuran_kredit['denda_persen'], 1, 0, 'C');
	$pdf->Cell(40, 5, format_rupiah($r_angsuran_kredit['denda_persen_nominal']), 1, 0, 'R');
	$no++;
	$total_denda = $total_denda + $r_angsuran_kredit['denda_persen_nominal'];
	$total_angsuran = $total_angsuran + $r_angsuran_kredit['angsuran_nominal'];
	$hh = $hh + 5;
}
$pdf->SetXY(80, $y+$hh);
$pdf->Cell(70, 5, 'TOTAL ANGSURAN', 0, 0, 'R');
$pdf->Cell(40, 5, format_rupiah($total_angsuran), 0, 0, 'R');
$pdf->SetXY(80, $y+$hh+5);
$pdf->Cell(70, 5, 'TOTAL DENDA', 0, 0, 'R');
$pdf->Cell(40, 5, format_rupiah($total_denda), 0, 0, 'R');

$pdf->SetXY(80, $y+$hh+15);
$get_count_angsuran = $get_count_angsuran-$no+2;
$pdf->Cell(70, 5, 'INI MERUPAKAN ANGSURAN KE - '.$get_count_angsuran, 0, 0, 'R');
$pdf->SetXY(80, $y+$hh+20);
$get_count_angsuran = $get_count_angsuran-$no+2;

$pdf->Cell(70, 5, 'SISA ANGSURAN - '.$sisa_lama_angsuran.' X , TOTAL Rp. '.format_rupiah($sisa_kredit).',00', 0, 0, 'R');
$pdf->Output();
 ?>
