WITH cte AS (SELECT *, SUM(weight) OVER(ORDER BY turn) total_weights FROM Queue)
SELECT person_name
FROM cte
WHERE total_weights <= 1000
ORDER BY turn DESC
LIMIT 1