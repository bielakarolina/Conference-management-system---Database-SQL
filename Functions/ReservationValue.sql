--ReservationValue 
CREATE FUNCTION [dbo].[ReservationValue] (@ReservationID int) 
RETURNS money 
AS BEGIN 
RETURN(dbo.Reservation_ConferenceValue(@ReservationID) + dbo.Reservation_Workshop-Value(@ReservationID)); 
END 
GO