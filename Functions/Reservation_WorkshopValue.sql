CREATE FUNCTION [dbo].[Reservation_WorkshopValue] (@ReservationID int) 
RETURNS money 
AS BEGIN 
DECLARE @Licznik INT 
SET @Licznik= (SELECT count(ReservationID) FROM reservation_workshop 
WHERE Reservation-ID=@ReservationID) 
DECLARE @Reservation_WorkshopID INT 
DECLARE @Value1 INT 
SET @Reservation_WorkshopID=0 
SET @Value1=0 
DECLARE @Value INT 
SET @Value=0 
WHILE @Licznik>0 
BEGIN 
DECLARE @WorkshopID INT 
SET @WorkshopID=(SELECT TOP 1 WorkshopID FROM dbo.Reservation_Workshop WHERE ReservationID=@ReservationID AND 				  Reservation_WorkshopID>@Reservation_-WorkshopID) 
DECLARE @Price int 
SET @Price=(SELECT Price_Workshop FROM Workshop WHERE WorkshopID=@WorkshopID) 
DECLARE @NumberOfPeople INT 
SET @NumberOfPeople=(SELECT TOP 1 NumberOfPeople FROM dbo.Reservation_Workshop 
					 WHERE ReservationID=@ReservationID AND WorkshopID=@WorkshopID AND Reservation_WorkshopID>@Reservation_WorkshopID) 
SET @Reservation_WorkshopID=(SELECT TOP 1 Reservation_WorkshopID FROM dbo.Reservation_Workshop 
							 WHERE ReservationID=@ReservationID AND Reservation_Workshop-ID>@Reservation_WorkshopID)
SET @Value1=@Price*@NumberOfPeople 
SET @Value=@Value+@Value1 
SET @Licznik=@Licznik-1 
END 
RETURN(@Value); 
END 
GO