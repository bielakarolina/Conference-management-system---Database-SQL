CREATE PROCEDURE [dbo].[UpdateConferenceNumberOfSeats] 
@NumberOfSeats INT, 
@ConferenceID INT 
AS BEGIN 
SET NOCOUNT ON; 
UPDATE dbo.Conference 
SET Number_of_seats = @NumberOfSeats 
WHERE ConferenceID = @ConferenceID 
END 
GO