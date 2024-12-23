SELECT p.product_name, SUM(o.unit) AS unit
FROM Orders o LEFT JOIN Products p ON o.product_id = p.product_id
WHERE SUBSTR(o.order_date, 1, 4) = '2020' AND SUBSTR(o.order_date, 6, 2) = '02'
GROUP BY p.product_id
HAVING SUM(o.unit) >= 100