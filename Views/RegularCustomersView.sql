CREATE VIEW [dbo].[RegularCustomers] 
AS 
SELECT TOP 100 CustomerID, COUNT(CustomerID) AS [Number of Conferences] 
FROM dbo.Reservation_Conference 
GROUP BY CustomerID 
ORDER BY COUNT(CustomerID) DESC GO