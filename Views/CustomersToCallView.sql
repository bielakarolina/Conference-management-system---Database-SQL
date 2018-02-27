 REATE VIEW [dbo].[CustomersToCall] 
 AS 
 SELECT 
 rc.reservationID, 
 CustomerID, 
 dbo.NumberOfPeopleIn-Reservation(rc.ReservationID) - dbo.NumberOfParticipantsBy-Reservation(rc.ReservationID) AS [Number of Missing Participants], Phone 
 FROM dbo.Reservation_Conference AS rc 
 INNER JOIN Conference AS c 
 on c.ConferenceID = rc.ConferenceID 
 INNER JOIN Company AS Comp 
 ON comp.CompanyID = RC.CustomerID 
 WHERE DATEADD(dd, 14, GETDATE()) > c.StartDate AND Startdate > GETDATE() AND dbo.NumberOfPeopleInReservation(rc.ReservationID) - dbo.NumberOfParticipantsBy-Reservation(rc.ReservationID) <> 0