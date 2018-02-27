CREATE PROCEDURE [dbo].[UpdateWorkshopNumberOfSeats] 
@NumberOfSeats INT, 
@WorkshopID INT 
AS BEGIN 
SET NOCOUNT ON; 
UPDATE dbo.Workshop 
SET Number_of_seats = @NumberOfSeats 
WHERE WorkshopID = @WorkshopID 
END 
GO