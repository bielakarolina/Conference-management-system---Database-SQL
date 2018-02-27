CREATE VIEW [dbo].[ConferenceDayParticipants] 
AS 
SELECT 
c.ConferenceID, 
cp.ConferenceDayID, 
DATEDIFF(dd, c.StartDate,CD.Date-ConferenceDay)+1 AS [Number of Conference Day], 
c.ConferenceName,
cp.FirstName, 
cp.Lastname, 
cp.Companyname 
FROM Conference_Participant AS cp 
INNER JOIN dbo.ConferenceDay CD 
ON CP.ConferenceDayID = CD.ConferenceDayID 
INNER JOIN Conference AS c 
ON c.ConferenceID = cp.ConferenceID 
INNER JOIN dbo.Reservation_Conference RC 
ON Cp.ReservationID = RC.ReservationID 
WHERE RC.Cancelled = 0 AND c.ConferenceID=cp.ConferenceID AND cd.ConferenceDayID = cp.conferenceDayID