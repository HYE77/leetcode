SELECT s.machine_id,
        ROUND(AVG(e.timestamp - s.timestamp), 3) processing_time
FROM(
    SELECT *
    FROM Activity
    WHERE activity_type = 'start') s
        LEFT JOIN (SELECT *
                    FROM Activity
                    WHERE activity_type = 'end') e
        ON s.machine_id = e.machine_id AND s.process_id = e.process_id
GROUP BY machine_id