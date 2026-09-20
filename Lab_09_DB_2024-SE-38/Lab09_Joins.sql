-- LAB 09 — Joins Part 02: Self Joins, Multi-table Joins, and Combined Challenges
-- Company schema
-- Tables assumed: Employee, Department, Project, Assignment

-- Task B1
SELECT e.EmpName AS EmployeeName,
       m.EmpName AS ManagerName
FROM Employee e
LEFT JOIN Employee m ON e.ManagerID = m.EmpID;

-- Task B2
SELECT e.EmpName AS EmployeeName,
       e.Salary AS EmployeeSalary,
       m.EmpName AS ManagerName,
       m.Salary AS ManagerSalary
FROM Employee e
INNER JOIN Employee m ON e.ManagerID = m.EmpID
WHERE e.Salary > m.Salary;

-- Task B3
SELECT e.EmpName AS EmpName,
       m.EmpName AS ManagerName,
       d1.DeptName AS EmployeeDepartment,
       d2.DeptName AS ManagerDepartment
FROM Employee e
INNER JOIN Employee m ON e.ManagerID = m.EmpID
INNER JOIN Department d1 ON e.DeptID = d1.DeptID
INNER JOIN Department d2 ON m.DeptID = d2.DeptID
WHERE e.DeptID <> m.DeptID;

-- Task B4
SELECT e.EmpName, p.ProjectName, a.WeeklyHours
FROM Employee e
INNER JOIN Assignment a ON e.EmpID = a.EmpID
INNER JOIN Project p ON a.ProjectID = p.ProjectID;

-- Task B5
SELECT a.AssignmentID,
       e.EmpName,
       p.ProjectName,
       d.DeptName AS ProjectDepartment
FROM Assignment a
INNER JOIN Employee e ON a.EmpID = e.EmpID
INNER JOIN Project p ON a.ProjectID = p.ProjectID
INNER JOIN Department d ON p.DeptID = d.DeptID;

-- Task B6
SELECT e.EmpName, a.WeeklyHours
FROM Employee e
INNER JOIN Assignment a ON e.EmpID = a.EmpID
INNER JOIN Project p ON a.ProjectID = p.ProjectID
WHERE p.ProjectName = 'Mobile App';

-- Task B7
SELECT e.EmpName, p.ProjectName, a.WeeklyHours
FROM Employee e
LEFT JOIN Assignment a ON e.EmpID = a.EmpID
LEFT JOIN Project p ON a.ProjectID = p.ProjectID
WHERE e.DeptID IN (
    SELECT d.DeptID
    FROM Department d
    WHERE d.Location = 'Lahore'
);

-- Task B8
SELECT DISTINCT e.EmpName
FROM Employee e
INNER JOIN Assignment a ON e.EmpID = a.EmpID
INNER JOIN Project p ON a.ProjectID = p.ProjectID
WHERE e.DeptID <> p.DeptID;

-- Task B9
SELECT d.DeptName, p.ProjectName
FROM Department d
LEFT JOIN Project p
    ON d.DeptID = p.DeptID
   AND p.StartDate >= '2024-01-01'
   AND p.StartDate < '2025-01-01';

-- Task B10
SELECT e.EmpName,
       COALESCE(SUM(a.WeeklyHours), 0) AS TotalWeeklyHours
FROM Employee e
LEFT JOIN Assignment a ON e.EmpID = a.EmpID
GROUP BY e.EmpID, e.EmpName;
