
CREATE VIEW [dbo].[ReservationConferenceToCancelled] 
as 
SELECT rc.ReservationID, rc.CustomerID,DATEDIFF(day,rc.DateOfReservation, GETDATE())as DateDifference 
FROM Reservation_Conference as rc 
WHERE DATEDIFF(day,rc.DateOfReservation, GETDATE()) > 7 and rc.DateOfPayment is null GO