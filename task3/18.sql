SELECT b_c_id, SUM(b_balance) AS credit_card_amount
FROM bank_card
WHERE b_type = '信用卡'
GROUP BY b_c_id
HAVING MAX(b_balance) > 5000
ORDER BY b_c_id;