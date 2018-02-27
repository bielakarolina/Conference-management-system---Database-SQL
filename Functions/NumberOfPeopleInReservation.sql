CREATE FUNCTION [dbo].[NumberOfPeopleInReservation] (@ReservationId INT) 
RETURNS INT 
AS BEGIN 
DECLARE @NumberOfPeople INT 
SET @NumberOfPeople = (SELECT SUM(NumberOfPeople) FROM dbo.ReservationDetails WHERE ReservationID = 
						@ReservationId) 
RETURN @NumberOfPeople 
END 
GO