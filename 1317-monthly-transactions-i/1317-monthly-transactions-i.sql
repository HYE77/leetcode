 WITH cte AS (SELECT *,
        IF(state = 'approved', 1, 0) approved,
        IF(state = 'approved', amount, 0) approved_amount
    FROM Transactions
)
SELECT SUBSTR(trans_date, 1, 7) month, country, 
    count(*) trans_count,
    SUM(approved) approved_count,
    SUM(amount) trans_total_amount,
    SUM(approved_amount) approved_total_amount
FROM cte
GROUP BY month, country