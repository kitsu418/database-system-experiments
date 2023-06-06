SELECT DISTINCT pro_c_id
FROM property t1
WHERE NOT EXISTS (
        SELECT *
        FROM (
                SELECT pro_pif_id
                FROM property
                WHERE pro_type = 1
                GROUP BY pro_pif_id
                HAVING COUNT(pro_c_id) > 2
            ) t2
        WHERE NOT EXISTS (
                SELECT *
                FROM property t3
                WHERE t3.pro_type = 1
                    AND t1.pro_c_id = t3.pro_c_id
                    AND t2.pro_pif_id = t3.pro_pif_id
            )
    )
ORDER BY t1.pro_c_id