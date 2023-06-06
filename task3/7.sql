SELECT c_name,
    c_phone,
    c_mail
FROM client
WHERE c_id NOT IN(
        SELECT pro_c_id
        FROM property
        WHERE pro_type = 1
    )
    AND c_id_card LIKE '4201%'
ORDER BY c_id;