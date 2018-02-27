CREATE TABLE [dbo].[Conference_Participant] 
( [Conference_ParticipantID] [int] NOT NULL,
 [ReservationID] [int] NOT NULL,
 [ConferenceID] [int] NOT NULL, 
 [ConferenceDayID] [int] NOT NULL, 
 [FirstName] [nvarchar] (50) COLLATE Polish_CI_AS NOT NULL,
 [LastName] [nvarchar] (50) COLLATE Polish_CI_AS NOT NULL,
 [CompanyName] [nvarchar] (50) COLLATE Polish_CI_AS NULL 
 ) ON [PRIMARY] 
 GO 
 ALTER TABLE [dbo].[Conference_Participant] ADD CONSTRAINT [PK_Conference_-Participant] PRIMARY KEY CLUSTERED ([Conference_ParticipantID]) ON [PRIMARY] 
 GO 
 CREATE NONCLUSTERED INDEX [ConferenceID] ON [dbo].[Conference_Participant] ([ConferenceID]) ON [PRIMARY]
 GO 
 CREATE NONCLUSTERED INDEX [LastName] ON [dbo].[Conference_Participant] ([LastName]) ON [PRIMARY] 
 GO 
 ALTER TABLE [dbo].[Conference_Participant] ADD CONSTRAINT [FK_Conference_-Participant_Conference] FOREIGN KEY ([ConferenceID]) REFERENCES [dbo].[Conference] ([ConferenceID]) 
 GO
 ALTER TABLE [dbo].[Conference_Participant] ADD CONSTRAINT [FK_Conference_-Participant_ConferenceDay] FOREIGN KEY ([ConferenceDayID]) REFERENCES [dbo].[ConferenceDay] ([ConferenceDayID]) 
 GO 
 ALTER TABLE [dbo].[Conference_Participant] ADD CONSTRAINT [FK_Conference_-Participant_Reservation_Conference] FOREIGN KEY ([ReservationID]) REFERENCES [dbo].[Reservation_Conference] ([ReservationID]) 
 GO