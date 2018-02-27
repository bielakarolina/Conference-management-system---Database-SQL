 CREATE VIEW [dbo].[WorkshopParticipants] 
 AS ( 
 SELECT 
 CD.ConferenceDayID,
 W.WorkshopID, 
 WT.WorkshopName, 
 WP.Workshop_-ParticipantID, 
 CP.Firstname, 
 CP.Lastname, 
 CP.Companyname 
 
 FROM Workshop_Participant AS WP 
 JOIN Conference_Participant AS CP 
 ON CP.Conference_ParticipantID = WP.Conference_ParticipantID 
 JOIN Workshop AS W 
 ON W.WorkshopID = WP.WorkshopID 
 JOIN ConferenceDay AS CD 
 ON CD.ConferenceDayID = W.ConferenceDayID 
 JOIN WorkshopType AS WT 
 ON WT.WorkshopTypeID = W.WorkshopID 
 WHERE CP.Conference_ParticipantID = WP.Conference_ParticipantID AND WP.WorkshopID = W.WorkshopID 
 )