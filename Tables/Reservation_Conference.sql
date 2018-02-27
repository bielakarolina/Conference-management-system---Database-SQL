CREATE TABLE [dbo].[Reservation_Conference] 
( [ReservationID] [int] NOT NULL,
 [CustomerID] [int] NOT NULL,
 [ConferenceID] [int] NOT NULL,
 [DateOfReservation] [datetime] NOT NULL,
 [DateOfPayment] [datetime] NULL,
 [Cancelled] [bit] NOT NULL ) ON [PRIMARY] 
 GO 
 ALTER TABLE [dbo].[Reservation_Conference] ADD CONSTRAINT [PK_Reservation_-Conference] PRIMARY KEY CLUSTERED ([ReservationID]) ON [PRIMARY] 
 GO 
 CREATE NONCLUSTERED INDEX [IX_Reservation_Conference] ON [dbo].[Reservation_-Conference] ([ConferenceID]) ON [PRIMARY] 
 GO 
 CREATE NONCLUSTERED INDEX [CustomerID] ON [dbo].[Reservation_Conference] ([CustomerID]) ON [PRIMARY] 
 GO 
 ALTER TABLE [dbo].[Reservation_Conference] ADD CONSTRAINT [FK_Reservation_-Conference_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([CustomerID]) 
 GO