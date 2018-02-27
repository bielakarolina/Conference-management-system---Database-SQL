CREATE PROCEDURE [dbo].[AddWorkshop] 
@ConferenceID int, 
@WorkshopName nvarchar(50), 
@ConferenceDayID int, 
@Number_of_seats int, 
@Price_Workshop money, 
@Address nvarchar(50), 
@Start_time datetime, 
@End_time datetime 
AS BEGIN 
SET NOCOUNT ON; 

IF ( @Start_time > @End_time) 
BEGIN; 
	THROW 51000, 'EndDate should not be earlier than StartDate.', 1 
END
Declare @StartDate date 
set @startDate = (select StartDate from Conference where ConferenceID = @ConferenceID) Declare @EndDate Date 
set @endDate = (select EndDate from Conference where ConferenceID = @ConferenceID) IF ( @Start_time < @StartDate) 
Declare @NumberOfPeopleInConference int 
set @NumberOfPeopleInConference = (select Number_of_seats from Conference where ConferenceID = @ConferenceID) 

IF ( @Start_time < @StartDate) 
BEGIN; 
	THROW 51000, 'Start_time should be contained in Conference time.', 1 
END 
IF ( @EndDate < @End_time) 
BEGIN; 
	THROW 51000, 'End_time should be contained in Conference time.', 1 
END 
IF ( @NumberOfPeopleInConference < @Number_of_seats) 
BEGIN; 
THROW 51000, 'Number of people on workshop has to be smaller than number of people on conference', 1 
END 
IF @WorkshopName not in (select WorkshopName from WorkshopType) 
BEGIN 

DECLARE @WorkshopNewTypeID int 
SET @WorkshopNewTypeID = (Select top 1 WorkshopTypeID from WorkshopType order by WorkshopTypeID desc) + 1 

INSERT INTO WorkshopType(WorkshopTypeID ,WorkshopName) 
VALUES (@WorkshopNewTypeID,@WorkshopName) 
END 

DECLARE @WorkshopTypeID int 
SET @WorkshopTypeID = (SELECT WorkshopTypeID FROM WorkshopType WHERE @WorkshopName = WorkshopName) 
DECLARE @WorkshopID int 
set @WorkshopID = (Select top 1 WorkshopID from Workshop order by WorkshopID desc) + 1

INSERT INTO Workshop(WorkshopID, WorkshopTypeID,ConferenceID,ConferenceDayID, Number_of_seats,Price_Workshop, Address,Start_time,End_time) 
VALUES (@WorkshopID, @WorkshopTypeID, @ConferenceID,@ConferenceDay-ID,@Number_of_seats,@Price_Workshop, @Address,@Start_time, @End_time ) 
END 
GO