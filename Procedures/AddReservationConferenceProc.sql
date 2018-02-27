 Create PROCEDURE [dbo].[AddReservation_Conference] 
	@ConferenceID int, 
	@CustomerID int 
	AS BEGIN 
	SET NOCOUNT ON; 
	
-- SPRAWDZANIE POPRAWNOŚCI DANYCH 

		Declare @ConferenceIDCheck int 
		set @ConferenceIDCheck = (select ConferenceID from conference where conferenceID = @COnferenceID) 
		
		IF ( @ConferenceIDCheck is NUll) 
		BEGIN; 
			THROW 52000, 'There is no such conference.', 1 
		END 
		
		
		Declare @CustomerIDCheck int 
		set @CustomerIDCheck = (select CustomerID from Customers where CustomerID = @CustomerID)

		
		IF ( @CustomerIDCheck is NUll) 
		BEGIN; 
			THROW 52000, 'This Customer does not exist', 1
		END 
		---------------------------------------------- 
		
		DECLARE @ReservationID int 
		set @ReservationID = (select top 1 ReservationID from Reservation_Conference order by ReservationID desc) + 1 
		
		INSERT INTO Reservation_Conference(ReservationID, CustomerID,ConferenceID,DateOf-Reservation,DateOfPayment, Cancelled) 
		VALUES(@ReservationID, @CustomerID,@ConferenceID, GETDATE(), NUll, 0) 
	END