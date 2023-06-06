SELECT i_id,
    i_amount
FROM insurance
WHERE i_amount = (
        SELECT DISTINCT i_amount
        FROM insurance
        ORDER BY i_amount DESC
        LIMIT 3, 1
    );