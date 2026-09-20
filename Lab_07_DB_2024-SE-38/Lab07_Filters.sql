-- Lab07 -- Part B: BETWEEN, IN, LIKE, IS NULL, ORDER BY, LIMIT
-- Employee table columns assumed:
-- EmpID, EmpName, Gender, Salary, City, Department, JobTitle, HireDate

-- Task B1
SELECT *
FROM Employee
WHERE Salary BETWEEN 75000 AND 100000
ORDER BY Salary ASC;

-- Task B2
SELECT *
FROM Employee
WHERE HireDate BETWEEN '2020-01-01' AND '2022-12-31';

-- Task B3
SELECT *
FROM Employee
WHERE Salary NOT BETWEEN 80000 AND 100000;

-- Task B4
SELECT *
FROM Employee
WHERE City IN ('Lahore', 'Islamabad')
ORDER BY City ASC, Salary DESC;

-- Task B5
SELECT *
FROM Employee
WHERE Department NOT IN ('Engineering', 'Sales', 'HR');

-- Task B6
SELECT EmpName
FROM Employee
WHERE EmpName LIKE 'M%';

-- Task B7
SELECT *
FROM Employee
WHERE LOWER(EmpName) LIKE '%a%';

-- Task B8
SELECT *
FROM Employee
WHERE EmpName LIKE '%an';

-- Task B9
SELECT *
FROM Employee
WHERE JobTitle LIKE '%Engineer%'
  AND Department <> 'Engineering';

-- Task B10
SELECT EmpName
FROM Employee
WHERE City IS NULL;

-- Task B11
SELECT *
FROM Employee
WHERE City IS NOT NULL
ORDER BY City ASC;

-- Task B12
SELECT EmpName, Salary
FROM Employee
ORDER BY Salary DESC
LIMIT 3;

-- Task B13
SELECT *
FROM Employee
ORDER BY HireDate DESC
LIMIT 5;

-- Task B14
SELECT *
FROM Employee
ORDER BY Salary ASC
LIMIT 3;

-- Task B15
SELECT *
FROM Employee
ORDER BY Department ASC, HireDate ASC;
