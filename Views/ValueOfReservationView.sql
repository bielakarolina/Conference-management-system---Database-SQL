 CREATE VIEW [dbo].[ValueOfReservation] 
 AS 
 SELECT ReservationID, dbo.ReservationValue(ReservationID) AS Value 
 FROM dbo.Reservation_Conference