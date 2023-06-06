SELECT c_name,
    c_phone,
    c_mail
FROM client
WHERE c_id in (
        SELECT pro_c_id
        FROM property
        WHERE pro_type = 3
            AND pro_pif_id IN (
                SELECT f_id
                FROM fund
                WHERE f_type = '货币型'
            )
    )
ORDER BY c_id;