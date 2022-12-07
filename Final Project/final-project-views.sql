/*Final Project Views

USE LuxuryAutos;
GO 
CREATE VIEW VeteranEmployees AS
SELECT EmployeeID, FirstName, LastName, CommissionLevel
FROM Employees
WHERE CommissionLevel > 6;

USE LuxuryAutos;
GO
CREATE VIEW TopSellingCars AS
SELECT Make, Model, InventoryMinimum-InventoryNumber AS NumberSold 
FROM Inventory

USE LuxuryAutos;
GO
CREATE VIEW DeliveryPending AS
SELECT CustFirstName, CustLastName, PhoneNumber, DeliveryStatus
FROM Deliveries JOIN Sales ON Deliveries.DeliveryNumber=Sales.DeliveryNumber
WHERE DeliveryStatus <> 'Delivered';

USE LuxuryAutos;
GO
CREATE VIEW NorthernDealerships AS
SELECT * FROM Dealerships
WHERE City IN ('Traverse City');

USE LuxuryAutos;
GO
Update NorthernDealerships
SET PhoneNumber = '231-899-0011' 
WHERE DealershipID = 4;*/


