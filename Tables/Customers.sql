CREATE TABLE [dbo].[Customers] 
( [CustomerID] [int] NOT NULL 
) ON [PRIMARY] 
GO
ALTER TABLE [dbo].[Customers] ADD CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([CustomerID]) ON [PRIMARY] 
GO