 CREATE VIEW [dbo].[WorkshopsInDayList] 
 AS 
 SELECT CD.ConferenceDayID, C.ConferenceName, abs(DATEDIFF(DD, StartDate, Date-ConferenceDay))+1 as [Number of Conference Day], WT.WorkshopName AS [Workshop Name] 
 FROM Workshop as W 
 JOIN WorkshopType AS WT 
 ON W.WorkshopID = WT.WorkshopTypeID 
 JOIN Conference AS C 
 ON W.ConferenceID = C.ConferenceID 
 JOIN ConferenceDay AS CD 
 ON CD.ConferenceDayID = W.ConferenceDayID 
 WHERE W.ConferenceDayID = CD.ConferenceDayID