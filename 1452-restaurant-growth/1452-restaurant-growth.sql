WITH cte AS (SELECT visited_on, SUM(amount) amount
FROM Customer
GROUP BY visited_on
ORDER BY visited_on)
SELECT visited_on,
    SUM(amount) OVER (ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
    ROUND(AVG(amount) OVER (ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount
FROM cte
LIMIT 6, 1234234652345