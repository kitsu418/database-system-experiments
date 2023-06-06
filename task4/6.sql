SELECT *
FROM (
        SELECT t1.pro_c_id AS pac,
            t2.pro_c_id AS pbc,
            COUNT(*) AS common,
            RANK() OVER(
                PARTITION BY t1.pro_c_id
                ORDER BY COUNT(*) DESC,
                    t2.pro_c_id ASC
            ) crank
        FROM (
                SELECT pro_c_id,
                    pro_pif_id
                FROM property
                WHERE pro_type = 1
            ) t1
            JOIN (
                SELECT pro_c_id,
                    pro_pif_id
                FROM property
                WHERE pro_type = 1
            ) t2 ON t1.pro_c_id != t2.pro_c_id
            AND t1.pro_pif_id = t2.pro_pif_id
        GROUP BY t1.pro_c_id,
            t2.pro_c_id
    ) t3
WHERE crank < 3;