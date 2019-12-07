-- create own database

use master

drop database if exists testDB

create database testDB
go

drop table if exists testTable
go

drop table if exists testTables2
go

create table testTable(
testTableId INT,
testName VARCHAR(20),
)


INSERT INTO testTable values (1, 'fred')

SELECT * FROM testTable

/*AUTO COMMENTS*/
-- we use IDENTITY to auto increment the ID
-- IDENTITY(start value, increment)
-- IDENTITY (1,1)
create table testTables2(

   testTable2Id INT NOT NULL IDENTITY(1000, 10), 
   testName VARCHAR(20)
)

INSERT INTO testTables2 values ('fred')
INSERT INTO testTables2 values ('Tom')
INSERT INTO testTables2 values ('Frank')
Select * from testTables2


drop table if exists Orders
drop table if exists Customers
go



create table Customers(
CustomersID INT NOT NULL IDENTITY PRIMARY KEY,
CustomersName VARCHAR(50),
IsDeleted BIT NULL,
DateCreate Date NUll
)

CREATE Table Orders(
OrderID INT NOT NULL IDENTITY PRIMARY KEY,
TotalValue FLOAT,
CustomersID INT NOT NULL,
FOREIGN KEY (CustomersID) REFERENCES Customers (CustomersID)  

)
/* create 2 customers and one order with customer 2 ID*/
INSERT INTO Customers VALUES ('Bill', 1, '2019-11-13')
INSERT INTO Customers VALUES ('Tina', 0, GETDATE())
INSERT INTO Orders VALUES (100.56,1)
INSERT INTO Orders VALUES (200.78,2)
SELECT * FROM Customers
SELECT * FROM Orders


SELECT COUNT(*) AS 'Number of Customers' FROM Customers
SELECT COUNT(*)  'Number of Customers' FROM Customers 