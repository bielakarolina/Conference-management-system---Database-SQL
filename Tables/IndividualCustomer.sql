CREATE TABLE [dbo].[IndividualCustomer] 
( [IndividualCustomerID] [int] NOT NULL,
 [FirstName] [nvarchar] (50) NOT NULL,
 [LastName] [nvarchar] (50) NOT NULL,
 [Address] [varchar] (50) NOT NULL,
 [Phone] [nvarchar] (50) NOT NULL,
 [CityID] [int] NOT NULL,
 [CountryID] [int] NOT NULL,
 [Email] [nvarchar] (50) NOT NULL,
 [IsStudent] [bit] NULL ) ON [PRIMARY] 
 GO 
 ALTER TABLE [dbo].[IndividualCustomer] ADD CONSTRAINT [PK_IndividualCustomer] PRIMARY KEY CLUSTERED ([IndividualCustomerID]) ON [PRIMARY] 
 GO 
 ALTER TABLE [dbo].[IndividualCustomer] WITH NOCHECK ADD CONSTRAINT [FK_Individual-Customer_CityName] FOREIGN KEY ([CityID]) REFERENCES [dbo].[CityName] ([CityID]) 
 GO 
 ALTER TABLE [dbo].[IndividualCustomer] WITH NOCHECK ADD CONSTRAINT [FK_Individual-Customer_Country] FOREIGN KEY ([CountryID]) REFERENCES [dbo].[Country] ([Country-ID]) 
 GO 
 ALTER TABLE [dbo].[IndividualCustomer] ADD CONSTRAINT [FK_IndividualCustomer_-Customers] FOREIGN KEY ([IndividualCustomerID]) REFERENCES [dbo].[Customers] ([CustomerID]) 
 GO 
 ALTER TABLE [dbo].[IndividualCustomer] NOCHECK CONSTRAINT [FK_IndividualCustomer_-CityName] 
 GO 
 ALTER TABLE [dbo].[IndividualCustomer] NOCHECK CONSTRAINT [FK_IndividualCustomer_-Country] 
GO