CREATE TABLE [dbo].[WorkshopType] 
( [WorkshopTypeID] [int] NOT NULL,
 [WorkshopName] [nvarchar] (50) COLLATE Polish_CI_AS NOT NULL ) ON [PRIMARY] 
GO 
ALTER TABLE [dbo].[WorkshopType] ADD CONSTRAINT [PK_WorkshopType] PRIMARY KEY CLUSTERED ([WorkshopTypeID]) ON [PRIMARY] 
GO