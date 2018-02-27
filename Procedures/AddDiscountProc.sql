 CREATE PROCEDURE [dbo].[AddDiscount] 
	@ConferenceID INT, 
	@DateDifference1 INT, 
	@Discount1 REAL, 
	@DateDifference2 INT, 
	@Discount2 REAL, 
	@DateDifference3 INT, 
	@Discount3 REAL 
 
 
	AS BEGIN 
	SET NOCOUNT ON; 
		IF @DateDifference1<0 OR @DateDifference2<0 OR @DateDifference3<0 
		BEGIN; 
			THROW 52000, 'Date difference need to be positive .', 1 
		END 
		
		IF @Discount1>1 OR @Discount2>1 OR @Discount3>1
		BEGIN; 
			THROW 52000, 'Discount need to be smaller than 1 .', 1 
		END 
		
		IF @ConferenceID NOT IN (SELECT ConferenceID FROM dbo.Conference) 
		BEGIN; 
			THROW 52000, 'There is not such ConferenceID in Conference Table.', 1 
		END 
		
		DECLARE @DiscountID1 INT 
		SET @DiscountID1=(select top 1 DiscountID from dbo.Discounts order by DiscountID desc) + 1 
		
		INSERT INTO dbo.Discounts( DiscountID ,ConferenceID ,DateDifference ,Discount) 
		VALUES ( @DiscountID1,@ConferenceID,@DateDifference1,@Discount1) 
		
		INSERT INTO dbo.Discounts( DiscountID ,ConferenceID ,DateDifference ,Discount) 
		VALUES ( @DiscountID1+1,@ConferenceID,@DateDifference2,@Discount2) 
		
		INSERT INTO dbo.Discounts( DiscountID ,ConferenceID ,DateDifference ,Discount) 
		VALUES ( @DiscountID1+2,@ConferenceID,@DateDifference3,@Discount3) 
		
	END