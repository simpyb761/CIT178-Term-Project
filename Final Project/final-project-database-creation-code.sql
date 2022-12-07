CREATE DATABASE LuxuryAutos;
GO

USE LuxuryAutos;
CREATE TABLE CommissionRate
(CommissionLevel DECIMAL NOT NULL PRIMARY KEY,
ServiceYears INT NOT NULL,
ProfitSales MONEY NOT NULL,
BaseCommision DECIMAL NOT NULL,
BonusCommission DECIMAL NOT NULL);

CREATE TABLE Dealerships
(DealershipID INT NOT NULL PRIMARY KEY IDENTITY,
City VARCHAR(50) NOT NULL,
StreetAddress VARCHAR(50) NOT NULL,
ZipCode VARCHAR(50) NOT NULL,
PhoneNumber VARCHAR(50) NOT NULL);

CREATE TABLE Inventory
(CarID INT NOT NULL PRIMARY KEY,
Make VARCHAR(50) NOT NULL,
Model VARCHAR(50) NOT NULL,
MSRP MONEY NOT NULL,
InventoryNumber INT NOT NULL,
InventoryMinimum INT NOT NULL);

CREATE TABLE Deliveries
(DeliveryNumber VARCHAR(50) NOT NULL PRIMARY KEY,
DeliverySpeed VARCHAR(50) NULL,
StreetAddress VARCHAR(50) NULL,
City VARCHAR(50) NULL,
State CHAR(2) NULL,
DeliveryStatus VARCHAR(50) Null);

CREATE TABLE Employees
(EmployeeID INT NOT NULL PRIMARY KEY IDENTITY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
CommissionLevel DECIMAL NOT NULL
			REFERENCES CommissionRate(CommissionLevel),
EmploymentDate DATE NOT NULL,
EmploymentYears INT NOT NULL,
DealershipID INT NOT NULL
			REFERENCES Dealerships(DealershipID));

CREATE TABLE Sales
(OrderID INT NOT NULL PRIMARY KEY,
CustFirstName VARCHAR(50) NOT NULL,
CustLastName VARCHAR(50) NOT NULL,
PhoneNumber VARCHAR(50) NOT NULL,
EmployeeID INT NOT NULL
			REFERENCES Employees(EmployeeID),
CarID INT NOT NULL
			REFERENCES Inventory(CarID),
DeliveryNumber VARCHAR(50) NOT NULL
			REFERENCES Deliveries(DeliveryNumber));

CREATE INDEX IX_Employees_CommissionLevel
			ON Employees(CommissionLevel);
CREATE INDEX IX_Employees_DealershipID
			ON Employees(DealershipID);
CREATE INDEX IX_Sales_EmployeeID
			ON Sales(EmployeeID);
CREATE INDEX IX_Sales_CarID
			ON Sales(CarID);
CREATE INDEX IX_Sales_DeliveryNumber
			On Sales(DeliveryNumber);
