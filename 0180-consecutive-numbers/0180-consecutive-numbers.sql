WITH cte AS (SELECT *,
  LAG(num) OVER() AS ONE,
  LAG(num, 2) OVER () AS TWO
FROM Logs)
SELECT DISTINCT num AS ConsecutiveNums
FROM cte
WHERE num = ONE AND ONE = TWO