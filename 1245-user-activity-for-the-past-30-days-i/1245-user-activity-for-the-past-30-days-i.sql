SELECT
  activity_date AS day,
  COUNT(DISTINCT user_id) AS active_users
FROM
  Activity
GROUP BY
  activity_date
HAVING
  day BETWEEN DATE_SUB("2019-07-27", INTERVAL 29 DAY) AND "2019-07-27"