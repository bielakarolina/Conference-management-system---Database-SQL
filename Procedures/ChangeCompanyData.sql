CREATE PROCEDURE [dbo].[ChangeCompanyData] 
@ComanyID INT, 
@NewCompanyName NVARCHAR(50), 
@NewPhone NVARCHAR(50), 
@NewEmail NVARCHAR(50), 
@NewAddress NVARCHAR(50), 
@NewCity NVARCHAR(50), 
@NewCountry NVARCHAR(50) 
AS BEGIN 
SET NOCOUNT ON; 

IF @NewCity IS NOT NULL 
BEGIN; 
DECLARE @CountryID INT 
SET @CountryID = (SELECT CountryID FROM dbo.Country WHERE CountryName LIKE @NewCountry)
UPDATE dbo.Company 
SET CountryID = @CountryID 
WHERE CompanyID = @ComanyID 
END 

IF @NewCountry IS NOT NULL 
BEGIN; 
DECLARE @CityID INT 
SET @CityID = (SELECT @CityID FROM dbo.CityName WHERE CityName LIKE @NewCity) 
UPDATE dbo.Company 
SET CityID = @CityID 
WHERE CompanyID = @ComanyID 
END 

IF @NewCompanyName IS NOT NULL 
BEGIN; 
UPDATE dbo.Company 
SET CompanyName= @NewCompanyName 
WHERE CompanyID = @ComanyID 
END 

IF @NewPhone IS NOT NULL 
BEGIN; 
UPDATE dbo.Company 
SET Phone= @NewPhone 
WHERE CompanyID = @ComanyID 
END

IF @NewEmail IS NOT NULL 
BEGIN; 
UPDATE dbo.Company 
SET Email= @NewEmail 
WHERE CompanyID = @ComanyID 
END 

IF @NewAddress IS NOT NULL 
BEGIN; 
UPDATE dbo.Company 
SET Address= @NewAddress 
WHERE CompanyID = @ComanyID 
END 
END 
GO