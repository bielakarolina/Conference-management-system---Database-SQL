CREATE PROCEDURE [dbo].[AddReservationWorkshop] 
@NumberOfPeople INT, 
@ReservationID INT, 
@WorkshopID INT 
AS BEGIN 
SET NOCOUNT ON; 
IF (@ReservationID NOT IN (SELECT ReservationID FROM dbo.Reservation_Conference)) 
	BEGIN; 
	THROW 52000, 'There is no reservation with this ID.', 1 
	END 
DECLARE @ReservationDetailsID INT 
SET @ReservationDetailsID = (SELECT ReservationDetailsID FROM dbo.Reservation-Details 							 WHERE ConferenceDayID = (SELECT ConferenceDayID 
							FROM dbo.Workshop WHERE WorkshopID = @WorkshopID)
							AND @ReservationID = ReservationID) 
IF @ReservationDetailsID IS NULL 
BEGIN; 
	THROW 52000, 'There is no reservation on this day.', 1 
END 

DECLARE @CustomerID INT 
SET @CustomerID = (SELECT CustomerID FROM dbo.Reservation_Conference) 

IF (@CustomerID IN (SELECT IndividualCustomerID FROM dbo.IndividualCustomer) AND @NumberOfPeople > 1) 
BEGIN; 
	THROW 52000, 'Individual customer can reserve only one place in workshop.', 1 
END 

DECLARE @NumberOfPeopleForDay int 
SET @NumberOfPeopleForDay=(SELECT NumberOfPeople FROM dbo.ReservationDetails WHERE ReservationDetailsID=@ReservationDetailsID)
 
IF @NumberOfPeople>@NumberOfPeopleForDay 
BEGIN; 
	THROW 52000, 'You do not booked enough seats for that day.', 1 
END 

DECLARE @TakenPlaces INT 
SET @TakenPlaces = (SELECT SUM(NumberOfPeople) FROM Reservation_Workshop AS rw WHERE rw.workshopID = @workshopID)
DECLARE @AllPlaces INT 
SET @AllPlaces = (SELECT W.number_of_seats FROM Workshop w WHERE @WorkshopID = w.WorkshopID) DECLARE @FreePlaces INT 
SET @FreePlaces = @AllPlaces - @TakenPlaces 

IF (@freePlaces < @NumberOfPeople) BEGIN; 
	THROW 52000, 'Number of free places is smaller than number of people you want to register for this workshop.', 1 
END 
---------------------------------------------- 
DECLARE @ReservationWorkshopID INT 
SET @ReservationWorkshopID = (SELECT TOP 1 Reservation_WorkshopID FROM 								Reservation_Workshop ORDER BY Reservation_WorkshopID 							  DESC) + 1 
INSERT INTO Reservation_Workshop(Reservation_WorkshopID, ReservationID,Workshop-ID,NumberOfPeople, Cancelled) 
VALUES(@ReservationWorkshopID,@ReservationID,@WorkshopID, @NumberOfPeople, 0) 
END 
GO