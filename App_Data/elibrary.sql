USE [master]
GO
/****** Object:  Database [eLibrary]    Script Date: 5/8/2022 7:43:01 PM ******/
CREATE DATABASE [eLibrary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eLibrary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\eLibrary.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'eLibrary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\eLibrary_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [eLibrary] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eLibrary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eLibrary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eLibrary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eLibrary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eLibrary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eLibrary] SET ARITHABORT OFF 
GO
ALTER DATABASE [eLibrary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eLibrary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eLibrary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eLibrary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eLibrary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eLibrary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eLibrary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eLibrary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eLibrary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eLibrary] SET  DISABLE_BROKER 
GO
ALTER DATABASE [eLibrary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eLibrary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eLibrary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eLibrary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eLibrary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eLibrary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eLibrary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eLibrary] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [eLibrary] SET  MULTI_USER 
GO
ALTER DATABASE [eLibrary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eLibrary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eLibrary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eLibrary] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [eLibrary] SET DELAYED_DURABILITY = DISABLED 
GO
USE [eLibrary]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/8/2022 7:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/8/2022 7:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/8/2022 7:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/8/2022 7:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/8/2022 7:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/8/2022 7:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DangKyMuon]    Script Date: 5/8/2022 7:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DangKyMuon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HocsinhId] [int] NOT NULL,
	[SachId] [int] NOT NULL,
	[NgayDK] [date] NOT NULL,
	[NgayNhan] [date] NOT NULL,
	[Phuongthuc] [nvarchar](50) NOT NULL,
	[Diachi] [nvarchar](80) NULL,
	[Dienthoai] [varchar](10) NULL,
	[Ghichu] [nvarchar](50) NULL,
	[Xuly] [bit] NOT NULL CONSTRAINT [DF_DangKyMuon_Xuly]  DEFAULT ((0)),
 CONSTRAINT [PK__DangKyMu__3214EC07B576DD37] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hocsinh]    Script Date: 5/8/2022 7:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hocsinh](
	[Id] [int] NOT NULL,
	[Hoten] [nvarchar](50) NOT NULL,
	[LopId] [int] NOT NULL,
	[Dienthoai] [varchar](10) NOT NULL,
	[Email] [varchar](50) NULL,
	[Diachi] [nvarchar](50) NULL,
	[Phuhuynh] [nvarchar](50) NULL,
	[Anh] [nvarchar](100) NULL,
 CONSTRAINT [PK__Hocsinh__2725A6EF04B83014] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiSach]    Script Date: 5/8/2022 7:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSach](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](100) NOT NULL,
	[Mota] [nvarchar](500) NOT NULL,
	[Anh] [nvarchar](100) NULL,
 CONSTRAINT [PK__LoaiSach__2725C7721C4BBD75] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lop]    Script Date: 5/8/2022 7:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lop](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tenlop] [nvarchar](50) NOT NULL,
	[GVCN] [nvarchar](50) NOT NULL,
	[Ghichu] [nvarchar](100) NULL,
 CONSTRAINT [PK__Lop__3B98D27347A8EB8F] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MuonTra]    Script Date: 5/8/2022 7:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuonTra](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HocsinhId] [int] NOT NULL,
	[SachId] [int] NOT NULL,
	[NgayMuon] [date] NOT NULL,
	[Ngaytra] [date] NULL,
	[Ngayphaitra] [date] NOT NULL,
	[Tienphat] [float] NULL,
	[Ghichu] [nvarchar](100) NULL,
 CONSTRAINT [PK__MuonTra__3214EC0728176BA3] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sach]    Script Date: 5/8/2022 7:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sach](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenSach] [nvarchar](100) NOT NULL,
	[LoaisachId] [int] NULL,
	[Tomtat] [nvarchar](500) NULL,
	[Anh] [nvarchar](150) NULL,
	[NhaXB] [nvarchar](50) NULL,
	[NamXB] [varchar](10) NULL,
	[Tacgia] [nvarchar](150) NULL,
 CONSTRAINT [PK__Sach__B235742D03C61E55] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202203160423596_InitialCreate', N'SmartLibrary.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE336167E2FB0FF41D0D36E915AB9EC0CA681DD2275926ED0DC30CE14FB36A025DA2146A25489CA2428FACBFAB03F69FF420F254A9678D1C5566CA728508CC5C3EF1C1E7E240FC9C3FCFFCFFF8D7F7C0E7CEB09C70909E9C43E1A1DDA16A66EE811BA9CD8295B7CF7C1FEF1877F7C33BEF08267EBD742EE84CB414D9A4CEC47C6A253C749DC471CA0641410370E9370C1466E1838C80B9DE3C3C3EF9DA3230703840D589635FE985246029CFD809FD390BA386229F26F420FFB89F80E25B30CD5BA45014E22E4E2893D0B50CCAEC93C46F1CB2817B7AD339F20306586FD856D214A438618187AFA29C133168774398BE003F21F5E220C720BE4275834E07425DEB52D87C7BC2DCEAA6201E5A6090B839E804727C2398E5C7D2D17DBA5F3C07D17E066F6C25B9DB970625F7938FBF431F4C101B2C2D3A91F73E1897D53AA384BA25BCC4645C5510E791903DCD730FE32AA221E589DEB1D94643A1E1DF2FF0EAC69EAB334C6138A531623FFC0BA4FE73E717FC12F0FE1174C272747F3C5C98777EF9177F2FEDFF8E45DB5A5D05690AB7D804FF77118E1186CC38BB2FDB6E5D4EB3972C5B25AA54EEE15E0128C0BDBBA41CFD7982ED9238C98E30FB675499EB1577C11E4FA44090C23A8C4E2147EDEA6BE8FE63E2ECB9D469DFCFF0D5A8FDFBD1F44EB2D7A22CBACEB25FD30706218571FB19F95268F24CA8757ADBF3F0BB1CB380CF8EF3ABFF2D2CFB3308D5DDE98D028F280E2256675EBC6CE8ABC9D28CDA186A77581BAFFD4E696AAF4D68AF206AD33120A15DB1E0D85BDAFABB733E3CEA2083A2FA316F74813E134ABD548AA7E60558556E439EA4A1E0A8DFA3BCF85170122FE009361072D10882C481CE0B2953F85403D447BDB7C8F9204E602EF3F28796C301DFE3980E933ECA6315074C65010BDBAB6FBC790E2DB349873E66F4FD7605DF3F035BC442E0BE30BCA6B6D8C771DBA5FC2945D50EF1C31FC89B90520FFF94082EE00839873E6BA38492E81CCD89B861067178057949D1CF786E333D4AE8391A98F48A08F46A4B9F47321BA8A48F4124A546210D345264DA65E874B42BB995A889A4DCD255A4D15627D4DE560DD2C159266433381563B73A9C162BDAC87860FF632D8FD8FF6365BBC4D7341C58D339821F1CF98E218A631EF1E318663BAEA812EF3C62E8285ACFBB8D2575F9B324DBF223F1D5AD55AA3219B04861F0D19ECFE8F86CC4CF8FC443C1E9574D80215C200DF495EBFBB6A1F739265DB1E0EB5666E5BF976E600D370394B92D025D928D01C7E89A38BBAFD10C359EDE718796BE4B3106818109DF0250FBE40DB6C995477F41CFB9861EBCCCD0F07A7287191A7BA111AE4F530AC58513586ADCE44EAC67DABE804A6E39857427C1394C0482594A9C382509744C86FF59254B3E312C6DB5EEA904BCE71842957D8EA892ECAF54720DC80528FD4296D1E1A3B15C63513D110B59AFABC2D845DF5BB7232B1154EB6C4CE065E8AF8ED5588D9ECB12D90B3D9255D0C301EE7ED82A062AFD29500F2C665DF082AED980C041521D556085AF7D80E085A77C99B2368BE45EDDAFFD27E75DFE859DF286F7F596F74D70EB859F3C79E51338F3DA10E831A3856E9793EE785F89969366760A7D89F2522D49529C2C16798D58F6C56F1AE360E759A4164123501AE88D6022A2E0215206540F530AE38CB6BB44E44113D608B73B7465831F74BB0150EA8D8D50BD18AA0F9DA542667A7DD47D9B2920D0AC93B6D162A381A42C89357BDE11D9C623A97551DD32516EE130D571A263AA3C1412D91ABC149456306F75241CD762FE902B23E21D9465E92C22783978AC60CEE25C1D176276982821E61C1462EAA2FE1030DB6E2A4A35C6DCAB2B193274A890F63C7905135BE415144E8B2926125BE58B33CBD6AFADDAC7FDA519063386EA2C93E2AAD2D35B130464B2C95826AB0F492C4093B470CCD113FE7997A8122A65D5B0DD37FA1B2BA7CAA9D58AC038534FFB7B859D55CDFD7165B351A112097D0C4808734D939BA8600FAEA164F79433E8A3547F7D3D04F036A8EB0CCB5F30BBC6AFDFC8B8A307624FB95084A719712E7D67DDFA967D45131542F9511CCFA3D658630F9BB883FAB1E37C5A46694E288AA8A623AB6DA59CF9942997EBD258789FD3BAB15E1754696C84DA902884F3D312AE90D0A58A5AC3B6A3D03A58A592FE98E28A5995421A5A21E565693496A46560BD6C23378542FD15D839A3E5245574BBB236B1249AAD09AE235B03536CB65DD5135B92655604D7177EC55E2893C8BEEF1DA65DCBCACBF78E51BDCCD562F03C6EB4C89C32C7E957BFC2A50E5734F2C7153AF8089EF7B4927E32E6F7D3AE5071B9BD1C980619E7B6A57E0F5A9A7F1DEDE8C59BBD7AE4DEF4DF7FA66BC7EA47D556A28BB3C59A4D45EEEF6A45DDD58ECB0DA1FD3285BAE5CC4B60A3702A15E128683111718CD7EF3A73EC17C222F046E10250B9CB03C97C33E3E3C3A969EE3ECCFD31827493C5FB34335BD8FA9F7D916D2B2E8138ADD4714AB49121B3C1F59812AE7CF57D4C3CF13FBF7ACD6697694C1FF957D3EB0AE924F94FC9642C1439C62EB0F35E9739874FAE67DD69E3E7EE8EED5ABFF7ECEAB1E5877318C9853EB50F2E53A3D5C7F12D1CB9ABCEA06D6ACFD50E2ED0EA8DA1B042DAA3420D67F7230276C90E7068595FF0CD0F3BFFA9AA67D52B011A2E6D9C0507883B8D0F42C601D2CE393000F7EB2EC4940BFC6EA9F08AC639AF17900A1FDC1E4C701DDA7A1A2E60E971ACDA6681B5352E6E7D6E4EA8D322D77BD362939D81B0D7435CFBA07DC06B9D46B30E38DA5210FB63A6AB28C07C3DE25B55F3DB5785FB28957791EBB4D22DE66DE70C3CDD0DF2A5D780F12DC34093BBB4F0ADE36D74C07B97B9E59D92FF577CFC826D2B8769FE0BB6DB2998E79F79C6CBDD278F78C6BBB5A3F77CCB4CE4BE8CE9372D5FC22C3858CEE2CB82DE9363F38871DFE3C0412E41165FE56529FE5D594A1DAA2702562566A4E2F93152B0347D1AB4834ABEDD756B1E0373656C834AB35246536E916F37FA36E21D3ACDB90EAB88B74616DB2A12E85BB651E6BCA837A4BE9C1B596B464A3B7C5AC8DB7EB6F291B7810A7D4468FE18EF8ED24FF0EE29221874E8F645FF5BA17D6CECA5F5884F53B21CB1504FF7B8B14BBB555B394B9A28BB058BC258B0A11E984E60633E4C1927A1633B2402E83627EC69C3DF6CECEEDF84DC71C7B57F42E6551CAA0C93898FBB5032F1E0434E9CF329AEB368FEFA2ECEF960CD1043093F0B3F93BFA534A7CAFB4FB5273266480E0D18538D1E57DC9F8C9EEF2A544BA0D694720E1BE32287AC041E40358724767E809AF631BD0EF1A2F91FBB23A013481B47744DDEDE3738296310A1281B1AA0F3F81C35EF0FCC35F74F3631E68540000, N'6.1.3-40302')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0f307a65-e514-4024-9355-a77a066c74b5', N'user02@sm.com', 0, N'ACyI93VThSx7zVZLj8Nt+rWQPiCY6lazjwelRlkg08LkVUn+HXKb5zckykp0kgIa6w==', N'ee3239eb-2d52-47f8-8867-7dd1f38a4614', NULL, 0, 0, NULL, 1, 0, N'user02@sm.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'30426efa-84b6-4b22-8eec-c43d40a81537', N'u04@sm.com', 0, N'AArFETHAJ2oGLWYcneVg9DNlZ+ebTSSlJ5P5PYyYxtZci1fdM2UC8e3D/zMW+v089Q==', N'c86ac16e-6a69-4a37-a68a-b4e6703954ff', NULL, 0, 0, NULL, 1, 0, N'u04@sm.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'52a10291-7c84-4c68-bd2a-7ab17ca2fd16', N'admin2@gmail.com', 0, N'AKlN44Ms4xAFqxLkdih9IbKJ3umQ15lWMigkdoGJXVifOWp4jxAdOYYq80J2TOct6Q==', N'32f58a91-6d68-4845-b964-2994d9a6a3a1', NULL, 0, 0, NULL, 1, 0, N'admin@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'54ea12dc-33ef-4391-83f9-b5c04bf62e51', N'u03@sm.com', 0, N'AJtOZkKvTeGtvC+oZQJ0Ek+P0wlMEwfHOcIgIZJGHjoCCvbLJdMBTMW9OmgpH7huTg==', N'df6eebd8-ff7d-40d6-b1e6-8bd6185289c6', NULL, 0, 0, NULL, 1, 0, N'u03@sm.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'820c452d-0909-4e02-b00a-be3781ee4c81', N'u05@sm.com', 0, N'AFXq+rEMqalPEclR71JiTo1UB1hGoKmxiimSjyZ7ZRXsNcYVoNmxySLEvL9wRBen7Q==', N'260056af-b369-4e57-935f-ab3bf166f110', NULL, 0, 0, NULL, 1, 0, N'u05@sm.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'88f204d5-64d4-4e36-9f36-ece5b2a95d92', N'admin@sl.com', 0, N'AKotDV4Jiy8FOD/n8bOzJBdEawi0uk6zRGiHP1KYi2eGAHOZH/xmLto1aTlfHx2HEA==', N'8f862933-3b6d-4506-ac0d-13d79eaa7497', NULL, 0, 0, NULL, 1, 0, N'admin@sl.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'896ae233-76d3-4f3e-9f5d-a4c973c63db3', N'user01@smartlibrary.com', 0, N'AKwMDNGL0R3FtHVjuND2B4qnT9MkpHRMUIPeIsb8TFel3O8opnW3yEK0qdKMg9SrHg==', N'b54bbf6a-760a-4a2f-80a2-59dcc9c044c9', NULL, 0, 0, NULL, 1, 0, N'user01@smartlibrary.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9760ff88-155f-4c0c-855c-d54afe59bf48', N'u06@sm.com', 0, N'AIQNooilKIAB2ZLO3YXek94ly+J1EprFp71cIkGIrS/OX0QIaBuHlKWInCyQdFmEug==', N'fa136d00-93f4-49ac-81ef-dd2b80a07f3c', NULL, 0, 0, NULL, 1, 0, N'u06@sm.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9c47656a-29a5-42dd-a54f-7858ab35e11d', N'khanhn2@fe.edu.vn', 0, N'ADpuYEuBFkLNOrTUiS0F0IJ9NZJXbMhFZDklDwVyeNoAAzUYN71Bzle8nQCG5EhRew==', N'0e229495-e6bf-4057-b1fe-83dd7fab4d07', N'0989078328', 0, 0, NULL, 1, 0, N'Nguyễn Khánh')
SET IDENTITY_INSERT [dbo].[DangKyMuon] ON 

INSERT [dbo].[DangKyMuon] ([Id], [HocsinhId], [SachId], [NgayDK], [NgayNhan], [Phuongthuc], [Diachi], [Dienthoai], [Ghichu], [Xuly]) VALUES (1, 2, 11, CAST(N'2022-03-19' AS Date), CAST(N'2022-03-20' AS Date), N'giao tại nhà', N'Đà Nẵng', N'0989020304', NULL, 1)
INSERT [dbo].[DangKyMuon] ([Id], [HocsinhId], [SachId], [NgayDK], [NgayNhan], [Phuongthuc], [Diachi], [Dienthoai], [Ghichu], [Xuly]) VALUES (2, 2, 10, CAST(N'2022-03-19' AS Date), CAST(N'2022-03-20' AS Date), N'giao tại nhà', N'Đà Nẵng', N'0989020304', NULL, 1)
INSERT [dbo].[DangKyMuon] ([Id], [HocsinhId], [SachId], [NgayDK], [NgayNhan], [Phuongthuc], [Diachi], [Dienthoai], [Ghichu], [Xuly]) VALUES (3, 2, 9, CAST(N'2022-03-19' AS Date), CAST(N'2022-03-20' AS Date), N'giao tại nhà', N'Đà Nẵng', N'0989020304', NULL, 1)
INSERT [dbo].[DangKyMuon] ([Id], [HocsinhId], [SachId], [NgayDK], [NgayNhan], [Phuongthuc], [Diachi], [Dienthoai], [Ghichu], [Xuly]) VALUES (4, 2, 1, CAST(N'2022-03-19' AS Date), CAST(N'2022-03-19' AS Date), N'giao tại nhà', N'Đà Nẵng', N'0989020304', NULL, 1)
INSERT [dbo].[DangKyMuon] ([Id], [HocsinhId], [SachId], [NgayDK], [NgayNhan], [Phuongthuc], [Diachi], [Dienthoai], [Ghichu], [Xuly]) VALUES (5, 2, 2, CAST(N'2022-03-19' AS Date), CAST(N'2022-03-19' AS Date), N'giao tại nhà', N'Đà Nẵng', N'0989020304', NULL, 1)
INSERT [dbo].[DangKyMuon] ([Id], [HocsinhId], [SachId], [NgayDK], [NgayNhan], [Phuongthuc], [Diachi], [Dienthoai], [Ghichu], [Xuly]) VALUES (6, 2, 3, CAST(N'2022-03-19' AS Date), CAST(N'2022-03-19' AS Date), N'giao tại nhà', N'Đà Nẵng', N'0989020304', NULL, 1)
INSERT [dbo].[DangKyMuon] ([Id], [HocsinhId], [SachId], [NgayDK], [NgayNhan], [Phuongthuc], [Diachi], [Dienthoai], [Ghichu], [Xuly]) VALUES (7, 2, 2, CAST(N'2022-03-20' AS Date), CAST(N'2022-03-21' AS Date), N'Nhận sách tại nhà', N'Đà Nẵng', N'0989020304', NULL, 1)
INSERT [dbo].[DangKyMuon] ([Id], [HocsinhId], [SachId], [NgayDK], [NgayNhan], [Phuongthuc], [Diachi], [Dienthoai], [Ghichu], [Xuly]) VALUES (8, 2, 11, CAST(N'2022-03-20' AS Date), CAST(N'2022-03-21' AS Date), N'Nhận sách tại thư viện', N'Đà Nẵng', N'0989020304', NULL, 1)
INSERT [dbo].[DangKyMuon] ([Id], [HocsinhId], [SachId], [NgayDK], [NgayNhan], [Phuongthuc], [Diachi], [Dienthoai], [Ghichu], [Xuly]) VALUES (9, 2, 10, CAST(N'2022-03-20' AS Date), CAST(N'2022-03-21' AS Date), N'Nhận sách tại thư viện', N'Đà Nẵng', N'0989020304', NULL, 0)
INSERT [dbo].[DangKyMuon] ([Id], [HocsinhId], [SachId], [NgayDK], [NgayNhan], [Phuongthuc], [Diachi], [Dienthoai], [Ghichu], [Xuly]) VALUES (10, 2, 3, CAST(N'2022-04-01' AS Date), CAST(N'2022-04-01' AS Date), N'Nhận sách tại nhà', N'Đà Nẵng', N'0989020304', NULL, 1)
INSERT [dbo].[DangKyMuon] ([Id], [HocsinhId], [SachId], [NgayDK], [NgayNhan], [Phuongthuc], [Diachi], [Dienthoai], [Ghichu], [Xuly]) VALUES (11, 2, 3, CAST(N'2022-04-02' AS Date), CAST(N'2022-04-02' AS Date), N'Nhận sách tại nhà', N'Đà Nẵng', N'0989020304', NULL, 1)
INSERT [dbo].[DangKyMuon] ([Id], [HocsinhId], [SachId], [NgayDK], [NgayNhan], [Phuongthuc], [Diachi], [Dienthoai], [Ghichu], [Xuly]) VALUES (12, 2, 5, CAST(N'2022-05-02' AS Date), CAST(N'2022-05-02' AS Date), N'Nhận sách tại nhà', N'Đà Nẵng', N'0989020304', NULL, 0)
INSERT [dbo].[DangKyMuon] ([Id], [HocsinhId], [SachId], [NgayDK], [NgayNhan], [Phuongthuc], [Diachi], [Dienthoai], [Ghichu], [Xuly]) VALUES (13, 2, 6, CAST(N'2022-05-02' AS Date), CAST(N'2022-05-02' AS Date), N'Nhận sách tại nhà', N'Đà Nẵng', N'0989020304', NULL, 0)
INSERT [dbo].[DangKyMuon] ([Id], [HocsinhId], [SachId], [NgayDK], [NgayNhan], [Phuongthuc], [Diachi], [Dienthoai], [Ghichu], [Xuly]) VALUES (14, 2, 4, CAST(N'2022-05-02' AS Date), CAST(N'2022-05-02' AS Date), N'Nhận sách tại nhà', N'Đà Nẵng', N'0989020304', NULL, 0)
INSERT [dbo].[DangKyMuon] ([Id], [HocsinhId], [SachId], [NgayDK], [NgayNhan], [Phuongthuc], [Diachi], [Dienthoai], [Ghichu], [Xuly]) VALUES (15, 2, 7, CAST(N'2022-05-02' AS Date), CAST(N'2022-05-02' AS Date), N'Nhận sách tại nhà', N'Đà Nẵng', N'0989020304', NULL, 0)
INSERT [dbo].[DangKyMuon] ([Id], [HocsinhId], [SachId], [NgayDK], [NgayNhan], [Phuongthuc], [Diachi], [Dienthoai], [Ghichu], [Xuly]) VALUES (16, 2, 9, CAST(N'2022-05-02' AS Date), CAST(N'2022-05-02' AS Date), N'Nhận sách tại nhà', N'Đà Nẵng', N'0989020304', NULL, 0)
INSERT [dbo].[DangKyMuon] ([Id], [HocsinhId], [SachId], [NgayDK], [NgayNhan], [Phuongthuc], [Diachi], [Dienthoai], [Ghichu], [Xuly]) VALUES (17, 2, 11, CAST(N'2022-05-08' AS Date), CAST(N'2022-05-08' AS Date), N'Nhận sách tại nhà', N'Đà Nẵng', N'0989020304', NULL, 0)
INSERT [dbo].[DangKyMuon] ([Id], [HocsinhId], [SachId], [NgayDK], [NgayNhan], [Phuongthuc], [Diachi], [Dienthoai], [Ghichu], [Xuly]) VALUES (18, 2, 3, CAST(N'2022-05-08' AS Date), CAST(N'2022-05-08' AS Date), N'Nhận sách tại nhà', N'Đà Nẵng', N'0989020304', NULL, 0)
SET IDENTITY_INSERT [dbo].[DangKyMuon] OFF
INSERT [dbo].[Hocsinh] ([Id], [Hoten], [LopId], [Dienthoai], [Email], [Diachi], [Phuhuynh], [Anh]) VALUES (1, N'Tuấn Tú', 1, N'0905334455', N'user02@sm.com', N'Đà Nẵng', N'0905334455', N'/ckfinder/userfiles/images/avatar5.png')
INSERT [dbo].[Hocsinh] ([Id], [Hoten], [LopId], [Dienthoai], [Email], [Diachi], [Phuhuynh], [Anh]) VALUES (2, N'Minh Thư', 1, N'0989020304', N'u03@sm.com', N'Đà Nẵng', N'0989020304', N'/ckfinder/userfiles/images/2212.jpg')
INSERT [dbo].[Hocsinh] ([Id], [Hoten], [LopId], [Dienthoai], [Email], [Diachi], [Phuhuynh], [Anh]) VALUES (3, N'User 04', 1, N'0905334455', N'u04@sm.com', N'Đà Nẵng', N'0905334455', N'/ckfinder/userfiles/images/avatar5.png')
INSERT [dbo].[Hocsinh] ([Id], [Hoten], [LopId], [Dienthoai], [Email], [Diachi], [Phuhuynh], [Anh]) VALUES (4, N'User 05', 1, N'0989020304', N'u05@sm.com', N'Đà Nẵng', N'0989020304', N'/ckfinder/userfiles/images/avatar5.png')
INSERT [dbo].[Hocsinh] ([Id], [Hoten], [LopId], [Dienthoai], [Email], [Diachi], [Phuhuynh], [Anh]) VALUES (5, N'User 06', 1, N'0905334455', N'u06@sm.com', N'Đà Nẵng', N'0905334455', N'/ckfinder/userfiles/images/avatar5.png')
SET IDENTITY_INSERT [dbo].[LoaiSach] ON 

INSERT [dbo].[LoaiSach] ([Id], [TenLoai], [Mota], [Anh]) VALUES (3, N'Lịch Sử', N'Lịch Sử - Chính Trị', NULL)
INSERT [dbo].[LoaiSach] ([Id], [TenLoai], [Mota], [Anh]) VALUES (7, N'Ngoại ngữ', N'Ngoại Ngữ', NULL)
INSERT [dbo].[LoaiSach] ([Id], [TenLoai], [Mota], [Anh]) VALUES (9, N'Văn Hóa - Tôn Giáo', N'Văn Hóa - Tôn Giáo', NULL)
INSERT [dbo].[LoaiSach] ([Id], [TenLoai], [Mota], [Anh]) VALUES (11, N'Thể Thao - Nghệ Thuật', N'Thể Thao - Nghệ Thuật', N'/ckfinder/userfiles/images/2212.jpg')
INSERT [dbo].[LoaiSach] ([Id], [TenLoai], [Mota], [Anh]) VALUES (13, N'Y Học - Sức Khỏe', N'Y Học - Sức Khỏe', NULL)
INSERT [dbo].[LoaiSach] ([Id], [TenLoai], [Mota], [Anh]) VALUES (15, N'Vật lý', N'Sách vật lý phổ thông', NULL)
INSERT [dbo].[LoaiSach] ([Id], [TenLoai], [Mota], [Anh]) VALUES (16, N'Sinh học', N'Sách sinh học phổ thông', NULL)
INSERT [dbo].[LoaiSach] ([Id], [TenLoai], [Mota], [Anh]) VALUES (17, N'Toán học', N'Sách toán phổ thông', NULL)
INSERT [dbo].[LoaiSach] ([Id], [TenLoai], [Mota], [Anh]) VALUES (18, N'Hóa học', N'Sách hóa học phổ thông', NULL)
INSERT [dbo].[LoaiSach] ([Id], [TenLoai], [Mota], [Anh]) VALUES (20, N'Địa lý', N'Sách địa lý', NULL)
INSERT [dbo].[LoaiSach] ([Id], [TenLoai], [Mota], [Anh]) VALUES (21, N'Văn học', N'Sách ngữ văn', NULL)
SET IDENTITY_INSERT [dbo].[LoaiSach] OFF
SET IDENTITY_INSERT [dbo].[Lop] ON 

INSERT [dbo].[Lop] ([Id], [Tenlop], [GVCN], [Ghichu]) VALUES (1, N'9/1', N'Cô A', NULL)
INSERT [dbo].[Lop] ([Id], [Tenlop], [GVCN], [Ghichu]) VALUES (2, N'9/2', N'Thầy B', NULL)
INSERT [dbo].[Lop] ([Id], [Tenlop], [GVCN], [Ghichu]) VALUES (3, N'8/1', N'Cô C', NULL)
INSERT [dbo].[Lop] ([Id], [Tenlop], [GVCN], [Ghichu]) VALUES (4, N'8/2', N'Thầy D', NULL)
SET IDENTITY_INSERT [dbo].[Lop] OFF
SET IDENTITY_INSERT [dbo].[MuonTra] ON 

INSERT [dbo].[MuonTra] ([Id], [HocsinhId], [SachId], [NgayMuon], [Ngaytra], [Ngayphaitra], [Tienphat], [Ghichu]) VALUES (1, 2, 11, CAST(N'2022-03-23' AS Date), NULL, CAST(N'2022-04-06' AS Date), 0, N'Mượn sách')
INSERT [dbo].[MuonTra] ([Id], [HocsinhId], [SachId], [NgayMuon], [Ngaytra], [Ngayphaitra], [Tienphat], [Ghichu]) VALUES (2, 2, 10, CAST(N'2022-03-23' AS Date), NULL, CAST(N'2022-04-06' AS Date), 0, N'Mượn sách')
INSERT [dbo].[MuonTra] ([Id], [HocsinhId], [SachId], [NgayMuon], [Ngaytra], [Ngayphaitra], [Tienphat], [Ghichu]) VALUES (3, 2, 3, CAST(N'2022-04-01' AS Date), NULL, CAST(N'2022-04-15' AS Date), 0, N'Mượn sách')
INSERT [dbo].[MuonTra] ([Id], [HocsinhId], [SachId], [NgayMuon], [Ngaytra], [Ngayphaitra], [Tienphat], [Ghichu]) VALUES (4, 2, 9, CAST(N'2022-04-01' AS Date), NULL, CAST(N'2022-04-15' AS Date), 0, N'Mượn sách')
INSERT [dbo].[MuonTra] ([Id], [HocsinhId], [SachId], [NgayMuon], [Ngaytra], [Ngayphaitra], [Tienphat], [Ghichu]) VALUES (5, 2, 1, CAST(N'2022-04-01' AS Date), NULL, CAST(N'2022-04-15' AS Date), 0, N'Mượn sách')
INSERT [dbo].[MuonTra] ([Id], [HocsinhId], [SachId], [NgayMuon], [Ngaytra], [Ngayphaitra], [Tienphat], [Ghichu]) VALUES (6, 2, 2, CAST(N'2022-04-02' AS Date), NULL, CAST(N'2022-04-16' AS Date), 0, N'Mượn sách')
INSERT [dbo].[MuonTra] ([Id], [HocsinhId], [SachId], [NgayMuon], [Ngaytra], [Ngayphaitra], [Tienphat], [Ghichu]) VALUES (7, 2, 3, CAST(N'2022-04-02' AS Date), NULL, CAST(N'2022-04-16' AS Date), 0, N'Mượn sách')
INSERT [dbo].[MuonTra] ([Id], [HocsinhId], [SachId], [NgayMuon], [Ngaytra], [Ngayphaitra], [Tienphat], [Ghichu]) VALUES (8, 2, 2, CAST(N'2022-04-02' AS Date), NULL, CAST(N'2022-04-16' AS Date), 0, N'Mượn sách')
INSERT [dbo].[MuonTra] ([Id], [HocsinhId], [SachId], [NgayMuon], [Ngaytra], [Ngayphaitra], [Tienphat], [Ghichu]) VALUES (9, 2, 11, CAST(N'2022-04-02' AS Date), NULL, CAST(N'2022-04-16' AS Date), 0, N'Mượn sách')
INSERT [dbo].[MuonTra] ([Id], [HocsinhId], [SachId], [NgayMuon], [Ngaytra], [Ngayphaitra], [Tienphat], [Ghichu]) VALUES (10, 2, 3, CAST(N'2022-04-02' AS Date), NULL, CAST(N'2022-04-16' AS Date), 0, N'Mượn sách')
SET IDENTITY_INSERT [dbo].[MuonTra] OFF
SET IDENTITY_INSERT [dbo].[Sach] ON 

INSERT [dbo].[Sach] ([Id], [TenSach], [LoaisachId], [Tomtat], [Anh], [NhaXB], [NamXB], [Tacgia]) VALUES (1, N'400 Bài Tập Hóa Học 10', 18, N'<p>400 B&agrave;i Tập H&oacute;a Học 10</p>', N'/ckfinder/userfiles/images/hh.jpg', N'Ebook', N'2022', N'Nhiều tác giả')
INSERT [dbo].[Sach] ([Id], [TenSach], [LoaisachId], [Tomtat], [Anh], [NhaXB], [NamXB], [Tacgia]) VALUES (2, N'567 Câu Hỏi Trắc Nghiệm Sinh Học 9', 16, N'<p>567 C&acirc;u Hỏi Trắc Nghiệm Sinh Học 9</p>
', N'/ckfinder/userfiles/images/sinhhoc.jpg', N'Ebook', N'2022', N'Nhiều tác giả')
INSERT [dbo].[Sach] ([Id], [TenSach], [LoaisachId], [Tomtat], [Anh], [NhaXB], [NamXB], [Tacgia]) VALUES (3, N'15 Chủ Đề Nói Thường Gặp Trong Tiếng Anh', 7, N'<p>15 Chủ Đề N&oacute;i Thường Gặp Trong Tiếng Anh</p>', N'/ckfinder/userfiles/images/eng1.jpg', N'Ebook', N'2022', N'Nhiều tác giả')
INSERT [dbo].[Sach] ([Id], [TenSach], [LoaisachId], [Tomtat], [Anh], [NhaXB], [NamXB], [Tacgia]) VALUES (4, N'15 Chủ Đề Nói Thường Gặp Trong Tiếng Anh', 7, N'<p>15 Chủ Đề N&oacute;i Thường Gặp Trong Tiếng Anh</p>', N'/ckfinder/userfiles/images/eng1.jpg', N'Ebook', N'2022', N'Nhiều tác giả')
INSERT [dbo].[Sach] ([Id], [TenSach], [LoaisachId], [Tomtat], [Anh], [NhaXB], [NamXB], [Tacgia]) VALUES (5, N'15 Chủ Đề Nói Thường Gặp Trong Tiếng Anh', 7, N'<p>15 Chủ Đề N&oacute;i Thường Gặp Trong Tiếng Anh</p>', N'/ckfinder/userfiles/images/eng1.jpg', N'Ebook', N'2022', N'Nhiều tác giả')
INSERT [dbo].[Sach] ([Id], [TenSach], [LoaisachId], [Tomtat], [Anh], [NhaXB], [NamXB], [Tacgia]) VALUES (6, N'15 Chủ Đề Nói Thường Gặp Trong Tiếng Anh', 7, N'<p>15 Chủ Đề N&oacute;i Thường Gặp Trong Tiếng Anh</p>', N'/ckfinder/userfiles/images/eng1.jpg', N'Ebook', N'2022', N'Nhiều tác giả')
INSERT [dbo].[Sach] ([Id], [TenSach], [LoaisachId], [Tomtat], [Anh], [NhaXB], [NamXB], [Tacgia]) VALUES (7, N'15 Chủ Đề Nói Thường Gặp Trong Tiếng Anh', 7, N'<p>15 Chủ Đề N&oacute;i Thường Gặp Trong Tiếng Anh</p>', N'/ckfinder/userfiles/images/eng1.jpg', N'Ebook', N'2022', N'Nhiều tác giả')
INSERT [dbo].[Sach] ([Id], [TenSach], [LoaisachId], [Tomtat], [Anh], [NhaXB], [NamXB], [Tacgia]) VALUES (8, N'15 Chủ Đề Nói Thường Gặp Trong Tiếng Anh', 7, N'<p>15 Chủ Đề N&oacute;i Thường Gặp Trong Tiếng Anh</p>', N'/ckfinder/userfiles/images/eng1.jpg', N'Ebook', N'2022', N'Nhiều tác giả')
INSERT [dbo].[Sach] ([Id], [TenSach], [LoaisachId], [Tomtat], [Anh], [NhaXB], [NamXB], [Tacgia]) VALUES (9, N'15 Chủ Đề Nói Thường Gặp Trong Tiếng Anh', 7, N'<p>15 Chủ Đề N&oacute;i Thường Gặp Trong Tiếng Anh</p>', N'/ckfinder/userfiles/images/eng1.jpg', N'Ebook', N'2022', N'Nhiều tác giả')
INSERT [dbo].[Sach] ([Id], [TenSach], [LoaisachId], [Tomtat], [Anh], [NhaXB], [NamXB], [Tacgia]) VALUES (10, N'15 Chủ Đề Nói Thường Gặp Trong Tiếng Anh', 7, N'<p>15 Chủ Đề N&oacute;i Thường Gặp Trong Tiếng Anh</p>', N'/ckfinder/userfiles/images/eng1.jpg', N'Ebook', N'2022', N'Nhiều tác giả')
INSERT [dbo].[Sach] ([Id], [TenSach], [LoaisachId], [Tomtat], [Anh], [NhaXB], [NamXB], [Tacgia]) VALUES (11, N'360 Câu Hỏi Trắc Nghiệm Vật Lý 9 – Có Đáp Án', 15, N'<p>360 C&acirc;u Hỏi Trắc Nghiệm Vật L&yacute; 9 &ndash; C&oacute; Đ&aacute;p &Aacute;n</p>
', N'/ckfinder/userfiles/images/vatly.jpg', N'Ebook', N'2022', N'Nhiều tác giả')
SET IDENTITY_INSERT [dbo].[Sach] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/8/2022 7:43:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 5/8/2022 7:43:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 5/8/2022 7:43:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 5/8/2022 7:43:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 5/8/2022 7:43:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/8/2022 7:43:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[DangKyMuon]  WITH CHECK ADD  CONSTRAINT [FK_DangKyMuon_Hocsinh] FOREIGN KEY([HocsinhId])
REFERENCES [dbo].[Hocsinh] ([Id])
GO
ALTER TABLE [dbo].[DangKyMuon] CHECK CONSTRAINT [FK_DangKyMuon_Hocsinh]
GO
ALTER TABLE [dbo].[DangKyMuon]  WITH CHECK ADD  CONSTRAINT [FK_DangKyMuon_Sach] FOREIGN KEY([SachId])
REFERENCES [dbo].[Sach] ([Id])
GO
ALTER TABLE [dbo].[DangKyMuon] CHECK CONSTRAINT [FK_DangKyMuon_Sach]
GO
ALTER TABLE [dbo].[Hocsinh]  WITH CHECK ADD  CONSTRAINT [FK_Hocsinh_Lop] FOREIGN KEY([LopId])
REFERENCES [dbo].[Lop] ([Id])
GO
ALTER TABLE [dbo].[Hocsinh] CHECK CONSTRAINT [FK_Hocsinh_Lop]
GO
ALTER TABLE [dbo].[MuonTra]  WITH CHECK ADD  CONSTRAINT [FK_MuonTra_Hocsinh] FOREIGN KEY([HocsinhId])
REFERENCES [dbo].[Hocsinh] ([Id])
GO
ALTER TABLE [dbo].[MuonTra] CHECK CONSTRAINT [FK_MuonTra_Hocsinh]
GO
ALTER TABLE [dbo].[MuonTra]  WITH CHECK ADD  CONSTRAINT [FK_MuonTra_Sach] FOREIGN KEY([SachId])
REFERENCES [dbo].[Sach] ([Id])
GO
ALTER TABLE [dbo].[MuonTra] CHECK CONSTRAINT [FK_MuonTra_Sach]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_LoaiSach] FOREIGN KEY([LoaisachId])
REFERENCES [dbo].[LoaiSach] ([Id])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_LoaiSach]
GO
/****** Object:  StoredProcedure [dbo].[GetMemberInfo]    Script Date: 5/8/2022 7:43:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMemberInfo]
@userId varchar(60)
as
select * from AspNetUsers
where Id = @userId
GO
USE [master]
GO
ALTER DATABASE [eLibrary] SET  READ_WRITE 
GO
