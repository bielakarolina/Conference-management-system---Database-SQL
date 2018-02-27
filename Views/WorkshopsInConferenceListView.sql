 CREATE VIEW [dbo].[WorkshopsInConferenceList] 
 AS 
 ( SELECT C.ConferenceName AS [Conference Name] , WT.WorkshopName AS [Workshop Name] 
 FROM Workshop as W 
 JOIN WorkshopType AS WT 
 ON W.WorkshopID = WT.WorkshopTypeID 
 JOIN Conference AS C 
 ON W.ConferenceID = C.ConferenceID 
 WHERE C.ConferenceID = W.ConferenceID )