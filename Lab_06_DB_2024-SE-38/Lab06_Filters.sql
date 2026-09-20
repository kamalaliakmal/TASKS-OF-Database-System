-- Lab06 -- Part A: Comparison & Logical Operators
-- Employee table columns assumed:
-- EmpID, EmpName, Gender, Salary, City, Department, JobTitle, HireDate

-- Task A1
SELECT EmpID, EmpName, Salary
FROM Employee
WHERE Salary > 90000;

-- Task A2
SELECT EmpName, Salary
FROM Employee
WHERE Salary <= 75000;

-- Task A3
SELECT *
FROM Employee
WHERE City = 'Lahore' AND Salary > 90000;

-- Task A4
SELECT EmpName, City
FROM Employee
WHERE City = 'Karachi' OR City = 'Islamabad';

-- Task A5
SELECT *
FROM Employee
WHERE Gender = 'Female' AND Department <> 'Engineering';

-- Task A6
SELECT *
FROM Employee
WHERE Gender = 'Male'
  AND Salary >= 70000
  AND Salary <= 90000;

-- Task A7
SELECT *
FROM Employee
WHERE JobTitle = 'Software Engineer' OR Salary > 100000;

-- Task A8
SELECT *
FROM Employee
WHERE Department <> 'Marketing'
  AND Department <> 'Sales';
