SELECT ROUND(COUNT(DISTINCT consecutive)/COUNT(DISTINCT player_id), 2) fraction
FROM(SELECT player_id, event_date,
        LAG(event_date) OVER (PARTITION BY player_id ORDER BY event_date) daybefore,
        IF(DATEDIFF(event_date, LAG(event_date) OVER (PARTITION BY player_id ORDER BY event_date)) = 1, player_id, NULL) consecutive,
        RANK() OVER (PARTITION BY player_id ORDER BY event_date) firstsecond
    FROM Activity) cte
WHERE firstsecond in (1, 2)

