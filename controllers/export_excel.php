<?php
include '../lib/config.php';
include '../lib/function.php';
include '../models/export_excel_model.php';
$page = null;
$page = (isset($_GET['page'])) ? $_GET['page'] : "list";
$title = ucfirst("Arus Kas");

switch ($page) {
  case 'export_journal_excel':
    $i_date = $_GET['date'];

    $date 	= explode("-", $_GET["date"]);

  	$date1 	= $date[0];
  	$date2 	= $date[1];

    $date1 	= str_replace("/","-", $date1);
  	$date2 	= str_replace("/","-", $date2);

    $branch_id = $_SESSION['branch_id'];

    if ($branch_id==3) { $and_branch_id = ""; } else { $and_branch_id = "AND a.branch_id = '$branch_id'"; }

    $q_umum = select_jurnal_umum($and_branch_id, $date1, $date2);
    // include '../views/export_excel/export_journal_excel.php';
    break;

}
