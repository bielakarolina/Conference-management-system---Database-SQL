 CREATE VIEW [dbo].[PopularWorkshops] 
 AS 
 SELECT TOP 100 WT.WorkshopName, SUM(RW.NumberOfPeople) AS [Number of WS participants] 
 FROM Reservation_Workshop AS RW 
 INNER JOIN Workshop AS W 
 ON RW.WorkshopID = W.WorkshopID 
 INNER JOIN WorkshopType AS WT 
 ON WT.WorkshopTypeID = W.WorkshopID 
 GROUP BY WT.WorkshopName 
 ORDER BY [Number of WS participants] DESC