SELECT c1.c_id AS c_id1,
    c2.c_id AS c_id2
FROM client c1
    JOIN client c2 ON c1.c_id < c2.c_id
WHERE NOT EXISTS (
        SELECT *
        FROM property p1
        WHERE p1.pro_c_id = c1.c_id
            AND p1.pro_type = 3
            AND NOT EXISTS(
                SELECT *
                FROM property p2
                WHERE p2.pro_c_id = c2.c_id
                    AND p2.pro_type = 3
                    AND p1.pro_pif_id = p2.pro_pif_id
            )
    )
    AND NOT EXISTS (
        SELECT *
        FROM property p2
        WHERE p2.pro_c_id = c2.c_id
            AND p2.pro_type = 3
            AND NOT EXISTS(
                SELECT *
                FROM property p1
                WHERE p1.pro_c_id = c1.c_id
                    AND p1.pro_type = 3
                    AND p1.pro_pif_id = p2.pro_pif_id
            )
    )
    AND EXISTS (
        SELECT *
        FROM property p
        WHERE p.pro_c_id = c1.c_id
            AND p.pro_type = 3
    )
    AND EXISTS (
        SELECT *
        FROM property p
        WHERE p.pro_c_id = c2.c_id
            AND p.pro_type = 3
    );