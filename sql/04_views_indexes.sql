USE student_performance_db;

-- Reusable student performance view
CREATE OR REPLACE VIEW vw_student_performance AS
SELECT s.student_id, s.student_name, d.department_name,
       COUNT(m.mark_id) AS subjects_recorded,
       ROUND(AVG(m.marks_obtained), 2) AS average_marks,
       SUM(m.marks_obtained) AS total_marks
FROM Students AS s
JOIN Departments AS d ON d.department_id = s.department_id
LEFT JOIN Marks AS m ON m.student_id = s.student_id
GROUP BY s.student_id, s.student_name, d.department_name;

-- Reusable attendance view
CREATE OR REPLACE VIEW vw_attendance_summary AS
SELECT s.student_id, s.student_name, sub.subject_name,
       a.total_classes, a.attended_classes,
       ROUND(100.0 * a.attended_classes / NULLIF(a.total_classes, 0), 2)
         AS attendance_percentage
FROM Attendance AS a
JOIN Students AS s ON s.student_id = a.student_id
JOIN Subjects AS sub ON sub.subject_id = a.subject_id;

-- Indexes to support common filtering/join patterns
CREATE INDEX idx_marks_exam_student ON Marks(exam_type, student_id);
CREATE INDEX idx_attendance_student ON Attendance(student_id);

-- Example view queries
SELECT * FROM vw_student_performance ORDER BY average_marks DESC;
SELECT * FROM vw_attendance_summary
WHERE attendance_percentage < 75
ORDER BY attendance_percentage;
