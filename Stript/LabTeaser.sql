use master
go

drop database if exists Taskdb
go

drop table if exists ToDo
go

drop table if exists Catergories
go

create database Taskdb

CREATE TABLE Categories(
CategoryId INT NOT NULL IDENTITY,
CategoryName NVARCHAR(50)
)

CREATE TABLE ToDo(
TodoId INT NOT NULL IDENTITY PRIMARY KEY,
Descriptions NVARCHAR(50) NULL,
Done BIT NULL,
DateCompleted  DATE,
--FOREIGN KEY (CategoryId) REFERENCES Categories (CategoryId)
)

SELECT * FROM Categories
SELECT * FROM ToDo

     
        

 

  
