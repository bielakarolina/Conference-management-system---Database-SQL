 CREATE PROCEDURE [dbo].[AddConferenceDay] 
	@ConferenceID int 
	
	AS 
	BEGIN 	
	SET NOCOUNT ON;
	
		DECLARE @StartDate date 
		DECLARE @EndDate date 
		
		SET @EndDate = ( SELECT EndDate from Conference WHERE ConferenceID=@ConferenceID) 
		SET @StartDate = ( SELECT StartDate from Conference WHERE ConferenceID=@ConferenceID) 
		
		DECLARE @Day int 
		DECLARE @Date date

		SET @Date = @StartDate 
		
		DECLARE @ConferenceDayID int 
		WHILE (@Date<=@EndDate) 
		BEGIN 
			SET @Day = day(@Date) 
			SET @ConferenceDayID =concat(@Day,0,@ConferenceID) 
			INSERT INTO ConferenceDay(ConferenceDayID,ConferenceID,DateConferenceDay) 
			VALUES (@ConferenceDayID,@ConferenceID,@Date) 
			
			SET @Date = DATEADD(day,1,@Date) 
		END 
	END