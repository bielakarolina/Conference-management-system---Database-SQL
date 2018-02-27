CREATE FUNCTION [dbo].[Reservation_ConferenceValue] (@ReservationID int) RETURNS MONEY --wynikiem funkcji jest cena tylko za rezerwacje konferencji(bez warsztat�w)
 AS BEGIN --ustalamy liczb� ludzi kt�rzy nie s� studentami i z tego tytu�u nie przys�uje im zni�ka
 DECLARE @NumberOfRegularPeople int 
 SET @NumberOfRegularPeople = (SELECT SUM(rd.NumberOfPeople-rd.NumberOfStudents) AS 
								NOT_Students FROM dbo.ReservationDetails rd 
								WHERE rd.ReservationID=@ReservationID GROUP BY rd.ReservationID ) --ustalamy liczb� student�w 
 DECLARE @NumberOfStudents INT 
 SET @NumberOfStudents=(SELECT SUM(NumberOfStudents) FROM dbo.ReservationDetails 
						WHERE ReservationID=@ReservationID) --cena za dzie� konferencji
 DECLARE @Price money 
 SET @Price=(SELECT c.Price FROM dbo.Conference c 
			WHERE ConferenceID=(SELECT ConferenceID FROM dbo.Reservation_Conference WHERE ReservationID=@ReservationID)) --wartosc rezerwacji bez uwzgl�dniania zni�ki dniowej 
 DECLARE @Value MONEY 
 SET @Value=@Price*(@NumberOfRegularPeople+(1-dbo.StudentDiscount(@Reservation-ID))*@NumberOfStudents)
--finalna warto�� zam�wienia konferencji po uwzgl�dnienu zni�ki dniowej 
DECLARE @ValueAfterDiscount MONEY 
SET @ValueAfterDiscount=(1-dbo.GetDiscount(@ReservationID))*@Value 
RETURN(@ValueAfterDiscount); 
END 
GO