CREATE TABLE [dbo].[ReservationDetails] 
( [ReservationDetailsID] [int] NOT NULL,
 [ReservationID] [int] NOT NULL,
 [ConferenceDayID] [int] NOT NULL, 
 [NumberOfPeople] [int] NULL,
 [Cancelled] [bit] NULL, 
 [NumberOfStudents] [int] NULL ) ON [PRIMARY]
 GO --sprawdza, czy iloœæ miejsc dostêpnych danego dnia konferencji nie jest mniejsza od iloœci miejsc zarezerwowanych w tworzonej rezerwacji. 
 CREATE TRIGGER [dbo].[MoreSeatsThanPeople] on [dbo].[ReservationDetails]
 AFTER INSERT 
 AS
 BEGIN 
 SET NOCOUNT ON 
 DECLARE @reserved int; 
 DECLARE @free int; 
 SET @reserved = (SELECT NumberOfPeople FROM INSERTED); SET @free = dbo.ConferenceDayFreePlaces((SELECT ConferenceDayID FROM INSERTED)) + @reserved; 
 IF(@free < @reserved) 
 BEGIN RAISERROR('Only %d places are available', 16, 1, @reserved, @free) 
 ROLLBACK TRANSACTION 
 END 
 END 
 GO 
 ALTER TABLE [dbo].[ReservationDetails] ADD CONSTRAINT [PK_ReservationDetails] PRIMARY KEY CLUSTERED ([ReservationDetailsID]) 
 ON [PRIMARY]
 GO 
 CREATE NONCLUSTERED INDEX [IX_ReservationDetails_1] ON [dbo].[ReservationDetails] ([ConferenceDayID]) ON [PRIMARY] GO CREATE NONCLUSTERED INDEX [IX_ReservationDetails] ON [dbo].[ReservationDetails] ([ReservationID]) ON [PRIMARY]
 GO 
 ALTER TABLE [dbo].[ReservationDetails] ADD CONSTRAINT [FK_ReservationDetails_-ConferenceDay] FOREIGN KEY ([ConferenceDayID]) REFERENCES [dbo].[ConferenceDay] ([ConferenceDayID]) 
 GO
 ALTER TABLE [dbo].[ReservationDetails] ADD CONSTRAINT [FK_ReservationDetails_-Reservation_Conference] FOREIGN KEY ([ReservationID]) REFERENCES [dbo].[Reservation_Conference] ([ReservationID]) 
 GO