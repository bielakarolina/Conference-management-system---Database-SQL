 CREATE PROCEDURE [dbo].[AddConference] 
	@Name NVARCHAR(50), 
	@StartDate DATE, 
	@EndDate DATE, 
	@NUmberOfSeats INT, 
	@StudentDiscount REAL, 
	@Address VARCHAR(50), 
	@CountryName VARCHAR(50), 
	@CityName VARCHAR(50), 
	@Price MONEY 
	
	AS 
	BEGIN 
	SET NOCOUNT ON; 
		
		IF ( @StartDate > @EndDate) 
		BEGIN; 
			THROW 51000, 'EndDate should not be earlier than StartDate.', 1 
		END
		
		IF ( @StudentDiscount < 0 OR @StudentDiscount > 1) 
		BEGIN ; 
			THROW 51000, 'The discount must be between 0 and 1.',1 
		END 
		
		IF ( @StartDate < GETDATE()) 
		BEGIN; 
			THROW 51000, 'Conference cannot start in the past.', 1 
		END 
		
		IF @CountryName NOT IN (SELECT CountryName FROM Country) 
		BEGIN 
			DECLARE @CountryNewID INT 
			SET @CountryNewID = (SELECT TOP 1 CountryID FROM Country ORDER BY CountryID DESC)+1 
			INSERT INTO Country(CountryID,CountryName) 
			VALUES( @CountryNewID,@CountryName) 
		END 
		
		IF @CityName NOT IN (SELECT CityName FROM CityName) 
		BEGIN 
			DECLARE @CityNewID INT 
			SET @CityNewID = (SELECT TOP 1 CityID FROM CityName ORDER BY CityID DESC)+1 
			INSERT INTO CityName(CityID,CityName) 
			VALUES( @CityNewID,@CityName) 
		END
		
		DECLARE @CountryID INT 
		SET @CountryID = ( SELECT CountryID FROM Country WHERE CountryName = @CountryName ) 
		
		DECLARE @CityID INT 
		SET @CityID = ( SELECT CityID FROM CityName WHERE CityName = @CityName ) 
		
		DECLARE @ConferenceID INT 
		SET @ConferenceID = (SELECT TOP 1 ConferenceID FROM Conference ORDER BY conferenceid DESC) + 1 
		
		INSERT INTO Conference(ConferenceID, ConferenceName, Number_of_seats, Address,CityID,CountryID,StartDate,EndDate, StudentDiscount, Price) 
		VALUES (@ConferenceID, @Name, @NumberOfSeats, @Address, @CityID, @CountryID, @StartDate, @EndDate, @StudentDiscount, @Price) 
		
	END