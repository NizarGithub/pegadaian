<?php
/**
 * PHPExcel
 *
 * Copyright (C) 2006 - 2014 PHPExcel
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * @category   PHPExcel
 * @package    PHPExcel
 * @copyright  Copyright (c) 2006 - 2014 PHPExcel (http://www.codeplex.com/PHPExcel)
 * @license    http://www.gnu.org/licenses/old-licenses/lgpl-2.1.txt	LGPL
 * @version    1.8.0, 2014-03-02
 */

/** Error reporting */
error_reporting(E_ALL);
ini_set('display_errors', TRUE);
ini_set('display_startup_errors', TRUE);
date_default_timezone_set('Europe/London');

if (PHP_SAPI == 'cli')
	die('This example should only be run from a Web Browser');

/** Include PHPExcel */
require_once dirname(__FILE__) . '/../../lib/phpexcel/Classes/PHPExcel.php';


// Create new PHPExcel object
$objPHPExcel = new PHPExcel();
$myWorkSheet = new PHPExcel_Worksheet($objPHPExcel, 'Pengangsuran Kredit');
$objPHPExcel->addSheet($myWorkSheet, 1);
$objPHPExcel->setActiveSheetIndex(0);

$objPHPExcel->getActiveSheet()->setTitle('Jurnal Umum');
// Set document properties
$objPHPExcel->getProperties()->setCreator("Maarten Balliauw")
							 ->setLastModifiedBy("Maarten Balliauw")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Test result file");


// Add some data
// $objPHPExcel->getActiveSheet()->setAutoSize(false);
// $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth("50");

$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(5);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(20);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(20);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(30);
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(20);
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(20);
$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(20);
$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(20);
$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth(20);
$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setWidth(20);
$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(20);
$objPHPExcel->getActiveSheet()->freezePane('A2');


$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', 'No')
            ->setCellValue('B1', 'No. Invoice')
						->setCellValue('C1', 'Tanggal')
            ->setCellValue('D1', 'Cabang')
						->setCellValue('E1', 'Admin')
						->setCellValue('F1', 'Client')
						->setCellValue('G1', 'Tipe Journal')
						->setCellValue('H1', 'Journal Debit')
            ->setCellValue('I1', 'Journal Kredit')
            ->setCellValue('J1', 'Journal Piutang')
						->setCellValue('K1', 'Journal Hutang')
						->setCellValue('L1', 'Bank Perusahaan')
						->setCellValue('M1', 'No. Bank')
						->setCellValue('N1', 'Bank Client')
						->setCellValue('O1', 'No. Bank');

$i=2;
$j=1;
$total_debit = 0;
$total_kredit = 0;
$total_piutang = 0;
$total_hutang = 0;
while ($r_umum = mysql_fetch_array($q_umum)) {
			$objPHPExcel->setActiveSheetIndex(0)
              		->setCellValue('A'.$i, $j)
              		->setCellValue('B'.$i, $r_umum['data_id'])
              		->setCellValue('C'.$i, format_date_only($r_umum['journal_date']))
									->setCellValue('D'.$i, $r_umum['branch_name'])
									->setCellValue('E'.$i, $r_umum['user_name'])
									->setCellValue('F'.$i, $r_umum['client'])
									->setCellValue('G'.$i, $r_umum['journal_type_name'])
									->setCellValue('H'.$i, $r_umum['journal_debit'])
									->setCellValue('I'.$i, $r_umum['journal_credit'])
									->setCellValue('J'.$i, $r_umum['journal_piutang'])
									->setCellValue('K'.$i, $r_umum['journal_hutang'])
									->setCellValue('L'.$i, $r_umum['bank_kita'])
									->setCellValue('M'.$i, $r_umum['bank_account'])
									->setCellValue('N'.$i, $r_umum['bank_client'])
									->setCellValue('O'.$i, $r_umum['bank_account_to']);
									$total_debit = $total_debit + $r_umum['journal_debit'];
									$total_kredit = $total_kredit + $r_umum['journal_credit'];
									$total_piutang = $total_piutang + $r_umum['journal_piutang'];
									$total_hutang	= $total_hutang	+ $r_umum['journal_hutang'];
      				$i++;
      				$j++;
}
$k = $i++;

$objPHPExcel->setActiveSheetIndex(0)
						->setCellValue('F'.$k, 'TOTAL ANGSURAN')
						->setCellValue('G'.$k, $total_debit)
						->setCellValue('H'.$k, $total_kredit)
						->setCellValue('I'.$k, $total_piutang)
						->setCellValue('J'.$k, $total_hutang);

// Set active sheet index to the first sheet, so Excel opens this as the first sheet

$objPHPExcel->setActiveSheetIndex(1)
            ->setCellValue('A1', 'No')
            ->setCellValue('B1', 'No. Invoice')
						->setCellValue('C1', 'Tanggal')
            ->setCellValue('D1', 'Cabang')
						->setCellValue('E1', 'Admin')
						->setCellValue('F1', 'Client')
						->setCellValue('G1', 'Jml. Angsuran')
						->setCellValue('H1', 'Denda')
						->setCellValue('I1', 'Bank Perusahaan')
						->setCellValue('J1', 'No. Bank')
						->setCellValue('K1', 'Bank Client')
						->setCellValue('L1', 'No. Bank');

$i2=2;
$j2=1;
$total_setor_angsuran = 0;
while ($r_angsuran = mysql_fetch_array($q_angsuran)) {
			$objPHPExcel->setActiveSheetIndex(1)
              		->setCellValue('A'.$i2, $j2)
              		->setCellValue('B'.$i2, $r_angsuran['data_id'])
              		->setCellValue('C'.$i2, format_date_only($r_angsuran['journal_date']))
									->setCellValue('D'.$i2, $r_angsuran['branch_name'])
									->setCellValue('E'.$i2, $r_angsuran['user_name'])
									->setCellValue('F'.$i2, $r_angsuran['member_name'])
									->setCellValue('G'.$i2, $r_angsuran['angsuran_nominal'])
									->setCellValue('H'.$i2, $r_angsuran['denda_persen_nominal'])
									->setCellValue('I'.$i2, $r_angsuran['bank_kita'])
									->setCellValue('J'.$i2, $r_angsuran['bank_account'])
									->setCellValue('K'.$i2, $r_angsuran['bank_client'])
									->setCellValue('L'.$i2, $r_angsuran['bank_account_to']);
$total_setor_angsuran = $total_setor_angsuran + $r_angsuran['angsuran_nominal'];
      				$i2++;
      				$j2++;
}
$k2 = $i2++;


$objPHPExcel->setActiveSheetIndex(1)
						->setCellValue('F'.$k2, 'TOTAL')
						->setCellValue('G'.$k2, $total_setor_angsuran);

						$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(5);
						$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(20);
						$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(20);
						$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(30);
						$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(20);
						$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(20);
						$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(20);
						$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(20);
						$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth(20);
						$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setWidth(20);
						$objPHPExcel->getActiveSheet()->freezePane('A2');

$objPHPExcel->setActiveSheetIndex(0);

// Redirect output to a client’s web browser (Excel2007)
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="transaksi.xlsx"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
$objWriter->save('php://output');
exit;
