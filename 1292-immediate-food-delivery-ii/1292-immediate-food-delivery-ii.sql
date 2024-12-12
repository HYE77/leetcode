WITH cte AS (SELECT customer_id, min(order_date) first_order
    FROM Delivery
    GROUP BY customer_id)
SELECT ROUND(SUM(d.order_date = d.customer_pref_delivery_date)/COUNT(*) * 100, 2) immediate_percentage
FROM cte INNER JOIN Delivery d ON cte.customer_id = d.customer_id AND cte.first_order = d.order_date
