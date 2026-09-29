-- Student Performance & Academic Analytics System
-- MySQL 8.0+
-- WARNING: This script drops and recreates the project database.

DROP DATABASE IF EXISTS student_performance_db;
CREATE DATABASE student_performance_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;
USE student_performance_db;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    department_id INT NOT NULL,
    semester TINYINT UNSIGNED NOT NULL,
    enrollment_date DATE NOT NULL,
    CONSTRAINT fk_students_department
      FOREIGN KEY (department_id)
      REFERENCES Departments(department_id),
    CONSTRAINT chk_students_semester CHECK (semester BETWEEN 1 AND 8)
);

CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(100) NOT NULL UNIQUE,
    credits TINYINT UNSIGNED NOT NULL,
    CONSTRAINT chk_subject_credits CHECK (credits BETWEEN 1 AND 6)
);

CREATE TABLE Marks (
    mark_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    marks_obtained DECIMAL(5,2) NOT NULL,
    exam_type VARCHAR(30) NOT NULL DEFAULT 'Final',
    CONSTRAINT fk_marks_student FOREIGN KEY (student_id)
      REFERENCES Students(student_id),
    CONSTRAINT fk_marks_subject FOREIGN KEY (subject_id)
      REFERENCES Subjects(subject_id),
    CONSTRAINT uq_marks_student_subject_exam
      UNIQUE (student_id, subject_id, exam_type),
    CONSTRAINT chk_marks_range CHECK (marks_obtained BETWEEN 0 AND 100)
);

CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    total_classes SMALLINT UNSIGNED NOT NULL,
    attended_classes SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT fk_attendance_student FOREIGN KEY (student_id)
      REFERENCES Students(student_id),
    CONSTRAINT fk_attendance_subject FOREIGN KEY (subject_id)
      REFERENCES Subjects(subject_id),
    CONSTRAINT uq_attendance_student_subject
      UNIQUE (student_id, subject_id),
    CONSTRAINT chk_attendance_total CHECK (total_classes > 0),
    CONSTRAINT chk_attendance_attended
      CHECK (attended_classes <= total_classes)
);
