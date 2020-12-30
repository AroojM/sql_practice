/* SQL Practice Problems  by Sylvia Moestl Vasilik */
/* MySQL Solutions */
/* Easy Problems 1 to 19 */
SHOW DATABASES;
USE northwind;
SHOW TABLES;

/* Ex 1 */
SELECT * FROM shippers;

/* Ex 2 */
SELECT  CategoryName, Description FROM Categories;

/* Ex 3 */
SELECT  FirstName, LastName, HireDate FROM Employees WHERE Title = 'Sales Representative';

/* Ex 4 */
SELECT  FirstName, LastName, HireDate FROM Employees WHERE Title = 'Sales Representative' AND Country = 'USA';

/* Ex 5 */
SELECT OrderID, OrderDate FROM Orders WHERE EmployeeID = 5;

/* Ex 6 */
SELECT SupplierID, ContactName, ContactTitle FROM Suppliers WHERE ContactTitle != 'Marketing Manager';

/* Ex 7 */
SELECT ProductID, ProductName FROM products WHERE ProductName LIKE '%queso%';

/* Ex 8 */
SELECT OrderID, CustomerID, ShipCountry FROM orders WHERE ShipCountry = 'Belgium' OR ShipCountry = 'France';

/* Ex 9 */
SELECT OrderID, CustomerID, ShipCountry FROM orders WHERE ShipCountry in ('Brazil','Mexico','Argentina','Venezuela') ;

/* Ex 10 */
SELECT FirstName, LastName, Title, BirthDate FROM employees ORDER BY BirthDate;

/* Ex 11 */
SELECT FirstName, LastName, Title, CAST(BirthDate as DATE) FROM employees ORDER BY BirthDate ;

/* Ex 12 */
/* temporary showing a column */
SELECT LastName, FirstName, CONCAT(FirstName," ",LastName) AS FullName FROM employees;
/* creating & updating values in a column */
ALTER TABLE employees 
  ADD COLUMN FullName varchar(25) 
  AFTER FirstName;
UPDATE employees 
SET FullName = CONCAT(FirstName," ",LastName);

/* Ex 13 */
ALTER TABLE `Order Details` 
  ADD COLUMN 	`Total Price` float 
  AFTER Quantity;
UPDATE `Order Details` 
  SET `Total Price` = UnitPrice * Quantity;
/* backticks when table name has spaces Also default limit of rows 1000*/
SELECT OrderID, ProductID, UnitPrice, Quantity, `Total Price` 
  FROM `Order Details` 
  ORDER BY OrderID, ProductID LIMIT 0, 2500; 

/* Ex 14 */
SELECT COUNT(*) AS TotalCustomers FROM Customers; 

/* Ex 15 */
SELECT MIN(OrderDate) AS FirstOrderDate FROM Orders; 

/* Ex 16 */
SELECT Country  
  FROM Customers 
  GROUP BY Country 
  ORDER BY Country;

/* Ex 17 */
SELECT ContactTitle, COUNT(ContactTitle) AS TotalContactTitle  
FROM Customers 
GROUP BY ContactTitle 
ORDER BY TotalContactTitle; 

/* Ex 18 */
SELECT p.ProductID, p.ProductName, s.CompanyName 
FROM Products p 
  INNER JOIN Suppliers s 
  ON p.SupplierID = s.SupplierID 
ORDER BY ProductID;

/* Ex 19 */
SELECT o.OrderID, CAST(o.OrderDate AS DATE) AS `Order Date`, s.CompanyName AS Shipper
FROM Orders o 
  INNER JOIN Shippers s 
  ON o.ShipVia = s.ShipperID
  HAVING o.OrderID < 10300
ORDER BY o.OrderID ; 
