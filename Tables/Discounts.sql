CREATE TABLE [dbo].[Discounts] 
( [DiscountID] [int] NOT NULL,
 [ConferenceID] [int] NULL,
 [DateDifference] [int] NULL,
 [Discount] [real] NULL ) ON [PRIMARY] 
 GO 
 ALTER TABLE [dbo].[Discounts] ADD CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED ([DiscountID]) ON [PRIMARY] 
 GO 
 CREATE NONCLUSTERED INDEX [IX_Discounts] ON [dbo].[Discounts] ([ConferenceID]) ON [PRIMARY] 
 GO 
 ALTER TABLE [dbo].[Discounts] ADD CONSTRAINT [FK_Discounts_Conference] FOREIGN KEY ([ConferenceID]) REFERENCES [dbo].[Conference] ([ConferenceID]) 
 GO