-- LAB 10 — Scalar Functions Part 01: String Functions
-- File: 2024-SE-38_ScalarFunctions_Lab10.sql

-- Task A1
SELECT CustID, CustName AS OriginalCustName, TRIM(CustName) AS CleanedName
FROM Customer;

-- Task A2
SELECT CustID, UPPER(CustName) AS UpperName, LOWER(CustName) AS LowerName
FROM Customer;

-- Task A3
SELECT CustID, TRIM(CustName) AS TrimmedName, CHAR_LENGTH(TRIM(CustName)) AS CharacterCount
FROM Customer;

-- Task A4
SELECT CustID, CONCAT('Dear ', TRIM(CustName), ', welcome!') AS Greeting
FROM Customer;

-- Task A5
SELECT CustName,
       SUBSTRING_INDEX(Email, '@', 1) AS Username
FROM Customer
WHERE Email IS NOT NULL AND Email <> '';

-- Task A6
SELECT CustName,
       SUBSTRING_INDEX(Email, '@', -1) AS Domain
FROM Customer
WHERE Email IS NOT NULL AND Email <> '';

-- Task A7
SELECT CustID, LEFT(TRIM(CustName), 3) AS First3Characters
FROM Customer;

-- Task A8
SELECT CustID,
       CONCAT(LEFT(Phone, 4), 'XXX-XXXX') AS MaskedPhone
FROM Customer
WHERE Phone IS NOT NULL AND Phone <> '';

-- Task A9
SELECT ProdID,
       REPLACE(ProdName, ' ', '-') AS SlugName
FROM Product;

-- Task A10
SELECT ProdID,
       LPAD(ProdID, 5, '0') AS PaddedProdID
FROM Product;

-- Task A11
SELECT ProdID, ProdName, LOCATE('Pro', ProdName) AS ProPosition
FROM Product
WHERE LOCATE('Pro', ProdName) > 0;

-- Task A12
SELECT CustID,
       SUBSTRING(TRIM(CustName), 1, LOCATE(' ', TRIM(CustName)) - 1) AS FirstName
FROM Customer
WHERE LOCATE(' ', TRIM(CustName)) > 0;
