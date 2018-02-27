CREATE TABLE [dbo].[Workshop] 
([WorkshopID] [int] NOT NULL,
 [WorkshopTypeID] [int] NOT NULL,
 [ConferenceID] [int] NOT NULL,
 [ConferenceDayID] [int] NOT NULL,
 [Number_of_seats] [int] NULL,
 [Price_Workshop] [money] NULL,
 [Address] [nvarchar] (50) COLLATE Polish_CI_AS NULL,
 [Start_time] [datetime] NULL,
 [End_time] [datetime] NULL ) ON [PRIMARY] 
 GO 
 ALTER TABLE [dbo].[Workshop] ADD CONSTRAINT [PK_Workshop] PRIMARY KEY CLUSTERED ([WorkshopID]) ON [PRIMARY] 
 GO 
 CREATE NONCLUSTERED INDEX [ConferenceDayID] ON [dbo].[Workshop] ([ConferenceDayID]) ON [PRIMARY] 
 GO 
 CREATE NONCLUSTERED INDEX [ConferenceID] ON [dbo].[Workshop] ([ConferenceID]) ON [PRIMARY] 
 GO 
 CREATE NONCLUSTERED INDEX [IX_Workshop] ON [dbo].[Workshop] ([WorkshopTypeID]) ON [PRIMARY] 
 GO 
 ALTER TABLE [dbo].[Workshop] ADD CONSTRAINT [FK_Workshop_Conference] FOREIGN KEY ([ConferenceID]) REFERENCES [dbo].[Conference] ([ConferenceID]) 
 GO 
 ALTER TABLE [dbo].[Workshop] ADD CONSTRAINT [FK_Workshop_ConferenceDay] FOREIGN KEY ([ConferenceDayID]) REFERENCES [dbo].[ConferenceDay] ([ConferenceDayID]) 
 GO 
 ALTER TABLE [dbo].[Workshop] ADD CONSTRAINT [FK_Workshop_WorkshopType] FOREIGN KEY ([WorkshopTypeID]) REFERENCES [dbo].[WorkshopType] ([WorkshopTypeID]) 
 GO