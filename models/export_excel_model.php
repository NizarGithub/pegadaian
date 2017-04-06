<?php
function select_jurnal_umum($and_branch_id, $date_1, $date_2){
  $query = mysql_query("SELECT a.*, b.journal_type_name, g.bank_name AS bank_kita, h.bank_name AS bank_client,
                        CASE a.journal_type_id
                        	WHEN a.journal_type_id=1 THEN e.member_name
                        	WHEN a.journal_type_id=2 THEN f.supplier_name
                        	WHEN a.journal_type_id=5 THEN f.supplier_name
                        	WHEN a.journal_type_id=6 THEN e.member_name
                        END AS client, i.branch_name, j.user_name
                        FROM journals a
                        LEFT JOIN journal_types b ON b.journal_type_id = a.journal_type_id
                        LEFT JOIN transactions c ON c.transaction_code = a.data_id
                        LEFT JOIN purchases d ON d.purchases_code = a.data_id
                        	LEFT JOIN members e ON e.member_id = c.member_id
                        	LEFT JOIN suppliers f ON f.supplier_id = d.supplier_id
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
                        i.branch_name, j.user_name, k.angsuran_nominal,e.member_name, k.denda_persen_nominal
                        FROM journals a
                        LEFT JOIN journal_types b ON b.journal_type_id = a.journal_type_id
                        LEFT JOIN transactions c ON c.transaction_code = a.data_id
                        LEFT JOIN purchases d ON d.purchases_code = a.data_id
                        LEFT JOIN members e ON e.member_id = c.member_id
                        LEFT JOIN banks g on g.bank_id = a.bank_id
                        LEFT JOIN banks h on h.bank_id = a.bank_id_to
                        LEFT JOIN branches i on i.branch_id = a.branch_id
                        LEFT JOIN users j on j.user_id = a.user_id
                        LEFT JOIN angsuran_kredit_details k on k.angsuran_kredit_details_code = a.data_id
                        WHERE a.journal_date >= '$date1'
                        AND a.journal_date <= '$date2'
                        '$and_branch_id'
                        AND a.journal_type_id = 6
                        group by a.data_id
                        ");
  return $query;
}
 ?>
