/* SQL Practice Problems  by Sylvia Moestl Vasilik */
/* MySQL Solutions */
/* Intermediate Problems 20 to 31 */
SHOW DATABASES;
USE northwind;
SHOW TABLES;

/* Ex 20 */
SELECT  c.CategoryName, COUNT(*) AS ProductsPerCategory
FROM Categories c
INNER JOIN Products p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID
ORDER BY ProductsPerCategory DESC;

/* Ex 21 */
 SELECT  Country, City, COUNT(*) AS TotalCustomers
 FROM Customers 
 GROUP BY City
 ORDER BY TotalCustomers DESC;

/* Ex 22 */
SELECT ProductID, ProductName, UnitsInStock, ReorderLevel 
FROM Products 
WHERE UnitsInStock < ReorderLevel
ORDER BY ProductID;

/* Ex 23 */
SELECT ProductID, ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
FROM Products 
WHERE UnitsInStock + UnitsOnOrder <= ReorderLevel AND Discontinued = 0
ORDER BY ProductID;

/* Ex 24 */
SELECT CustomerID, CompanyName, Region FROM Customers
ORDER BY Region IS NULL, Region ASC, CustomerID ASC;

/* Ex 25 */
/* using built-in SUM function & calculating average */
SELECT ShipCountry, SUM(Freight) AS TotalFreightCharges, COUNT(ShipCountry) AS OdersPerCountry, SUM(Freight)/COUNT(ShipCountry) AS AvgFreight
FROM Orders
GROUP BY ShipCountry
ORDER BY AvgFreight DESC
LIMIT 0,3;
/* using built-in AVG function */
SELECT ShipCountry, AVG(Freight) AS AvgFreight
FROM Orders 
GROUP BY ShipCountry
ORDER BY AvgFreight DESC
LIMIT 0,3;

/* Ex 26 */
SELECT ShipCountry, AVG(Freight) AS AvgFreight
FROM Orders 
WHERE OrderDate > "1994-12-31" AND OrderDate < "1996-01-01" 
GROUP BY ShipCountry
ORDER BY AvgFreight DESC
LIMIT 0,3;

/* Ex 27 */


/* Ex 28 */
/* 1st method -- Not exactly correct, date interval of 12 MONTH counts exact date to date interval
/* cannot use Aggregate functions in a WHERE clause so SubQuery used */
SELECT ShipCountry, AVG(Freight) AS AvgFreight
FROM Orders 
WHERE  OrderDate >= DATE_SUB((SELECT MAX(OrderDate) FROM Orders), INTERVAL 12 MONTH) 
GROUP BY ShipCountry
ORDER BY AvgFreight DESC
LIMIT 0,3;
/* 2nd method */
SELECT ShipCountry, AVG(Freight) AS AvgFreight
FROM Orders 
WHERE YEAR(OrderDate) = YEAR((SELECT MAX(OrderDate) FROM Orders)) 
	  OR
      (YEAR(OrderDate) = YEAR((SELECT MAX(OrderDate) FROM Orders))-1
      AND
	  MONTH(OrderDate) > MONTH((SELECT MAX(OrderDate) FROM Orders)))
GROUP BY ShipCountry
ORDER BY AvgFreight DESC
LIMIT 0,3;

/* Ex 29 */
SELECT e.EmployeeID, LastName, d.OrderID, ProductName, Quantity
FROM `Order Details`d
INNER JOIN Products p
ON d.ProductID = p.ProductID
INNER JOIN Orders o
ON o.OrderID = d.OrderID
INNER JOIN Employees e
ON o.EmployeeID = e.EmployeeID
ORDER BY d.OrderID ASC, p.ProductID ASC
LIMIT 0,2500;


/* Ex 30 */
SELECT c.CustomerID AS Customers_CustomerID, o.CustomerID AS Orders_CustomerID
FROM Customers c
LEFT OUTER JOIN Orders o
ON o.CustomerID = c.CustomerID 
WHERE o.CustomerID IS NULL;

/* Ex 31 */
/* 1st method */
SELECT c.CustomerID, e.CustomerID 
FROM Customers c
LEFT OUTER JOIN (SELECT CustomerID FROM Orders WHERE EmployeeID = 4) e
ON c.CustomerID = e.CustomerID
WHERE e.CustomerID IS NULL;
/* 2nd method */
SELECT CustomerID
FROM Customers c
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders WHERE EmployeeID = 4) ;
/* 3rd method */
SELECT c.CustomerID, o.CustomerID 
FROM Customers c
LEFT OUTER JOIN Orders o
ON c.CustomerID = o.CustomerID AND o.EmployeeID = 4
WHERE o.CustomerID IS NULL;




