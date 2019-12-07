use master
go 

DROP DATABASE IF EXISTS SchoolBooksDB
GO

CREATE DATABASE SchoolBooksDB
GO

 DROP TABLE IF EXISTS SBInventory
 GO

 DROP TABLE IF EXISTS SBOrders
 GO

  DROP TABLE IF EXISTS Students
 GO

 USE SchoolBooksDB
 GO

 CREATE TABLE SBOrders(
 OrderBooksId INT PRIMARY KEY NOT NULL,
 BookInventoryID INT NULL,
 Subject VARCHAR(50) NULL,
 BookName VARCHAR (50) NULL,
 ExamBoardAndLevel VARCHAR (50) NULL,
 BookType VARCHAR (50) NULL,
 QuantityOrdered INT NULL,
 TotalCostOfBooks DECIMAL NULL,
 DateOrdered DATE NULL,
 DateOrderRecieved DATE NULL,
 Notes VARCHAR (100) NULL,
 -- FOREIGN KEY
FOREIGN KEY (BookInventoryId) REFERENCES SBInventory (BookInventoryId)

)
	INSERT INTO SBOrders VALUES(1,1, 'Maths', 'CGP Target book year 6', 'KS2', 'StudyBook', 2, 9.98, '2019-11-24','2019-11-26', '')
 	INSERT INTO SBOrders VALUES(2,2, 'Maths', 'CGP Mathematics Higher', 'Edexcel (H)', 'StudyBook', 3, 15.98, '24-11-2019','26-11-2019', '')


CREATE TABLE Students(
StudentID INT IDENTITY PRIMARY KEY NOT NULL,
OrderBooksID INT NULL,
FirstName VARCHAR(50) NULL,
LastName VARCHAR(50) NULL,
SchoolYear INT NULL,
Subjects VARCHAR(50) NULL,
ExamBoardAndLevel VARCHAR(50) NULL,
BooksRecieved BIT NULL,
BookStatus VARCHAR(50) NULL,

--FOREIGN KEY
 FOREIGN KEY (OrderBooksId) REFERENCES SBOrders (OrderBooksId)

)

INSERT INTO Students VALUES(1,'Aabida', 'Alee', 6, 'Maths and English', 'KS2', 1, 'Available' )
 INSERT INTO Students VALUES(2,'Khalid', 'Mellow',9,'Maths English and Double Science', 'AQA and Edexcel (H) ', 0, 'Ordered')

CREATE TABLE SBInventory(
BookInventoryId INT IDENTITY PRIMARY KEY NOT NULL,
Subject VARCHAR(50) NULL,
BookName VARCHAR (50) NULL,
ExamBoardAndLevel VARCHAR (50) NULL,
BookType VARCHAR (50) NULL,
BookSatus VARCHAR(50)NULL,
QuantityInStock INT NULL,
Notes VARCHAR(100) NULL
)
	INSERT INTO SBInventory VALUES('Maths', 'CGP Target book year 6', 'KS2', 'StudyBook', 'Available', 2, '' )
	INSERT INTO SBInventory VALUES('Maths', 'CGP Mathematics Higher ', 'Edexcel(H)', 'StudyBook', 'Available', 3, '' )

DELETE FROM Students
DELETE FROM SBOrders
DELETE FROM SBInventory

SELECT * FROM Students
SELECT * FROM SBOrders
SELECT * FROM SBInventory


                           