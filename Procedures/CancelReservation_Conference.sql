Create PROCEDURE [dbo].[CancelReservation_Conference] 
@Reservation_ConferenceID int 
AS BEGIN 
SET NOCOUNT ON;
 --SPRAWDZANIE DANYCH 
 Declare @ConfIDCheck int 
 set @ConfIDCheck = (select ReservationID from Reservation_Conference where ReservationID = @Reservation_ConferenceID) 
 IF ( @ConfIDCheck is NULL) 
 BEGIN; 
	THROW 51000, 'There is no such conference',1 
 END 
 ------------------------------------
UPDATE Reservation_Conference 
SET Cancelled = 1 WHERE ReservationID = @Reservation_ConferenceID 
END 
GO