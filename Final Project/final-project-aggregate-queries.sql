/*USE LuxuryAutos;
SELECT Dealerships.City, COUNT(EmployeeID) AS 'Employees Per City'
FROM Employees JOIN Dealerships ON 
		Employees.DealershipID = Dealerships.DealershipID
GROUP BY Dealerships.City;


USE LuxuryAutos;
SELECT Make, MAX(MSRP) AS 'Highest Priced Car', MIN(MSRP) AS 'Lowest Priced Car'
FROM Inventory
GROUP BY Make
ORDER BY MAX(MSRP) DESC;

USE LuxuryAutos;
SELECT Make, SUM(InventoryMinimum -InventoryNumber) 'Make Popularity'
FROM Inventory
WHERE InventoryMinimum -InventoryNumber > 0
GROUP BY Make 
ORDER BY SUM(InventoryMinimum -InventoryNumber) DESC;

USE LuxuryAutos;
SELECT Employees.EmployeeID, MAX(MSRP) AS 'Highest Sale', MIN(MSRP) AS 'Lowest Sale',
			AVG(MSRP) AS 'Average Sales'
FROM SALES JOIN Employees ON Sales.EmployeeID = Employees.EmployeeID
		JOIN Inventory ON Sales.CarID = Inventory.CarID
GROUP BY Employees.EmployeeID
ORDER BY AVG(MSRP) DESC;*/
