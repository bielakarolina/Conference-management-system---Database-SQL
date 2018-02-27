CREATE FUNCTION [dbo].[ConferenceDayFreePlaces] (@ConferenceDayID int) 
RETURNS int 
AS BEGIN 
DECLARE @Number_of_seats int; 
SET @Number_of_seats = (SELECT c.Number_of_seats FROM Conference as c inner join ConferenceDay as cd on c.ConferenceID = cd.ConferenceID where cd.ConferenceDayID = @ConferenceDayID) DECLARE @takenPlaces int; SET @takenPlaces = (SELECT SUM(rd.NumberOfPeople) FROM ReservationDetails as rd WHERE rd.ConferenceDayID = @ConferenceDayID) 
RETURN (@Number_of_seats - @takenPlaces); 
END 
GO