# Lab 4 — Aggregate Functions

## University Database

This folder contains the MySQL SQL file for the **University Database Aggregate Functions** lab.

### File Included

- `RollNo_Aggregates.sql`

### Database

The setup script creates and uses the following database:

```sql
uni_lab
```

### Tables

The database contains three tables:

- **Student** — stores student information.
- **Course** — stores course information.
- **Enrollment** — stores student course enrollments and marks.

### Schema

#### Student

| Column | Key |
|---|---|
| StudentID | Primary Key |
| FullName | — |
| City | — |
| EnrollDate | — |

#### Course

| Column | Key |
|---|---|
| CourseID | Primary Key |
| CourseName | — |
| Department | — |
| Credits | — |
| Fee | — |

#### Enrollment

| Column | Key |
|---|---|
| EnrollID | Primary Key |
| StudentID | Foreign Key |
| CourseID | Foreign Key |
| Marks | — |
| EnrollmentDate | — |

### Topics Covered

The SQL file demonstrates aggregate functions and related SQL concepts including:

- `COUNT()`
- `COUNT(DISTINCT ...)`
- `AVG()`
- `MIN()`
- `MAX()`
- `SUM()`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `LIMIT`
- `JOIN`
- `LEFT JOIN`
- Subqueries

### Questions Covered

- **Q1:** Count total students and courses.
- **Q2:** Count distinct student cities while ignoring `NULL`.
- **Q3:** Calculate average, minimum, and maximum marks.
- **Q4:** Count students in each city.
- **Q5:** Count courses in each department.
- **Q6:** Show enrollment count and average marks for each course.
- **Q7:** Find courses with average marks above 80.
- **Q8:** Calculate total fee revenue per department.
- **Q9:** Show course count and average marks for every student, including students with no enrollments.
- **Q10:** Find students who scored above 85 and show their highest mark.
- **Q11:** Find departments with an overall average mark below 75.
- **Q12:** Find the top 3 students by total fees paid.

### How to Run

1. Open MySQL Workbench or another MySQL client.
2. Open `RollNo_Aggregates.sql`.
3. Run the complete script.
4. The script creates the `uni_lab` database, creates all three tables, and inserts the provided sample data.
5. Run the assessment queries to view the results.

### Submission Structure

A recommended GitHub structure is:

```text
Your-Repository/
│
├── Lab4-Aggregates/
│   ├── RollNo_Aggregates.sql
│   └── README_Aggregates.md
│
├── Lab10-ScalarFunctions/
│   ├── RollNo_ScalarFunctions_Lab10.sql
│   └── README_Lab10.md
│
└── Lab11-ScalarFunctions/
    ├── RollNo_ScalarFunctions_Lab11.sql
    └── README_Lab11.md
```

> Replace `RollNo` with your actual roll number if your instructor requires the real roll number in the filename.
