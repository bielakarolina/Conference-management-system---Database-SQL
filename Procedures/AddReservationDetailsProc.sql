 CREATE procedure [dbo].[AddReservationDetails] 
	@ReservationID int, 
	@NumberOfDay int, 
	@NumberOfPeople int, 
	@NumberOfStudents int 
 
	AS BEGIN 
	SET NOCOUNT ON; 
	
--Conference id wyciągam z rezarwacji. przyda mi się 2 razy 

		Declare @ConferenceID int 
		SET @ConferenceID =(select ConferenceID from Reservation_Conference where ReservationID = @ReservationID)
		
		
		DECLARE @ConferenceDayID int 
		SET @ConferenceDayID = (select ConferenceDayID from ConferenceDay 
								where ConferenceID = @ConferenceID 
								and DateConferenceDay = (select DateAdd(DD, @NumberOfDay -1, startDate) 
										from Conference where ConferenceID = @ConferenceID))

		--dodawanie indywidualnego klienta jako participanta conf 
		
		DECLARE @CustomerID int 
		SET @CustomerID = (select CustomerID from Reservation_Conference where ConferenceID = @ConferenceID) 
		if (@CustomerID in (select IndividualCustomerID from IndividualCustomer 
							where @ConferenceID = IndividualCustomerID) AND @NumberOfPeople>1) 
		BEGIN; 
			THROW 52000, 'Individual Customer can not be multiplied, unless he or she is a Holy Trinity then Individual Customer can be three people at once.', 1 
		END 
		--SPRAWDZANIE DANYCH 
		
		
		Declare @PeopleInConference int 
		SET @PeopleInConference = (dbo.ConferenceDayFreePlaces(@ConferenceDayID)) 
		
		Declare @EndDate date 
		Set @EndDate = (select EndDate from Conference where ConferenceID = @ConferenceID) 
		
		IF @NumberOfPeople < @NumberOfStudents 
		Begin; 
			THROW 52000, 'Students are people too! Number of students must be smaller than number of people.', 1 
		END 
		
		IF @NumberOfPeople > (select Number_Of_Seats from Conference where conferenceID = @ConferenceID) 
		Begin;
			THROW 52000, 'Number of people must be smaller than number of seats in conference.', 1 
		END 
		
		IF ( @EndDate < (select DateAdd(DD, @NumberOfDay -1, startDate) from Conference where ConferenceID = @ConferenceID)) 
		BEGIN; 
			THROW 51000, 'There is less days in a conference!', 1 
		END 
		
		IF ( @NumberOfPeople > @PeopleInConference) 
		BEGIN; 
			THROW 51000, 'Number of seats you want to reserve is bigger than number of places left for this conference.', 1 
		END 
		
		
		Declare @ReservationIDCheck int 
		set @ReservationIDCheck = (select ReservationID from Reservation_Conference where ReservationID = @ReservationID) 
		IF ( @ReservationIDCheck is NUll) 
		BEGIN; 
			THROW 51000, 'There is no such conference.', 1 
		END 
		------------------------------------------------------ 
		
		DECLARE @ReservationDetailsID int 
		SET @ReservationDetailsID = (select top 1 ReservationDetailsID from ReservationDetails order by ReservationDetailsID desc) + 1 
		
		INSERT INTO ReservationDetails(ReservationDetailsID,ReservationID,ConferenceDayID,NumberOf-People,Cancelled) 
		VALUES( @ReservationDetailsID, @ReservationID, @ConferenceDayID,@NumberOfPeople, 0) 
	END