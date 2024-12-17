
SELECT CASE WHEN (SELECT COUNT(id) FROM Seat) % 2 = 0 AND id % 2 = 1 THEN id + 1
            WHEN (SELECT COUNT(id) FROM Seat)  % 2 = 0 AND id % 2 = 0 THEN id - 1
            WHEN (SELECT COUNT(id) FROM Seat)  % 2 = 1 AND id % 2 = 1 AND id != (SELECT MAX(id) FROM Seat) THEN id + 1
            WHEN (SELECT COUNT(id) FROM Seat)  % 2 = 1 AND id % 2 = 0 THEN id - 1
            WHEN (SELECT COUNT(id) FROM Seat)  % 2 = 1 AND id % 2 = 1 AND id = (SELECT MAX(id) FROM Seat) THEN id END AS id,
       student
FROM Seat
ORDER BY 1
