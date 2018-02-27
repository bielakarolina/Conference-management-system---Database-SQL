CREATE TABLE [dbo].[Students] 
( [StudentID] [int] NOT NULL,
 [Student_CardID] [int] NULL,
 [Expiration_Date] [date] NULL ) ON [PRIMARY] 
 GO 
 ALTER TABLE [dbo].[Students] ADD CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED ([StudentID]) ON [PRIMARY] 
 GO 
 CREATE UNIQUE NONCLUSTERED INDEX [Student_CardID] ON [dbo].[Students] ([Student_-CardID]) ON [PRIMARY] 
 GO 
 ALTER TABLE [dbo].[Students] ADD CONSTRAINT [FK_Students_Conference_Participant] FOREIGN KEY ([StudentID]) REFERENCES [dbo].[Conference_Participant] ([Conference_-ParticipantID]) 
 GO