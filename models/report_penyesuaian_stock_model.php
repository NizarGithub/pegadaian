<?php

function select($id){
  $query = mysql_query("SELECT a.*, b.*, c.user_name  FROM penyesuaian_stock_cabang a
                        JOIN items b ON b.item_id = a.item_id
                        JOIN users c on c.user_id = a.user_id
                        WHERE a.branch_id = '$id'");
  return $query;
}

?>
