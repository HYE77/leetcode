(SELECT u.name AS results
FROM MovieRating m JOIN Users u ON m.user_id = u.user_id
GROUP BY u.name
ORDER BY COUNT(movie_id) DESC, 1
LIMIT 1)
UNION ALL
(SELECT m.title AS results
FROM MovieRating r JOIN Movies m ON r.movie_id = m.movie_id
WHERE LEFT(r.created_at, 7) = '2020-02'
GROUP BY r.movie_id
ORDER BY AVG(r.rating) DESC, 1
LIMIT 1)