CREATE VIEW [dbo].[CancelledReservations] 
AS 
SELECT RC.ReservationID, IC.FirstName + ' ' + IC.LastName AS [Customer Name] 
FROM Reservation_Conference as RC 
JOIN IndividualCustomer as IC ON IC.IndividualCustomerID = RC.CustomerID 
WHERE RC.Cancelled = 1 
UNION 
SELECT RC.ReservationID, C.CompanyName AS [Customer Name] 
FROM Reservation_Conference as RC JOIN Company as C 
ON C.CompanyID = RC.CustomerID 
WHERE RC.Cancelled = 1 GO