<?php
function select_jurnal_umum($where_branch_id, $date_1, $date_2){
  $query = mysql_query("SELECT a.* FROM journals a");
  return $query;
}
 ?>
