CREATE VIEW [dbo].[ConferenceParticipants] 
AS 
SELECT c.conferenceID, c.ConferenceName,cp.FirstName, cp.Lastname, cp.Companyname 
FROM Conference_Participant AS cp 
INNER JOIN Conference AS c 
ON c.ConferenceID = cp.ConferenceID 
INNER JOIN dbo.Reservation_Conference RC 
ON Cp.ReservationID = RC.ReservationID 
WHERE RC.Cancelled = 0 AND c.ConferenceID=cp.ConferenceID