SELECT c_name,
    c_phone,
    b_number
FROM client
    JOIN bank_card ON client.c_id = bank_card.b_c_id
WHERE bank_card.b_type = '储蓄卡'
ORDER BY c_id;