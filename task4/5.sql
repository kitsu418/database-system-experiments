SELECT t1.pro_c_id AS pro_c_id,
    t2.pro_c_id AS pro_c_id,
    COUNT(*) AS total_count
FROM property t1
    JOIN property t2 ON t1.pro_c_id != t2.pro_c_id
WHERE t1.pro_type = 1
    AND t2.pro_type = 1
    AND t1.pro_pif_id = t2.pro_pif_id
GROUP BY t1.pro_c_id,
    t2.pro_c_id
HAVING COUNT(*) >= 2
ORDER BY t1.pro_c_id ASC;