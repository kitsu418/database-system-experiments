SELECT c.c_name,
    c.c_id_card,
    SUM(p.pro_income) AS total_income
FROM client c
    JOIN property p ON c.c_id = p.pro_c_id
WHERE p.pro_status = '可用'
GROUP BY c.c_id
ORDER BY total_income DESC
LIMIT 3;