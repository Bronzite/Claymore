
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/17/2017 20:21:22
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

IF OBJECT_ID(N'[dbo].[FK_Attendance_Session]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Attendance] DROP CONSTRAINT [FK_Attendance_Session];
GO
IF OBJECT_ID(N'[dbo].[FK_Attendance_Character]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Attendance] DROP CONSTRAINT [FK_Attendance_Character];
GO
IF OBJECT_ID(N'[dbo].[FK_XPChangeXPTransaction]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[XPChanges] DROP CONSTRAINT [FK_XPChangeXPTransaction];
GO
IF OBJECT_ID(N'[dbo].[FK_XPChangeXPAsset]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[XPChanges] DROP CONSTRAINT [FK_XPChangeXPAsset];
GO
IF OBJECT_ID(N'[dbo].[FK_XPTransactionSession]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Sessions] DROP CONSTRAINT [FK_XPTransactionSession];
GO
IF OBJECT_ID(N'[dbo].[FK_CharacterXPAsset]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[XPAssets] DROP CONSTRAINT [FK_CharacterXPAsset];
GO
IF OBJECT_ID(N'[dbo].[FK_CampaignSession_Campaign]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CampaignSession] DROP CONSTRAINT [FK_CampaignSession_Campaign];
GO
IF OBJECT_ID(N'[dbo].[FK_CampaignSession_Session]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CampaignSession] DROP CONSTRAINT [FK_CampaignSession_Session];
GO
IF OBJECT_ID(N'[dbo].[FK_CampaignSession1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Campaigns] DROP CONSTRAINT [FK_CampaignSession1];
GO
IF OBJECT_ID(N'[dbo].[FK_CampaignXPTransaction]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Campaigns] DROP CONSTRAINT [FK_CampaignXPTransaction];
GO
IF OBJECT_ID(N'[dbo].[FK_DocumentCharacter]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [FK_DocumentCharacter];
GO
IF OBJECT_ID(N'[dbo].[FK_DocumentSession]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [FK_DocumentSession];
GO
IF OBJECT_ID(N'[dbo].[FK_Attribute_inherits_XPAsset]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[XPAssets_Attribute] DROP CONSTRAINT [FK_Attribute_inherits_XPAsset];
GO
IF OBJECT_ID(N'[dbo].[FK_Skill_inherits_XPAsset]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[XPAssets_Skill] DROP CONSTRAINT [FK_Skill_inherits_XPAsset];
GO
IF OBJECT_ID(N'[dbo].[FK_Trait_inherits_XPAsset]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[XPAssets_Trait] DROP CONSTRAINT [FK_Trait_inherits_XPAsset];
GO
IF OBJECT_ID(N'[dbo].[FK_EdgePoints_inherits_XPAsset]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[XPAssets_EdgePoints] DROP CONSTRAINT [FK_EdgePoints_inherits_XPAsset];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Characters]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Characters];
GO
IF OBJECT_ID(N'[dbo].[Sessions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Sessions];
GO
IF OBJECT_ID(N'[dbo].[XPAssets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[XPAssets];
GO
IF OBJECT_ID(N'[dbo].[XPTransactions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[XPTransactions];
GO
IF OBJECT_ID(N'[dbo].[XPChanges]', 'U') IS NOT NULL
    DROP TABLE [dbo].[XPChanges];
GO
IF OBJECT_ID(N'[dbo].[Campaigns]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Campaigns];
GO
IF OBJECT_ID(N'[dbo].[Documents]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Documents];
GO
IF OBJECT_ID(N'[dbo].[XPAssets_Attribute]', 'U') IS NOT NULL
    DROP TABLE [dbo].[XPAssets_Attribute];
GO
IF OBJECT_ID(N'[dbo].[XPAssets_Skill]', 'U') IS NOT NULL
    DROP TABLE [dbo].[XPAssets_Skill];
GO
IF OBJECT_ID(N'[dbo].[XPAssets_Trait]', 'U') IS NOT NULL
    DROP TABLE [dbo].[XPAssets_Trait];
GO
IF OBJECT_ID(N'[dbo].[XPAssets_EdgePoints]', 'U') IS NOT NULL
    DROP TABLE [dbo].[XPAssets_EdgePoints];
GO
IF OBJECT_ID(N'[dbo].[Attendance]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Attendance];
GO
IF OBJECT_ID(N'[dbo].[CampaignSession]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CampaignSession];
GO

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
    [XPTransactionId] uniqueidentifier  NULL,
    [BaseXP] nvarchar(max)  NULL,
    [InUniverseStartDate] datetime  NULL,
    [InUniverseEndDate] datetime  NULL
);
GO

-- Creating table 'XPAssets'
CREATE TABLE [dbo].[XPAssets] (
    [Id] uniqueidentifier  NOT NULL,
    [AllocatedXP] int  NULL,
    [Name] nvarchar(max)  NOT NULL,
    [CharacterId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'XPTransactions'
CREATE TABLE [dbo].[XPTransactions] (
    [Id] uniqueidentifier  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Timestamp] datetime  NULL
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

-- Creating table 'Campaigns'
CREATE TABLE [dbo].[Campaigns] (
    [Id] uniqueidentifier  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [BaseXP] int  NULL,
    [SessionId] uniqueidentifier  NULL,
    [XPTransactionId] uniqueidentifier  NULL
);
GO

-- Creating table 'Documents'
CREATE TABLE [dbo].[Documents] (
    [Id] uniqueidentifier  NOT NULL,
    [PostDate] nvarchar(max)  NOT NULL,
    [Content] nvarchar(max)  NOT NULL,
    [CreditCharacterId] uniqueidentifier  NULL,
    [SessionId] uniqueidentifier  NULL
);
GO

-- Creating table 'CharacterOwnerships'
CREATE TABLE [dbo].[CharacterOwnerships] (
    [Id] uniqueidentifier  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL,
    [CharacterId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'XPAssets_Attribute'
CREATE TABLE [dbo].[XPAssets_Attribute] (
    [LinkBonus] int  NOT NULL,
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

-- Creating table 'CampaignSession'
CREATE TABLE [dbo].[CampaignSession] (
    [Campaigns_Id] uniqueidentifier  NOT NULL,
    [Sessions_Id] uniqueidentifier  NOT NULL
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

-- Creating primary key on [Id] in table 'Campaigns'
ALTER TABLE [dbo].[Campaigns]
ADD CONSTRAINT [PK_Campaigns]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Documents'
ALTER TABLE [dbo].[Documents]
ADD CONSTRAINT [PK_Documents]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CharacterOwnerships'
ALTER TABLE [dbo].[CharacterOwnerships]
ADD CONSTRAINT [PK_CharacterOwnerships]
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

-- Creating primary key on [Campaigns_Id], [Sessions_Id] in table 'CampaignSession'
ALTER TABLE [dbo].[CampaignSession]
ADD CONSTRAINT [PK_CampaignSession]
    PRIMARY KEY CLUSTERED ([Campaigns_Id], [Sessions_Id] ASC);
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

-- Creating foreign key on [Campaigns_Id] in table 'CampaignSession'
ALTER TABLE [dbo].[CampaignSession]
ADD CONSTRAINT [FK_CampaignSession_Campaign]
    FOREIGN KEY ([Campaigns_Id])
    REFERENCES [dbo].[Campaigns]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Sessions_Id] in table 'CampaignSession'
ALTER TABLE [dbo].[CampaignSession]
ADD CONSTRAINT [FK_CampaignSession_Session]
    FOREIGN KEY ([Sessions_Id])
    REFERENCES [dbo].[Sessions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CampaignSession_Session'
CREATE INDEX [IX_FK_CampaignSession_Session]
ON [dbo].[CampaignSession]
    ([Sessions_Id]);
GO

-- Creating foreign key on [SessionId] in table 'Campaigns'
ALTER TABLE [dbo].[Campaigns]
ADD CONSTRAINT [FK_CampaignSession1]
    FOREIGN KEY ([SessionId])
    REFERENCES [dbo].[Sessions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CampaignSession1'
CREATE INDEX [IX_FK_CampaignSession1]
ON [dbo].[Campaigns]
    ([SessionId]);
GO

-- Creating foreign key on [XPTransactionId] in table 'Campaigns'
ALTER TABLE [dbo].[Campaigns]
ADD CONSTRAINT [FK_CampaignXPTransaction]
    FOREIGN KEY ([XPTransactionId])
    REFERENCES [dbo].[XPTransactions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CampaignXPTransaction'
CREATE INDEX [IX_FK_CampaignXPTransaction]
ON [dbo].[Campaigns]
    ([XPTransactionId]);
GO

-- Creating foreign key on [CreditCharacterId] in table 'Documents'
ALTER TABLE [dbo].[Documents]
ADD CONSTRAINT [FK_DocumentCharacter]
    FOREIGN KEY ([CreditCharacterId])
    REFERENCES [dbo].[Characters]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DocumentCharacter'
CREATE INDEX [IX_FK_DocumentCharacter]
ON [dbo].[Documents]
    ([CreditCharacterId]);
GO

-- Creating foreign key on [SessionId] in table 'Documents'
ALTER TABLE [dbo].[Documents]
ADD CONSTRAINT [FK_DocumentSession]
    FOREIGN KEY ([SessionId])
    REFERENCES [dbo].[Sessions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DocumentSession'
CREATE INDEX [IX_FK_DocumentSession]
ON [dbo].[Documents]
    ([SessionId]);
GO

-- Creating foreign key on [CharacterId] in table 'CharacterOwnerships'
ALTER TABLE [dbo].[CharacterOwnerships]
ADD CONSTRAINT [FK_CharacterOwnershipCharacter]
    FOREIGN KEY ([CharacterId])
    REFERENCES [dbo].[Characters]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CharacterOwnershipCharacter'
CREATE INDEX [IX_FK_CharacterOwnershipCharacter]
ON [dbo].[CharacterOwnerships]
    ([CharacterId]);
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