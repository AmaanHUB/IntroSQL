/*
 * Join-Testing.sql
 * Copyright (C) 2020 Amaan Hashmi-Ubhi <AHashmi-Ubhi@spartaglobal.com>
 *
 * Distributed under terms of the MIT license.
 */

-- Query to practice JOINING
-- Get customer information for location of Brazil, using primary key CustomerID from Customers and foreign key CustomerID from Orders
-- Choosing appropriate to show, and group by
-- group by has to have all the columns that you want to show also, since it cannot deal with duplicates naturally
SELECT
    Customers.CustomerID,
    Customers.ContactName,
    Customers.Phone,
    Orders.ShipCity,
    Orders.ShipCountry
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.ShipCountry = 'Brazil'
GROUP BY
    Customers.CustomerID,
    Customers.ContactName,
    Customers.Phone,
    Orders.ShipCity,
    Orders.ShipCountry;


-- vim:et
