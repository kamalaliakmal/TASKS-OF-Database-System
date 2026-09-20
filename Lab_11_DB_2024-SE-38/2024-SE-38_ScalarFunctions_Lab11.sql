-- LAB 11 — Scalar Functions Part 02: Numeric & Date/Time Functions
-- File: 2024-SE-38_ScalarFunctions_Lab11.sql

-- Task B1
SELECT ProdName,
       Price,
       ROUND(Price * 0.85, 2) AS DiscountedPrice
FROM Product;

-- Task B2
SELECT ProdName,
       ROUND(Price * 0.17, 2) AS Tax,
       ROUND(Price + (Price * 0.17), 2) AS PriceWithTax
FROM Product;

-- Task B3
SELECT ProdName,
       Price,
       FLOOR(Price / 1000) AS FloorVal,
       CEIL(Price / 1000) AS CeilVal
FROM Product;

-- Task B4
SELECT ProdName,
       Price,
       ROUND(Price, -2) AS RoundedPrice
FROM Product;

-- Task B5
SELECT ProdID, ProdName
FROM Product
WHERE MOD(ProdID, 2) = 1;

-- Task B6
SELECT CustID,
       YEAR(JoinDate) AS JoinYear,
       MONTHNAME(JoinDate) AS JoinMonth,
       DAYNAME(JoinDate) AS JoinDay
FROM Customer;

-- Task B7
SELECT CustID,
       DATE_FORMAT(DOB, '%d-%M-%Y') AS FormattedDOB
FROM Customer;

-- Task B8
SELECT CustName,
       DOB,
       TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS Age
FROM Customer;

-- Task B9
SELECT CustName,
       JoinDate,
       DATEDIFF(CURDATE(), JoinDate) AS DaysSinceJoin
FROM Customer;

-- Task B10
SELECT CustID, CustName, JoinDate
FROM Customer
WHERE YEAR(JoinDate) = 2023;

-- Task B11
SELECT ProdID, ProdName, LaunchDate
FROM Product
WHERE MONTH(LaunchDate) IN (10, 11, 12);

-- Task B12
SELECT CustID, CustName, JoinDate
FROM Customer
WHERE JoinDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- Task B13
SELECT ProdName,
       LaunchDate,
       DATEDIFF(CURDATE(), LaunchDate) AS AgeInDays
FROM Product;

-- Task B14
SELECT ProdName,
       LaunchDate,
       DATE_ADD(LaunchDate, INTERVAL 90 DAY) AS NinetyDaysLater
FROM Product;

-- Task B15
SELECT CONCAT(
           'Hello ',
           UPPER(TRIM(CustName)),
           ', age ',
           TIMESTAMPDIFF(YEAR, DOB, CURDATE()),
           ', joined ',
           DATE_FORMAT(JoinDate, '%b %Y')
       ) AS Summary
FROM Customer;
