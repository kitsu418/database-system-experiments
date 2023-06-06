SELECT c_name,
    c_id_card,
    c_phone
FROM client
    JOIN bank_card ON client.c_id = bank_card.b_c_id
WHERE b_type = '信用卡'
GROUP BY client.c_id
HAVING COUNT(*) >= 2
ORDER BY client.c_id;