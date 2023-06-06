SELECT c_id,
    c_name,
    IFNULL(SUM(pro_amount), 0) AS total_property
FROM client
    LEFT JOIN (
        SELECT pro_c_id,
            pro_quantity * p_amount as pro_amount
        FROM property
            JOIN finances_product ON pro_pif_id = p_id
        WHERE pro_type = 1
        UNION ALL
        SELECT pro_c_id,
            pro_quantity * i_amount as pro_amount
        FROM property
            JOIN insurance ON pro_pif_id = i_id
        WHERE pro_type = 2
        UNION ALL
        SELECT pro_c_id,
            pro_quantity * f_amount as pro_amount
        FROM property
            JOIN fund ON pro_pif_id = f_id
        WHERE pro_type = 3
        UNION ALL
        SELECT pro_c_id,
            SUM(pro_income) AS pro_amount
        FROM property
        GROUP BY pro_c_id
        UNION ALL
        SELECT b_c_id,
            SUM(IF(b_type = '储蓄卡', b_balance, - b_balance)) AS pro_amount
        FROM bank_card
        GROUP BY b_c_id
    ) pro ON c_id = pro.pro_c_id
GROUP BY c_id
ORDER BY c_id ASC;