 CREATE PROCEDURE [dbo].[AddConferenceParticipant] 
	@ReservationID INT, 
	@ConferenceDayID INT, 
	@FirstName NVARCHAR(50), 
	@LastName NVARCHAR(50), 
	@StudentCardID INT, 
	@Expiration DATE, 
	@IsStudent BIT 
	
	AS 
	BEGIN 
	SET NOCOUNT ON; 
	
		DECLARE @CompanyName NVARCHAR(50) 
		DECLARE @CustomerID INT 
		
		SET @CustomerID = (SELECT CustomerID FROM Reservation_Conference 
							WHERE ReservationID = @ReservationID)
		
		IF (@CustomerID IN (SELECT IndividualCustomerID FROM IndividualCustomer)) 
		BEGIN; 
			SET @CompanyName = NULL 
			SET @IsStudent = (SELECT IndividualCustomerID 
								FROM IndividualCustomer 
								IndividualCustomerID = @CustomerID) 
		END 
		ELSE 
		BEGIN; 
			SET @CompanyName = (SELECT CompanyName FROM Company WHERE CompanyID = @CustomerID) 
		END 
		
		DECLARE @ConferenceParticipantID INT 
		SET @ConferenceParticipantID = (SELECT TOP 1 Conference_ParticipantID 
										FROM Conference_Participant 
										ORDER BY Conference_ParticipantID DESC) + 1 
		
		DECLARE @ConferenceID INT 
		SET @ConferenceID = (SELECT ConferenceID FROM Reservation_Conference 
								WHERE ReservationID = @ReservationID) 
		
		DECLARE @AlreadyRegistered INT 
		SET @AlreadyRegistered = (SELECT COUNT(@ConferenceParticipantID) 
									FROM dbo.Conference_Participant 
									WHERE ReservationID = @ReservationID AND ConferenceDayID = @ConferenceDayID) 
									
		DECLARE @ReservationDetailsID INT 
		SET @ReservationDetailsID = (SELECT @ReservationDetailsID 
									FROM dbo.Reservation-Details 
									WHERE ConferenceDayID = ConferenceDayID AND ReservationID = @ReservationID) 
		
		
		IF ((SELECT NumberOfPeople FROM dbo.ReservationDetails 
		WHERE ReservationDetailsID = @ReservationDetailsID) <= @AlreadyRegistered ) 
		BEGIN; 
			THROW 51000, 'You cannot add another participant because you have already registered all of reserved places', 0 
		END 
		
		INSERT INTO Conference_Participant(Conference_ParticipantID, ReservationID, ConferenceID, FirstName, LastName, Companyname) 
		VALUES(@ConferenceParticipantID, @ReservationID, @ConferenceID, @FirstName, @LastName, @CompanyName) 
		
		IF (@IsStudent =1 AND @Expiration IS NULL) 
		BEGIN; 
			THROW 51000, 'If participant is a student you need to add the epiration date of Student ID.', 0 
		END 
		
		IF (@IsStudent =1 AND @StudentCardID IS NULL) 
		BEGIN; 
			THROW 51000, 'If participant is a student you need to add Student ID number.', 0 
		END 
		
		IF(@IsStudent =1 AND @StudentCardID IS NOT NULL AND @Expiration IS NOT NULL) 
		BEGIN; 
			INSERT INTO Students(StudentID, Student_CardID, Expiration_Date) 
			VALUES(@ConferenceParticipantID, @StudentCardID, @Expiration) 
		END 
	END