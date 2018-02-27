CREATE FUNCTION [dbo].[NumberOfParticipantsByReservation] (@ReservationId INT) 
RETURNS INT 
AS BEGIN 
DECLARE @NumberOfParticipants int 
SET @NumberOfParticipants = (SELECT COUNT(Conference_participantID) FROM dbo.Conference_Participant WHERE 								ReservationID = @ReservationId)
RETURN @NumberOfParticipants 
END 
GO