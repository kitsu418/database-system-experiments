SELECT pro_income,
    COUNT(pro_income) AS presence
FROM property
GROUP BY pro_income
HAVING COUNT(*) >= ALL(
        SELECT COUNT(*)
        FROM property
        GROUP BY pro_income
    );