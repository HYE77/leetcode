SELECT e.name, SUM(b.bonus) bonus
FROM Employee e LEFT JOIN Bonus b ON e.empId = b.empId
GROUP BY e.empId
HAVING bonus < 1000 or bonus IS NULL