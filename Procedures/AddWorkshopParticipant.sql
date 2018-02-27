CREATE PROCEDURE [dbo].[AddWorkshopParticipant] 
@ReservationWorkshopID INT, 
@ConferenceParticipantID INT 
AS BEGIN 
SET NOCOUNT ON; 
DECLARE @Conference_ParticipantID int 
DECLARE @Start_Time DATETIME 
DECLARE @End_Time DATETIME 
DECLARE @Work_shopID INT 

IF @ReservationWorkshopID NOT IN (SELECT Reservation_WorkshopID FROM dbo.Reservation_Workshop) 
BEGIN; 
	THROW 51000, 'This reservation of workshop does not exist', 1 
END 

IF @ConferenceParticipantID NOT IN (SELECT Conference_ParticipantID FROM dbo.Conference_Participant) 
BEGIN; 
	THROW 52000, 'This conference participant does not exists', 1 
END 

DECLARE @WorkshopID INT 
SET @WorkshopID = (SELECT WorkshopID FROM dbo.Reservation_Workshop WHERE Reservation_WorkshopID = @ReservationWorkshopID) 
DECLARE @WorkshopParticipantID INT 
SET @WorkshopParticipantID = (SELECT TOP 1 Workshop_ParticipantID FROM dbo.Workshop_Participant ORDER BY Workshop_ParticipantID DESC) + 1 -- sprawdzanie czy ktoœ nie próbuje dodaæ wiecej uczestników niz zareklarowa³ w rezerwacji warsztatu 

DECLARE @AlreadyRegistered INT 
SET @AlreadyRegistered = (SELECT SUM(Workshop_ParticipantID) FROM dbo.							Workshop_Participant WP INNER JOIN dbo.Reservation_Workshop 						 Rw ON rw.Reservation_WorkshopID = wp.ReservationWorkshopID 						 WHERE rw.Reservation_WorkshopID = @ReservationWorkshop-ID) 

IF @AlreadyRegistered >= (SELECT NumberOfPeople FROM dbo.Reservation_Workshop WHERE Reservation_WorkshopID= @ReservationWorkshopID) 
BEGIN; 
	THROW 52000, 'You have already registered all participans from this reservation.'1
END -- sprawzdanie czy warsztaty nie koliduj¹ danemu uczestnikowi DECLARE @StartTime DATETIME

SET @StartTime = (SELECT Start_time FROM dbo.Workshop WHERE WorkshopID = @WorkshopID) DECLARE @EndTime DATETIME 
SET @EndTime = (SELECT End_time FROM dbo.Workshop WHERE WorkshopID = @WorkshopID) DECLARE @Collision BIT 
SET @Collision = 0 /*deklarujemy kursor*/ 

DECLARE moj_kursor CURSOR LOCAL FOR 
/*deklarujemy zrodlo kursora*/ 
SELECT Conference_ParticipantID, wp.WorkshopID, w.Start_Time, w.End_Time FROM dbo.Workshop w 
INNER JOIN dbo.Workshop_Participant wp 
ON wp.WorkshopID = w.WorkshopID 
WHERE Conference_ParticipantID = 3698 AND wp.WorkshopID = w.WorkshopID 
/*otwieramy kursor*/ 
OPEN moj_kursor 
/*przypisujemy pierwszy wiersz do zmiennych o typach zgodnych z kolumnami w zrodle*/ FETCH NEXT FROM moj_kursor INTO @Conference_ParticipantID, @Work_shopID, @Start_-Time,@End_Time 
/*jezeli przypisanie sie powiodlo wchodzimy w petle*/ 
WHILE @@FETCH_STATUS = 0 
BEGIN 
/*przykladowa czynnosc na danych*/ 
IF (@StartTime < @End_Time OR @EndTime > @Start_Time) 
BEGIN; 
THROW 51000, 'This workshop collides with the one you have already registered for.', 1
END 
/*przypisanie kolejnego wiersza*/ 
FETCH NEXT FROM moj_kursor INTO @Conference_ParticipantID, @WorkshopID, @Start_-Time,@End_Time 
END 
/*zamkniecie kursora*/ 
CLOSE moj_kursor 
/*zwolnienie kursora*/
 DEALLOCATE moj_kursor 
 INSERT INTO dbo.Workshop_Participant ( Workshop_ParticipantID , WorkshopID , Conference_ParticipantID , ReservationWorkshopID ) 
 VALUES ( @WorkshopParticipantID , -- Workshop_ParticipantID - int 
 @WorkshopID , -- WorkshopID - int 
 @ConferenceParticipantID , -- Conference_ParticipantID - int 
 @ReservationWorkshopID -- ReservationWorkshopID - int 
 ) 
 END 
 GO