CREATE TABLE [dbo].[CityName] 
( [CityID] [int] NOT NULL, [CityName] [nvarchar] (50) COLLATE Polish_CI_AS NOT NULL 
) ON [PRIMARY] 
GO 
ALTER TABLE [dbo].[CityName] ADD CONSTRAINT [PK_CityName] PRIMARY KEY CLUSTERED ([CityID]) ON [PRIMARY] 
GO