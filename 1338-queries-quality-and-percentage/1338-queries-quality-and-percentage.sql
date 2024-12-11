SELECT query_name,
    ROUND(AVG(rating/position), 2) quality,
    ROUND(COUNT(IF(rating < 3, rating, NULL))/COUNT(rating) * 100, 2) poor_query_percentage
FROM Queries
GROUP BY 1
