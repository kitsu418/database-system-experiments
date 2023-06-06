SELECT c_name,
    c_id_card,
    IFNULL(SUM(pro_amount), 0) AS total_amount
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
    ) pro ON c_id = pro.pro_c_id
GROUP BY c_id
ORDER BY total_amount DESC;