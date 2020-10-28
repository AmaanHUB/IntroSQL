/*
 * WHEN-Arithmetic.sql
 * Copyright (C) 2020 Amaan Hashmi-Ubhi <AHashmi-Ubhi@spartaglobal.com>
 *
 * Distributed under terms of the MIT license.
 */


SELECT TOP 2 OrderID ,UnitPrice, Quantity, Discount, CONVERT(DECIMAL(10,2),(UnitPrice * Quantity) * (1 -Discount)) AS "Net-Total" FROM [Order Details]
ORDER BY [Net-Total] DESC;

select ProductName as 'Products with an apostrophe'
from Products
where charindex('''', ProductName) != 0;


SELECT FirstName + ' ' + LastName AS Name,
DATEDIFF(yy, BirthDate, GETDATE()) AS Age, CASE
WHEN DATEDIFF(yy, BirthDate, GETDATE()) >= 65 THEN 'Retired'
WHEN DATEDIFF(yy, BirthDate, GETDATE()) > 60 THEN  'Nearing retirement'
ELSE 'More than 5 years to go'
END AS RetirementStatus
FROM Employees;

-- vim:et
