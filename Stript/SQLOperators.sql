-- products in stock 
 SELECT COUNT(*) as 'NUMBER OF PRODUCTS IN STOCK' from Products where UnitsInStock > 0

-- products in stock and not discuntinued
 SELECT COUNT(*) as 'NUMBER OF PRODUCTS NOT DISCUNTUED' from Products where UnitsInStock >0 AND Discontinued != 1
-- products in stock > 29.99 unitprice

SELECT COUNT(*) as 'NUMBER OF PRODUCTS IN STOCK > 29.99 ' from Products where UnitsInStock > 0 AND  UnitPrice> 29.99

SELECT ProductName, UnitPrice, UnitsOnOrder FROM Products

SELECT ProductName, UnitPrice, UnitsOnOrder, (UnitPrice * UnitsOnOrder) AS OrderValue FROM Products

SELECT ProductName, UnitPrice, UnitsOnOrder, (UnitPrice * UnitsOnOrder) AS OrderValue FROM Products WHERE UnitsOnOrder > 0

SELECT SUM(UnitPrice * UnitsOnOrder) AS TOTALORDERVALUE FROM Products 


-- statistical values max min average sum
-- repeat and get  max order value , min order value, average order value
-- max
-- min
-- average

SELECT MAX(UnitPrice * UnitsOnOrder) AS TOTALORDERVALUEmax FROM Products WHERE UnitsOnOrder > 0

SELECT MIN(UnitPrice * UnitsOnOrder) AS TOTALORDERVALUEmin FROM Products WHERE UnitsOnOrder > 0

SELECT ROUND(AVG(UnitPrice * UnitsOnOrder),2) AS TOTALORDERVALUEavgRound FROM Products WHERE UnitsOnOrder > 0

-- REPEAT ORDER DETAILS
-- add another column discount
--  so we list product , unitprice, 

SELECT ProductId, UnitPrice, Quantity, 
(UnitPrice * Quantity) 
AS OrderValue 
FROM [Order Details]
WHERE Quantity > 0

-- GET TOTAL OF ALL ORDERS DETAILS ON ORDER
--SELECT * FROM Orders	

-- SUM
SELECT SUM(UnitPrice * Quantity)  AS TOTALORDER FROM [Order Details] WHERE Quantity	>0	

-- AVG
SELECT AVG(UnitPrice * Quantity)  AS TOTALORDERAVG FROM [Order Details] WHERE Quantity	>0	

-- MIN
SELECT MIN(UnitPrice * Quantity)  AS TOTALORDERMIN FROM [Order Details] WHERE Quantity	>0	

-- MAX
SELECT MAX(UnitPrice * Quantity)  AS TOTALORDER FROM [Order Details] WHERE Quantity	>0	








