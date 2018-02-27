CREATE PROCEDURE [dbo].[ChangeIndividualCustomerData] 
@IndividualCustomerID INT, 
@NewFirstName VARCHAR(50), 
@NewLastName VARCHAR(50), 
@NewPhone NVARCHAR(50), 
@NewEmail NVARCHAR(50), 
@NewAddress NVARCHAR(50), 
@NewCity NVARCHAR(50), 
@NewCountry NVARCHAR(50), 
@NewIsStudent BIT 
AS BEGIN 

SET NOCOUNT ON;

IF @NewCity IS NOT NULL 
BEGIN; 
	DECLARE @CountryID INT 
	SET @CountryID = (SELECT CountryID FROM dbo.Country WHERE CountryName LIKE @NewCountry) 
	UPDATE IndividualCustomer 
	SET CountryID = @CountryID 
	WHERE IndividualCustomerID = @IndividualCustomerID 
END 

IF @NewCountry IS NOT NULL 
BEGIN; 
	DECLARE @CityID INT 
	SET @CityID = (SELECT @CityID FROM dbo.CityName WHERE CityName LIKE @NewCity) UPDATE IndividualCustomer 
	SET CityID = @CityID 
	WHERE IndividualCustomerID = @IndividualCustomerID 
END 

IF @NewFirstName IS NOT NULL 
BEGIN; 
	UPDATE IndividualCustomer 
	SET FirstName = @NewFirstName 
	WHERE IndividualCustomerID = @IndividualCustomerID 
END

IF @NewLastName IS NOT NULL 
BEGIN; 
	UPDATE IndividualCustomer 
	SET LastName = @NewLastName 
	WHERE IndividualCustomerID = @IndividualCustomerID 
END 

IF @NewPhone IS NOT NULL 
BEGIN; 
	UPDATE IndividualCustomer 
	SET Phone= @NewPhone 
	WHERE IndividualCustomerID = @IndividualCustomerID 
END 

IF @NewEmail IS NOT NULL 
BEGIN; 
	UPDATE IndividualCustomer 
	SET Email= @NewEmail 
	WHERE IndividualCustomerID = @IndividualCustomerID 
END 

IF @NewAddress IS NOT NULL 
BEGIN; 
	UPDATE IndividualCustomer 
	SET Address= @NewAddress 
	WHERE IndividualCustomerID = @IndividualCustomerID 
END

IF @NewIsStudent IS NOT NULL 
BEGIN; 
	UPDATE IndividualCustomer 
	SET Address= IsStudent 
	WHERE IndividualCustomerID = @IndividualCustomerID 
END 
END 
GO