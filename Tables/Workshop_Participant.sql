CREATE TABLE [dbo].[Workshop_Participant] 
( [Workshop_ParticipantID] [int] NOT NULL,
 [WorkshopID] [int] NOT NULL,
 [Conference_ParticipantID] [int] NOT NULL,
 [ReservationWorkshopID] [int] NOT NULL ) ON [PRIMARY] 
 GO 
 ALTER TABLE [dbo].[Workshop_Participant] ADD CONSTRAINT [PK_Workshop_Participant] PRIMARY KEY CLUSTERED ([Workshop_ParticipantID]) ON [PRIMARY] 
 GO 
 CREATE NONCLUSTERED INDEX [WorkshopID] ON [dbo].[Workshop_Participant] ([Workshop-ID]) ON [PRIMARY] 
 GO 
 ALTER TABLE [dbo].[Workshop_Participant] ADD CONSTRAINT [FK_Workshop_Participant_-Conference_Participant] FOREIGN KEY ([Conference_ParticipantID]) REFERENCES [dbo].[Conference_Participant] ([Conference_ParticipantID]) 
 GO 
 ALTER TABLE [dbo].[Workshop_Participant] ADD CONSTRAINT [FK_Workshop_Participant_-Reservation_Workshop] FOREIGN KEY ([ReservationWorkshopID]) REFERENCES [dbo].[Reservation_Workshop] ([Reservation_WorkshopID]) 
 GO 
 ALTER TABLE [dbo].[Workshop_Participant] ADD CONSTRAINT [FK_Workshop_Participant_-Workshop] FOREIGN KEY ([WorkshopID]) REFERENCES [dbo].[Workshop] ([WorkshopID]) 
 GO