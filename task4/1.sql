SELECT pyear,
    rk,
    p_id,
    sumamount
FROM (
        SELECT YEAR(pro_purchase_time) AS pyear,
            p_id,
            SUM(pro_quantity * p_amount) AS sumamount,
            RANK() OVER(
                PARTITION BY YEAR(pro_purchase_time)
                ORDER BY SUM(pro_quantity * p_amount) DESC,
                    p_id ASC
            ) AS rk
        FROM property
            JOIN finances_product ON pro_pif_id = p_id
            AND pro_type = 1
        WHERE pro_purchase_time BETWEEN '2010-1-1' AND '2011-12-31'
        GROUP BY pyear,
            p_id
    ) t
WHERE rk <= 3;