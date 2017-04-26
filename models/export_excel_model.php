<?php
function select_jurnal_umum($and_branch_id, $date_1, $date_2){
  $query = mysql_query("SELECT a.*, b.journal_type_name, g.bank_name AS bank_kita, h.bank_name AS bank_client,
                        i.branch_name, j.user_name
                        FROM journals a
                        LEFT JOIN journal_types b ON b.journal_type_id = a.journal_type_id
                        LEFT JOIN transactions c ON c.transaction_code = a.data_id
                        LEFT JOIN purchases d ON d.purchases_code = a.data_id
                        LEFT JOIN banks g on g.bank_id = a.bank_id
                        LEFT JOIN banks h on h.bank_id = a.bank_id_to
                        LEFT JOIN branches i on i.branch_id = a.branch_id
                        LEFT JOIN users j on j.user_id = a.user_id
                        WHERE a.journal_date >= '$date_1'
                        AND a.journal_date <= '$date_2'
                        '$and_branch_id'
                        ");
  return $query;
}

function select_jurnal_angsuran($and_branch_id, $date1, $date2){
  $query = mysql_query("SELECT a.*, b.journal_type_name, g.bank_name AS bank_kita, h.bank_name AS bank_client,
                        i.branch_name, j.user_name, c.angsuran_nominal,e.member_name, c.denda_persen_nominal
                        FROM journals a
                        LEFT JOIN journal_types b ON b.journal_type_id = a.journal_type_id
                        LEFT JOIN angsuran_kredit_details c ON c.angsuran_kredit_details_code = a.data_id
                        left join angsuran_kredit d on d.angsuran_kredit_id = c.angsuran_kredit_id
                        LEFT JOIN members e ON e.member_id = d.member_id
                        LEFT JOIN banks g on g.bank_id = a.bank_id
                        LEFT JOIN banks h on h.bank_id = a.bank_id_to
                        LEFT JOIN branches i on i.branch_id = a.branch_id
                        LEFT JOIN users j on j.user_id = a.user_id
                        WHERE a.journal_date >= '$date1'
                        AND a.journal_date <= '$date2'
                        '$and_branch_id'
                        AND a.journal_type_id = 6
                        group by a.data_id
                        ");
  return $query;
}

function get_member_name($code)
{
  $query = mysql_query("SELECT b.member_name as result FROM transactions a
                        LEFT JOIN members b on b.member_id = a.member_id
                        WHERE a.transaction_code = '$code'");

  $row = mysql_fetch_array($query);
  $result = $row['result'];
  return $result;
}

function get_supplier_name($code)
{
  $query = mysql_query("SELECT b.supplier_name as result FROM purchases a
                        LEFT JOIN suppliers b on b.supplier_id = a.supplier_id
                        WHERE a.purchases_code = '$code'");
  $row = mysql_fetch_array($query);
  $result = $row['result'];
  return $result;
}

 ?>
