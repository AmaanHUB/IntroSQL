USE Northwind;

-- Number of employees in London
SELECT COUNT(*) FROM Employees
WHERE City = 'London';


-- Which is doctor?
SELECT FirstName, LastName FROM Employees
WHERE TitleOfCourtesy = 'Dr.';

-- How many products are discontinued?
SELECT COUNT(DISTINCT ProductName) FROM Products
WHERE Discontinued = 1;

-- What are the name and product IDs 
-- of products below <5 
SELECT ProductID, ProductName FROM Products
WHERE UnitPrice < 5;

-- Category name with initials beginning with B or S
SELECT CategoryName FROM Categories
WHERE CategoryName LIKE 'B%' OR CategoryName LIKE 'S%';

-- How many orders for Employee 5 and 7?
SELECT COUNT(OrderID) FROM Orders
WHERE EmployeeID = 5 AND EmployeeID = 7;

-- Concatenation with first and last name employee
SELECT FirstName + ' ' + LastName AS 'Employee Name' FROM Employees;

-- Region codes to list six countries
SELECT DISTINCT(Country) FROM Customers
WHERE Region != 'NULL';