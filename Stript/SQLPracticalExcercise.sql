use Northwind
go 

/*
Question 1

1.1 --- 5
1.2 --- 5
1.3 ---5
1.4 ---5
1.5 ---5
1.6 ---5
1.7 ---5
1.8 ---5

Total Out of 40/40 , 5 marks each

Question 2

2.1 --20

Total out of 20/20


Question 3

3.1 ---5
3.2 ---5
3.3 ---6
3.4 ---10

Total out of  26/30

Total 86/90
Standards 10/10

Grand total 96/100

Marked by Nathan
*/








-- Question 1 

--1.1
-- In this query statement I list all the customers that are either in Paris or London.
SELECT CustomerID, CompanyName, Address, PostalCode, City, Region 
FROM Customers 
WHERE City IN ('Paris', 'London')

--1.2
--I this query I list all the products by calling the product name that are stored in bottle.
SELECT ProductName FROM Products WHERE QuantityPerUnit LIKE ('%bottle%')

--1.3
-- Again repeating the query above and also adding in the Supplier Name and Country from the Suppliers Table.
SELECT P.ProductName, S.ContactName,S.Country  
FROM Products P
JOIN Suppliers S
ON P.SupplierID = S.SupplierID
WHERE QuantityPerUnit LIKE ('%bottle%')

--1.4
--Writing an SQL Statement that shows how many products there are in each category. 
--and also including Category Name in result set and list the highest number firstin order.
SELECT C.CategoryName, COUNT(P.ProductName) 'Number Of Products' FROM Categories C
JOIN Products P
ON C.CategoryID = P.CategoryID 
GROUP BY C.CategoryName
ORDER BY COUNT(P.ProductName) DESC


--1.5
-- Listing all UK employees using concatenation to join their title of courtesy, first name and last name together.
-- I also included their city of residence.
SELECT CONCAT(TitleOfCourtesy, FirstName,' ', LastName) AS 'Residents Full Names', 
City 
FROM Employees
WHERE Country LIKE 'UK'

--1.6

--Listing Sales Totals for all Sales Regions (via the Territories table using 4 joins) with a Sales Total greater than 1,000,000. 
-- And using rounding to present the numbers.

SELECT  R.RegionDescription AS 'Region', ROUND(SUM(OD.Quantity*OD.UnitPrice),2) AS 'Total Sales'  FROM Territories T
JOIN Region R
ON T.RegionID = R.RegionID
JOIN EmployeeTerritories ET
ON ET.TerritoryID = T.TerritoryID
JOIN Orders O 
ON O.EmployeeID = ET.EmployeeID
JOIN [Order Details] OD
ON OD.OrderID = O.OrderID
GROUP BY R.RegionDescription
HAVING ROUND(SUM(OD.Quantity*OD.UnitPrice),2) > 1000000


--1.7
--I have written a query statement to count how many Orders have a Freight amount greater than 100.00 and either USA or UK as Ship Country.
SELECT COUNT(OrderID) AS 'Number of Orders' FROM Orders WHERE 
Freight > 100.00 AND ShipCountry IN ('USA','UK')


--1.8
--Wrote an SQL Statement to identify the Order Number of the Order with the highest amount of discount applied to that order.
SELECT TOP 1 OrderID AS 'Order Number'
FROM [Order Details] OD
ORDER BY (OD.Quantity * OD.UnitPrice* OD.Discount) DESC



-- Question 2

--2.1
-- drops the table when it already exists.
drop table if exists Spartans
go


-- Table has been created run the code SELECT * FROM Spartans
-- you will find all the column names  and their allocated values
-- that are inserted.
CREATE TABLE Spartans(
SpartansID INT NOT NULL IDENTITY,
Title NVARCHAR(50) NOT NULL,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
UniversityAttended VARCHAR(50) NOT NULL,
CourseTaken VARCHAR(50) NOT NULL,
GradeAchieved NVARCHAR(50) NOT NULL,
GraduationDate DATE NOT NULL,
PRIMARY KEY (SpartansID)
)

--SELECT * FROM Spartans

-- I have already ran the Insert query, hence you will find the values already been inserted 
-- When you run the ' Select * from Spartans ' you will see the table with the same values as the ones below

SET IDENTITY_INSERT Spartans ON
INSERT INTO Spartans(SpartansID, Title, FirstName, LastName, UniversityAttended, CourseTaken, GradeAchieved, GraduationDate) 

VALUES
(1, 'Mr.', 'Bob', 'Spender', 'UCL', 'Computing Bcs (Hons)', '2:1', '2018-06-25'),
(2, 'Mr.', 'Gary', 'White', 'Brunel University', 'Law BA(Hons)', '2:2', '2019-07-26'),
(3, 'Mrs.', 'Kim', 'Tracy', 'City University', 'Art BA(Hons)', '1st', '2017-12-17'),
(4, 'Miss.', 'Mai', 'Grey', 'Westminster University Of London', 'Computer Science Bcs(Hons)', '2:1', '2019-07-22'),
(5, 'Mis.', 'Katy', 'Moore', 'University Of Greenwitch', 'Pysics (BA(Hons)', '2:2', '2016-07-28'),
(6, 'Mr.', 'Brandy', 'Crown', ' University Of East London', 'Electronic Engineering Beng (Hons)', '2:2', '2018-06-23'),
(7, 'Mr.', 'Ben', 'Karren', ' Queen Mary University Of London', 'Electrical Engineering Meng (Hons)', '2:1', '2018-07-28'),
(8, 'Miss.', 'Wendy', 'Brown', ' Manchester University', 'Nano Technology Bcs(Hons)', '3rd', '2019-07-27'),
(9, 'Mrs.', 'Jona', 'Bella', ' University Of Oxford', 'medicine MBBS(Hons)', '1st', '2019-06-25'),
(10, 'Mrs.', 'Jona', 'Bella', ' University Of Cambridge', 'Aeronautical Engineering Meng(Hons)', '2:1', '2017-06-28')


SET IDENTITY_INSERT Spartans OFF


SELECT * FROM Spartans -- run this code to see the  full table for Q2.1


-- Question 3

-- 3.1
-- This query below lists all the employees from the Employees table
-- and the name of the person who they report to.
-- SELECT * FROM Employees

SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ', LastName) AS 'Full Name', 
CASE 
WHEN ReportsTo LIKE 2 THEN 'Andrew Fuller'
WHEN ReportsTo LIKE 5 THEN 'Steven Buchanan'
WHEN ReportsTo LIKE NULL THEN NULL
END AS ReportsToTheFollowingNames

FROM Employees


--3.2
-- In this query statement it lists all supplies with total sales(including discount)
-- over $10,000 in the Order Details table. I have included the companies Name
-- I have exported the table into excel file an made the graph  
SELECT S.CompanyName, ROUND(SUM(OD.Quantity * OD.UnitPrice * (1-OD.Discount)),2) AS 'Supplier Total' FROM Suppliers S
JOIN Products P ON P.SupplierID = S.SupplierID
JOIN [Order Details] OD ON OD.ProductID = P.ProductID
GROUP BY S.CompanyName
HAVING SUM(OD.Quantity * OD.UnitPrice * (1-OD.Discount)) > 10000



--3.3
-- In this query I have listed the Top 10 Customers of the latest year in the Orders file.
-- Based on total dollar amount of orders shipped.
SELECT TOP(10) C.ContactName,
ROUND(SUM(OD.Quantity * OD.UnitPrice * (1-OD.Discount)),2) AS 'The Total Order Value In Dollars ($)'
FROM Orders O
JOIN Customers C ON C.CustomerID = O.CustomerID
JOIN [Order Details] OD ON OD.OrderID = O.OrderID
WHERE O.ShippedDate LIKE '%1998%'
GROUP BY C.ContactName

SELECT * FROM Orders


--3.4
-- This query allows me to Plot the Average Ship Time by month for all data in the Orders Table.
SELECT AVG(DATEDIFF(DAY, OrderDate, ShippedDate)) AS 'The Average Shipping Time', CONCAT(DATEPART(MONTH, OrderDate) , ' - ' , DATEPART(YEAR, OrderDate) ) AS 'Month And Year'
FROM Orders WHERE OrderDate IS NOT NULL
GROUP BY  DATEPART(MONTH, OrderDate), DATEPART(YEAR, OrderDate)
ORDER BY DATEPART(YEAR, OrderDate) ASC, DATEPART(MONTH, OrderDate) ASC  








