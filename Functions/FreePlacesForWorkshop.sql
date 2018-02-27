CREATE FUNCTION [dbo].[FreePlacesForWorkshop] (@workshopID int) 
RETURNS int 
AS BEGIN 
DECLARE @allPlaces int; 
SET @allPlaces = (SELECT Number_of_seats FROM Workshop WHERE workshopID = @workshopID) DECLARE @takenPlaces int; 
SET @takenPlaces = (SELECT SUM(NumberOfPeople) FROM Reservation_Workshop WHERE workshopID = @workshopID) 
RETURN (@allPlaces - @takenPlaces); 
END 
GO