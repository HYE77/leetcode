-- SELECT employee_id, name, COUNT(*) AS reports_count, ROUND(AVG(age), 0) AS average_age
-- FROM Employees
-- GROUP BY reports_to
-- ORDER BY employee_id

-- SELECT DISTINCT reports_to
-- FROM Employees
-- WHERE reports_to IS NOT NULL

SELECT
    e.reports_to AS employee_id,
    m.name AS name,
    COUNT(*) AS reports_count,
    ROUND(AVG(e.age), 0) AS average_age
FROM Employees e LEFT JOIN Employees m ON e.reports_to = m.employee_id
GROUP BY e.reports_to
HAVING employee_id IS NOT NULL
ORDER BY employee_id

