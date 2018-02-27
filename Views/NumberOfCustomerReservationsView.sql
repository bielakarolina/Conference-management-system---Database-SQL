 CREATE VIEW [dbo].[NumberOfCustomerReservations] 
 AS 
 select CustomerID, count(customerid) as NumberOfReservations 
 from Reservation_-Conference 
 group by customerid