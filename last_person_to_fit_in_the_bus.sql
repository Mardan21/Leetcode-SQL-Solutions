SELECT person_name
FROM (
    SELECT person_id,
        person_name,
        weight,
        turn,
        SUM(weight) OVER (
            ORDER BY turn
        ) AS cum
    FROM Queue
) p1
WHERE cum <= 1000
ORDER BY turn
DESC limit 1;
