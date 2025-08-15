# Get total amounts for each day
WITH DailyAmounts AS (
    SELECT
        visited_on, 
        SUM(amount) AS total_daily_amount
    FROM 
        Customer
    GROUP BY
        visited_on
),

# Get the 7 day moving average from DailyAmounts table
SevenDayMovingAverage AS (
    SELECT 
        visited_on,
        SUM(total_daily_amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount,
        AVG(total_daily_amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS average_amount,
        ROW_NUMBER() OVER (ORDER BY visited_on) as rn
    FROM DailyAmounts
)

SELECT 
    visited_on,
    amount,
    ROUND(average_amount, 2) AS average_amount
FROM 
    SevenDayMovingAverage
WHERE 
    rn >= 7
ORDER BY
    visited_on;
