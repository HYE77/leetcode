WITH cte AS (SELECT d.name AS depname, e.name AS empname, e.Salary,
        DENSE_RANK() OVER (Partition by e.departmentId ORDER BY e.Salary DESC) AS sRank
    FROM Employee e LEFT JOIN Department d ON e.departmentId = d.id)
SELECT depname AS Department, empname AS Employee, Salary
FROM cte
WHERE sRank <= 3
