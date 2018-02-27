CREATE TABLE [dbo].[Company] 
([CompanyID] [int] NOT NULL, 
[CompanyName] [nvarchar] (50) COLLATE Polish_CI_AS NOT NULL,
 [Phone] [nvarchar] (50) COLLATE Polish_CI_AS NOT NULL,
 [Email] [nvarchar] (50) COLLATE Polish_CI_AS NOT NULL,
 [Address] [nvarchar] (50) COLLATE Polish_CI_AS NOT NULL,
 [CityID] [int] NOT NULL, [CountryID] [int] NOT NULL )
 ON [PRIMARY] 
 GO 
 ALTER TABLE [dbo].[Company] ADD CONSTRAINT [PK_Company_1] PRIMARY KEY CLUSTERED ([CompanyID]) ON [PRIMARY] 
 GO 
 CREATE UNIQUE NONCLUSTERED INDEX [IX_Company] ON [dbo].[Company] ([CompanyID]) ON [PRIMARY] 
 GO CREATE NONCLUSTERED INDEX [CompanyName] ON [dbo].[Company] ([CompanyName]) ON [PRIMARY] GO ALTER TABLE [dbo].[Company] WITH NOCHECK ADD CONSTRAINT [FK_Company_CityName] FOREIGN KEY ([CityID]) REFERENCES [dbo].[CityName] ([CityID]) 
 GO ALTER TABLE [dbo].[Company] WITH NOCHECK ADD CONSTRAINT [FK_Company_Country] FOREIGN KEY ([CountryID]) REFERENCES [dbo].[Country] ([CountryID]) 
 GO ALTER TABLE [dbo].[Company] ADD CONSTRAINT [FK_Company_Customers] FOREIGN KEY ([CompanyID]) REFERENCES [dbo].[Customers] ([CustomerID]) 
 GO ALTER TABLE [dbo].[Company] NOCHECK CONSTRAINT [FK_Company_CityName] 
 GO ALTER TABLE [dbo].[Company] NOCHECK CONSTRAINT [FK_Company_Country] 
 GO