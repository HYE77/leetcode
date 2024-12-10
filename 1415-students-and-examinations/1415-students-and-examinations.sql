WITH cte AS (SELECT *
FROM Students st CROSS JOIN Subjects sub
ORDER BY 1, 3)
SELECT c.student_id, c.student_name, c.subject_name,
        COUNT(e.subject_name) attended_exams
FROM cte c LEFT JOIN Examinations e ON c.student_id = e.student_id AND c.subject_name = e.subject_name
GROUP BY 1, 2, 3
ORDER BY 1, 3

