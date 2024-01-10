create database OnlineShopping;
USE OnlineShopping;
drop table if exists Products; 
drop table if exists Manifacturer; 
drop table if exists Supplied;

CREATE TABLE Manifacturer(ID varchar(100), name varchar(100), city varchar(100), primary key (ID));
CREATE TABLE Products(ID varchar(100), Name varchar(100), Price varchar(100), primary key (ID));
CREATE TABLE Supplied(ManifacturerID varchar(100), ProductID varchar(100), estimated_delivery timestamp, 
primary key (ManifacturerID, ProductID), foreign key(ManifacturerID) references Manifacturer(ID), 
foreign key (ProductID) references Products(ID));

INSERT INTO Manifacturer values("001","Pusuny","New York");
INSERT INTO Manifacturer values("022","Moredots","Washington DC");
INSERT INTO Manifacturer values("012","DayOfShe","Seattle");
INSERT INTO Manifacturer values("125","Aselfad","Los Angeles");

INSERT INTO Products values("A24","Wine Bottle Lights","$35");
INSERT INTO Products values("F56","Christmas Flowers Rose","$14");
INSERT INTO Products values("Y85","Custum Blancket","$12");
INSERT INTO Products values("H14","Heart Necklace","$30");

 INSERT INTO Supplied values("001","A24","2023-11-22");
 INSERT INTO Supplied values("001","Y85","2022-08-23");
 INSERT INTO Supplied values("022","F56","2020-07-11");
 INSERT INTO Supplied values("022","H14","2021-12-24");
 INSERT INTO Supplied values("012","A24","2015-05-17");
 INSERT INTO Supplied values("012","Y85","2018-03-16");
 INSERT INTO Supplied values("125","H14","2023-12-23");
 INSERT INTO Supplied values("125","F56","2000-05-24");
 
 SELECT Products.Name, Products.Price, Supplied.estimated_delivery FROM ((Products INNER JOIN Supplied ON Products.ID=Supplied.ProductID) INNER JOIN Manifacturer ON Manifacturer.ID=Supplied.ManifacturerID);
 
 DROP TABLE Supplied;
 DROP TABLE Manifacturer;
  DROP TABLE Products;