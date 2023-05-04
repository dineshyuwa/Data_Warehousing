USE Customers

CREATE TABLE Customers (
    CustomerID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);


INSERT INTO Customers (CustomerID, LastName,FirstName, Address, City)
VALUES (1, 'Tom','Erichsen', 'Skagen 21', 'Stavanger'),
(2, 'Tom','Erichen', 'Skagen 21', 'Stavanger'),
(3, 'Yuwa','dinesh', 'oslo 21', 'oslo'),
(4, 'Yuwa','dines', 'oslo 21', 'oslo'),
(5, 'Athavan','Theivendram', 'somalia 23', 'somalia'),
(6, 'Gugatharshan','guga', 'canda 21', 'toronto')
;

delete  from Customers;

select * from Customers;

CREATE TABLE FuzzyLookUp (
    CustomerID int,
     LastName varchar(255),
     FirstName varchar(255)
);


INSERT INTO FuzzyLookUp (CustomerID, LastName,FirstName)
VALUES (1, 'Tom','Erichsen'),
(2, 'Yuwa','dinesh'),
(3, 'Athavan','Theivendram'),
(4, 'Gugatharshan','guga')
;

