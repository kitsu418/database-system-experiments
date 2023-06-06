SELECT pro_purchase_time,
    t3.amount as total_amount
FROM (
        SELECT *,
            COUNT(*) OVER(PARTITION BY t2.dateid - t2.rownum) cnt
        FROM (
                SELECT *,
                    row_number() OVER(
                        order by dateid
                    ) rownum
                FROM (
                        SELECT pro_purchase_time,
                            sum(pro_quantity * f_amount) amount,
                            @row := datediff(pro_purchase_time, "2021-12-31") - 2 * WEEK(pro_purchase_time) dateid
                        FROM property,
                            fund
                        WHERE pro_purchase_time BETWEEN '2022-02-07' AND '2022-02-28'
                            AND WEEKDAY(pro_purchase_time) NOT IN (5, 6)
                            AND pro_type = 3
                            AND pro_pif_id = f_id
                        GROUP BY pro_purchase_time
                    ) t1
                WHERE amount > 1000000
            ) t2
    ) t3
WHERE t3.cnt >= 3;