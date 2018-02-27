CREATE TABLE [dbo].[Conference] 
( 
[ConferenceID] [int] NOT NULL,
 [ConferenceName] [nvarchar] (50) COLLATE Polish_CI_AS NOT NULL,
 [Number_of_seats] [int] NULL,
 [Address] [varchar] (50) COLLATE Polish_CI_AS NULL, 
 [CityID] [int] NOT NULL, [CountryID] [int] NOT NULL,
 [StartDate] [date] NULL, [EndDate] [date] NULL,
 [StudentDiscount] [real] NULL, 
 [Price] [money] NOT NULL 
 )  ON [PRIMARY] 
 GO 
 ALTER TABLE [dbo].[Conference] ADD CONSTRAINT [PK_Conference] PRIMARY KEY CLUSTERED ([ConferenceID]) ON [PRIMARY] 
 GO 
 CREATE NONCLUSTERED INDEX [IX_Conference_2] ON [dbo].[Conference] ([CityID]) ON [PRIMARY] 
 GO 
 CREATE NONCLUSTERED INDEX [IX_Conference] ON [dbo].[Conference] ([ConferenceName]) ON [PRIMARY] 
 GO 
 CREATE NONCLUSTERED INDEX [IX_Conference_1] ON [dbo].[Conference] ([CountryID]) ON [PRIMARY] 
 GO
 ALTER TABLE [dbo].[Conference] ADD CONSTRAINT [FK_Conference_CityName] FOREIGN KEY ([CityID]) REFERENCES [dbo].[CityName] ([CityID]) 
 GO 
 ALTER TABLE [dbo].[Conference] ADD CONSTRAINT [FK_Conference_Country] FOREIGN KEY ([CountryID]) REFERENCES [dbo].[Country] ([CountryID]) 
 GO