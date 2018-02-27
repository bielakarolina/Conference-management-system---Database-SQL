--Funkcja workshopsCollision – zwraca 1 w przypadku, gdy dane warsztaty odbywaj¹ siê w tym samym czasie i 0 w przeciwnym przypadku. 
CREATE FUNCTION [dbo].[CollisionsInWorkshops] (@workshopID1 int, @workshopID2 int) RETURNS bit 
AS BEGIN 
DECLARE @start_time1 time(7); 
DECLARE @end_time1 time(7); 
DECLARE @date1 date; 
DECLARE @start_time2 time(7); 
DECLARE @end_time2 time(7); 
DECLARE @date2 date; 
DECLARE @collision bit; 

SET @start_time1 = (SELECT Start_time FROM Workshop WHERE workshopID = @workshop-ID1) 
SET @end_time1 = (SELECT end_time FROM Workshop WHERE workshopID = @workshopID1) 
SET @date1 = (SELECT DateConferenceDay FROM ConferenceDay AS cd INNER JOIN Workshop AS w 
				ON w.ConferenceDayID = cd.ConferenceDayID where w.WorkshopID = @workshopID1) 
SET @start_time2 = (SELECT start_time FROM Workshop WHERE workshopID = @workshop-ID2) 
SET @end_time2 = (SELECT end_time FROM Workshop WHERE workshopID = @workshopID2) 
SET @date2 = (SELECT DateConferenceDay FROM ConferenceDay AS cd
				INNER JOIN Workshop AS w ON w.ConferenceDayID = cd.ConferenceDayID WHERE w.WorkshopID = @workshopID2) 

IF((@date1 = @date2) AND (@start_time1 < @end_time2 OR @start_time2 < @end_time1)) 
	SET @collision = 1 
ELSE SET @collision = 0 
RETURN @collision 
END 
GO