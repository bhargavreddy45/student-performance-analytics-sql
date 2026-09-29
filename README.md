# Student Performance & Academic Analytics System (SQL)

A MySQL project for managing student records, subject marks, and attendance, then generating academic reports for faculty and administrators.

## Project objectives
- Design a relational database with primary and foreign keys.
- Store student, department, subject, marks, and attendance records.
- Analyze performance using joins, aggregate functions, subqueries, CTEs, and window functions.
- Identify students who may need academic support based on marks and attendance.
- Demonstrate reusable reporting with views and query optimization with indexes.

## Tech stack
- MySQL 8.0+
- MySQL Workbench
- SQL

## Repository structure
```text
student-performance-analytics-sql/
├── README.md
├── sql/
│   ├── 01_schema.sql
│   ├── 02_sample_data.sql
│   ├── 03_analytics_queries.sql
│   └── 04_views_indexes.sql
└── docs/
    └── ERD.md
```

## Setup
1. Install MySQL Server 8.0+ and MySQL Workbench.
2. Open Workbench and connect to your local MySQL instance.
3. Open and execute `sql/01_schema.sql`.
4. Execute `sql/02_sample_data.sql`.
5. Run individual reports from `sql/03_analytics_queries.sql`.
6. Optionally execute `sql/04_views_indexes.sql`.

> The schema script recreates this project's database. Do not run it against a database containing data you need to keep.

## Reports included
1. Student roster with department names
2. Top five students by total marks
3. Subject-wise averages, highest and lowest marks
4. Attendance below 75%
5. Department-wise performance
6. Students above the overall average
7. Student rankings using `RANK()`
8. Students flagged for academic support using marks and attendance

## Data model
- `Departments` 1—many `Students`
- `Students` 1—many `Marks`
- `Subjects` 1—many `Marks`
- `Students` 1—many `Attendance`
- `Subjects` 1—many `Attendance`

## Resume description
**Student Performance & Academic Analytics System | MySQL**
- Designed a relational database to manage student profiles, subject marks, and attendance using primary and foreign key constraints.
- Developed analytical reports using multi-table joins, aggregate functions, subqueries, CTEs, and window functions.
- Created reusable reporting views and indexes to support efficient academic analysis.
- Identified low-attendance and low-performing records to demonstrate data-driven academic monitoring.

Only include skills and features you have personally run, verified, and can explain in an interview.

## Suggested GitHub topics
`mysql` `sql` `database` `data-analytics` `student-performance` `academic-analytics`

## Future improvements
- Add a frontend dashboard (Power BI, Tableau, or a web app).
- Expand the dataset and add semester-wise historical records.
- Add stored procedures and validation triggers.
- Add automated database tests.
