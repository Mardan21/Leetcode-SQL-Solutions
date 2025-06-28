SELECT
    ROUND(
        (SUM(CASE WHEN DATEDIFF(a.event_date, f.first_login) = 1 THEN 1 ELSE 0 END) 
        / COUNT(DISTINCT f.player_id)
    ), 2) AS fraction
FROM (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) f
LEFT JOIN Activity a
ON f.player_id = a.player_id;
