use Northwind;

-- 1.1
SELECT CustomerID, CompanyName, Address + ', ' + PostalCode AS ADDRESS FROM Customers
WHERE City = 'London' OR City = 'Paris';

-- 1.2
SELECT ProductID, ProductName, QuantityPerUnit FROM Products
WHERE QuantityPerUnit LIKE '%bottle%';

-- 1.3
SELECT ProductID, 
    ProductName,
    QuantityPerUnit, 
    Suppliers.CompanyName,
    Suppliers.Country
    FROM Products
    JOIN Suppliers ON
    Products.SupplierID = Suppliers.SupplierID
WHERE QuantityPerUnit LIKE '%bottle%';

-- 1.4
SELECT Categories.CategoryName, 
    COUNT(Products.ProductName) AS
        'Number is Groups' 
    FROM Products
    JOIN Categories ON
    Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryName;

-- 1.5
SELECT TitleOfCourtesy + ' ' 
    + FirstName + ' '
    + LastName AS
        'Name', 
    City + ', ' +
    Country AS 'Location'  
FROM Employees;


-- 1.6

SELECT Territories.RegionID,
FORMAT(SUM([Order Details].UnitPrice * [Order Details].Quantity), '###,###,###') AS
    'Sales Total'
FROM Territories
INNER JOIN EmployeeTerritories ON
Territories.TerritoryID = EmployeeTerritories.TerritoryID
INNER JOIN Employees ON
EmployeeTerritories.EmployeeID = Employees.EmployeeID
INNER JOIN Orders ON
Employees.EmployeeID = Orders.EmployeeID
INNER JOIN [Order Details] ON
Orders.OrderID = [Order Details].OrderID
GROUP BY Territories.RegionID
HAVING SUM([Order Details].Quantity * [Order Details].UnitPrice) > 1000000;

-- 1.7

SELECT COUNT(*) AS 'Orders with Freight Over 100' FROM Orders
WHERE Freight > 100 AND 
(ShipCountry = 'UK' OR ShipCountry = 'USA');

-- 1.8

SELECT TOP 1 * FROM [Order Details]
ORDER BY Discount DESC;





-- 2.1 

CREATE DATABASE Exercise2_1;
CREATE TABLE Course(
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(11),
    StartDate DATE
)

CREATE TABLE Academy(
    AcademyID INT PRIMARY KEY,
    AcademyName VARCHAR(32)
)

CREATE TABLE Rooms(
    RoomID INT PRIMARY KEY,
    RoomName VARCHAR(32),
)

CREATE TABLE Booking(
    BookingID INT PRIMARY KEY,
    AcademyID INT REFERENCES Academy(AcademyID),
    RoomID INT REFERENCES Rooms(RoomID)
)

CREATE TABLE Trainer(
    TrainerID INT PRIMARY KEY,
    FirstName VARCHAR(32),
    LastName VARCHAR(32)
)

CREATE TABLE Spartan(
    SpartanID INT PRIMARY KEY,
    FirstName VARCHAR(32),
    LastName VARCHAR(32),
);
