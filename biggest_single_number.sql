SELECT 
    CASE
        WHEN COUNT(num) >= 1 
            THEN MAX(NUM) 
        ELSE null
    END AS num
FROM MyNumbers
WHERE num IN (
    SELECT num 
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
);
