<?php
require_once '../lib/dompdf/autoload.inc.php';
use Dompdf\Dompdf;
use Dompdf\Options;
$dompdf = new Dompdf();

$html= '
<html>
<title>FAKTUR PEMBELIAN</title>
<head>
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="../css/print/print.css" rel="stylesheet">
</head>';
$html .='
	<center>
		<table style="width:100%; font-size:8pt; font-family:calibri; border-collapse: collapse;" border = "0">
			<tr>
				<td width="30%"" align="left" style="padding-right:80px; vertical-align:top">
					<span class="header">
						<b>FAKTUR PEMBELIAN
							<br>
							 '.$r_office['office_name'].'
						</b>
					</span>
					<br>
					'.$r_office['office_address'].'
					<br>
					'.$r_office['office_phone'].'
				</td>
				<td style="vertical-align:top;" width="30%" align="left">
					PRINTED DATE&nbsp;&nbsp;: '.$r_purchases['purchases_date'].'<br>
					NO. NOTA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: '.$r_purchases['purchases_code'].'<br>
				</td>
				<td style="vertical-align:top;" width="30%" align="left">
					SUPPLIER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:'.$r_purchases_supplier['supplier_name'].'<br>
					ALAMAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:'.$r_purchases_supplier['supplier_addres'].'<br>
					TELEPON&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:'.$r_purchases_supplier['supplier_phone'].'<br>
				</td>
			</tr>
		</table>
		<table id="lintable" cellspacing="0" style="width:100%; font-size:8pt; font-family:calibri;  border-collapse: collapse;">
			<tr align="center">
				<td width="5%">NO.</td>
				<td>KODE BARANG.</td>
				<td>NAMA BARANG</td>
				<td>JUMLAH</td>
				<td>KETERANGAN BARANG</td>
				<td>HARGA</td>
				<td>SUB TOTAL</td>
	   	</tr>
			<tbody style="border-bottom : 1px solid">';
			$no = 1;
			$total_berat = 0;
			$q_purchase = get_purchase($r_purchases['purchase_id']);
			$purchase_id = $r_purchases['purchase_id'];
			while ($r_purchase = mysql_fetch_array($q_purchase)) {
		$html .='
				<tr>
					<td class="center no-border"  valign="top">'.$no.'</td>
					<td class="center no-border"  valign="top"></td>
					<td class="left no-border"  valign="top">'.$r_purchase['item_name'].'</td>
					<td class="center no-border" valign="top">'.$r_purchase['purchase_qty'].'('.$r_purchase['unit_name'].')</td>';
  $html .='<td class="center no-border" valign="top">';
		$item_id = $r_purchase['item_id'];
		$where_item_id = "WHERE item_id = '$item_id' AND purchase_id = '$purchase_id'";
		$q_item_keterangan_details = select_config('item_keterangan_details' ,$where_item_id);
		while ($r_item_keterangan_details = mysql_fetch_array($q_item_keterangan_details)) {
	$html .= $r_item_keterangan_details['keterangan_details'].'<br>';
		}
		$html .='</td>';
		$sub_total = $r_purchase['purchase_qty']*$r_purchase['purchase_price'];
		$html	.='
					<td class="right no-border"  valign="top">'.format_rupiah($r_purchase['purchase_price']).'</td>
					<td class="right no-border"  valign="top">'.$sub_total.'</td>
				</tr>';
			$no++; }
	$html .='
			</tbody>
				<tr class="right no-border">
					<td class="no-border left" colspan="2">Tipe Pembayaran</td>
					<td class="no-border left"> : '.get_payment_method($r_purchases['payment_method']).'</td>
					<td class="no-border center"></td>
					<td class="no-border"></td>
					<td class="no-border right" colspan = "">
						<div>Total Yang Harus Di Bayar Adalah : </div>
					</td>
					<td> Rp.'.format_rupiah($r_purchases_t['purchase_total']).',00</td>
				</tr>
				<tr class="right no-border">
					<td class="no-border left" colspan="2">Uang Muka</td>
					<td class="no-border left">: Rp.'.format_rupiah($r_hutang['uang_muka']).',00</td>
					<td class="no-border left" colspan="2" rowspan="5">
						Catatan : '.$r_purchases['purchase_desc'].'
					</td>
					<td  class="no-border right" colspan = "">
						<div>Bayar : </div>
					</td>
					<td class="right">
						'.format_rupiah($r_purchases_t['purchase_payment']).'
					</td>
				</tr>
				<tr>
					<td class="no-border left" colspan="2">Sisa</td>
					<td class="no-border left"> : Rp.'.format_rupiah($r_purchases_t['purchase_total'] - $r_hutang['uang_muka']).',00</td>
					<td class="no-border right">
						<div>Kembalian : </div>
					</td>
					<td class="right">
						'.format_rupiah($r_purchases_t['purchase_change']).'
					</td>
				</tr>
				<tr>
					<td class="no-border left" colspan = "2">Tanggal Jatuh Tempo</td>
					<td class="no-border left"> : '.format_date_only($r_hutang['batas_tanggal']).'</td>
					<td class="no-border right"></td>
					<td class="no-border right"></td>
				</tr>
				<tr class="right no-border">
					<td class="no-border left" colspan="2">BANK Supplier</td>
					<td class="no-border left"> : '.get_bank_name($r_purchases['bank_id_to']).'</td>
				</tr>
				<tr class="right no-border">
					<td class="no-border left" colspan="2">No. Rekening</td>
					<td class="no-border left"> :
						'.$r_purchases['bank_account_to'].'
					</td>
				</tr>
			</table>';
$supplier_name = $r_purchases_supplier['supplier_name'] ? $r_purchases_supplier['supplier_name'] : ".................";
$html .='
			<table style="width:100%;padding-top:0;font-size:10px;">
				<tr>
					<td style="text-align:center;width:50%;">
					'.$supplier_name.'
					</td>
					<td style="text-align:center;">'.$user_name.'</td>
				</tr>
			</table>
		</center>
	</body>
</html>';
$dompdf->loadHtml($html);
// (Optional) Setup the paper size and orientation
$dompdf->setPaper('A4', 'landscape');

// Render the HTML as PDF
$dompdf->render();
$dompdf->set_base_path('../css/bootstrap.min.css');
$dompdf->set_base_path('../css/print/print.css');
// Output the generated PDF to Browser
$dompdf->stream("faktur_pembelian");

 ?>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
