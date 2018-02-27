CREATE FUNCTION [dbo].[Reservation_ConferenceValue] (@ReservationID int) RETURNS MONEY --wynikiem funkcji jest cena tylko za rezerwacje konferencji(bez warsztatów)
 AS BEGIN --ustalamy liczbê ludzi którzy nie s¹ studentami i z tego tytu³u nie przys³uje im zni¿ka
 DECLARE @NumberOfRegularPeople int 
 SET @NumberOfRegularPeople = (SELECT SUM(rd.NumberOfPeople-rd.NumberOfStudents) AS 
								NOT_Students FROM dbo.ReservationDetails rd 
								WHERE rd.ReservationID=@ReservationID GROUP BY rd.ReservationID ) --ustalamy liczbê studentów 
 DECLARE @NumberOfStudents INT 
 SET @NumberOfStudents=(SELECT SUM(NumberOfStudents) FROM dbo.ReservationDetails 
						WHERE ReservationID=@ReservationID) --cena za dzieñ konferencji
 DECLARE @Price money 
 SET @Price=(SELECT c.Price FROM dbo.Conference c 
			WHERE ConferenceID=(SELECT ConferenceID FROM dbo.Reservation_Conference WHERE ReservationID=@ReservationID)) --wartosc rezerwacji bez uwzglêdniania zni¿ki dniowej 
 DECLARE @Value MONEY 
 SET @Value=@Price*(@NumberOfRegularPeople+(1-dbo.StudentDiscount(@Reservation-ID))*@NumberOfStudents)
--finalna wartoœæ zamówienia konferencji po uwzglêdnienu zni¿ki dniowej 
DECLARE @ValueAfterDiscount MONEY 
SET @ValueAfterDiscount=(1-dbo.GetDiscount(@ReservationID))*@Value 
RETURN(@ValueAfterDiscount); 
END 
GO