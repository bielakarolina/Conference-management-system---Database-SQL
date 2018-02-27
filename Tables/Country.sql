CREATE TABLE [dbo].[Country] 
( [CountryID] [int] NOT NULL, 
[CountryName] [nvarchar] (50) COLLATE Polish_CI_AS NOT NULL
) ON [PRIMARY]
GO 
ALTER TABLE [dbo].[Country] ADD CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED ([CountryID]) ON [PRIMARY] 
GO 
CREATE UNIQUE NONCLUSTERED INDEX [IX_Country] ON [dbo].[Country] ([CountryID]) ON [PRIMARY] 
GO 
CREATE UNIQUE NONCLUSTERED INDEX [IX_Country_1] ON [dbo].[Country] ([CountryName]) ON [PRIMARY] 
GO