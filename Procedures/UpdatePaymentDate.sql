CREATE PROCEDURE [dbo].[UpdatePaymentDate] 
@DateOfPayment DATETIME, 
@Reservation_ConferenceID INT 
AS BEGIN 
SET NOCOUNT ON; 
UPDATE dbo.Reservation_Conference 
SET DateOfPayment = @DateOfPayment 
WHERE ReservationID = @Reservation_ConferenceID 
END 
GO