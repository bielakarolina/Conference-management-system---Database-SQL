CREATE TABLE [dbo].[Reservation_Workshop] 
( [Reservation_WorkshopID] [int] NOT NULL,
 [ReservationID] [int] NOT NULL,
 [WorkshopID] [int] NOT NULL,
 [NumberOfPeople] [int] NOT NULL,
 [Cancelled] [bit] NOT NULL ) ON [PRIMARY] 
 GO 
 ALTER TABLE [dbo].[Reservation_Workshop] ADD CONSTRAINT [PK_Reservation_Workshop] PRIMARY KEY CLUSTERED ([Reservation_WorkshopID]) ON [PRIMARY] 
 GO 
 CREATE NONCLUSTERED INDEX [ReservationID] ON [dbo].[Reservation_Workshop] ([ReservationID]) ON [PRIMARY] 
 GO 
 CREATE NONCLUSTERED INDEX [WorkshopID] ON [dbo].[Reservation_Workshop] ([Workshop-ID]) ON [PRIMARY] 
 GO 
 ALTER TABLE [dbo].[Reservation_Workshop] ADD CONSTRAINT [FK_Reservation_Workshop_-Reservation_Conference] FOREIGN KEY ([ReservationID]) REFERENCES [dbo].[Reservation_Conference] ([ReservationID]) 
 GO 
 ALTER TABLE [dbo].[Reservation_Workshop] ADD CONSTRAINT [FK_Reservation_Workshop_-Workshop] FOREIGN KEY ([WorkshopID]) REFERENCES [dbo].[Workshop] ([WorkshopID]) 
 GO