SELECT c_name,
    c_mail,
    c_phone
FROM client
WHERE EXISTS (
        SELECT *
        FROM property
        WHERE pro_c_id = c_id
            AND pro_type = 2
    )
    AND EXISTS (
        SELECT *
        FROM property
        WHERE pro_c_id = c_id
            AND pro_type = 3
    )
ORDER BY c_id;