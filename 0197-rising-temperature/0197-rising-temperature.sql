WITH TEMP_GAP AS (SELECT ID, RECORDDATE, TEMPERATURE, 
        LAG(RECORDDATE) OVER() YESTERDAY_DATE,
        LAG(TEMPERATURE) OVER () YESTERDAY_TEMP,
        TEMPERATURE - LAG(TEMPERATURE) OVER() GAP
FROM WEATHER
ORDER BY RECORDDATE)
SELECT ID
FROM TEMP_GAP
WHERE DATEDIFF(RECORDDATE, YESTERDAY_DATE) = 1 AND GAP > 0 

