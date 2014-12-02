
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 08/30/2014 20:44:51
-- Generated from EDMX file: D:\SkuGeneralFolder\SkuSearch\SkuSearch.DataAccess\EFModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SkuSearchDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AdditionalProperty_MultilanguageProperty]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AdditionalProperty] DROP CONSTRAINT [FK_AdditionalProperty_MultilanguageProperty];
GO
IF OBJECT_ID(N'[dbo].[FK_CategoryTranslated_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CategoryTranslated] DROP CONSTRAINT [FK_CategoryTranslated_Category];
GO
IF OBJECT_ID(N'[dbo].[FK_MultilanguageProperty_WorldLanguage]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MultilanguageProperty] DROP CONSTRAINT [FK_MultilanguageProperty_WorldLanguage];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Category];
GO
IF OBJECT_ID(N'[dbo].[FK_StockLocationTranslated_WorldLanguage]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StockLocationTranslated] DROP CONSTRAINT [FK_StockLocationTranslated_WorldLanguage];
GO
IF OBJECT_ID(N'[dbo].[FK_Translation_WorldLanguage]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Translation] DROP CONSTRAINT [FK_Translation_WorldLanguage];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AdditionalProperty]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AdditionalProperty];
GO
IF OBJECT_ID(N'[dbo].[Category]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Category];
GO
IF OBJECT_ID(N'[dbo].[CategoryTranslated]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CategoryTranslated];
GO
IF OBJECT_ID(N'[dbo].[Company]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Company];
GO
IF OBJECT_ID(N'[dbo].[Company_StockLocation]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Company_StockLocation];
GO
IF OBJECT_ID(N'[dbo].[CompanyTranslated]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CompanyTranslated];
GO
IF OBJECT_ID(N'[dbo].[Employee]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employee];
GO
IF OBJECT_ID(N'[dbo].[MultilanguageProperty]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MultilanguageProperty];
GO
IF OBJECT_ID(N'[dbo].[Product]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Product];
GO
IF OBJECT_ID(N'[dbo].[ProductStorage]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductStorage];
GO
IF OBJECT_ID(N'[dbo].[StockLocation]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StockLocation];
GO
IF OBJECT_ID(N'[dbo].[StockLocationTranslated]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StockLocationTranslated];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[Translation]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Translation];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO
IF OBJECT_ID(N'[dbo].[WorkingHours]', 'U') IS NOT NULL
    DROP TABLE [dbo].[WorkingHours];
GO
IF OBJECT_ID(N'[dbo].[WorldLanguage]', 'U') IS NOT NULL
    DROP TABLE [dbo].[WorldLanguage];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AdditionalProperty'
CREATE TABLE [dbo].[AdditionalProperty] (
    [AdditionalPropertyID] int IDENTITY(1,1) NOT NULL,
    [MultilanguagePropertyRef] int  NOT NULL,
    [AdditionalPropertyName] nvarchar(50)  NOT NULL,
    [AdditionalPropertyValue] nvarchar(50)  NOT NULL,
    [AdditionalPropertyImportance] bit  NOT NULL
);
GO

-- Creating table 'Category'
CREATE TABLE [dbo].[Category] (
    [CategoryID] int IDENTITY(1,1) NOT NULL,
    [CategoryParentRef] int  NULL,
    [CategoryName] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'CategoryTranslated'
CREATE TABLE [dbo].[CategoryTranslated] (
    [CategoryTranslatedID] int IDENTITY(1,1) NOT NULL,
    [CategoryRef] int  NOT NULL,
    [LanguageRef] nvarchar(2)  NOT NULL,
    [CategoryTranslatedName] nvarchar(50)  NULL
);
GO

-- Creating table 'Company'
CREATE TABLE [dbo].[Company] (
    [CompanyID] int IDENTITY(1,1) NOT NULL,
    [CompanyNameEn] nvarchar(100)  NOT NULL,
    [CompanyNameNative] nvarchar(100)  NULL,
    [CompanyCountry] nvarchar(50)  NULL,
    [CompanyCode] nvarchar(50)  NULL,
    [CompanyLogo] nvarchar(200)  NULL,
    [CompanyUrl] nvarchar(250)  NULL,
    [CompanyAddress1] nvarchar(50)  NULL,
    [CompanyAddess2] nvarchar(50)  NULL,
    [CompanyTown] nvarchar(50)  NULL,
    [CompanyCounty] nvarchar(50)  NULL,
    [CompanyPostcode] nvarchar(10)  NULL,
    [CompanyLocationCountry] nvarchar(50)  NULL,
    [CompanyLatitude] decimal(10,7)  NULL,
    [CompanyLongitude] decimal(10,7)  NULL
);
GO

-- Creating table 'Company_StockLocation'
CREATE TABLE [dbo].[Company_StockLocation] (
    [CompanyRef] int  NOT NULL,
    [StockLocationRef] int  NOT NULL
);
GO

-- Creating table 'CompanyTranslated'
CREATE TABLE [dbo].[CompanyTranslated] (
    [CompanyTranslatedID] int IDENTITY(1,1) NOT NULL,
    [CompanyRef] int  NOT NULL,
    [LanguageRef] nvarchar(2)  NOT NULL,
    [CompanyTranslatedName] nvarchar(100)  NULL
);
GO

-- Creating table 'Employee'
CREATE TABLE [dbo].[Employee] (
    [EmployeeID] int IDENTITY(1,1) NOT NULL,
    [UserRef] int  NOT NULL,
    [CompanyRef] int  NOT NULL,
    [EmployeeType] int  NOT NULL
);
GO

-- Creating table 'MultilanguageProperty'
CREATE TABLE [dbo].[MultilanguageProperty] (
    [MultilanguagePropertyID] int IDENTITY(1,1) NOT NULL,
    [WorldLanguageRef] varchar(2)  NOT NULL,
    [ProductRef] int  NOT NULL,
    [MultilanguagePropertyProductName] varchar(max)  NOT NULL,
    [MultilanguagePropertyProductDescription] varchar(max)  NULL,
    [MultilanguagePropertyProductURL] varchar(max)  NULL
);
GO

-- Creating table 'Product'
CREATE TABLE [dbo].[Product] (
    [ProductID] int IDENTITY(1,1) NOT NULL,
    [CompanyRef] int  NOT NULL,
    [CategoryRef] int  NULL,
    [ProductBarCode] nvarchar(50)  NOT NULL,
    [ProductAdditionalCode] nvarchar(50)  NULL,
    [ProductImage] varchar(max)  NULL
);
GO

-- Creating table 'ProductStorage'
CREATE TABLE [dbo].[ProductStorage] (
    [ProductStorageID] int IDENTITY(1,1) NOT NULL,
    [ProductRef] int  NOT NULL,
    [StockLocationRef] int  NOT NULL,
    [ProductStorageLocationStatus] nchar(10)  NULL,
    [ProductStorageDeliveryTime] time  NULL,
    [ProductStorageMaxShownQuantity] int  NULL,
    [ProductStorageMinShownQuantity] int  NULL,
    [ProductStorageQuantityLeft] int  NULL
);
GO

-- Creating table 'StockLocation'
CREATE TABLE [dbo].[StockLocation] (
    [StockLocationID] int IDENTITY(1,1) NOT NULL,
    [StockLocationName] nvarchar(50)  NOT NULL,
    [StockLocationOwnerType] int  NOT NULL,
    [StockLocationDescription] varchar(max)  NULL,
    [StockLocationWorkingHoursRef] int  NULL,
    [StockLocationPhone] nvarchar(100)  NULL,
    [StockLocationEmail] nvarchar(250)  NULL,
    [StockLocationUrl] nvarchar(250)  NULL,
    [StockLocationAddress1] nvarchar(50)  NULL,
    [StockLocationAddess2] nvarchar(50)  NULL,
    [StockLocationTown] nvarchar(50)  NULL,
    [StockLocationCounty] nvarchar(50)  NULL,
    [StockLocationPostcode] nvarchar(10)  NULL,
    [StockLocationCountry] nvarchar(50)  NULL,
    [StockLocationLatitude] decimal(10,7)  NULL,
    [StockLocationLongitude] decimal(10,7)  NULL
);
GO

-- Creating table 'StockLocationTranslated'
CREATE TABLE [dbo].[StockLocationTranslated] (
    [StockLocationTraslatedID] int IDENTITY(1,1) NOT NULL,
    [StockLocationRef] int  NOT NULL,
    [WorldLanguageRef] varchar(2)  NOT NULL,
    [StockLocationTraslatedName] nvarchar(50)  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'Translation'
CREATE TABLE [dbo].[Translation] (
    [TranslationID] int  NOT NULL,
    [WorldLanguageRef] varchar(2)  NOT NULL,
    [TranslationKey] nvarchar(250)  NOT NULL,
    [TranslationValue] nvarchar(250)  NOT NULL
);
GO

-- Creating table 'User'
CREATE TABLE [dbo].[User] (
    [UserID] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(50)  NOT NULL,
    [UserEmail] nvarchar(100)  NOT NULL,
    [UserPassword] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'WorkingHours'
CREATE TABLE [dbo].[WorkingHours] (
    [StockLocationRef] int IDENTITY(1,1) NOT NULL,
    [WorkingHoursDayOfWeek] int  NULL,
    [WorkingHoursOpenTime] time  NULL,
    [WorkingHoursCloseTime] time  NULL,
    [WorkingHoursLunchTimeBegin] time  NULL,
    [WorkingHoursLunchTimeEnd] time  NULL
);
GO

-- Creating table 'WorldLanguage'
CREATE TABLE [dbo].[WorldLanguage] (
    [WorldLanguageID] varchar(2)  NOT NULL,
    [WorldLanguageName] varchar(64)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [AdditionalPropertyID] in table 'AdditionalProperty'
ALTER TABLE [dbo].[AdditionalProperty]
ADD CONSTRAINT [PK_AdditionalProperty]
    PRIMARY KEY CLUSTERED ([AdditionalPropertyID] ASC);
GO

-- Creating primary key on [CategoryID] in table 'Category'
ALTER TABLE [dbo].[Category]
ADD CONSTRAINT [PK_Category]
    PRIMARY KEY CLUSTERED ([CategoryID] ASC);
GO

-- Creating primary key on [CategoryTranslatedID] in table 'CategoryTranslated'
ALTER TABLE [dbo].[CategoryTranslated]
ADD CONSTRAINT [PK_CategoryTranslated]
    PRIMARY KEY CLUSTERED ([CategoryTranslatedID] ASC);
GO

-- Creating primary key on [CompanyID] in table 'Company'
ALTER TABLE [dbo].[Company]
ADD CONSTRAINT [PK_Company]
    PRIMARY KEY CLUSTERED ([CompanyID] ASC);
GO

-- Creating primary key on [CompanyRef], [StockLocationRef] in table 'Company_StockLocation'
ALTER TABLE [dbo].[Company_StockLocation]
ADD CONSTRAINT [PK_Company_StockLocation]
    PRIMARY KEY CLUSTERED ([CompanyRef], [StockLocationRef] ASC);
GO

-- Creating primary key on [CompanyTranslatedID] in table 'CompanyTranslated'
ALTER TABLE [dbo].[CompanyTranslated]
ADD CONSTRAINT [PK_CompanyTranslated]
    PRIMARY KEY CLUSTERED ([CompanyTranslatedID] ASC);
GO

-- Creating primary key on [EmployeeID] in table 'Employee'
ALTER TABLE [dbo].[Employee]
ADD CONSTRAINT [PK_Employee]
    PRIMARY KEY CLUSTERED ([EmployeeID] ASC);
GO

-- Creating primary key on [MultilanguagePropertyID] in table 'MultilanguageProperty'
ALTER TABLE [dbo].[MultilanguageProperty]
ADD CONSTRAINT [PK_MultilanguageProperty]
    PRIMARY KEY CLUSTERED ([MultilanguagePropertyID] ASC);
GO

-- Creating primary key on [ProductID] in table 'Product'
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT [PK_Product]
    PRIMARY KEY CLUSTERED ([ProductID] ASC);
GO

-- Creating primary key on [ProductStorageID] in table 'ProductStorage'
ALTER TABLE [dbo].[ProductStorage]
ADD CONSTRAINT [PK_ProductStorage]
    PRIMARY KEY CLUSTERED ([ProductStorageID] ASC);
GO

-- Creating primary key on [StockLocationID] in table 'StockLocation'
ALTER TABLE [dbo].[StockLocation]
ADD CONSTRAINT [PK_StockLocation]
    PRIMARY KEY CLUSTERED ([StockLocationID] ASC);
GO

-- Creating primary key on [StockLocationTraslatedID] in table 'StockLocationTranslated'
ALTER TABLE [dbo].[StockLocationTranslated]
ADD CONSTRAINT [PK_StockLocationTranslated]
    PRIMARY KEY CLUSTERED ([StockLocationTraslatedID] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [TranslationID] in table 'Translation'
ALTER TABLE [dbo].[Translation]
ADD CONSTRAINT [PK_Translation]
    PRIMARY KEY CLUSTERED ([TranslationID] ASC);
GO

-- Creating primary key on [UserID] in table 'User'
ALTER TABLE [dbo].[User]
ADD CONSTRAINT [PK_User]
    PRIMARY KEY CLUSTERED ([UserID] ASC);
GO

-- Creating primary key on [StockLocationRef] in table 'WorkingHours'
ALTER TABLE [dbo].[WorkingHours]
ADD CONSTRAINT [PK_WorkingHours]
    PRIMARY KEY CLUSTERED ([StockLocationRef] ASC);
GO

-- Creating primary key on [WorldLanguageID] in table 'WorldLanguage'
ALTER TABLE [dbo].[WorldLanguage]
ADD CONSTRAINT [PK_WorldLanguage]
    PRIMARY KEY CLUSTERED ([WorldLanguageID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [MultilanguagePropertyRef] in table 'AdditionalProperty'
ALTER TABLE [dbo].[AdditionalProperty]
ADD CONSTRAINT [FK_AdditionalProperty_MultilanguageProperty]
    FOREIGN KEY ([MultilanguagePropertyRef])
    REFERENCES [dbo].[MultilanguageProperty]
        ([MultilanguagePropertyID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_AdditionalProperty_MultilanguageProperty'
CREATE INDEX [IX_FK_AdditionalProperty_MultilanguageProperty]
ON [dbo].[AdditionalProperty]
    ([MultilanguagePropertyRef]);
GO

-- Creating foreign key on [CategoryRef] in table 'CategoryTranslated'
ALTER TABLE [dbo].[CategoryTranslated]
ADD CONSTRAINT [FK_CategoryTranslated_Category]
    FOREIGN KEY ([CategoryRef])
    REFERENCES [dbo].[Category]
        ([CategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryTranslated_Category'
CREATE INDEX [IX_FK_CategoryTranslated_Category]
ON [dbo].[CategoryTranslated]
    ([CategoryRef]);
GO

-- Creating foreign key on [CategoryRef] in table 'Product'
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT [FK_Product_Category]
    FOREIGN KEY ([CategoryRef])
    REFERENCES [dbo].[Category]
        ([CategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_Category'
CREATE INDEX [IX_FK_Product_Category]
ON [dbo].[Product]
    ([CategoryRef]);
GO

-- Creating foreign key on [WorldLanguageRef] in table 'MultilanguageProperty'
ALTER TABLE [dbo].[MultilanguageProperty]
ADD CONSTRAINT [FK_MultilanguageProperty_WorldLanguage]
    FOREIGN KEY ([WorldLanguageRef])
    REFERENCES [dbo].[WorldLanguage]
        ([WorldLanguageID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MultilanguageProperty_WorldLanguage'
CREATE INDEX [IX_FK_MultilanguageProperty_WorldLanguage]
ON [dbo].[MultilanguageProperty]
    ([WorldLanguageRef]);
GO

-- Creating foreign key on [WorldLanguageRef] in table 'StockLocationTranslated'
ALTER TABLE [dbo].[StockLocationTranslated]
ADD CONSTRAINT [FK_StockLocationTranslated_WorldLanguage]
    FOREIGN KEY ([WorldLanguageRef])
    REFERENCES [dbo].[WorldLanguage]
        ([WorldLanguageID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StockLocationTranslated_WorldLanguage'
CREATE INDEX [IX_FK_StockLocationTranslated_WorldLanguage]
ON [dbo].[StockLocationTranslated]
    ([WorldLanguageRef]);
GO

-- Creating foreign key on [WorldLanguageRef] in table 'Translation'
ALTER TABLE [dbo].[Translation]
ADD CONSTRAINT [FK_Translation_WorldLanguage]
    FOREIGN KEY ([WorldLanguageRef])
    REFERENCES [dbo].[WorldLanguage]
        ([WorldLanguageID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Translation_WorldLanguage'
CREATE INDEX [IX_FK_Translation_WorldLanguage]
ON [dbo].[Translation]
    ([WorldLanguageRef]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------