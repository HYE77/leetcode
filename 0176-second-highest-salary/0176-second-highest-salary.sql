
WITH cte AS (SELECT DISTINCT(salary) SecondHighestSalary
FROM Employee
ORDER BY 1 DESC
LIMIT 1, 1)
SELECT IF(COUNT(*) > 0, cast(SecondHighestSalary as decimal), null) SecondHighestSalary
FROM cte