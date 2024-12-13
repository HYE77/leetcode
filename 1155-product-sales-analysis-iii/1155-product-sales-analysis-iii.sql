SELECT s.product_id, s.year AS first_year, s.quantity, s.price
FROM (SELECT product_id, min(year) AS first FROM Sales GROUP BY product_id) AS cte
  JOIN Sales s ON cte.product_id = s.product_id AND cte.first = s.year