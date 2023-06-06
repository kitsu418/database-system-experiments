SELECT c_id,
    c_name,
    c_id_card,
    c_phone
FROM client
WHERE c_mail IS NULL;