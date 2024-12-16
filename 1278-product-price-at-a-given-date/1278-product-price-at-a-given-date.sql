-- SELECT *
-- FROM Products
-- WHERE change_date < '2019-08-16' 

SELECT product_id, new_price AS price
FROM Products
WHERE (product_id, change_date) IN (SELECT product_id, max(change_date)
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id)

UNION

SELECT product_id, CAST(10 AS UNSIGNED) AS price
FROM Products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16'