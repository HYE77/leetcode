
SELECT r.contest_id,
    ROUND(COUNT(r.user_id) / (SELECT COUNT(*) FROM Users) * 100, 2) percentage
FROM Register r LEFT JOIN Users u ON r.user_id = u.user_id
GROUP BY 1
ORDER BY percentage desc, r.contest_id