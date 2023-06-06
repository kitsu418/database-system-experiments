SELECT pro_pif_id,
    COUNT(*) AS cc,
    DENSE_RANK() OVER(
        ORDER BY COUNT(pro_c_id) DESC
    ) AS prank
FROM (
        SELECT DISTINCT pro_pif_id
        FROM property t1
        WHERE t1.pro_type = 1
            AND t1.pro_pif_id != 14
            AND EXISTS(
                SELECT *
                FROM (
                        SELECT pro_c_id,
                            DENSE_RANK() OVER(
                                ORDER BY SUM(pro_quantity)
                            ) AS ranking
                        FROM property
                        WHERE pro_type = 1
                            AND pro_pif_id = 14
                        GROUP BY pro_c_id
                    ) t2
                WHERE t2.ranking <= 3
                    AND t1.pro_c_id = t2.pro_c_id
            )
    ) t3
    JOIN (
        SELECT *
        FROM property
        WHERE pro_type = 1
            AND pro_pif_id != 14
    ) t4 USING (pro_pif_id)
GROUP BY pro_pif_id
ORDER BY pro_pif_id;