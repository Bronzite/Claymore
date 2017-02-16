
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/16/2017 16:40:11
-- Generated from EDMX file: C:\Users\bronz\Documents\Visual Studio 2015\Projects\Claymore\Claymore\Models\ClaymoreDataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-Claymore-20170215055048];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Characters'
CREATE TABLE [dbo].[Characters] (
    [Id] uniqueidentifier  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Birthdate] datetime  NULL
);
GO

-- Creating table 'Sessions'
CREATE TABLE [dbo].[Sessions] (
    [Id] uniqueidentifier  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [SessionDate] datetime  NOT NULL,
    [XPTransactionId] uniqueidentifier  NULL
);
GO

-- Creating table 'XPAssets'
CREATE TABLE [dbo].[XPAssets] (
    [Id] uniqueidentifier  NOT NULL,
    [CharacterId] uniqueidentifier  NOT NULL,
    [AllocatedXP] int  NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'XPTransactions'
CREATE TABLE [dbo].[XPTransactions] (
    [Id] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'XPChanges'
CREATE TABLE [dbo].[XPChanges] (
    [Id] uniqueidentifier  NOT NULL,
    [XPTransactionId] uniqueidentifier  NOT NULL,
    [Amount] int  NOT NULL,
    [XPAssetId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'XPAssets_Attribute'
CREATE TABLE [dbo].[XPAssets_Attribute] (
    [LinkBonus] nvarchar(max)  NOT NULL,
    [Id] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'XPAssets_Skill'
CREATE TABLE [dbo].[XPAssets_Skill] (
    [PrimaryLinkAttribute] nvarchar(max)  NOT NULL,
    [SecondaryLinkAttribute] nvarchar(max)  NULL,
    [Simple] bit  NOT NULL,
    [Basic] bit  NOT NULL,
    [Id] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'XPAssets_Trait'
CREATE TABLE [dbo].[XPAssets_Trait] (
    [Level] int  NULL,
    [Id] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'XPAssets_EdgePoints'
CREATE TABLE [dbo].[XPAssets_EdgePoints] (
    [Id] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'Attendance'
CREATE TABLE [dbo].[Attendance] (
    [Sessions_Id] uniqueidentifier  NOT NULL,
    [Characters_Id] uniqueidentifier  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Characters'
ALTER TABLE [dbo].[Characters]
ADD CONSTRAINT [PK_Characters]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Sessions'
ALTER TABLE [dbo].[Sessions]
ADD CONSTRAINT [PK_Sessions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'XPAssets'
ALTER TABLE [dbo].[XPAssets]
ADD CONSTRAINT [PK_XPAssets]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'XPTransactions'
ALTER TABLE [dbo].[XPTransactions]
ADD CONSTRAINT [PK_XPTransactions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'XPChanges'
ALTER TABLE [dbo].[XPChanges]
ADD CONSTRAINT [PK_XPChanges]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'XPAssets_Attribute'
ALTER TABLE [dbo].[XPAssets_Attribute]
ADD CONSTRAINT [PK_XPAssets_Attribute]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'XPAssets_Skill'
ALTER TABLE [dbo].[XPAssets_Skill]
ADD CONSTRAINT [PK_XPAssets_Skill]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'XPAssets_Trait'
ALTER TABLE [dbo].[XPAssets_Trait]
ADD CONSTRAINT [PK_XPAssets_Trait]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'XPAssets_EdgePoints'
ALTER TABLE [dbo].[XPAssets_EdgePoints]
ADD CONSTRAINT [PK_XPAssets_EdgePoints]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Sessions_Id], [Characters_Id] in table 'Attendance'
ALTER TABLE [dbo].[Attendance]
ADD CONSTRAINT [PK_Attendance]
    PRIMARY KEY CLUSTERED ([Sessions_Id], [Characters_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Sessions_Id] in table 'Attendance'
ALTER TABLE [dbo].[Attendance]
ADD CONSTRAINT [FK_Attendance_Session]
    FOREIGN KEY ([Sessions_Id])
    REFERENCES [dbo].[Sessions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Characters_Id] in table 'Attendance'
ALTER TABLE [dbo].[Attendance]
ADD CONSTRAINT [FK_Attendance_Character]
    FOREIGN KEY ([Characters_Id])
    REFERENCES [dbo].[Characters]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Attendance_Character'
CREATE INDEX [IX_FK_Attendance_Character]
ON [dbo].[Attendance]
    ([Characters_Id]);
GO

-- Creating foreign key on [CharacterId] in table 'XPAssets'
ALTER TABLE [dbo].[XPAssets]
ADD CONSTRAINT [FK_CharacterXPAsset]
    FOREIGN KEY ([CharacterId])
    REFERENCES [dbo].[Characters]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CharacterXPAsset'
CREATE INDEX [IX_FK_CharacterXPAsset]
ON [dbo].[XPAssets]
    ([CharacterId]);
GO

-- Creating foreign key on [XPTransactionId] in table 'XPChanges'
ALTER TABLE [dbo].[XPChanges]
ADD CONSTRAINT [FK_XPChangeXPTransaction]
    FOREIGN KEY ([XPTransactionId])
    REFERENCES [dbo].[XPTransactions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_XPChangeXPTransaction'
CREATE INDEX [IX_FK_XPChangeXPTransaction]
ON [dbo].[XPChanges]
    ([XPTransactionId]);
GO

-- Creating foreign key on [XPAssetId] in table 'XPChanges'
ALTER TABLE [dbo].[XPChanges]
ADD CONSTRAINT [FK_XPChangeXPAsset]
    FOREIGN KEY ([XPAssetId])
    REFERENCES [dbo].[XPAssets]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_XPChangeXPAsset'
CREATE INDEX [IX_FK_XPChangeXPAsset]
ON [dbo].[XPChanges]
    ([XPAssetId]);
GO

-- Creating foreign key on [XPTransactionId] in table 'Sessions'
ALTER TABLE [dbo].[Sessions]
ADD CONSTRAINT [FK_XPTransactionSession]
    FOREIGN KEY ([XPTransactionId])
    REFERENCES [dbo].[XPTransactions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_XPTransactionSession'
CREATE INDEX [IX_FK_XPTransactionSession]
ON [dbo].[Sessions]
    ([XPTransactionId]);
GO

-- Creating foreign key on [Id] in table 'XPAssets_Attribute'
ALTER TABLE [dbo].[XPAssets_Attribute]
ADD CONSTRAINT [FK_Attribute_inherits_XPAsset]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[XPAssets]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'XPAssets_Skill'
ALTER TABLE [dbo].[XPAssets_Skill]
ADD CONSTRAINT [FK_Skill_inherits_XPAsset]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[XPAssets]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'XPAssets_Trait'
ALTER TABLE [dbo].[XPAssets_Trait]
ADD CONSTRAINT [FK_Trait_inherits_XPAsset]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[XPAssets]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'XPAssets_EdgePoints'
ALTER TABLE [dbo].[XPAssets_EdgePoints]
ADD CONSTRAINT [FK_EdgePoints_inherits_XPAsset]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[XPAssets]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------