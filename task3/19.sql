SELECT week_of_trading,
    SUM(IF(dayid = 0, amount, NULL)) Monday,
    SUM(IF(dayid = 1, amount, NULL)) Tuesday,
    SUM(IF(dayid = 2, amount, NULL)) Wednesday,
    SUM(IF(dayid = 3, amount, NULL)) Thursday,
    SUM(IF(dayid = 4, amount, NULL)) Friday
FROM (
        SELECT WEEK(pro_purchase_time) - 5 week_of_trading,
            WEEKDAY(pro_purchase_time) dayid,
            SUM(pro_quantity * f_amount) amount
        FROM property
            JOIN fund ON pro_pif_id = f_id
        WHERE pro_type = 3
            AND pro_purchase_time like "2022-02-%"
        GROUP BY pro_purchase_time
    ) t
GROUP BY week_of_trading;