/* Final Project Procedures

USE LuxuryAutos;
GO
CREATE PROC spDeliveredCars
AS

SELECT * FROM Deliveries
WHERE DeliveryStatus = 'Delivered';

CREATE PROC spCarBudget
		@LoanMax money
AS 

SELECT * FROM Inventory
WHERE MSRP < @LoanMax;

CREATE PROC spEmployeeCount
		@LocationID int,
		@EmpCount int OUTPUT
AS 

SELECT COUNT(*) FROM Employees
WHERE DealershipID = @LocationID;

CREATE PROC spInventoryRequirements
			@CarID int
AS
DECLARE @InventoryNeeds int;

DECLARE @EmpCount int;
EXEC spEmployeeCount 2, @EmpCount OUTPUT;
PRINT @EmpCount;

SELECT @InventoryNeeds = (InventoryMinimum - InventoryNumber) FROM Inventory
WHERE @CarId = CarID;
RETURN @InventoryNeeds;

DECLARE @InventoryNeeds int;
EXEC @InventoryNeeds = spInventoryRequirements 1201;
PRINT @InventoryNeeds;*/



/* Final Project User Defined Functions

CREATE FUNCTION fnModelSales
		(@CarModel varchar(50))
		Returns int
BEGIN
	RETURN(SELECT CarID FROM Inventory WHERE Model = @CarModel)
END;

SELECT OrderID, CustFirstName, CustLastName FROM Sales
WHERE CarID = dbo.fnModelSales('F8 Tributo');

CREATE FUNCTION fnEmployeePromotion
		(@DealershipID int)
		RETURNS table
RETURN 
	(SELECT EmployeeID, FirstName, LastName 
		FROM Employees JOIN CommissionRate ON Employees.CommissionLevel = CommissionRate.CommissionLevel
		WHERE EmploymentYears > ServiceYears AND DealershipID = @DealershipID);

--Done for function testing purposes 
	UPDATE Employees
	SET EmploymentYears = 1 
	WHERE EmployeeID = 6;

SELECT * FROM dbo.fnEmployeePromotion(3);*/

/* Final Project Triggers

CREATE Table DeliveredSales (OrderID Int NOT NULL Primary Key,
							CustFirstName varchar(50) NOT NULL,
							CustLastName varchar(50) NOT NULL,
							PhoneNumber varchar(50) NOT NULL,
							EmployeeID int NOT NULL REFERENCES Employees(EmployeeID),
							CarID int NOT NULL REFERENCES Inventory (CarID),
							DeliveryNumber varchar(50) NOT NULL REFERENCES Deliveries(DeliveryNumber))

CREATE TRIGGER Sales_Delete
		ON Deliveries
		AFTER DELETE 
AS 
	INSERT INTO DeliveredSales (OrderId, CustFirstName, CustLastName, 
								PhoneNumber, EmployeeID, CarID, DeliveryNumber)
				SELECT OrderID, CustFirstName, CustLastName, PhoneNumber, EmployeeID,
						CarID, DeliveryNumber
				FROM Deleted;

DELETE Sales
WHERE DeliveryNumber IN (SELECT DeliveryNumber FROM Deliveries WHERE DeliveryStatus = 'Delivered');

CREATE TABLE EmployeeLocationArchive (ArchiveNumber int IDENTITY Primary KEY,
										EmployeeID int NOT NULL REFERENCES Employees(EmployeeID),
										DealershipID int NOT NULL References Dealerships(DealershipID));

		CREATE TRIGGER Employee_Location_Insert
		ON Employees
		AFTER INSERT
AS
		INSERT INTO EmployeeLocationArchive (EmployeeID, DealershipID)
			SELECT EmployeeID, DealershipID FROM Inserted

INSERT Employees 
Values('Lori', 'Stevenson', '1', '2022-11-02', 0, 5);


CREATE TRIGGER Employee_Location_Update
		ON Employees
		AFTER Update
AS
		INSERT INTO EmployeeLocationArchive (EmployeeID, DealershipID)
			SELECT EmployeeID, DealershipID FROM Inserted

UPDATE Employees
SET DealershipID = 4
WHERE EmployeeID = 9;*/