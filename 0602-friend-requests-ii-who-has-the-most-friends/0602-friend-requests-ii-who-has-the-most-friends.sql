WITH cte AS (
SELECT requester_id
FROM RequestAccepted
UNION ALL
SELECT accepter_id
FROM RequestAccepted
) SELECT requester_id AS id, COUNT(*) AS NUM
FROM cte
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1