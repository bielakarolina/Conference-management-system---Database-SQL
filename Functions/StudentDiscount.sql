CREATE FUNCTION [dbo].[StudentDiscount] (@ReservationID INT) 
RETURNS REAL 
AS BEGIN 
DECLARE @SDiscount REAL;
DECLARE @CustomerID INT; 
SET @SDiscount = (SELECT studentDiscount FROM Conference c 
				  INNER JOIN dbo.Reservation_Conference AS rc 
				  ON Rc.ConferenceID = c.ConferenceID 
				  WHERE rc.ReservationID = @ReservationID) 
RETURN @SDiscount 
END 
GO
