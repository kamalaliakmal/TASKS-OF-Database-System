-- LAB 08 — Joins Part 01: INNER, LEFT, RIGHT Joins
-- Company schema
-- Tables assumed: Employee, Department, Project, Assignment

-- Task A1
SELECT e.EmpName, d.DeptName, d.Location
FROM Employee e
INNER JOIN Department d ON e.DeptID = d.DeptID;

-- Task A2
SELECT e.EmpName, d.DeptName, d.Location
FROM Employee e
LEFT JOIN Department d ON e.DeptID = d.DeptID;

-- Task A3
SELECT d.DeptName, e.EmpName
FROM Department d
LEFT JOIN Employee e ON d.DeptID = e.DeptID;

-- Task A4
SELECT p.ProjectName, d.DeptName, d.Location
FROM Project p
LEFT JOIN Department d ON p.DeptID = d.DeptID;

-- Task A5
SELECT e.EmpID, e.EmpName
FROM Employee e
LEFT JOIN Assignment a ON e.EmpID = a.EmpID
WHERE a.EmpID IS NULL;

-- Task A6
SELECT p.ProjectID, p.ProjectName
FROM Project p
LEFT JOIN Assignment a ON p.ProjectID = a.ProjectID
WHERE a.ProjectID IS NULL;

-- Task A7
SELECT e.EmpName, e.Salary
FROM Employee e
INNER JOIN Department d ON e.DeptID = d.DeptID
WHERE d.DeptName = 'Engineering'
ORDER BY e.Salary DESC;

-- Task A8
SELECT e.EmpName, d.DeptName
FROM Employee e
INNER JOIN Department d ON e.DeptID = d.DeptID
WHERE d.Location = 'Lahore';

-- Task A9
SELECT d.DeptName, COUNT(e.EmpID) AS EmployeeCount
FROM Department d
LEFT JOIN Employee e ON d.DeptID = e.DeptID
GROUP BY d.DeptID, d.DeptName;

-- Task A10
SELECT e.EmpID, e.EmpName, d.DeptID, d.DeptName
FROM Employee e
LEFT JOIN Department d ON e.DeptID = d.DeptID

UNION

SELECT e.EmpID, e.EmpName, d.DeptID, d.DeptName
FROM Department d
LEFT JOIN Employee e ON e.DeptID = d.DeptID
WHERE e.EmpID IS NULL;
