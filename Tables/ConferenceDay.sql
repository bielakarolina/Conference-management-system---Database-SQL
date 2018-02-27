CREATE TABLE [dbo].[ConferenceDay] 
( [ConferenceDayID] [int] NOT NULL,
 [ConferenceID] [int] NULL,
 [DateConferenceDay] [date] NULL 
) ON [PRIMARY] 
GO 
ALTER TABLE [dbo].[ConferenceDay] ADD CONSTRAINT [PK_ConferenceDay] PRIMARY KEY CLUSTERED ([ConferenceDayID]) ON [PRIMARY] 
GO 
CREATE NONCLUSTERED INDEX [ConferenceID] ON [dbo].[ConferenceDay] ([ConferenceID]) ON [PRIMARY] 
GO 
ALTER TABLE [dbo].[ConferenceDay] ADD CONSTRAINT [FK_ConferenceDay_Conference] FOREIGN KEY ([ConferenceID]) REFERENCES [dbo].[Conference] ([ConferenceID]) 
GO