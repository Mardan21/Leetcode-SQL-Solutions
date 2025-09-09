WITH TripStatus AS (
    SELECT 
        request_at AS Day,
        t.status != 'completed' AS cancelled
    FROM 
        Trips t
    JOIN Users c ON client_id = c.users_id AND c.banned = 'No'
    JOIN Users d ON driver_id = d.users_id AND d.banned = 'No'
    WHERE request_at BETWEEN '2013-10-01' AND '2013-10-03'
)

SELECT 
    Day,
    ROUND(
        SUM(cancelled) / COUNT(cancelled),
        2
    ) AS 'Cancellation Rate'
FROM 
    TripStatus
GROUP BY 
    Day;
