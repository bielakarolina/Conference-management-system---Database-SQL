CREATE FUNCTION [dbo].[GetDiscount] (@ReservationID INT) 
RETURNS REAL 
AS BEGIN 
DECLARE @Disc REAL 
SET @Disc = (SELECT TOP 1 Discount FROM Discounts INNER JOIN Conference AS c ON c.ConferenceId = Discounts.				ConferenceID INNER JOIN dbo.Reservation_Conference RC ON RC.ConferenceID = c.ConferenceID 
			 WHERE RC.ReservationID = @ReservationID And DATEDIFF(dd,RC.DateOfReservation,c.StartDate ) > Discounts.DateDifference) RETURN @Disc 
END 
GO