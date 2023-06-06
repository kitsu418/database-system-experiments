SELECT p_id,
    p_amount,
    p_year
FROM finances_product
WHERE p_amount BETWEEN 30000 AND 50000
ORDER BY p_amount ASC,
    p_year DESC;