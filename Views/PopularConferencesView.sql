 CREATE VIEW [dbo].[PopularConferences] 
 AS 
 SELECT TOP 100 C.ConferenceName, SUM(NumberOfPeople) AS [Number of people] FROM Conference AS C 
 JOIN Reservation_Conference AS RC 
 ON C.ConferenceID = RC.ConferenceID 
 JOIN ReservationDetails AS RD 
 ON RC.ReservationID = RD.ReservationID 
 WHERE RC.Cancelled LIKE 0 
 GROUP BY C.ConferenceName 
 ORDER BY [Number of people] DESC