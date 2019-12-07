use master

drop database if exists RabbitDB

create database RabbitDB
go

use RabbitDB
go

drop table if exists Rabbits
go

CREATE TABLE Rabbits(
RabbitID INT NOT NULL IDENTITY PRIMARY KEY,
RabbitName VARCHAR(50) NOT NULL,
RabbitAge INT NOT NULL
)