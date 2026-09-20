# Lab 07 — Filters: BETWEEN, IN, LIKE, IS NULL, ORDER BY & LIMIT

## Database Systems

This folder contains the SQL work for **Lab 07 — Part B: Filtering, Sorting and Limiting Results**.

### SQL File

- `Lab07_Filters.sql`

### Table Used

The queries assume an `Employee` table with these columns:

```text
EmpID
EmpName
Gender
Salary
City
Department
JobTitle
HireDate
```

### Topics Covered

This lab demonstrates:

- `BETWEEN`
- `NOT BETWEEN`
- `IN`
- `NOT IN`
- `LIKE`
- `LOWER()`
- `IS NULL`
- `IS NOT NULL`
- `ORDER BY`
- `LIMIT`

### Tasks Covered

The SQL file includes queries for:

- Employees within specified salary ranges
- Employees hired within a date range
- Employees outside a salary range
- Employees from selected cities
- Employees outside selected departments
- Names beginning with `M`
- Names containing `a`
- Names ending with `an`
- Job titles containing `Engineer`
- Employees with NULL cities
- Employees with non-NULL cities
- Highest-paid employees
- Most recently hired employees
- Lowest-paid employees
- Sorting by department and hire date

### How to Run

1. Open `Lab07_Filters.sql` in MySQL Workbench.
2. Ensure the `Employee` table exists.
3. Run the queries individually or as a complete script.
