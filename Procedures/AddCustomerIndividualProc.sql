 CREATE PROCEDURE [dbo].[AddCustomerIndividual] 
	@IsStudent BIT, 
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50), 
	@Address NVARCHAR(50),
	@Phone NVARCHAR(50) ,
	@CityName NVARCHAR(50),
	@CountryName NVARCHAR(50),
	@Email NVARCHAR(50) 
	
	AS BEGIN 
	SET NOCOUNT ON; 
	
	DECLARE @CustomerID int 
	set @CustomerID = (Select top 1 CustomerID from Customers order by CustomerID desc) + 1 
	
	IF @CountryName NOT IN (SELECT CountryName FROM Country) 
	BEGIN
		DECLARE @CountryNewID INT 
		SET @CountryNewID = (SELECT TOP 1 CountryID FROM Country ORDER BY CountryID DESC)+1 
		INSERT INTO Country(CountryID,CountryName) 
		VALUES( @CountryNewID,@CountryName)
	END 
	
	IF @CityName NOT IN (SELECT CityName FROM CityName) 
	BEGIN 
		DECLARE @CityNewID INT 
		SET @CityNewID = (SELECT TOP 1 CityID FROM CityName ORDER BY CityID DESC)+1 
		INSERT INTO CityName(CityID,CityName) 
		VALUES( @CityNewID,@CityName) 
	END 
	
	DECLARE @CountryID INT 
	SET @CountryID = ( SELECT CountryID FROM Country WHERE CountryName = @CountryName ) 
	
	DECLARE @CityID INT 
	SET @CityID = ( SELECT CityID FROM CityName WHERE CityName = @CityName ) 
	
	DECLARE @IndividualCustomerID INT 
	SET @IndividualCustomerID = ( SELECT TOP 1 CustomerID FROM Customers ORDER BY CustomerID DESC )+1 
	
	INSERT INTO Customers(CustomerID)
	VALUES(@CustomerID) 
	
	INSERT INTO IndividualCustomer(IndividualCustomerID,FirstName,LastName,Address,Phone,CityID,CountryID,Email) 
	VALUES( @IndividualCustomerID,@FirstName ,@LastName,@Address,@Phone,@City-ID,@CountryID,@Email) 
END