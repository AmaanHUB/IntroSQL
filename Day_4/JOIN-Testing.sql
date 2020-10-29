/*
 * JOIN-Testing.sql
 * Copyright (C) 2020
 *
 * Distributed under terms of the MIT license.
 */

-- Get information for units on order for each supplier, give company name
SELECT Suppliers.CompanyName, AVG(Products.UnitsOnOrder) AS 'Mean Units on Order' FROM Products
INNER JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Suppliers.CompanyName
ORDER BY AVG(Products.UnitsOnOrder) DESC;

-- vim:et
