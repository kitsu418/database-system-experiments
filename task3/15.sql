SELECT pro_c_id,
    SUM(pro_income) AS total_revenue,
    RANK() OVER(
        ORDER BY SUM(pro_income) DESC
    ) AS 'rank'
FROM property
WHERE pro_type = 3
GROUP BY pro_c_id
ORDER BY total_revenue DESC,
    pro_c_id ASC;
SELECT pro_c_id,
    SUM(pro_income) AS total_revenue,
    DENSE_RANK() OVER(
        ORDER BY SUM(pro_income) DESC
    ) AS 'rank'
FROM property
WHERE pro_type = 3
GROUP BY pro_c_id
ORDER BY total_revenue DESC,
    pro_c_id ASC;