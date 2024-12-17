WITH cte AS (SELECT income,
   CASE WHEN income = (SELECT min(income) FROM accounts) THEN 'Low Salary'
        WHEN income = (SELECT max(income) FROM accounts) THEN 'High Salary'
        ELSE 'Average Salary' END AS category
FROM Accounts)
SELECT DISTINCT cte.category, coalesce(s.accounts_count, 0) AS accounts_count
FROM cte LEFT JOIN (SELECT CASE WHEN income < 20000 THEN 'Low Salary'
       WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
       WHEN income > 50000 THEN 'High Salary' END AS category, 
       COUNT(*) accounts_count
FROM Accounts
GROUP BY category) s ON cte.category = s.category