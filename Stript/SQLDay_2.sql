use Northwind
go

/*SP_help Customers

SELECT * FROM sysdatabases
SELECT * FROM SYS.TABLES
SELECT * FROM SYS.OBJECTS*/

SELECT * FROM Customers

SELECT City FROM Customers
SELECT COUNT(City) FROM Customers

SELECT DISTINCT City FROM Customers

SELECT COUNT( DISTINCT City) FROM Customers

SELECT COUNT( DISTINCT Country) FROM Customers

SELECT COUNT(*) FROM Customers WHERE City IN ( 'London', 'Sao Paulo', 'Madrid') -- the use of "IN"to choose pecify the exact name

SELECT ProductName FROM Products WHERE ProductName LIKE 'ch%' 
SELECT COUNT( ProductName) FROM Products WHERE ProductName LIKE 'ch%'



SELECT ProductName FROM Products WHERE ProductName LIKE '%ch%' 
SELECT COUNT( ProductName) FROM Products WHERE ProductName LIKE '%ch%'


SELECT ProductName FROM Products WHERE ProductName LIKE '[ABC]%' 
SELECT COUNT( ProductName) FROM Products WHERE ProductName LIKE '[ABC]%' 
--"LIKE"is used when you want to find a pattern or contains some keywords that you know but forgot the whole name of the item for instance



-- GROUP BY
-- GROUP BY IS USED WITH OUR STATISTICAL FIELDS
-- TO GROUP RESULTS BY THE SUM/COUNT ETC ON A PARTICULAR COLUMN

SELECT COUNT(CITY) FROM Customers
SELECT CITY FROM Customers ORDER BY City

SELECT COUNT(CustomerID) AS 'COUNT', City 
FROM Customers
GROUP BY City
HAVING COUNT(CustomerID) > 1
ORDER BY COUNT(CustomerID) DESC

SELECT COUNT(CustomerID)  AS 'TOTAL', Country 
FROM Customers
GROUP BY Country


-- must be in order as you see it the:	GROUP BY and HAVING 
SELECT COUNT(CustomerID) AS 'COUNT', City 
FROM Customers
WHERE City IN ('London', 'Madrid', 'Sao Paulo')
GROUP BY City
HAVING COUNT(CustomerID) > 1
ORDER BY COUNT(CustomerID) DESC

SELECT COUNT(ProductName), CategoryID FROM Products 
GROUP BY CategoryID


SELECT COUNT(ProductName), CategoryID FROM Products
WHERE CategoryID = 2
GROUP BY CategoryID






