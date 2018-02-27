 CREATE PROCEDURE [dbo].[AddCustomerCompany] 
	@CompanyName NVARCHAR(50),
	@Phone NVARCHAR(50) ,
	@Email NVARCHAR(50), 
	@Address NVARCHAR(50),
	@CityName NVARCHAR(50),
	@CountryName NVARCHAR(50) 
	
	AS BEGIN 
	SET NOCOUNT ON; 
		DECLARE @CustomerID int 
		set @CustomerID = (Select top 1 CustomerID from dbo.Customers order by CustomerID desc) + 1 
		
		IF @CompanyName IN (SELECT Companyname FROM dbo.Company) 
		BEGIN; 
			THROW 52000, 'This Company already exists in our database.', 1 
		END 
		
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
		
		INSERT INTO Customers(CustomerID) 
		VALUES(@CustomerID) 
		INSERT INTO Company(CompanyID,CompanyName,Phone,Email,Address,CityID,CountryID) 
		VALUES(@CustomerID,@CompanyName ,@Phone,@Email,@Address,@CityID,@CountryID) 
		
	END