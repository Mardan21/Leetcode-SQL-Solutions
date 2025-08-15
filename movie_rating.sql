WITH 
MostActiveUser AS (
    SELECT name
    FROM Users u
    JOIN MovieRating mr ON u.user_id = mr.user_id
    GROUP BY u.user_id
    ORDER BY COUNT(*) DESC, name
    LIMIT 1
),
BestMovieFebruary AS (
    SELECT title
    FROM Movies m
    JOIN MovieRating mr ON m.movie_id = mr.movie_id
    WHERE created_at BETWEEN '2020-02-01' and '2020-02-29'
    GROUP BY m.movie_id
    ORDER BY AVG(rating) DESC, title
    LIMIT 1
)

SELECT name AS results
FROM MostActiveUser
UNION ALL
SELECT title AS results 
FROM BestMovieFebruary
