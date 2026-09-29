USE student_performance_db;

-- 1. Student roster with department names
SELECT s.student_id, s.student_name, s.email, d.department_name, s.semester
FROM Students AS s
JOIN Departments AS d ON d.department_id = s.department_id
ORDER BY s.student_id;

-- 2. Top five students by total marks
SELECT s.student_id, s.student_name,
       SUM(m.marks_obtained) AS total_marks,
       ROUND(AVG(m.marks_obtained), 2) AS average_marks
FROM Students AS s
JOIN Marks AS m ON m.student_id = s.student_id
WHERE m.exam_type = 'Final'
GROUP BY s.student_id, s.student_name
ORDER BY total_marks DESC
LIMIT 5;

-- 3. Subject-wise statistics
SELECT sub.subject_name,
       COUNT(*) AS students_appeared,
       ROUND(AVG(m.marks_obtained), 2) AS average_marks,
       MAX(m.marks_obtained) AS highest_marks,
       MIN(m.marks_obtained) AS lowest_marks
FROM Subjects AS sub
JOIN Marks AS m ON m.subject_id = sub.subject_id
WHERE m.exam_type = 'Final'
GROUP BY sub.subject_id, sub.subject_name
ORDER BY average_marks DESC;

-- 4. Attendance below 75%
SELECT s.student_name, sub.subject_name,
       a.attended_classes, a.total_classes,
       ROUND(100.0 * a.attended_classes / NULLIF(a.total_classes, 0), 2)
         AS attendance_percentage
FROM Attendance AS a
JOIN Students AS s ON s.student_id = a.student_id
JOIN Subjects AS sub ON sub.subject_id = a.subject_id
WHERE 100.0 * a.attended_classes / NULLIF(a.total_classes, 0) < 75
ORDER BY attendance_percentage, s.student_name;

-- 5. Department-level performance
SELECT d.department_name,
       COUNT(DISTINCT s.student_id) AS total_students,
       ROUND(AVG(m.marks_obtained), 2) AS average_marks,
       MAX(m.marks_obtained) AS highest_mark
FROM Departments AS d
JOIN Students AS s ON s.department_id = d.department_id
JOIN Marks AS m ON m.student_id = s.student_id
WHERE m.exam_type = 'Final'
GROUP BY d.department_id, d.department_name
ORDER BY average_marks DESC;

-- 6. Students whose average is above the overall mark average
SELECT s.student_name, ROUND(AVG(m.marks_obtained), 2) AS student_average
FROM Students AS s
JOIN Marks AS m ON m.student_id = s.student_id
WHERE m.exam_type = 'Final'
GROUP BY s.student_id, s.student_name
HAVING AVG(m.marks_obtained) > (
    SELECT AVG(marks_obtained)
    FROM Marks
    WHERE exam_type = 'Final'
)
ORDER BY student_average DESC;

-- 7. Student ranking using a window function
WITH student_totals AS (
    SELECT s.student_id, s.student_name,
           SUM(m.marks_obtained) AS total_marks
    FROM Students AS s
    JOIN Marks AS m ON m.student_id = s.student_id
    WHERE m.exam_type = 'Final'
    GROUP BY s.student_id, s.student_name
)
SELECT student_id, student_name, total_marks,
       RANK() OVER (ORDER BY total_marks DESC) AS student_rank
FROM student_totals
ORDER BY student_rank;

-- 8. Academic support list: average marks below 70 OR attendance below 75%
WITH mark_summary AS (
    SELECT student_id, AVG(marks_obtained) AS avg_marks
    FROM Marks
    WHERE exam_type = 'Final'
    GROUP BY student_id
),
attendance_summary AS (
    SELECT student_id,
           100.0 * SUM(attended_classes) / NULLIF(SUM(total_classes), 0)
             AS attendance_pct
    FROM Attendance
    GROUP BY student_id
)
SELECT s.student_id, s.student_name,
       ROUND(ms.avg_marks, 2) AS average_marks,
       ROUND(att.attendance_pct, 2) AS attendance_percentage
FROM Students AS s
JOIN mark_summary AS ms ON ms.student_id = s.student_id
JOIN attendance_summary AS att ON att.student_id = s.student_id
WHERE ms.avg_marks < 70 OR att.attendance_pct < 75
ORDER BY ms.avg_marks, att.attendance_pct;
