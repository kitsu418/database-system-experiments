SELECT c_id,
    c_name,
    COUNT(b_c_id) AS number_of_cards
FROM client
    LEFT JOIN bank_card ON c_id = b_c_id
WHERE c_name LIKE '黄%'
GROUP BY c_id
ORDER BY number_of_cards DESC,
    c_id