
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 05/21/2013 17:44:31
-- Generated from EDMX file: C:\Users\ENDER\Desktop\Projects\EOBS_001\EOBSModel\EOBSModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [EOBS_001];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ARA_TBL1_DAMLACIKLAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ARA_TBL1] DROP CONSTRAINT [FK_ARA_TBL1_DAMLACIKLAR];
GO
IF OBJECT_ID(N'[dbo].[FK_ARA_TBL1_DUYURULAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ARA_TBL1] DROP CONSTRAINT [FK_ARA_TBL1_DUYURULAR];
GO
IF OBJECT_ID(N'[dbo].[FK_ARA_TBL1_HAFTALAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ARA_TBL1] DROP CONSTRAINT [FK_ARA_TBL1_HAFTALAR];
GO
IF OBJECT_ID(N'[dbo].[FK_ARA_TBL1_ODEVLER]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ARA_TBL1] DROP CONSTRAINT [FK_ARA_TBL1_ODEVLER];
GO
IF OBJECT_ID(N'[dbo].[FK_ARA_TBL1_SUBELER]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ARA_TBL1] DROP CONSTRAINT [FK_ARA_TBL1_SUBELER];
GO
IF OBJECT_ID(N'[dbo].[FK_ARA_TBL2_KULLANICILAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ARA_TBL2] DROP CONSTRAINT [FK_ARA_TBL2_KULLANICILAR];
GO
IF OBJECT_ID(N'[dbo].[FK_ARA_TBL2_OKULLAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ARA_TBL2] DROP CONSTRAINT [FK_ARA_TBL2_OKULLAR];
GO
IF OBJECT_ID(N'[dbo].[FK_CEVAPLAR_SINAVLAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CEVAPLAR] DROP CONSTRAINT [FK_CEVAPLAR_SINAVLAR];
GO
IF OBJECT_ID(N'[dbo].[FK_DAMLACIKLAR_HAFTALAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DAMLACIKLAR] DROP CONSTRAINT [FK_DAMLACIKLAR_HAFTALAR];
GO
IF OBJECT_ID(N'[dbo].[FK_DRSSNVSNC_DERSLER]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DRSSNVSNC] DROP CONSTRAINT [FK_DRSSNVSNC_DERSLER];
GO
IF OBJECT_ID(N'[dbo].[FK_DRSSNVSNC_KULLANICILAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DRSSNVSNC] DROP CONSTRAINT [FK_DRSSNVSNC_KULLANICILAR];
GO
IF OBJECT_ID(N'[dbo].[FK_DRSSNVSNC_SINAVLAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DRSSNVSNC] DROP CONSTRAINT [FK_DRSSNVSNC_SINAVLAR];
GO
IF OBJECT_ID(N'[dbo].[FK_DUYURULAR_HAFTALAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DUYURULAR] DROP CONSTRAINT [FK_DUYURULAR_HAFTALAR];
GO
IF OBJECT_ID(N'[dbo].[FK_HEPTABLO_KULLANICILAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HEPTABLO] DROP CONSTRAINT [FK_HEPTABLO_KULLANICILAR];
GO
IF OBJECT_ID(N'[dbo].[FK_KARNEDERS_DERSLER]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KARNEDERS] DROP CONSTRAINT [FK_KARNEDERS_DERSLER];
GO
IF OBJECT_ID(N'[dbo].[FK_KARNEDERS_SINIFLAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KARNEDERS] DROP CONSTRAINT [FK_KARNEDERS_SINIFLAR];
GO
IF OBJECT_ID(N'[dbo].[FK_KARNEDERSNOT_DERSLER]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KARNEDERSNOT] DROP CONSTRAINT [FK_KARNEDERSNOT_DERSLER];
GO
IF OBJECT_ID(N'[dbo].[FK_KARNEDERSNOT_KULLANICILAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KARNEDERSNOT] DROP CONSTRAINT [FK_KARNEDERSNOT_KULLANICILAR];
GO
IF OBJECT_ID(N'[dbo].[FK_KULLANICILAR_BRANSLAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KULLANICILAR] DROP CONSTRAINT [FK_KULLANICILAR_BRANSLAR];
GO
IF OBJECT_ID(N'[dbo].[FK_KULLANICILAR_KURLAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KULLANICILAR] DROP CONSTRAINT [FK_KULLANICILAR_KURLAR];
GO
IF OBJECT_ID(N'[dbo].[FK_KULLANICILAR_OKULLAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KULLANICILAR] DROP CONSTRAINT [FK_KULLANICILAR_OKULLAR];
GO
IF OBJECT_ID(N'[dbo].[FK_KULLANICILAR_SUBELER]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KULLANICILAR] DROP CONSTRAINT [FK_KULLANICILAR_SUBELER];
GO
IF OBJECT_ID(N'[dbo].[FK_KULLANICILAR_YETKILER]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KULLANICILAR] DROP CONSTRAINT [FK_KULLANICILAR_YETKILER];
GO
IF OBJECT_ID(N'[dbo].[FK_KURLAR_OKULLAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KURLAR] DROP CONSTRAINT [FK_KURLAR_OKULLAR];
GO
IF OBJECT_ID(N'[dbo].[FK_KURLAR_SINIFLAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KURLAR] DROP CONSTRAINT [FK_KURLAR_SINIFLAR];
GO
IF OBJECT_ID(N'[dbo].[FK_MESAJLAR_KIM]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MESAJLAR] DROP CONSTRAINT [FK_MESAJLAR_KIM];
GO
IF OBJECT_ID(N'[dbo].[FK_MESAJLAR_KIME]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MESAJLAR] DROP CONSTRAINT [FK_MESAJLAR_KIME];
GO
IF OBJECT_ID(N'[dbo].[FK_ODEVLER_HAFTALAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ODEVLER] DROP CONSTRAINT [FK_ODEVLER_HAFTALAR];
GO
IF OBJECT_ID(N'[dbo].[FK_ODEVSNC_KULLANICILAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ODEVSNC] DROP CONSTRAINT [FK_ODEVSNC_KULLANICILAR];
GO
IF OBJECT_ID(N'[dbo].[FK_ODEVSNC_ODEVSNCLAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ODEVSNC] DROP CONSTRAINT [FK_ODEVSNC_ODEVSNCLAR];
GO
IF OBJECT_ID(N'[dbo].[FK_OKULLAR_RESIMLER]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OKULLAR] DROP CONSTRAINT [FK_OKULLAR_RESIMLER];
GO
IF OBJECT_ID(N'[dbo].[FK_OZELNOT_KULLANICILAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OZELNOT] DROP CONSTRAINT [FK_OZELNOT_KULLANICILAR];
GO
IF OBJECT_ID(N'[dbo].[FK_OZELNOT_OZELNOTLAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OZELNOT] DROP CONSTRAINT [FK_OZELNOT_OZELNOTLAR];
GO
IF OBJECT_ID(N'[dbo].[FK_RDSDERSLER_DERSLER]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RDSDERSLER] DROP CONSTRAINT [FK_RDSDERSLER_DERSLER];
GO
IF OBJECT_ID(N'[dbo].[FK_RDSDERSLER_KULLANICILAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RDSDERSLER] DROP CONSTRAINT [FK_RDSDERSLER_KULLANICILAR];
GO
IF OBJECT_ID(N'[dbo].[FK_RDSDERSLER_SINIFLAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RDSDERSLER] DROP CONSTRAINT [FK_RDSDERSLER_SINIFLAR];
GO
IF OBJECT_ID(N'[dbo].[FK_RDSLISTE_KULLANICILAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RDSLISTE] DROP CONSTRAINT [FK_RDSLISTE_KULLANICILAR];
GO
IF OBJECT_ID(N'[dbo].[FK_RDSLISTE_RDSDERSLER]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RDSLISTE] DROP CONSTRAINT [FK_RDSLISTE_RDSDERSLER];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVDETAY_DERSLER0]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVDETAY] DROP CONSTRAINT [FK_SINAVDETAY_DERSLER0];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVDETAY_DERSLER1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVDETAY] DROP CONSTRAINT [FK_SINAVDETAY_DERSLER1];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVDETAY_DERSLER10]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVDETAY] DROP CONSTRAINT [FK_SINAVDETAY_DERSLER10];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVDETAY_DERSLER11]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVDETAY] DROP CONSTRAINT [FK_SINAVDETAY_DERSLER11];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVDETAY_DERSLER12]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVDETAY] DROP CONSTRAINT [FK_SINAVDETAY_DERSLER12];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVDETAY_DERSLER13]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVDETAY] DROP CONSTRAINT [FK_SINAVDETAY_DERSLER13];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVDETAY_DERSLER14]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVDETAY] DROP CONSTRAINT [FK_SINAVDETAY_DERSLER14];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVDETAY_DERSLER2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVDETAY] DROP CONSTRAINT [FK_SINAVDETAY_DERSLER2];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVDETAY_DERSLER3]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVDETAY] DROP CONSTRAINT [FK_SINAVDETAY_DERSLER3];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVDETAY_DERSLER4]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVDETAY] DROP CONSTRAINT [FK_SINAVDETAY_DERSLER4];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVDETAY_DERSLER5]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVDETAY] DROP CONSTRAINT [FK_SINAVDETAY_DERSLER5];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVDETAY_DERSLER6]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVDETAY] DROP CONSTRAINT [FK_SINAVDETAY_DERSLER6];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVDETAY_DERSLER7]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVDETAY] DROP CONSTRAINT [FK_SINAVDETAY_DERSLER7];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVDETAY_DERSLER8]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVDETAY] DROP CONSTRAINT [FK_SINAVDETAY_DERSLER8];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVDETAY_DERSLER9]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVDETAY] DROP CONSTRAINT [FK_SINAVDETAY_DERSLER9];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVDETAY_OPTIK]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVDETAY] DROP CONSTRAINT [FK_SINAVDETAY_OPTIK];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVDETAY_SINAVTIP]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVDETAY] DROP CONSTRAINT [FK_SINAVDETAY_SINAVTIP];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVLAR_HAFTALAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVLAR] DROP CONSTRAINT [FK_SINAVLAR_HAFTALAR];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVLAR_SINAVDETAY]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVLAR] DROP CONSTRAINT [FK_SINAVLAR_SINAVDETAY];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVSNC_KULLANICILAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVSNC] DROP CONSTRAINT [FK_SINAVSNC_KULLANICILAR];
GO
IF OBJECT_ID(N'[dbo].[FK_SINAVSNC_SINAVLAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINAVSNC] DROP CONSTRAINT [FK_SINAVSNC_SINAVLAR];
GO
IF OBJECT_ID(N'[dbo].[FK_SINIFLAR_KARNELER]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINIFLAR] DROP CONSTRAINT [FK_SINIFLAR_KARNELER];
GO
IF OBJECT_ID(N'[dbo].[FK_SINIFLAR_OKULLAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SINIFLAR] DROP CONSTRAINT [FK_SINIFLAR_OKULLAR];
GO
IF OBJECT_ID(N'[dbo].[FK_SORUANALIZ_DERSLER]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SORUANALIZ] DROP CONSTRAINT [FK_SORUANALIZ_DERSLER];
GO
IF OBJECT_ID(N'[dbo].[FK_SORUANALIZ_SINAVLAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SORUANALIZ] DROP CONSTRAINT [FK_SORUANALIZ_SINAVLAR];
GO
IF OBJECT_ID(N'[dbo].[FK_SUBELER_OKULLAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SUBELER] DROP CONSTRAINT [FK_SUBELER_OKULLAR];
GO
IF OBJECT_ID(N'[dbo].[FK_SUBELER_SINIFLAR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SUBELER] DROP CONSTRAINT [FK_SUBELER_SINIFLAR];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AOPLANLAR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AOPLANLAR];
GO
IF OBJECT_ID(N'[dbo].[ARA_TBL1]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ARA_TBL1];
GO
IF OBJECT_ID(N'[dbo].[ARA_TBL2]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ARA_TBL2];
GO
IF OBJECT_ID(N'[dbo].[BRANSLAR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BRANSLAR];
GO
IF OBJECT_ID(N'[dbo].[CEVAPLAR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CEVAPLAR];
GO
IF OBJECT_ID(N'[dbo].[CINSIYET]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CINSIYET];
GO
IF OBJECT_ID(N'[dbo].[DAMLACIKLAR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DAMLACIKLAR];
GO
IF OBJECT_ID(N'[dbo].[DAVRANIS]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DAVRANIS];
GO
IF OBJECT_ID(N'[dbo].[DAVRANISLAR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DAVRANISLAR];
GO
IF OBJECT_ID(N'[dbo].[DEGEREGITIM]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DEGEREGITIM];
GO
IF OBJECT_ID(N'[dbo].[DERSLER]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DERSLER];
GO
IF OBJECT_ID(N'[dbo].[DEVAMSIZ]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DEVAMSIZ];
GO
IF OBJECT_ID(N'[dbo].[DRSSNVSNC]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DRSSNVSNC];
GO
IF OBJECT_ID(N'[dbo].[DUYURULAR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DUYURULAR];
GO
IF OBJECT_ID(N'[dbo].[HAFTALAR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HAFTALAR];
GO
IF OBJECT_ID(N'[dbo].[HATALAR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HATALAR];
GO
IF OBJECT_ID(N'[dbo].[HEPTABLO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HEPTABLO];
GO
IF OBJECT_ID(N'[dbo].[KARNEDERS]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KARNEDERS];
GO
IF OBJECT_ID(N'[dbo].[KARNEDERSNOT]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KARNEDERSNOT];
GO
IF OBJECT_ID(N'[dbo].[KARNELER]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KARNELER];
GO
IF OBJECT_ID(N'[dbo].[KULLANICILAR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KULLANICILAR];
GO
IF OBJECT_ID(N'[dbo].[KURLAR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KURLAR];
GO
IF OBJECT_ID(N'[dbo].[MESAJLAR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MESAJLAR];
GO
IF OBJECT_ID(N'[dbo].[ODEVLER]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ODEVLER];
GO
IF OBJECT_ID(N'[dbo].[ODEVSNC]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ODEVSNC];
GO
IF OBJECT_ID(N'[dbo].[ODEVSNCLAR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ODEVSNCLAR];
GO
IF OBJECT_ID(N'[dbo].[OKULLAR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OKULLAR];
GO
IF OBJECT_ID(N'[dbo].[OKULTUR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OKULTUR];
GO
IF OBJECT_ID(N'[dbo].[OPTIK]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OPTIK];
GO
IF OBJECT_ID(N'[dbo].[OZELNOT]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OZELNOT];
GO
IF OBJECT_ID(N'[dbo].[OZELNOTLAR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OZELNOTLAR];
GO
IF OBJECT_ID(N'[dbo].[RDSDERSLER]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RDSDERSLER];
GO
IF OBJECT_ID(N'[dbo].[RDSLISTE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RDSLISTE];
GO
IF OBJECT_ID(N'[dbo].[RESIMLER]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RESIMLER];
GO
IF OBJECT_ID(N'[dbo].[SAYFALAR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAYFALAR];
GO
IF OBJECT_ID(N'[dbo].[SINAVDETAY]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SINAVDETAY];
GO
IF OBJECT_ID(N'[dbo].[SINAVLAR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SINAVLAR];
GO
IF OBJECT_ID(N'[dbo].[SINAVSNC]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SINAVSNC];
GO
IF OBJECT_ID(N'[dbo].[SINAVTIP]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SINAVTIP];
GO
IF OBJECT_ID(N'[dbo].[SINIFLAR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SINIFLAR];
GO
IF OBJECT_ID(N'[dbo].[SORUANALIZ]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SORUANALIZ];
GO
IF OBJECT_ID(N'[dbo].[SUBELER]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SUBELER];
GO
IF OBJECT_ID(N'[dbo].[YETKILER]', 'U') IS NOT NULL
    DROP TABLE [dbo].[YETKILER];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'KARNELER'
CREATE TABLE [dbo].[KARNELER] (
    [KRN_ID] int IDENTITY(1,1) NOT NULL,
    [KRN_AD] varchar(50)  NULL
);
GO

-- Creating table 'KULLANICILAR'
CREATE TABLE [dbo].[KULLANICILAR] (
    [KUL_ID] int IDENTITY(1,1) NOT NULL,
    [KUL_AD] varchar(20)  NULL,
    [KUL_SIFRE] varchar(20)  NULL,
    [KUL_AKTIF] bit  NULL,
    [KUL_ISIM] varchar(50)  NULL,
    [KUL_SOYISIM] varchar(50)  NULL,
    [KUL_TCNO] varchar(11)  NULL,
    [KUL_CINSIYET] varchar(10)  NULL,
    [KUL_NO] int  NULL,
    [KUL_VISIM] varchar(50)  NULL,
    [KUL_VSOYISIM] varchar(50)  NULL,
    [KUL_TEL1] varchar(20)  NULL,
    [KUL_TEL2] varchar(20)  NULL,
    [KUL_TEL3] varchar(20)  NULL,
    [KUL_OLSTAR] datetime  NULL,
    [KUL_GRSTAR] datetime  NULL,
    [KUL_EXPTAR] datetime  NULL,
    [YTK_ID] smallint  NULL,
    [OKL_ID] int  NULL,
    [SNF_ID] int  NULL,
    [SUB_ID] int  NULL,
    [KUR_ID] int  NULL,
    [RE1_ID] int  NULL,
    [RE2_ID] int  NULL,
    [RE3_ID] int  NULL,
    [BRS_ID] int  NULL,
    [KUL_TEMP] varchar(max)  NULL,
    [KUL_ADSOYAD] varchar(100)  NULL,
    [KUL_DAVNOT] smallint  NULL
);
GO

-- Creating table 'KURLAR'
CREATE TABLE [dbo].[KURLAR] (
    [KUR_ID] int IDENTITY(1,1) NOT NULL,
    [KUR_AD] varchar(50)  NULL,
    [KUR_SIRA] int  NULL,
    [SNF_ID] int  NULL,
    [OKL_ID] int  NULL
);
GO

-- Creating table 'MESAJLAR'
CREATE TABLE [dbo].[MESAJLAR] (
    [MSJ_ID] int IDENTITY(1,1) NOT NULL,
    [MSJ_METNI] varchar(max)  NULL,
    [MSJ_KONU] varchar(max)  NULL,
    [MSJ_KIM_ID] int  NULL,
    [MSJ_KIM] varchar(50)  NULL,
    [MSJ_KIME_ID] int  NULL,
    [MSJ_KIME] varchar(50)  NULL,
    [MSJ_OKUNDU] bit  NULL,
    [MSJ_TAR] datetime  NULL
);
GO

-- Creating table 'SINIFLAR'
CREATE TABLE [dbo].[SINIFLAR] (
    [SNF_ID] int IDENTITY(1,1) NOT NULL,
    [SNF_AD] varchar(50)  NULL,
    [SNF_SIRA] int  NULL,
    [KRN_ID] int  NULL,
    [OKL_ID] int  NULL
);
GO

-- Creating table 'SUBELER'
CREATE TABLE [dbo].[SUBELER] (
    [SUB_ID] int IDENTITY(1,1) NOT NULL,
    [SUB_AD] varchar(50)  NULL,
    [SUB_SIRA] int  NULL,
    [SNF_ID] int  NULL,
    [OKL_ID] int  NULL
);
GO

-- Creating table 'YETKILER'
CREATE TABLE [dbo].[YETKILER] (
    [YTK_ID] smallint IDENTITY(1,1) NOT NULL,
    [YTK_AD] varchar(20)  NULL,
    [YTK_KODU] smallint  NULL
);
GO

-- Creating table 'BRANSLAR'
CREATE TABLE [dbo].[BRANSLAR] (
    [BRS_ID] int IDENTITY(1,1) NOT NULL,
    [BRS_AD] varchar(50)  NULL,
    [BRS_SIRA] int  NULL
);
GO

-- Creating table 'CINSIYET'
CREATE TABLE [dbo].[CINSIYET] (
    [CNS_ID] smallint IDENTITY(1,1) NOT NULL,
    [CNS_AD] varchar(20)  NULL,
    [CNS_DEGER] varchar(20)  NULL
);
GO

-- Creating table 'HAFTALAR'
CREATE TABLE [dbo].[HAFTALAR] (
    [HFT_ID] int IDENTITY(1,1) NOT NULL,
    [HFT_AD] varchar(50)  NULL,
    [HFT_DETAY] varchar(255)  NULL,
    [HFT_BITTAR] datetime  NULL,
    [HFT_IZINVELI] bit  NULL,
    [HFT_AKTIF] bit  NULL
);
GO

-- Creating table 'ARA_TBL1'
CREATE TABLE [dbo].[ARA_TBL1] (
    [ARA_ID] int IDENTITY(1,1) NOT NULL,
    [SUB_ID] int  NULL,
    [DML_ID] int  NULL,
    [DYR_ID] int  NULL,
    [ODV_ID] int  NULL,
    [HFT_ID] int  NULL
);
GO

-- Creating table 'DAMLACIKLAR'
CREATE TABLE [dbo].[DAMLACIKLAR] (
    [DML_ID] int IDENTITY(1,1) NOT NULL,
    [DML_AD] varchar(max)  NULL,
    [DML_METIN] varchar(max)  NULL,
    [HFT_ID] int  NULL,
    [OKL_ID] int  NULL,
    [SUB_ADS] varchar(max)  NULL,
    [KUL_ID] int  NULL,
    [DML_TAR] datetime  NULL
);
GO

-- Creating table 'DUYURULAR'
CREATE TABLE [dbo].[DUYURULAR] (
    [DYR_ID] int IDENTITY(1,1) NOT NULL,
    [DYR_AD] varchar(255)  NULL,
    [DYR_METIN] varchar(max)  NULL,
    [HFT_ID] int  NULL,
    [OKL_ID] int  NULL,
    [SUB_ADS] varchar(max)  NULL,
    [KUL_ID] int  NULL,
    [DRY_TAR] datetime  NULL
);
GO

-- Creating table 'ODEVLER'
CREATE TABLE [dbo].[ODEVLER] (
    [ODV_ID] int IDENTITY(1,1) NOT NULL,
    [ODV_AD] varchar(255)  NULL,
    [ODV_METIN] varchar(max)  NULL,
    [HFT_ID] int  NULL,
    [OKL_ID] int  NULL,
    [SUB_ADS] varchar(max)  NULL,
    [KUL_ID] int  NULL,
    [ODV_TAR] datetime  NULL
);
GO

-- Creating table 'OZELNOTLAR'
CREATE TABLE [dbo].[OZELNOTLAR] (
    [OZL_ID] int IDENTITY(1,1) NOT NULL,
    [OZL_AD] varchar(255)  NULL,
    [OZL_METIN] varchar(max)  NULL,
    [HFT_ID] int  NULL,
    [OKL_ID] int  NULL,
    [SUB_ADS] varchar(max)  NULL,
    [KUL_ID] int  NULL
);
GO

-- Creating table 'ODEVSNCLAR'
CREATE TABLE [dbo].[ODEVSNCLAR] (
    [SNC_ID] int IDENTITY(1,1) NOT NULL,
    [SNC_AD] varchar(255)  NULL,
    [SNC_METIN] varchar(max)  NULL,
    [HFT_ID] int  NULL,
    [OKL_ID] int  NULL,
    [SUB_ADS] varchar(max)  NULL,
    [KUL_ID] int  NULL
);
GO

-- Creating table 'OZELNOT'
CREATE TABLE [dbo].[OZELNOT] (
    [OZN_ID] int IDENTITY(1,1) NOT NULL,
    [OZN_NOT] varchar(max)  NULL,
    [KUL_ID] int  NULL,
    [OZL_ID] int  NULL,
    [OZN_AKTIF] bit  NOT NULL,
    [OZN_GRUP] varchar(255)  NULL,
    [HFT_ID] int  NULL,
    [OZN_TAR] datetime  NULL
);
GO

-- Creating table 'ODEVSNC'
CREATE TABLE [dbo].[ODEVSNC] (
    [ODE_ID] int IDENTITY(1,1) NOT NULL,
    [ODE_NOT] varchar(max)  NULL,
    [HFT_ID] int  NULL,
    [KUL_ID] int  NULL,
    [SNC_ID] int  NULL,
    [ODE_AKTIF] bit  NOT NULL,
    [ODE_GRUP] varchar(255)  NULL,
    [ODE_DURUM1] bit  NOT NULL,
    [ODE_DURUM2] bit  NOT NULL,
    [ODE_DURUM3] bit  NOT NULL,
    [ODE_DURUM4] bit  NOT NULL,
    [ODE_DURUM5] bit  NOT NULL,
    [ODE_SNC] varchar(50)  NULL,
    [ODE_TAR] datetime  NULL
);
GO

-- Creating table 'SINAVTIP'
CREATE TABLE [dbo].[SINAVTIP] (
    [STP_ID] smallint IDENTITY(1,1) NOT NULL,
    [STP_AD] varchar(50)  NULL
);
GO

-- Creating table 'CEVAPLAR'
CREATE TABLE [dbo].[CEVAPLAR] (
    [CVP_ID] int IDENTITY(1,1) NOT NULL,
    [SNV_ID] int  NULL,
    [DRS_ID] int  NULL,
    [CVP_KA] varchar(100)  NULL,
    [CVP_KB] varchar(100)  NULL,
    [CVP_KC] varchar(100)  NULL,
    [CVP_KD] varchar(100)  NULL
);
GO

-- Creating table 'DRSSNVSNC'
CREATE TABLE [dbo].[DRSSNVSNC] (
    [DSN_ID] int IDENTITY(1,1) NOT NULL,
    [SNV_ID] int  NULL,
    [KUL_ID] int  NULL,
    [DRS_ID] int  NULL,
    [DSN_SS] smallint  NULL,
    [DSN_DS] smallint  NULL,
    [DSN_YS] smallint  NULL,
    [DSN_NS] decimal(5,2)  NULL,
    [DSN_ORTSUB] decimal(5,2)  NULL,
    [DSN_ORTSNF] decimal(5,2)  NULL,
    [DSN_ORTOKL] decimal(5,2)  NULL,
    [DSN_ORTKRM] decimal(5,2)  NULL,
    [DSN_BSRYZD] decimal(5,2)  NULL,
    [DSN_BSRYRM] varchar(50)  NULL,
    [DSN_BS] smallint  NULL,
    [DSN_PUAN] decimal(5,2)  NULL,
    [DSN_SRASUB] smallint  NULL,
    [DSN_SRASNF] smallint  NULL,
    [DSN_SRAOKL] smallint  NULL,
    [DSN_SRAKRM] smallint  NULL,
    [DSN_TOPSUB] smallint  NULL,
    [DSN_TOPSNF] smallint  NULL,
    [DSN_TOPOKL] smallint  NULL,
    [DSN_TOPKRM] smallint  NULL,
    [DSN_CVPANH] varchar(255)  NULL,
    [DSN_CVPKUL] varchar(255)  NULL,
    [DSN_CVPAE] varchar(255)  NULL,
    [DSN_KTPCK] varchar(10)  NULL,
    [DSN_YGS1] decimal(5,2)  NULL,
    [DSN_YGS2] decimal(5,2)  NULL,
    [DSN_YGS3] decimal(5,2)  NULL,
    [DSN_YGS4] decimal(5,2)  NULL,
    [DSN_YGS5] decimal(5,2)  NULL,
    [DSN_YGS6] decimal(5,2)  NULL,
    [DSN_MF1] decimal(5,2)  NULL,
    [DSN_MF2] decimal(5,2)  NULL,
    [DSN_MF3] decimal(5,2)  NULL,
    [DSN_MF4] decimal(5,2)  NULL,
    [DSN_TM1] decimal(5,2)  NULL,
    [DSN_TM2] decimal(5,2)  NULL,
    [DSN_TM3] decimal(5,2)  NULL,
    [DSN_TS1] decimal(5,2)  NULL,
    [DSN_TS2] decimal(5,2)  NULL,
    [DSN_DIL1] decimal(5,2)  NULL,
    [DSN_DIL2] decimal(5,2)  NULL
);
GO

-- Creating table 'SINAVLAR'
CREATE TABLE [dbo].[SINAVLAR] (
    [SNV_ID] int IDENTITY(1,1) NOT NULL,
    [SNV_AD] varchar(50)  NULL,
    [SDT_ID] int  NULL,
    [SNF_ID] int  NULL,
    [OKL_ID] int  NULL,
    [SNV_KB] bit  NOT NULL,
    [SNV_KC] bit  NOT NULL,
    [SNV_KD] bit  NOT NULL,
    [SNV_KACY1D] smallint  NULL,
    [SNV_DEG] bit  NOT NULL,
    [SNV_DEGTAR] datetime  NULL,
    [SNV_EKLTAR] datetime  NULL,
    [HFT_ID] int  NULL,
    [SNV_KARNE] bit  NULL
);
GO

-- Creating table 'ARA_TBL2'
CREATE TABLE [dbo].[ARA_TBL2] (
    [ARA_ID] int IDENTITY(1,1) NOT NULL,
    [KUL_ID] int  NULL,
    [OKL_ID] int  NULL
);
GO

-- Creating table 'SINAVSNC'
CREATE TABLE [dbo].[SINAVSNC] (
    [SNS_ID] int IDENTITY(1,1) NOT NULL,
    [SNV_ID] int  NULL,
    [KUL_ID] int  NULL,
    [SNS_SS] smallint  NULL,
    [SNS_DS] smallint  NULL,
    [SNS_YS] smallint  NULL,
    [SNS_BS] smallint  NULL,
    [SNS_NS] decimal(5,2)  NULL,
    [SNS_PUAN] decimal(5,2)  NULL,
    [SNS_ORTSUB] decimal(5,2)  NULL,
    [SNS_SRASUB] smallint  NULL,
    [SNS_TOPSUB] smallint  NULL,
    [SNS_ORTSNF] decimal(5,2)  NULL,
    [SNS_SRASNF] smallint  NULL,
    [SNS_TOPSNF] smallint  NULL,
    [SNS_ORTOKL] decimal(5,2)  NULL,
    [SNS_SRAOKL] smallint  NULL,
    [SNS_TOPOKL] smallint  NULL,
    [SNS_ORTKRM] decimal(5,2)  NULL,
    [SNS_SRAKRM] smallint  NULL,
    [SNS_TOPKRM] smallint  NULL,
    [SNS_BSRYZD] decimal(5,2)  NULL,
    [SNS_BSRYRM] varchar(50)  NULL,
    [SNS_KTPCK] varchar(10)  NULL,
    [SNS_YGS1] decimal(5,2)  NULL,
    [SNS_YGS2] decimal(5,2)  NULL,
    [SNS_YGS3] decimal(5,2)  NULL,
    [SNS_YGS4] decimal(5,2)  NULL,
    [SNS_YGS5] decimal(5,2)  NULL,
    [SNS_YGS6] decimal(5,2)  NULL,
    [SNS_MF1] decimal(5,2)  NULL,
    [SNS_MF2] decimal(5,2)  NULL,
    [SNS_MF3] decimal(5,2)  NULL,
    [SNS_MF4] decimal(5,2)  NULL,
    [SNS_TM1] decimal(5,2)  NULL,
    [SNS_TM2] decimal(5,2)  NULL,
    [SNS_TM3] decimal(5,2)  NULL,
    [SNS_TS1] decimal(5,2)  NULL,
    [SNS_TS2] decimal(5,2)  NULL,
    [SNS_DIL1] decimal(5,2)  NULL,
    [SNS_DIL2] decimal(5,2)  NULL
);
GO

-- Creating table 'RDSDERSLER'
CREATE TABLE [dbo].[RDSDERSLER] (
    [RDS_ID] int IDENTITY(1,1) NOT NULL,
    [KUL_ID] int  NULL,
    [RDS_KONU] varchar(255)  NULL,
    [SNF_ID] int  NULL,
    [DRS_ID] int  NULL,
    [RDS_YER] varchar(255)  NULL,
    [RDS_KONT] smallint  NULL,
    [RDS_KONTBOS] smallint  NULL,
    [RDS_EKLTAR] datetime  NULL,
    [RDS_AKTIF] bit  NULL,
    [RDS_ZAMAN] varchar(255)  NULL
);
GO

-- Creating table 'RDSLISTE'
CREATE TABLE [dbo].[RDSLISTE] (
    [RDL_ID] int IDENTITY(1,1) NOT NULL,
    [RDS_ID] int  NULL,
    [KUL_ID] int  NULL
);
GO

-- Creating table 'KARNEDERS'
CREATE TABLE [dbo].[KARNEDERS] (
    [KDL_ID] int IDENTITY(1,1) NOT NULL,
    [SNF_ID] int  NULL,
    [DRS_ID] int  NULL,
    [OKL_ID] int  NULL
);
GO

-- Creating table 'KARNEDERSNOT'
CREATE TABLE [dbo].[KARNEDERSNOT] (
    [KDN_ID] int IDENTITY(1,1) NOT NULL,
    [DRS_ID] int  NULL,
    [KUL_ID] int  NULL,
    [KDN_MUAF] bit  NOT NULL,
    [KDN_DONEM] smallint  NULL,
    [KDN_S1] smallint  NULL,
    [KDN_S2] smallint  NULL,
    [KDN_S3] smallint  NULL,
    [KDN_S4] smallint  NULL,
    [KDN_PRO1] smallint  NULL,
    [KDN_PRO2] smallint  NULL,
    [KDN_PROORT] decimal(5,2)  NULL,
    [KDN_PEK1] smallint  NULL,
    [KDN_PEK2] smallint  NULL,
    [KDN_PEK3] smallint  NULL,
    [KDN_PEKORT] decimal(5,2)  NULL,
    [KDN_PG1] smallint  NULL,
    [KDN_PG2] smallint  NULL,
    [KDN_PG3] smallint  NULL,
    [KDN_PG4] smallint  NULL,
    [KDN_PG5] smallint  NULL,
    [KDN_PGORT] decimal(5,2)  NULL,
    [KDN_PERORT] decimal(5,2)  NULL,
    [KDN_NOT] smallint  NULL,
    [KDN_PUAN] decimal(5,2)  NULL
);
GO

-- Creating table 'OKULTUR'
CREATE TABLE [dbo].[OKULTUR] (
    [OTR_ID] smallint IDENTITY(1,1) NOT NULL,
    [OTR_KOD] varchar(10)  NULL,
    [OTR_AD] varchar(50)  NULL
);
GO

-- Creating table 'DEGEREGITIM'
CREATE TABLE [dbo].[DEGEREGITIM] (
    [DGE_ID] int IDENTITY(1,1) NOT NULL,
    [DGE_AD] varchar(max)  NULL,
    [DGE_METIN] varchar(max)  NULL,
    [HFT_ID] int  NULL,
    [OKL_ID] int  NULL,
    [SUB_ADS] varchar(max)  NULL,
    [KUL_ID] int  NULL,
    [DGE_TAR] datetime  NULL
);
GO

-- Creating table 'AOPLANLAR'
CREATE TABLE [dbo].[AOPLANLAR] (
    [HPL_ID] int IDENTITY(1,1) NOT NULL,
    [HFT_ID] int  NULL,
    [OKL_ID] int  NULL,
    [SUB_ADS] varchar(max)  NULL,
    [KUL_ID] int  NULL,
    [HPL_PTESI] varchar(max)  NULL,
    [HPL_IPTESI] varchar(max)  NULL,
    [HPL_SALI] varchar(max)  NULL,
    [HPL_ISALI] varchar(max)  NULL,
    [HPL_CARS] varchar(max)  NULL,
    [HPL_ICARS] varchar(max)  NULL,
    [HPL_PERS] varchar(max)  NULL,
    [HPL_IPERS] varchar(max)  NULL,
    [HPL_CUMA] varchar(max)  NULL,
    [HPL_ICUMA] varchar(max)  NULL
);
GO

-- Creating table 'DERSLER'
CREATE TABLE [dbo].[DERSLER] (
    [DRS_ID] int IDENTITY(1,1) NOT NULL,
    [DRS_AD] varchar(50)  NULL,
    [DRS_SIRA] int  NULL
);
GO

-- Creating table 'OPTIK'
CREATE TABLE [dbo].[OPTIK] (
    [OPT_ID] int IDENTITY(1,1) NOT NULL,
    [OPT_AD] varchar(50)  NULL,
    [SDT_ID] int  NULL,
    [OKL_ID] int  NULL,
    [OPT_OK_BAS] smallint  NULL,
    [OPT_OK_UZN] smallint  NULL,
    [OPT_TC_BAS] smallint  NULL,
    [OPT_TC_UZN] smallint  NULL,
    [OPT_NO_BAS] smallint  NULL,
    [OPT_NO_UZN] smallint  NULL,
    [OPT_KT_BAS] smallint  NULL,
    [OPT_D0_BAS] smallint  NULL,
    [OPT_D1_BAS] smallint  NULL,
    [OPT_D2_BAS] smallint  NULL,
    [OPT_D3_BAS] smallint  NULL,
    [OPT_D4_BAS] smallint  NULL,
    [OPT_D5_BAS] smallint  NULL,
    [OPT_D6_BAS] smallint  NULL,
    [OPT_D7_BAS] smallint  NULL,
    [OPT_D8_BAS] smallint  NULL,
    [OPT_D9_BAS] smallint  NULL,
    [OPT_D10_BAS] smallint  NULL,
    [OPT_D11_BAS] smallint  NULL,
    [OPT_D12_BAS] smallint  NULL,
    [OPT_D13_BAS] smallint  NULL,
    [OPT_D14_BAS] smallint  NULL,
    [OPT_AD_BAS] smallint  NULL,
    [OPT_AD_UZN] smallint  NULL,
    [OPT_SOY_BAS] smallint  NULL,
    [OPT_SOY_UZN] smallint  NULL
);
GO

-- Creating table 'SINAVDETAY'
CREATE TABLE [dbo].[SINAVDETAY] (
    [SDT_ID] int IDENTITY(1,1) NOT NULL,
    [STP_ID] smallint  NULL,
    [SDT_AD] varchar(50)  NULL,
    [SDT_NOT] varchar(max)  NULL,
    [SDT_TOPSORU] smallint  NULL,
    [SDT_TABPUAN] decimal(5,2)  NULL,
    [SDT_DERSLER] varchar(max)  NULL,
    [OPT_ID] int  NULL,
    [OKL_ID] int  NULL,
    [SDT_DRS0] int  NULL,
    [SDT_DRS0SS] smallint  NULL,
    [SDT_DRS0KS] decimal(4,2)  NULL,
    [SDT_DRS1] int  NULL,
    [SDT_DRS1SS] smallint  NULL,
    [SDT_DRS1KS] decimal(4,2)  NULL,
    [SDT_DRS2] int  NULL,
    [SDT_DRS2SS] smallint  NULL,
    [SDT_DRS2KS] decimal(4,2)  NULL,
    [SDT_DRS3] int  NULL,
    [SDT_DRS3SS] smallint  NULL,
    [SDT_DRS3KS] decimal(4,2)  NULL,
    [SDT_DRS4] int  NULL,
    [SDT_DRS4SS] smallint  NULL,
    [SDT_DRS4KS] decimal(4,2)  NULL,
    [SDT_DRS5] int  NULL,
    [SDT_DRS5SS] smallint  NULL,
    [SDT_DRS5KS] decimal(4,2)  NULL,
    [SDT_DRS6] int  NULL,
    [SDT_DRS6SS] smallint  NULL,
    [SDT_DRS6KS] decimal(4,2)  NULL,
    [SDT_DRS7] int  NULL,
    [SDT_DRS7SS] smallint  NULL,
    [SDT_DRS7KS] decimal(4,2)  NULL,
    [SDT_DRS8] int  NULL,
    [SDT_DRS8SS] smallint  NULL,
    [SDT_DRS8KS] decimal(4,2)  NULL,
    [SDT_DRS9] int  NULL,
    [SDT_DRS9SS] smallint  NULL,
    [SDT_DRS9KS] decimal(4,2)  NULL,
    [SDT_DRS10] int  NULL,
    [SDT_DRS10SS] smallint  NULL,
    [SDT_DRS10KS] decimal(4,2)  NULL,
    [SDT_DRS11] int  NULL,
    [SDT_DRS11SS] smallint  NULL,
    [SDT_DRS11KS] decimal(4,2)  NULL,
    [SDT_DRS12] int  NULL,
    [SDT_DRS12SS] smallint  NULL,
    [SDT_DRS12KS] decimal(4,2)  NULL,
    [SDT_DRS13] int  NULL,
    [SDT_DRS13SS] smallint  NULL,
    [SDT_DRS13KS] decimal(4,2)  NULL,
    [SDT_DRS14] int  NULL,
    [SDT_DRS14SS] smallint  NULL,
    [SDT_DRS14KS] decimal(4,2)  NULL
);
GO

-- Creating table 'RESIMLER'
CREATE TABLE [dbo].[RESIMLER] (
    [RSM_ID] int IDENTITY(1,1) NOT NULL,
    [RSM_AD] varchar(255)  NULL,
    [RSM_YOL] varchar(255)  NULL,
    [RSM_IMG] varbinary(max)  NULL,
    [OKL_ID] int  NULL,
    [RSM_DAD] varchar(255)  NULL,
    [RSM_TYPE] varchar(50)  NULL
);
GO

-- Creating table 'OKULLAR'
CREATE TABLE [dbo].[OKULLAR] (
    [OKL_ID] int IDENTITY(1,1) NOT NULL,
    [OTR_KOD] varchar(10)  NULL,
    [OKL_KODU] varchar(50)  NULL,
    [OKL_ADI] varchar(max)  NULL,
    [OKL_KISA] varchar(20)  NULL,
    [OKL_SIRA] int  NULL,
    [RSM_ID] int  NULL,
    [OKL_SMSKULAD] varchar(50)  NULL,
    [OKL_SMSSIFRE] varchar(50)  NULL,
    [OKL_RESELLERID] varchar(10)  NULL,
    [OKL_SMSBASLIK] varchar(50)  NULL
);
GO

-- Creating table 'HATALAR'
CREATE TABLE [dbo].[HATALAR] (
    [ERR_ID] int IDENTITY(1,1) NOT NULL,
    [ERR_MSG1] varchar(max)  NULL,
    [ERR_MSG2] varchar(max)  NULL,
    [ERR_MSG3] varchar(max)  NULL,
    [ERR_MSG4] varchar(max)  NULL,
    [ERR_MSG5] varchar(max)  NULL,
    [ERR_KUL] varchar(50)  NULL,
    [ERR_TAR] datetime  NULL,
    [ERR_KULMSG] varchar(max)  NULL
);
GO

-- Creating table 'HEPTABLO'
CREATE TABLE [dbo].[HEPTABLO] (
    [HEP_ID] int IDENTITY(1,1) NOT NULL,
    [OKL_ID] int  NULL,
    [HEP_GRUP] smallint  NULL,
    [KUL_ID] int  NULL,
    [HEP_H1] smallint  NULL,
    [HEP_G1] smallint  NULL,
    [HEP_H2] smallint  NULL,
    [HEP_G2] smallint  NULL,
    [HEP_H3] smallint  NULL,
    [HEP_G3] smallint  NULL,
    [HEP_H4] smallint  NULL,
    [HEP_G4] smallint  NULL,
    [HEP_H5] smallint  NULL,
    [HEP_G5] smallint  NULL,
    [HEP_H6] smallint  NULL,
    [HEP_G6] smallint  NULL,
    [HEP_H7] smallint  NULL,
    [HEP_G7] smallint  NULL,
    [HEP_H8] smallint  NULL,
    [HEP_G8] smallint  NULL,
    [HEP_H9] smallint  NULL,
    [HEP_G9] smallint  NULL
);
GO

-- Creating table 'SORUANALIZ'
CREATE TABLE [dbo].[SORUANALIZ] (
    [SOR_ID] int IDENTITY(1,1) NOT NULL,
    [SNV_ID] int  NULL,
    [DRS_ID] int  NULL,
    [SOR_NO] smallint  NULL,
    [SOR_GUCDER] decimal(5,2)  NULL,
    [SOR_GUCYRM] varchar(20)  NULL,
    [SOR_AGUCDER] decimal(5,2)  NULL,
    [SOR_AGUCYRM] varchar(20)  NULL,
    [SOR_DCVP] varchar(10)  NULL,
    [SOR_CVPA] smallint  NULL,
    [SOR_GUCA] decimal(2,2)  NULL,
    [SOR_CVPB] smallint  NULL,
    [SOR_GUCB] decimal(2,2)  NULL,
    [SOR_CVPC] smallint  NULL,
    [SOR_GUCC] decimal(2,2)  NULL,
    [SOR_CVPD] smallint  NULL,
    [SOR_GUCD] decimal(2,2)  NULL,
    [SOR_CVPE] smallint  NULL,
    [SOR_GUCE] decimal(2,2)  NULL,
    [SOR_BOS] smallint  NULL
);
GO

-- Creating table 'DAVRANISLAR'
CREATE TABLE [dbo].[DAVRANISLAR] (
    [DVR_ID] int IDENTITY(1,1) NOT NULL,
    [DVR_AD] varchar(255)  NULL,
    [SNF_ID] int  NULL,
    [DVR_OLUMLU] bit  NULL,
    [DVR_NOT] smallint  NULL
);
GO

-- Creating table 'DAVRANIS'
CREATE TABLE [dbo].[DAVRANIS] (
    [DAV_ID] int IDENTITY(1,1) NOT NULL,
    [KUL_ID] int  NULL,
    [HFT_ID] int  NULL,
    [OKL_ID] int  NULL,
    [DAV_KULID] int  NULL,
    [DAV_AD] varchar(255)  NULL,
    [DAV_NOT] smallint  NULL,
    [DAV_OLUMLU] bit  NULL,
    [DAV_TAR] datetime  NULL
);
GO

-- Creating table 'DEVAMSIZ'
CREATE TABLE [dbo].[DEVAMSIZ] (
    [DVM_ID] int IDENTITY(1,1) NOT NULL,
    [KUL_ID] int  NULL,
    [HFT_ID] int  NULL,
    [OKL_ID] int  NULL,
    [DVM_TAR] datetime  NULL,
    [DVM_AD] varchar(50)  NULL,
    [DVM_GUN] decimal(2,1)  NULL,
    [DVM_MAZERET] varchar(255)  NULL
);
GO

-- Creating table 'SAYFALAR'
CREATE TABLE [dbo].[SAYFALAR] (
    [SYF_ID] int IDENTITY(1,1) NOT NULL,
    [SYF_AD] varchar(255)  NULL,
    [SYF_ADMIN] bit  NULL,
    [SYF_OGRETMEN] bit  NULL,
    [SYF_OGRENCI] bit  NULL,
    [SYF_VELI] bit  NULL,
    [SYF_MISAFIR] bit  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [KRN_ID] in table 'KARNELER'
ALTER TABLE [dbo].[KARNELER]
ADD CONSTRAINT [PK_KARNELER]
    PRIMARY KEY CLUSTERED ([KRN_ID] ASC);
GO

-- Creating primary key on [KUL_ID] in table 'KULLANICILAR'
ALTER TABLE [dbo].[KULLANICILAR]
ADD CONSTRAINT [PK_KULLANICILAR]
    PRIMARY KEY CLUSTERED ([KUL_ID] ASC);
GO

-- Creating primary key on [KUR_ID] in table 'KURLAR'
ALTER TABLE [dbo].[KURLAR]
ADD CONSTRAINT [PK_KURLAR]
    PRIMARY KEY CLUSTERED ([KUR_ID] ASC);
GO

-- Creating primary key on [MSJ_ID] in table 'MESAJLAR'
ALTER TABLE [dbo].[MESAJLAR]
ADD CONSTRAINT [PK_MESAJLAR]
    PRIMARY KEY CLUSTERED ([MSJ_ID] ASC);
GO

-- Creating primary key on [SNF_ID] in table 'SINIFLAR'
ALTER TABLE [dbo].[SINIFLAR]
ADD CONSTRAINT [PK_SINIFLAR]
    PRIMARY KEY CLUSTERED ([SNF_ID] ASC);
GO

-- Creating primary key on [SUB_ID] in table 'SUBELER'
ALTER TABLE [dbo].[SUBELER]
ADD CONSTRAINT [PK_SUBELER]
    PRIMARY KEY CLUSTERED ([SUB_ID] ASC);
GO

-- Creating primary key on [YTK_ID] in table 'YETKILER'
ALTER TABLE [dbo].[YETKILER]
ADD CONSTRAINT [PK_YETKILER]
    PRIMARY KEY CLUSTERED ([YTK_ID] ASC);
GO

-- Creating primary key on [BRS_ID] in table 'BRANSLAR'
ALTER TABLE [dbo].[BRANSLAR]
ADD CONSTRAINT [PK_BRANSLAR]
    PRIMARY KEY CLUSTERED ([BRS_ID] ASC);
GO

-- Creating primary key on [CNS_ID] in table 'CINSIYET'
ALTER TABLE [dbo].[CINSIYET]
ADD CONSTRAINT [PK_CINSIYET]
    PRIMARY KEY CLUSTERED ([CNS_ID] ASC);
GO

-- Creating primary key on [HFT_ID] in table 'HAFTALAR'
ALTER TABLE [dbo].[HAFTALAR]
ADD CONSTRAINT [PK_HAFTALAR]
    PRIMARY KEY CLUSTERED ([HFT_ID] ASC);
GO

-- Creating primary key on [ARA_ID] in table 'ARA_TBL1'
ALTER TABLE [dbo].[ARA_TBL1]
ADD CONSTRAINT [PK_ARA_TBL1]
    PRIMARY KEY CLUSTERED ([ARA_ID] ASC);
GO

-- Creating primary key on [DML_ID] in table 'DAMLACIKLAR'
ALTER TABLE [dbo].[DAMLACIKLAR]
ADD CONSTRAINT [PK_DAMLACIKLAR]
    PRIMARY KEY CLUSTERED ([DML_ID] ASC);
GO

-- Creating primary key on [DYR_ID] in table 'DUYURULAR'
ALTER TABLE [dbo].[DUYURULAR]
ADD CONSTRAINT [PK_DUYURULAR]
    PRIMARY KEY CLUSTERED ([DYR_ID] ASC);
GO

-- Creating primary key on [ODV_ID] in table 'ODEVLER'
ALTER TABLE [dbo].[ODEVLER]
ADD CONSTRAINT [PK_ODEVLER]
    PRIMARY KEY CLUSTERED ([ODV_ID] ASC);
GO

-- Creating primary key on [OZL_ID] in table 'OZELNOTLAR'
ALTER TABLE [dbo].[OZELNOTLAR]
ADD CONSTRAINT [PK_OZELNOTLAR]
    PRIMARY KEY CLUSTERED ([OZL_ID] ASC);
GO

-- Creating primary key on [SNC_ID] in table 'ODEVSNCLAR'
ALTER TABLE [dbo].[ODEVSNCLAR]
ADD CONSTRAINT [PK_ODEVSNCLAR]
    PRIMARY KEY CLUSTERED ([SNC_ID] ASC);
GO

-- Creating primary key on [OZN_ID] in table 'OZELNOT'
ALTER TABLE [dbo].[OZELNOT]
ADD CONSTRAINT [PK_OZELNOT]
    PRIMARY KEY CLUSTERED ([OZN_ID] ASC);
GO

-- Creating primary key on [ODE_ID] in table 'ODEVSNC'
ALTER TABLE [dbo].[ODEVSNC]
ADD CONSTRAINT [PK_ODEVSNC]
    PRIMARY KEY CLUSTERED ([ODE_ID] ASC);
GO

-- Creating primary key on [STP_ID] in table 'SINAVTIP'
ALTER TABLE [dbo].[SINAVTIP]
ADD CONSTRAINT [PK_SINAVTIP]
    PRIMARY KEY CLUSTERED ([STP_ID] ASC);
GO

-- Creating primary key on [CVP_ID] in table 'CEVAPLAR'
ALTER TABLE [dbo].[CEVAPLAR]
ADD CONSTRAINT [PK_CEVAPLAR]
    PRIMARY KEY CLUSTERED ([CVP_ID] ASC);
GO

-- Creating primary key on [DSN_ID] in table 'DRSSNVSNC'
ALTER TABLE [dbo].[DRSSNVSNC]
ADD CONSTRAINT [PK_DRSSNVSNC]
    PRIMARY KEY CLUSTERED ([DSN_ID] ASC);
GO

-- Creating primary key on [SNV_ID] in table 'SINAVLAR'
ALTER TABLE [dbo].[SINAVLAR]
ADD CONSTRAINT [PK_SINAVLAR]
    PRIMARY KEY CLUSTERED ([SNV_ID] ASC);
GO

-- Creating primary key on [ARA_ID] in table 'ARA_TBL2'
ALTER TABLE [dbo].[ARA_TBL2]
ADD CONSTRAINT [PK_ARA_TBL2]
    PRIMARY KEY CLUSTERED ([ARA_ID] ASC);
GO

-- Creating primary key on [SNS_ID] in table 'SINAVSNC'
ALTER TABLE [dbo].[SINAVSNC]
ADD CONSTRAINT [PK_SINAVSNC]
    PRIMARY KEY CLUSTERED ([SNS_ID] ASC);
GO

-- Creating primary key on [RDS_ID] in table 'RDSDERSLER'
ALTER TABLE [dbo].[RDSDERSLER]
ADD CONSTRAINT [PK_RDSDERSLER]
    PRIMARY KEY CLUSTERED ([RDS_ID] ASC);
GO

-- Creating primary key on [RDL_ID] in table 'RDSLISTE'
ALTER TABLE [dbo].[RDSLISTE]
ADD CONSTRAINT [PK_RDSLISTE]
    PRIMARY KEY CLUSTERED ([RDL_ID] ASC);
GO

-- Creating primary key on [KDL_ID] in table 'KARNEDERS'
ALTER TABLE [dbo].[KARNEDERS]
ADD CONSTRAINT [PK_KARNEDERS]
    PRIMARY KEY CLUSTERED ([KDL_ID] ASC);
GO

-- Creating primary key on [KDN_ID] in table 'KARNEDERSNOT'
ALTER TABLE [dbo].[KARNEDERSNOT]
ADD CONSTRAINT [PK_KARNEDERSNOT]
    PRIMARY KEY CLUSTERED ([KDN_ID] ASC);
GO

-- Creating primary key on [OTR_ID] in table 'OKULTUR'
ALTER TABLE [dbo].[OKULTUR]
ADD CONSTRAINT [PK_OKULTUR]
    PRIMARY KEY CLUSTERED ([OTR_ID] ASC);
GO

-- Creating primary key on [DGE_ID] in table 'DEGEREGITIM'
ALTER TABLE [dbo].[DEGEREGITIM]
ADD CONSTRAINT [PK_DEGEREGITIM]
    PRIMARY KEY CLUSTERED ([DGE_ID] ASC);
GO

-- Creating primary key on [HPL_ID] in table 'AOPLANLAR'
ALTER TABLE [dbo].[AOPLANLAR]
ADD CONSTRAINT [PK_AOPLANLAR]
    PRIMARY KEY CLUSTERED ([HPL_ID] ASC);
GO

-- Creating primary key on [DRS_ID] in table 'DERSLER'
ALTER TABLE [dbo].[DERSLER]
ADD CONSTRAINT [PK_DERSLER]
    PRIMARY KEY CLUSTERED ([DRS_ID] ASC);
GO

-- Creating primary key on [OPT_ID] in table 'OPTIK'
ALTER TABLE [dbo].[OPTIK]
ADD CONSTRAINT [PK_OPTIK]
    PRIMARY KEY CLUSTERED ([OPT_ID] ASC);
GO

-- Creating primary key on [SDT_ID] in table 'SINAVDETAY'
ALTER TABLE [dbo].[SINAVDETAY]
ADD CONSTRAINT [PK_SINAVDETAY]
    PRIMARY KEY CLUSTERED ([SDT_ID] ASC);
GO

-- Creating primary key on [RSM_ID] in table 'RESIMLER'
ALTER TABLE [dbo].[RESIMLER]
ADD CONSTRAINT [PK_RESIMLER]
    PRIMARY KEY CLUSTERED ([RSM_ID] ASC);
GO

-- Creating primary key on [OKL_ID] in table 'OKULLAR'
ALTER TABLE [dbo].[OKULLAR]
ADD CONSTRAINT [PK_OKULLAR]
    PRIMARY KEY CLUSTERED ([OKL_ID] ASC);
GO

-- Creating primary key on [ERR_ID] in table 'HATALAR'
ALTER TABLE [dbo].[HATALAR]
ADD CONSTRAINT [PK_HATALAR]
    PRIMARY KEY CLUSTERED ([ERR_ID] ASC);
GO

-- Creating primary key on [HEP_ID] in table 'HEPTABLO'
ALTER TABLE [dbo].[HEPTABLO]
ADD CONSTRAINT [PK_HEPTABLO]
    PRIMARY KEY CLUSTERED ([HEP_ID] ASC);
GO

-- Creating primary key on [SOR_ID] in table 'SORUANALIZ'
ALTER TABLE [dbo].[SORUANALIZ]
ADD CONSTRAINT [PK_SORUANALIZ]
    PRIMARY KEY CLUSTERED ([SOR_ID] ASC);
GO

-- Creating primary key on [DVR_ID] in table 'DAVRANISLAR'
ALTER TABLE [dbo].[DAVRANISLAR]
ADD CONSTRAINT [PK_DAVRANISLAR]
    PRIMARY KEY CLUSTERED ([DVR_ID] ASC);
GO

-- Creating primary key on [DAV_ID] in table 'DAVRANIS'
ALTER TABLE [dbo].[DAVRANIS]
ADD CONSTRAINT [PK_DAVRANIS]
    PRIMARY KEY CLUSTERED ([DAV_ID] ASC);
GO

-- Creating primary key on [DVM_ID] in table 'DEVAMSIZ'
ALTER TABLE [dbo].[DEVAMSIZ]
ADD CONSTRAINT [PK_DEVAMSIZ]
    PRIMARY KEY CLUSTERED ([DVM_ID] ASC);
GO

-- Creating primary key on [SYF_ID] in table 'SAYFALAR'
ALTER TABLE [dbo].[SAYFALAR]
ADD CONSTRAINT [PK_SAYFALAR]
    PRIMARY KEY CLUSTERED ([SYF_ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [KRN_ID] in table 'SINIFLAR'
ALTER TABLE [dbo].[SINIFLAR]
ADD CONSTRAINT [FK_SINIFLAR_KARNELER]
    FOREIGN KEY ([KRN_ID])
    REFERENCES [dbo].[KARNELER]
        ([KRN_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINIFLAR_KARNELER'
CREATE INDEX [IX_FK_SINIFLAR_KARNELER]
ON [dbo].[SINIFLAR]
    ([KRN_ID]);
GO

-- Creating foreign key on [KUR_ID] in table 'KULLANICILAR'
ALTER TABLE [dbo].[KULLANICILAR]
ADD CONSTRAINT [FK_KULLANICILAR_KURLAR]
    FOREIGN KEY ([KUR_ID])
    REFERENCES [dbo].[KURLAR]
        ([KUR_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_KULLANICILAR_KURLAR'
CREATE INDEX [IX_FK_KULLANICILAR_KURLAR]
ON [dbo].[KULLANICILAR]
    ([KUR_ID]);
GO

-- Creating foreign key on [SUB_ID] in table 'KULLANICILAR'
ALTER TABLE [dbo].[KULLANICILAR]
ADD CONSTRAINT [FK_KULLANICILAR_SUBELER]
    FOREIGN KEY ([SUB_ID])
    REFERENCES [dbo].[SUBELER]
        ([SUB_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_KULLANICILAR_SUBELER'
CREATE INDEX [IX_FK_KULLANICILAR_SUBELER]
ON [dbo].[KULLANICILAR]
    ([SUB_ID]);
GO

-- Creating foreign key on [YTK_ID] in table 'KULLANICILAR'
ALTER TABLE [dbo].[KULLANICILAR]
ADD CONSTRAINT [FK_KULLANICILAR_YETKILER]
    FOREIGN KEY ([YTK_ID])
    REFERENCES [dbo].[YETKILER]
        ([YTK_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_KULLANICILAR_YETKILER'
CREATE INDEX [IX_FK_KULLANICILAR_YETKILER]
ON [dbo].[KULLANICILAR]
    ([YTK_ID]);
GO

-- Creating foreign key on [MSJ_KIM_ID] in table 'MESAJLAR'
ALTER TABLE [dbo].[MESAJLAR]
ADD CONSTRAINT [FK_MESAJLAR_KIM]
    FOREIGN KEY ([MSJ_KIM_ID])
    REFERENCES [dbo].[KULLANICILAR]
        ([KUL_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MESAJLAR_KIM'
CREATE INDEX [IX_FK_MESAJLAR_KIM]
ON [dbo].[MESAJLAR]
    ([MSJ_KIM_ID]);
GO

-- Creating foreign key on [MSJ_KIME_ID] in table 'MESAJLAR'
ALTER TABLE [dbo].[MESAJLAR]
ADD CONSTRAINT [FK_MESAJLAR_KIME]
    FOREIGN KEY ([MSJ_KIME_ID])
    REFERENCES [dbo].[KULLANICILAR]
        ([KUL_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MESAJLAR_KIME'
CREATE INDEX [IX_FK_MESAJLAR_KIME]
ON [dbo].[MESAJLAR]
    ([MSJ_KIME_ID]);
GO

-- Creating foreign key on [SNF_ID] in table 'KURLAR'
ALTER TABLE [dbo].[KURLAR]
ADD CONSTRAINT [FK_KURLAR_SINIFLAR]
    FOREIGN KEY ([SNF_ID])
    REFERENCES [dbo].[SINIFLAR]
        ([SNF_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_KURLAR_SINIFLAR'
CREATE INDEX [IX_FK_KURLAR_SINIFLAR]
ON [dbo].[KURLAR]
    ([SNF_ID]);
GO

-- Creating foreign key on [SNF_ID] in table 'SUBELER'
ALTER TABLE [dbo].[SUBELER]
ADD CONSTRAINT [FK_SUBELER_SINIFLAR]
    FOREIGN KEY ([SNF_ID])
    REFERENCES [dbo].[SINIFLAR]
        ([SNF_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SUBELER_SINIFLAR'
CREATE INDEX [IX_FK_SUBELER_SINIFLAR]
ON [dbo].[SUBELER]
    ([SNF_ID]);
GO

-- Creating foreign key on [BRS_ID] in table 'KULLANICILAR'
ALTER TABLE [dbo].[KULLANICILAR]
ADD CONSTRAINT [FK_KULLANICILAR_BRANSLAR]
    FOREIGN KEY ([BRS_ID])
    REFERENCES [dbo].[BRANSLAR]
        ([BRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_KULLANICILAR_BRANSLAR'
CREATE INDEX [IX_FK_KULLANICILAR_BRANSLAR]
ON [dbo].[KULLANICILAR]
    ([BRS_ID]);
GO

-- Creating foreign key on [SUB_ID] in table 'ARA_TBL1'
ALTER TABLE [dbo].[ARA_TBL1]
ADD CONSTRAINT [FK_ARA_TBL1_SUBELER]
    FOREIGN KEY ([SUB_ID])
    REFERENCES [dbo].[SUBELER]
        ([SUB_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ARA_TBL1_SUBELER'
CREATE INDEX [IX_FK_ARA_TBL1_SUBELER]
ON [dbo].[ARA_TBL1]
    ([SUB_ID]);
GO

-- Creating foreign key on [DML_ID] in table 'ARA_TBL1'
ALTER TABLE [dbo].[ARA_TBL1]
ADD CONSTRAINT [FK_ARA_TBL1_DAMLACIKLAR]
    FOREIGN KEY ([DML_ID])
    REFERENCES [dbo].[DAMLACIKLAR]
        ([DML_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ARA_TBL1_DAMLACIKLAR'
CREATE INDEX [IX_FK_ARA_TBL1_DAMLACIKLAR]
ON [dbo].[ARA_TBL1]
    ([DML_ID]);
GO

-- Creating foreign key on [HFT_ID] in table 'DAMLACIKLAR'
ALTER TABLE [dbo].[DAMLACIKLAR]
ADD CONSTRAINT [FK_DAMLACIKLAR_HAFTALAR]
    FOREIGN KEY ([HFT_ID])
    REFERENCES [dbo].[HAFTALAR]
        ([HFT_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DAMLACIKLAR_HAFTALAR'
CREATE INDEX [IX_FK_DAMLACIKLAR_HAFTALAR]
ON [dbo].[DAMLACIKLAR]
    ([HFT_ID]);
GO

-- Creating foreign key on [DYR_ID] in table 'ARA_TBL1'
ALTER TABLE [dbo].[ARA_TBL1]
ADD CONSTRAINT [FK_ARA_TBL1_DUYURULAR]
    FOREIGN KEY ([DYR_ID])
    REFERENCES [dbo].[DUYURULAR]
        ([DYR_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ARA_TBL1_DUYURULAR'
CREATE INDEX [IX_FK_ARA_TBL1_DUYURULAR]
ON [dbo].[ARA_TBL1]
    ([DYR_ID]);
GO

-- Creating foreign key on [HFT_ID] in table 'ARA_TBL1'
ALTER TABLE [dbo].[ARA_TBL1]
ADD CONSTRAINT [FK_ARA_TBL1_HAFTALAR]
    FOREIGN KEY ([HFT_ID])
    REFERENCES [dbo].[HAFTALAR]
        ([HFT_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ARA_TBL1_HAFTALAR'
CREATE INDEX [IX_FK_ARA_TBL1_HAFTALAR]
ON [dbo].[ARA_TBL1]
    ([HFT_ID]);
GO

-- Creating foreign key on [ODV_ID] in table 'ARA_TBL1'
ALTER TABLE [dbo].[ARA_TBL1]
ADD CONSTRAINT [FK_ARA_TBL1_ODEVLER]
    FOREIGN KEY ([ODV_ID])
    REFERENCES [dbo].[ODEVLER]
        ([ODV_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ARA_TBL1_ODEVLER'
CREATE INDEX [IX_FK_ARA_TBL1_ODEVLER]
ON [dbo].[ARA_TBL1]
    ([ODV_ID]);
GO

-- Creating foreign key on [HFT_ID] in table 'DUYURULAR'
ALTER TABLE [dbo].[DUYURULAR]
ADD CONSTRAINT [FK_DUYURULAR_HAFTALAR]
    FOREIGN KEY ([HFT_ID])
    REFERENCES [dbo].[HAFTALAR]
        ([HFT_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DUYURULAR_HAFTALAR'
CREATE INDEX [IX_FK_DUYURULAR_HAFTALAR]
ON [dbo].[DUYURULAR]
    ([HFT_ID]);
GO

-- Creating foreign key on [HFT_ID] in table 'ODEVLER'
ALTER TABLE [dbo].[ODEVLER]
ADD CONSTRAINT [FK_ODEVLER_HAFTALAR]
    FOREIGN KEY ([HFT_ID])
    REFERENCES [dbo].[HAFTALAR]
        ([HFT_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ODEVLER_HAFTALAR'
CREATE INDEX [IX_FK_ODEVLER_HAFTALAR]
ON [dbo].[ODEVLER]
    ([HFT_ID]);
GO

-- Creating foreign key on [KUL_ID] in table 'OZELNOT'
ALTER TABLE [dbo].[OZELNOT]
ADD CONSTRAINT [FK_OZELNOT_KULLANICILAR]
    FOREIGN KEY ([KUL_ID])
    REFERENCES [dbo].[KULLANICILAR]
        ([KUL_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OZELNOT_KULLANICILAR'
CREATE INDEX [IX_FK_OZELNOT_KULLANICILAR]
ON [dbo].[OZELNOT]
    ([KUL_ID]);
GO

-- Creating foreign key on [OZL_ID] in table 'OZELNOT'
ALTER TABLE [dbo].[OZELNOT]
ADD CONSTRAINT [FK_OZELNOT_OZELNOTLAR]
    FOREIGN KEY ([OZL_ID])
    REFERENCES [dbo].[OZELNOTLAR]
        ([OZL_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OZELNOT_OZELNOTLAR'
CREATE INDEX [IX_FK_OZELNOT_OZELNOTLAR]
ON [dbo].[OZELNOT]
    ([OZL_ID]);
GO

-- Creating foreign key on [KUL_ID] in table 'ODEVSNC'
ALTER TABLE [dbo].[ODEVSNC]
ADD CONSTRAINT [FK_ODEVSNC_KULLANICILAR]
    FOREIGN KEY ([KUL_ID])
    REFERENCES [dbo].[KULLANICILAR]
        ([KUL_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ODEVSNC_KULLANICILAR'
CREATE INDEX [IX_FK_ODEVSNC_KULLANICILAR]
ON [dbo].[ODEVSNC]
    ([KUL_ID]);
GO

-- Creating foreign key on [SNC_ID] in table 'ODEVSNC'
ALTER TABLE [dbo].[ODEVSNC]
ADD CONSTRAINT [FK_ODEVSNC_ODEVSNCLAR]
    FOREIGN KEY ([SNC_ID])
    REFERENCES [dbo].[ODEVSNCLAR]
        ([SNC_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ODEVSNC_ODEVSNCLAR'
CREATE INDEX [IX_FK_ODEVSNC_ODEVSNCLAR]
ON [dbo].[ODEVSNC]
    ([SNC_ID]);
GO

-- Creating foreign key on [SNV_ID] in table 'CEVAPLAR'
ALTER TABLE [dbo].[CEVAPLAR]
ADD CONSTRAINT [FK_CEVAPLAR_SINAVLAR]
    FOREIGN KEY ([SNV_ID])
    REFERENCES [dbo].[SINAVLAR]
        ([SNV_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CEVAPLAR_SINAVLAR'
CREATE INDEX [IX_FK_CEVAPLAR_SINAVLAR]
ON [dbo].[CEVAPLAR]
    ([SNV_ID]);
GO

-- Creating foreign key on [SNV_ID] in table 'DRSSNVSNC'
ALTER TABLE [dbo].[DRSSNVSNC]
ADD CONSTRAINT [FK_DRSSNVSNC_SINAVLAR]
    FOREIGN KEY ([SNV_ID])
    REFERENCES [dbo].[SINAVLAR]
        ([SNV_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DRSSNVSNC_SINAVLAR'
CREATE INDEX [IX_FK_DRSSNVSNC_SINAVLAR]
ON [dbo].[DRSSNVSNC]
    ([SNV_ID]);
GO

-- Creating foreign key on [KUL_ID] in table 'ARA_TBL2'
ALTER TABLE [dbo].[ARA_TBL2]
ADD CONSTRAINT [FK_ARA_TBL2_KULLANICILAR]
    FOREIGN KEY ([KUL_ID])
    REFERENCES [dbo].[KULLANICILAR]
        ([KUL_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ARA_TBL2_KULLANICILAR'
CREATE INDEX [IX_FK_ARA_TBL2_KULLANICILAR]
ON [dbo].[ARA_TBL2]
    ([KUL_ID]);
GO

-- Creating foreign key on [KUL_ID] in table 'DRSSNVSNC'
ALTER TABLE [dbo].[DRSSNVSNC]
ADD CONSTRAINT [FK_DRSSNVSNC_KULLANICILAR]
    FOREIGN KEY ([KUL_ID])
    REFERENCES [dbo].[KULLANICILAR]
        ([KUL_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DRSSNVSNC_KULLANICILAR'
CREATE INDEX [IX_FK_DRSSNVSNC_KULLANICILAR]
ON [dbo].[DRSSNVSNC]
    ([KUL_ID]);
GO

-- Creating foreign key on [KUL_ID] in table 'SINAVSNC'
ALTER TABLE [dbo].[SINAVSNC]
ADD CONSTRAINT [FK_SINAVSNC_KULLANICILAR]
    FOREIGN KEY ([KUL_ID])
    REFERENCES [dbo].[KULLANICILAR]
        ([KUL_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVSNC_KULLANICILAR'
CREATE INDEX [IX_FK_SINAVSNC_KULLANICILAR]
ON [dbo].[SINAVSNC]
    ([KUL_ID]);
GO

-- Creating foreign key on [SNV_ID] in table 'SINAVSNC'
ALTER TABLE [dbo].[SINAVSNC]
ADD CONSTRAINT [FK_SINAVSNC_SINAVLAR]
    FOREIGN KEY ([SNV_ID])
    REFERENCES [dbo].[SINAVLAR]
        ([SNV_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVSNC_SINAVLAR'
CREATE INDEX [IX_FK_SINAVSNC_SINAVLAR]
ON [dbo].[SINAVSNC]
    ([SNV_ID]);
GO

-- Creating foreign key on [KUL_ID] in table 'RDSDERSLER'
ALTER TABLE [dbo].[RDSDERSLER]
ADD CONSTRAINT [FK_RDSDERSLER_KULLANICILAR]
    FOREIGN KEY ([KUL_ID])
    REFERENCES [dbo].[KULLANICILAR]
        ([KUL_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RDSDERSLER_KULLANICILAR'
CREATE INDEX [IX_FK_RDSDERSLER_KULLANICILAR]
ON [dbo].[RDSDERSLER]
    ([KUL_ID]);
GO

-- Creating foreign key on [KUL_ID] in table 'RDSLISTE'
ALTER TABLE [dbo].[RDSLISTE]
ADD CONSTRAINT [FK_RDSLISTE_KULLANICILAR]
    FOREIGN KEY ([KUL_ID])
    REFERENCES [dbo].[KULLANICILAR]
        ([KUL_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RDSLISTE_KULLANICILAR'
CREATE INDEX [IX_FK_RDSLISTE_KULLANICILAR]
ON [dbo].[RDSLISTE]
    ([KUL_ID]);
GO

-- Creating foreign key on [SNF_ID] in table 'RDSDERSLER'
ALTER TABLE [dbo].[RDSDERSLER]
ADD CONSTRAINT [FK_RDSDERSLER_SINIFLAR]
    FOREIGN KEY ([SNF_ID])
    REFERENCES [dbo].[SINIFLAR]
        ([SNF_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RDSDERSLER_SINIFLAR'
CREATE INDEX [IX_FK_RDSDERSLER_SINIFLAR]
ON [dbo].[RDSDERSLER]
    ([SNF_ID]);
GO

-- Creating foreign key on [RDS_ID] in table 'RDSLISTE'
ALTER TABLE [dbo].[RDSLISTE]
ADD CONSTRAINT [FK_RDSLISTE_RDSDERSLER]
    FOREIGN KEY ([RDS_ID])
    REFERENCES [dbo].[RDSDERSLER]
        ([RDS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RDSLISTE_RDSDERSLER'
CREATE INDEX [IX_FK_RDSLISTE_RDSDERSLER]
ON [dbo].[RDSLISTE]
    ([RDS_ID]);
GO

-- Creating foreign key on [SNF_ID] in table 'KARNEDERS'
ALTER TABLE [dbo].[KARNEDERS]
ADD CONSTRAINT [FK_KARNEDERS_SINIFLAR]
    FOREIGN KEY ([SNF_ID])
    REFERENCES [dbo].[SINIFLAR]
        ([SNF_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_KARNEDERS_SINIFLAR'
CREATE INDEX [IX_FK_KARNEDERS_SINIFLAR]
ON [dbo].[KARNEDERS]
    ([SNF_ID]);
GO

-- Creating foreign key on [KUL_ID] in table 'KARNEDERSNOT'
ALTER TABLE [dbo].[KARNEDERSNOT]
ADD CONSTRAINT [FK_KARNEDERSNOT_KULLANICILAR]
    FOREIGN KEY ([KUL_ID])
    REFERENCES [dbo].[KULLANICILAR]
        ([KUL_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_KARNEDERSNOT_KULLANICILAR'
CREATE INDEX [IX_FK_KARNEDERSNOT_KULLANICILAR]
ON [dbo].[KARNEDERSNOT]
    ([KUL_ID]);
GO

-- Creating foreign key on [DRS_ID] in table 'DRSSNVSNC'
ALTER TABLE [dbo].[DRSSNVSNC]
ADD CONSTRAINT [FK_DRSSNVSNC_DERSLER]
    FOREIGN KEY ([DRS_ID])
    REFERENCES [dbo].[DERSLER]
        ([DRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DRSSNVSNC_DERSLER'
CREATE INDEX [IX_FK_DRSSNVSNC_DERSLER]
ON [dbo].[DRSSNVSNC]
    ([DRS_ID]);
GO

-- Creating foreign key on [DRS_ID] in table 'KARNEDERS'
ALTER TABLE [dbo].[KARNEDERS]
ADD CONSTRAINT [FK_KARNEDERS_DERSLER]
    FOREIGN KEY ([DRS_ID])
    REFERENCES [dbo].[DERSLER]
        ([DRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_KARNEDERS_DERSLER'
CREATE INDEX [IX_FK_KARNEDERS_DERSLER]
ON [dbo].[KARNEDERS]
    ([DRS_ID]);
GO

-- Creating foreign key on [DRS_ID] in table 'KARNEDERSNOT'
ALTER TABLE [dbo].[KARNEDERSNOT]
ADD CONSTRAINT [FK_KARNEDERSNOT_DERSLER]
    FOREIGN KEY ([DRS_ID])
    REFERENCES [dbo].[DERSLER]
        ([DRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_KARNEDERSNOT_DERSLER'
CREATE INDEX [IX_FK_KARNEDERSNOT_DERSLER]
ON [dbo].[KARNEDERSNOT]
    ([DRS_ID]);
GO

-- Creating foreign key on [DRS_ID] in table 'RDSDERSLER'
ALTER TABLE [dbo].[RDSDERSLER]
ADD CONSTRAINT [FK_RDSDERSLER_DERSLER]
    FOREIGN KEY ([DRS_ID])
    REFERENCES [dbo].[DERSLER]
        ([DRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RDSDERSLER_DERSLER'
CREATE INDEX [IX_FK_RDSDERSLER_DERSLER]
ON [dbo].[RDSDERSLER]
    ([DRS_ID]);
GO

-- Creating foreign key on [SDT_DRS0] in table 'SINAVDETAY'
ALTER TABLE [dbo].[SINAVDETAY]
ADD CONSTRAINT [FK_SINAVDETAY_DERSLER0]
    FOREIGN KEY ([SDT_DRS0])
    REFERENCES [dbo].[DERSLER]
        ([DRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVDETAY_DERSLER0'
CREATE INDEX [IX_FK_SINAVDETAY_DERSLER0]
ON [dbo].[SINAVDETAY]
    ([SDT_DRS0]);
GO

-- Creating foreign key on [SDT_DRS1] in table 'SINAVDETAY'
ALTER TABLE [dbo].[SINAVDETAY]
ADD CONSTRAINT [FK_SINAVDETAY_DERSLER1]
    FOREIGN KEY ([SDT_DRS1])
    REFERENCES [dbo].[DERSLER]
        ([DRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVDETAY_DERSLER1'
CREATE INDEX [IX_FK_SINAVDETAY_DERSLER1]
ON [dbo].[SINAVDETAY]
    ([SDT_DRS1]);
GO

-- Creating foreign key on [SDT_DRS2] in table 'SINAVDETAY'
ALTER TABLE [dbo].[SINAVDETAY]
ADD CONSTRAINT [FK_SINAVDETAY_DERSLER10]
    FOREIGN KEY ([SDT_DRS2])
    REFERENCES [dbo].[DERSLER]
        ([DRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVDETAY_DERSLER10'
CREATE INDEX [IX_FK_SINAVDETAY_DERSLER10]
ON [dbo].[SINAVDETAY]
    ([SDT_DRS2]);
GO

-- Creating foreign key on [SDT_DRS3] in table 'SINAVDETAY'
ALTER TABLE [dbo].[SINAVDETAY]
ADD CONSTRAINT [FK_SINAVDETAY_DERSLER11]
    FOREIGN KEY ([SDT_DRS3])
    REFERENCES [dbo].[DERSLER]
        ([DRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVDETAY_DERSLER11'
CREATE INDEX [IX_FK_SINAVDETAY_DERSLER11]
ON [dbo].[SINAVDETAY]
    ([SDT_DRS3]);
GO

-- Creating foreign key on [SDT_DRS4] in table 'SINAVDETAY'
ALTER TABLE [dbo].[SINAVDETAY]
ADD CONSTRAINT [FK_SINAVDETAY_DERSLER12]
    FOREIGN KEY ([SDT_DRS4])
    REFERENCES [dbo].[DERSLER]
        ([DRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVDETAY_DERSLER12'
CREATE INDEX [IX_FK_SINAVDETAY_DERSLER12]
ON [dbo].[SINAVDETAY]
    ([SDT_DRS4]);
GO

-- Creating foreign key on [SDT_DRS5] in table 'SINAVDETAY'
ALTER TABLE [dbo].[SINAVDETAY]
ADD CONSTRAINT [FK_SINAVDETAY_DERSLER13]
    FOREIGN KEY ([SDT_DRS5])
    REFERENCES [dbo].[DERSLER]
        ([DRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVDETAY_DERSLER13'
CREATE INDEX [IX_FK_SINAVDETAY_DERSLER13]
ON [dbo].[SINAVDETAY]
    ([SDT_DRS5]);
GO

-- Creating foreign key on [SDT_DRS6] in table 'SINAVDETAY'
ALTER TABLE [dbo].[SINAVDETAY]
ADD CONSTRAINT [FK_SINAVDETAY_DERSLER14]
    FOREIGN KEY ([SDT_DRS6])
    REFERENCES [dbo].[DERSLER]
        ([DRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVDETAY_DERSLER14'
CREATE INDEX [IX_FK_SINAVDETAY_DERSLER14]
ON [dbo].[SINAVDETAY]
    ([SDT_DRS6]);
GO

-- Creating foreign key on [SDT_DRS7] in table 'SINAVDETAY'
ALTER TABLE [dbo].[SINAVDETAY]
ADD CONSTRAINT [FK_SINAVDETAY_DERSLER2]
    FOREIGN KEY ([SDT_DRS7])
    REFERENCES [dbo].[DERSLER]
        ([DRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVDETAY_DERSLER2'
CREATE INDEX [IX_FK_SINAVDETAY_DERSLER2]
ON [dbo].[SINAVDETAY]
    ([SDT_DRS7]);
GO

-- Creating foreign key on [SDT_DRS8] in table 'SINAVDETAY'
ALTER TABLE [dbo].[SINAVDETAY]
ADD CONSTRAINT [FK_SINAVDETAY_DERSLER3]
    FOREIGN KEY ([SDT_DRS8])
    REFERENCES [dbo].[DERSLER]
        ([DRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVDETAY_DERSLER3'
CREATE INDEX [IX_FK_SINAVDETAY_DERSLER3]
ON [dbo].[SINAVDETAY]
    ([SDT_DRS8]);
GO

-- Creating foreign key on [SDT_DRS9] in table 'SINAVDETAY'
ALTER TABLE [dbo].[SINAVDETAY]
ADD CONSTRAINT [FK_SINAVDETAY_DERSLER4]
    FOREIGN KEY ([SDT_DRS9])
    REFERENCES [dbo].[DERSLER]
        ([DRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVDETAY_DERSLER4'
CREATE INDEX [IX_FK_SINAVDETAY_DERSLER4]
ON [dbo].[SINAVDETAY]
    ([SDT_DRS9]);
GO

-- Creating foreign key on [SDT_DRS10] in table 'SINAVDETAY'
ALTER TABLE [dbo].[SINAVDETAY]
ADD CONSTRAINT [FK_SINAVDETAY_DERSLER5]
    FOREIGN KEY ([SDT_DRS10])
    REFERENCES [dbo].[DERSLER]
        ([DRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVDETAY_DERSLER5'
CREATE INDEX [IX_FK_SINAVDETAY_DERSLER5]
ON [dbo].[SINAVDETAY]
    ([SDT_DRS10]);
GO

-- Creating foreign key on [SDT_DRS11] in table 'SINAVDETAY'
ALTER TABLE [dbo].[SINAVDETAY]
ADD CONSTRAINT [FK_SINAVDETAY_DERSLER6]
    FOREIGN KEY ([SDT_DRS11])
    REFERENCES [dbo].[DERSLER]
        ([DRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVDETAY_DERSLER6'
CREATE INDEX [IX_FK_SINAVDETAY_DERSLER6]
ON [dbo].[SINAVDETAY]
    ([SDT_DRS11]);
GO

-- Creating foreign key on [SDT_DRS12] in table 'SINAVDETAY'
ALTER TABLE [dbo].[SINAVDETAY]
ADD CONSTRAINT [FK_SINAVDETAY_DERSLER7]
    FOREIGN KEY ([SDT_DRS12])
    REFERENCES [dbo].[DERSLER]
        ([DRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVDETAY_DERSLER7'
CREATE INDEX [IX_FK_SINAVDETAY_DERSLER7]
ON [dbo].[SINAVDETAY]
    ([SDT_DRS12]);
GO

-- Creating foreign key on [SDT_DRS13] in table 'SINAVDETAY'
ALTER TABLE [dbo].[SINAVDETAY]
ADD CONSTRAINT [FK_SINAVDETAY_DERSLER8]
    FOREIGN KEY ([SDT_DRS13])
    REFERENCES [dbo].[DERSLER]
        ([DRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVDETAY_DERSLER8'
CREATE INDEX [IX_FK_SINAVDETAY_DERSLER8]
ON [dbo].[SINAVDETAY]
    ([SDT_DRS13]);
GO

-- Creating foreign key on [SDT_DRS14] in table 'SINAVDETAY'
ALTER TABLE [dbo].[SINAVDETAY]
ADD CONSTRAINT [FK_SINAVDETAY_DERSLER9]
    FOREIGN KEY ([SDT_DRS14])
    REFERENCES [dbo].[DERSLER]
        ([DRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVDETAY_DERSLER9'
CREATE INDEX [IX_FK_SINAVDETAY_DERSLER9]
ON [dbo].[SINAVDETAY]
    ([SDT_DRS14]);
GO

-- Creating foreign key on [OPT_ID] in table 'SINAVDETAY'
ALTER TABLE [dbo].[SINAVDETAY]
ADD CONSTRAINT [FK_SINAVDETAY_OPTIK]
    FOREIGN KEY ([OPT_ID])
    REFERENCES [dbo].[OPTIK]
        ([OPT_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVDETAY_OPTIK'
CREATE INDEX [IX_FK_SINAVDETAY_OPTIK]
ON [dbo].[SINAVDETAY]
    ([OPT_ID]);
GO

-- Creating foreign key on [STP_ID] in table 'SINAVDETAY'
ALTER TABLE [dbo].[SINAVDETAY]
ADD CONSTRAINT [FK_SINAVDETAY_SINAVTIP]
    FOREIGN KEY ([STP_ID])
    REFERENCES [dbo].[SINAVTIP]
        ([STP_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVDETAY_SINAVTIP'
CREATE INDEX [IX_FK_SINAVDETAY_SINAVTIP]
ON [dbo].[SINAVDETAY]
    ([STP_ID]);
GO

-- Creating foreign key on [SDT_ID] in table 'SINAVLAR'
ALTER TABLE [dbo].[SINAVLAR]
ADD CONSTRAINT [FK_SINAVLAR_SINAVDETAY]
    FOREIGN KEY ([SDT_ID])
    REFERENCES [dbo].[SINAVDETAY]
        ([SDT_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVLAR_SINAVDETAY'
CREATE INDEX [IX_FK_SINAVLAR_SINAVDETAY]
ON [dbo].[SINAVLAR]
    ([SDT_ID]);
GO

-- Creating foreign key on [OKL_ID] in table 'ARA_TBL2'
ALTER TABLE [dbo].[ARA_TBL2]
ADD CONSTRAINT [FK_ARA_TBL2_OKULLAR]
    FOREIGN KEY ([OKL_ID])
    REFERENCES [dbo].[OKULLAR]
        ([OKL_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ARA_TBL2_OKULLAR'
CREATE INDEX [IX_FK_ARA_TBL2_OKULLAR]
ON [dbo].[ARA_TBL2]
    ([OKL_ID]);
GO

-- Creating foreign key on [OKL_ID] in table 'KULLANICILAR'
ALTER TABLE [dbo].[KULLANICILAR]
ADD CONSTRAINT [FK_KULLANICILAR_OKULLAR]
    FOREIGN KEY ([OKL_ID])
    REFERENCES [dbo].[OKULLAR]
        ([OKL_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_KULLANICILAR_OKULLAR'
CREATE INDEX [IX_FK_KULLANICILAR_OKULLAR]
ON [dbo].[KULLANICILAR]
    ([OKL_ID]);
GO

-- Creating foreign key on [OKL_ID] in table 'KURLAR'
ALTER TABLE [dbo].[KURLAR]
ADD CONSTRAINT [FK_KURLAR_OKULLAR]
    FOREIGN KEY ([OKL_ID])
    REFERENCES [dbo].[OKULLAR]
        ([OKL_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_KURLAR_OKULLAR'
CREATE INDEX [IX_FK_KURLAR_OKULLAR]
ON [dbo].[KURLAR]
    ([OKL_ID]);
GO

-- Creating foreign key on [RSM_ID] in table 'OKULLAR'
ALTER TABLE [dbo].[OKULLAR]
ADD CONSTRAINT [FK_OKULLAR_RESIMLER]
    FOREIGN KEY ([RSM_ID])
    REFERENCES [dbo].[RESIMLER]
        ([RSM_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OKULLAR_RESIMLER'
CREATE INDEX [IX_FK_OKULLAR_RESIMLER]
ON [dbo].[OKULLAR]
    ([RSM_ID]);
GO

-- Creating foreign key on [OKL_ID] in table 'SINIFLAR'
ALTER TABLE [dbo].[SINIFLAR]
ADD CONSTRAINT [FK_SINIFLAR_OKULLAR]
    FOREIGN KEY ([OKL_ID])
    REFERENCES [dbo].[OKULLAR]
        ([OKL_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINIFLAR_OKULLAR'
CREATE INDEX [IX_FK_SINIFLAR_OKULLAR]
ON [dbo].[SINIFLAR]
    ([OKL_ID]);
GO

-- Creating foreign key on [OKL_ID] in table 'SUBELER'
ALTER TABLE [dbo].[SUBELER]
ADD CONSTRAINT [FK_SUBELER_OKULLAR]
    FOREIGN KEY ([OKL_ID])
    REFERENCES [dbo].[OKULLAR]
        ([OKL_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SUBELER_OKULLAR'
CREATE INDEX [IX_FK_SUBELER_OKULLAR]
ON [dbo].[SUBELER]
    ([OKL_ID]);
GO

-- Creating foreign key on [HFT_ID] in table 'SINAVLAR'
ALTER TABLE [dbo].[SINAVLAR]
ADD CONSTRAINT [FK_SINAVLAR_HAFTALAR]
    FOREIGN KEY ([HFT_ID])
    REFERENCES [dbo].[HAFTALAR]
        ([HFT_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SINAVLAR_HAFTALAR'
CREATE INDEX [IX_FK_SINAVLAR_HAFTALAR]
ON [dbo].[SINAVLAR]
    ([HFT_ID]);
GO

-- Creating foreign key on [KUL_ID] in table 'HEPTABLO'
ALTER TABLE [dbo].[HEPTABLO]
ADD CONSTRAINT [FK_HEPTABLO_KULLANICILAR]
    FOREIGN KEY ([KUL_ID])
    REFERENCES [dbo].[KULLANICILAR]
        ([KUL_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_HEPTABLO_KULLANICILAR'
CREATE INDEX [IX_FK_HEPTABLO_KULLANICILAR]
ON [dbo].[HEPTABLO]
    ([KUL_ID]);
GO

-- Creating foreign key on [DRS_ID] in table 'SORUANALIZ'
ALTER TABLE [dbo].[SORUANALIZ]
ADD CONSTRAINT [FK_SORUANALIZ_DERSLER]
    FOREIGN KEY ([DRS_ID])
    REFERENCES [dbo].[DERSLER]
        ([DRS_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SORUANALIZ_DERSLER'
CREATE INDEX [IX_FK_SORUANALIZ_DERSLER]
ON [dbo].[SORUANALIZ]
    ([DRS_ID]);
GO

-- Creating foreign key on [SNV_ID] in table 'SORUANALIZ'
ALTER TABLE [dbo].[SORUANALIZ]
ADD CONSTRAINT [FK_SORUANALIZ_SINAVLAR]
    FOREIGN KEY ([SNV_ID])
    REFERENCES [dbo].[SINAVLAR]
        ([SNV_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SORUANALIZ_SINAVLAR'
CREATE INDEX [IX_FK_SORUANALIZ_SINAVLAR]
ON [dbo].[SORUANALIZ]
    ([SNV_ID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------