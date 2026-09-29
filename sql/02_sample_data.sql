USE student_performance_db;

INSERT INTO Departments (department_name) VALUES
('Cybersecurity'),
('Computer Science'),
('Information Technology'),
('Electronics');

INSERT INTO Students
(student_name, email, department_id, semester, enrollment_date)
VALUES
('Arjun Kumar', 'arjun@example.com', 1, 5, '2024-08-01'),
('Priya Sharma', 'priya@example.com', 1, 5, '2024-08-01'),
('Rahul Reddy', 'rahul@example.com', 2, 5, '2024-08-01'),
('Sneha Patel', 'sneha@example.com', 3, 5, '2024-08-01'),
('Karthik Rao', 'karthik@example.com', 1, 5, '2024-08-01'),
('Ananya Singh', 'ananya@example.com', 2, 5, '2024-08-01'),
('Vijay Kumar', 'vijay@example.com', 4, 5, '2024-08-01'),
('Divya Reddy', 'divya@example.com', 3, 5, '2024-08-01'),
('Suresh Babu', 'suresh@example.com', 1, 5, '2024-08-01'),
('Meena Devi', 'meena@example.com', 2, 5, '2024-08-01');

INSERT INTO Subjects (subject_name, credits) VALUES
('Database Management Systems', 4),
('Computer Networks', 3),
('Cyber Security', 4),
('Operating Systems', 3),
('Data Structures', 4);

INSERT INTO Marks (student_id, subject_id, marks_obtained, exam_type) VALUES
(1,1,88,'Final'),(1,2,76,'Final'),(1,3,92,'Final'),(1,4,81,'Final'),(1,5,85,'Final'),
(2,1,95,'Final'),(2,2,89,'Final'),(2,3,91,'Final'),(2,4,87,'Final'),(2,5,93,'Final'),
(3,1,65,'Final'),(3,2,72,'Final'),(3,3,68,'Final'),(3,4,74,'Final'),(3,5,70,'Final'),
(4,1,78,'Final'),(4,2,82,'Final'),(4,3,85,'Final'),(4,4,79,'Final'),(4,5,88,'Final'),
(5,1,91,'Final'),(5,2,86,'Final'),(5,3,94,'Final'),(5,4,89,'Final'),(5,5,90,'Final'),
(6,1,73,'Final'),(6,2,77,'Final'),(6,3,80,'Final'),(6,4,69,'Final'),(6,5,75,'Final'),
(7,1,58,'Final'),(7,2,62,'Final'),(7,3,55,'Final'),(7,4,64,'Final'),(7,5,60,'Final'),
(8,1,84,'Final'),(8,2,88,'Final'),(8,3,90,'Final'),(8,4,86,'Final'),(8,5,92,'Final'),
(9,1,69,'Final'),(9,2,71,'Final'),(9,3,75,'Final'),(9,4,67,'Final'),(9,5,73,'Final'),
(10,1,87,'Final'),(10,2,83,'Final'),(10,3,89,'Final'),(10,4,91,'Final'),(10,5,85,'Final');

INSERT INTO Attendance
(student_id, subject_id, total_classes, attended_classes) VALUES
(1,1,40,36),(1,2,40,32),(1,3,40,38),(1,4,40,35),(1,5,40,34),
(2,1,40,39),(2,2,40,37),(2,3,40,38),(2,4,40,36),(2,5,40,40),
(3,1,40,28),(3,2,40,30),(3,3,40,32),(3,4,40,29),(3,5,40,31),
(4,1,40,35),(4,2,40,36),(4,3,40,34),(4,4,40,32),(4,5,40,37),
(5,1,40,38),(5,2,40,39),(5,3,40,37),(5,4,40,36),(5,5,40,38),
(6,1,40,31),(6,2,40,33),(6,3,40,34),(6,4,40,30),(6,5,40,32),
(7,1,40,24),(7,2,40,26),(7,3,40,22),(7,4,40,25),(7,5,40,27),
(8,1,40,37),(8,2,40,38),(8,3,40,39),(8,4,40,36),(8,5,40,37),
(9,1,40,29),(9,2,40,31),(9,3,40,30),(9,4,40,28),(9,5,40,32),
(10,1,40,36),(10,2,40,35),(10,3,40,38),(10,4,40,39),(10,5,40,37);
