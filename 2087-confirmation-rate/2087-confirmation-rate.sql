with cte2 AS (SELECT *,
    IF(action = 'timeout', 'timeout', NULL) timeouts,
    IF(action = 'confirmed', 'confirmed', NULL) confirmeds,
    IF(action = 'signup', 'signup', NULL) signs
FROM (SELECT *, 'signup' action
    FROM Signups
    UNION
    SELECT *
    FROM Confirmations) cte
ORDER BY user_id)

SELECT user_id,
    IF(COUNT(confirmeds) = 0 AND COUNT(timeouts) = 0, 0,
    ROUND(COUNT(confirmeds) / (COUNT(timeouts) + COUNT(confirmeds)), 2)) confirmation_rate
FROM cte2
GROUP BY user_id

