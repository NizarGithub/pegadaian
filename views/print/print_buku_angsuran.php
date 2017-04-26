<?php
require('../lib/fpdf/fpdf.php');

class PDF extends FPDF
{
	//Page header
	function Header()
	{

		$this->Image('../img/office/logo.png','15',8,40,"","","home.php");
		// $this->Image("../img/white.png",50,250,100,0,"","home.php");
    $this->SetFont('Times', '', 22);
    $this->SetXY(65,12);
		$this->Cell(0,20,'PT.TIANA INTERNASIONAL GROUP',0,0,'C');
    $this->SetXY(65,14);
    $this->Line(65,27,200,27);
    $this->SetFont('Times', '', 8);
    $this->SetXY(65,16);
		$this->Cell(0,28,'JL.SUROJENGGOLO NO.66 WATES-KEDUNGPRING-BALONGPANGGANG-GRESIK-61173-TLP: 031 79260972',0,0,'C');
    $this->Line(10,40,200,40);
	}

  function Footer()
	{

    $this->SetFont('times','',7);
    $this->SetXY(30,-10);
    $this->Cell(8,10,'*KARTU ANGSURAN INI HANYA SAH APABILA DI SERTAI DENGAN BUKTI KWITANSI RESMI DARI TP.TIANA INTERNASIONAL GROUP',0,1);
  }

}


$pdf = new PDF();

$y = 10;


$pdf->AddPage();
$pdf->SetFont('times','',12);
$pdf->SetXY(32,30+$y);
$pdf->Cell(40,10,'NAMA',0,1);
$pdf->SetXY(32,38+$y);
$pdf->Cell(40,5,'ALAMAT',0,1);
$pdf->SetXY(32,45+$y);
$pdf->Cell(40,5,'NO.HP',0,1);
$pdf->SetXY(32,52+$y);
$pdf->Cell(40,5,'BARANG',0,1);
$pdf->SetXY(32,59+$y);
$pdf->Cell(40,5,'TERMIN',0,1);
$pdf->SetXY(32,66+$y);
$pdf->Cell(40,5,'JUMLAH',0,1);

$pdf->SetFont('times','',12);
$pdf->SetXY(55,30+$y);
$pdf->Cell(40,10,': '.$r_member->member_name, 0, 1);
$pdf->SetXY(55,38+$y);
$pdf->Cell(40,5,': '.$r_member->member_alamat, 0, 1);
$pdf->SetXY(55,45+$y);
$pdf->Cell(40,5,': '.$r_member->member_phone,0,1);
$pdf->SetXY(55,52+$y);
$pdf->Cell(40,5,': '.$item_name.' '.$item_keterangan_details_id,0,1);
$pdf->SetXY(55,59+$y);
$pdf->Cell(40,5,': '.get_tanggal_saja($transaction_date),0,1);
$pdf->SetXY(70,59+$y);
$pdf->Cell(16,5,'BLN '.$bulan_ini,0,0,'L');
$pdf->SetXY(90,59+$y);
$pdf->Cell(16,5,'sd '.$bulan_akhir,0,0,'L');
$pdf->SetXY(55,66+$y);
$pdf->Cell(40,5,': '.format_rupiah($r_item_kredit['angsuran_per_bulan']),0,1);

$pdf->SetFont('times','',12);
$pdf->SetXY(30,75+$y);
$pdf->Cell(40,10,'BULAN',1,0,'C');
$pdf->Cell(44,10,'BESARNYA CICILAN',1,0,'C');
$pdf->Cell(40,10,'TGL',1,0,'C');
$pdf->Cell(40,10,'PARAF',1,0,'C');

$no = 1;
$row_angsuran = 5;
$berapa_kali = $r_item_kredit['lama'];
for ($i=1; $i <= $berapa_kali; $i++) {

    $bulan = $r_item_kredit['kredit_date'];
    $tanggal = date('m',strtotime($bulan));
    $tahun = date('Y',strtotime($bulan));
    $tahun_angsuran = $tahun;
    $bulan_angsuran = $i + $tanggal;

    if ($bulan_angsuran>12) { $bulan_angsuran = $bulan_angsuran - 12;$tahun_angsuran = 1 + $tahun;}
        $bulan = array('','Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember');

        $bulan_angsuran = $bulan[$bulan_angsuran];
        if ($r_item_kredit['periode']==3) {
          $periode_angsuran = $bulan_angsuran;
        } else {
          $periode_angsuran = 'Minggu ke -'.$i+1;
        }

      $pdf->SetXY(30,80+$y+$row_angsuran);
      $pdf->Cell(40,15,$periode_angsuran,1,0,'C');
      $pdf->Cell(44,15, format_rupiah($r_item_kredit['angsuran_per_bulan']),1,0,'C');
      $pdf->Cell(40,15,'',1,0,'R');
      $pdf->Cell(40,15,'',1,0,'R');
      $row_angsuran = $row_angsuran + 15;
}
//
//
// $pdf->SetXY(30,95);
// $pdf->Cell(40,10,'FEBRUARI',1,0,'C');
// $pdf->Cell(41,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'R');
//
// $pdf->SetXY(30,105);
// $pdf->Cell(40,10,'MARET',1,0,'C');
// $pdf->Cell(41,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'R');
//
// $pdf->SetXY(30,115);
// $pdf->Cell(40,10,'APRIL',1,0,'C');
// $pdf->Cell(41,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'R');
//
// $pdf->SetXY(30,125);
// $pdf->Cell(40,10,'MEI',1,0,'C');
// $pdf->Cell(41,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'R');
//
// $pdf->SetXY(30,135);
// $pdf->Cell(40,10,'JUNI',1,0,'C');
// $pdf->Cell(41,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'R');
//
// $pdf->SetXY(30,145);
// $pdf->Cell(40,10,'JULI',1,0,'C');
// $pdf->Cell(41,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'R');
//
// $pdf->SetXY(30,155);
// $pdf->Cell(40,10,'AGUSTUS',1,0,'C');
// $pdf->Cell(41,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'R');
//
// $pdf->SetXY(30,165);
// $pdf->Cell(40,10,'SEPTEMBER',1,0,'C');
// $pdf->Cell(41,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'R');
//
// $pdf->SetXY(30,175);
// $pdf->Cell(40,10,'OKTOBER',1,0,'C');
// $pdf->Cell(41,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'R');
//
// $pdf->SetXY(30,185);
// $pdf->Cell(40,10,'NOVEMBER',1,0,'C');
// $pdf->Cell(41,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'R');
//
// $pdf->SetXY(30,195);
// $pdf->Cell(40,10,'DESEMBER',1,0,'C');
// $pdf->Cell(41,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'C');
// $pdf->Cell(40,10,'',1,0,'R');
// $pdf->SetFont('times','',15);

$pdf->SetXY(145,-30);
$pdf->Cell(15,5, '( '.$user_name.' )',0, 1, 'L');

$pdf->Output();
?>
