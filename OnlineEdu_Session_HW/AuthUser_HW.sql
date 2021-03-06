USE [master]
GO
/****** Object:  Database [AuthUser]    Script Date: 23/07/2020 23:01:26 ******/
CREATE DATABASE [AuthUser]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AuthUser', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\AuthUser.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AuthUser_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\AuthUser_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AuthUser] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AuthUser].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AuthUser] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AuthUser] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AuthUser] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AuthUser] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AuthUser] SET ARITHABORT OFF 
GO
ALTER DATABASE [AuthUser] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AuthUser] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AuthUser] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AuthUser] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AuthUser] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AuthUser] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AuthUser] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AuthUser] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AuthUser] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AuthUser] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AuthUser] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AuthUser] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AuthUser] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AuthUser] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AuthUser] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AuthUser] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AuthUser] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AuthUser] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AuthUser] SET  MULTI_USER 
GO
ALTER DATABASE [AuthUser] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AuthUser] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AuthUser] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AuthUser] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AuthUser] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AuthUser] SET QUERY_STORE = OFF
GO
USE [AuthUser]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [AuthUser]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 23/07/2020 23:01:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Users]    Script Date: 23/07/2020 23:01:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202007231202560_CreateDB', N'OnlineEdu_Session_HW.Migrations.Configuration', 0x1F8B0800000000000400CD57DB6E1B37107D2FD07F20F8D4028EE8CB4B6BEC267025BB351A5946D6491E036A772413E5654B721DE9DBFAD04FEA2F64A8BD6A255992D306855E56DC993333676EDC7FFEFA3B7AB350923C8175C2E8989E0D4E29019D9A4CE8794C0B3F7BF5137DF3FAFBEFA2EB4C2DC8875AEE22C8A1A676317DF43EBF64CCA58FA0B81B28915AE3CCCC0F52A318CF0C3B3F3DFD999D9D3140088A588444EF0AED8582D51FFC3B343A85DC175C8E4D06D255E7F82659A1923BAEC0E53C85984EB4141AAEB3E253022E78F3E9B78F83D114213C2CBCA3E44A0A8E6E2520679470AD8DE71EC52EDF3B48BC357A9EE478C0E5C33207949B71E9A00AE6B2153F34AED3F310176B156BA8B470DEA82301CF2E2AA2585FFD4574D38648A4F21A29F7CB10F58ACE9822219692BEA1CBA1B4416807D365820641F7846C933869AA048B29FC4EC8B090BEB0106B28BCE5F284DC175329D2DF61F960FE001DEB42CAAEABE82CBE5B3BC0A37B6B72B07EF90E66550022A384ADEBB1BE62A3D6D129C3BBD5FEE29C923B34CEA7129A4AE850917863E157D060B987EC9E7B0F1613799BC18ACB0DEB3D5B81248D4FB5452C3F6C2B4AC67CF116F4DC3FC6141F29B9110BC8EA93CA8BF75A6017A292B7056CF1F279CBD78A0BF9EDCDDE73E73E1B9BFDD79623D616F366898751C0B12E6D270DD578D852EEF8B6AA7857D95E0FB1C44CC077D070CAB40E94A3665076D3362F1B7FDAB1C6CAB956CF3FB6630046639EE7C860672056272429A7E1F05572FC645025064BDD9601D178DB58C226E073E8BD45D3E8E98DB0CE8FB8E7531E7234CCD4865897FD1DCCD696BA04F7BBBFE5BB960ECFA5C69E9550A6A607D8527983D1296CE855A0D03855CDC70DB5D552E292DB2D83656864A1F4AEE1F49C763B2ABA18EDE9E14855EB7761AAA3C331DA3EEEC2B4A79B4811EBB1D9CF1FDB48606F70F7ABE1B946EA8B34D69B86EA354E5415F1FEEBC5465597229420454F220B159D2C9D0735080283E44F399402E36D05C65C8B19385FEE368A4BFDBC7729F9FF5C109873993CE096F0CD97B3088CEE5DBF47AEA7FE3ED64FDCA68FDCFEA0F8E2C7AFDBB15F07D5DF9BC7A01DB70B3787F6FE6DB773D995AD11D36C6AD0F3D2C36A3DBE700F6EB669C4BADF0AD1089C98B710E1CB41431AEABF05AD656EF5CCD44463445D8F6A915E1EC6E07986C45C592F663CF5F83A0D1B25DC613E7059ACB23E85EC564F0A9F17FECA395053B976118CD8F3F657CB7EDDE76892877FEEDF0801DD1418024CF42F859059E3F7CD96CAD901116AA4EA3AF40AEF7008375F364877461F0854D137821C74E8D90750B9443037D1097F8297F886E5F516E63C5DD6D37637C8FE44ACD31E8D049F5BAE5C85D1EA87EF5F163E805F7F018341F071320F0000, N'6.2.0-61023')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [Username], [Email], [Password]) VALUES (4, N'Puste', N'puste@gmail.com', N'AFAvWbhe9dohym8eejmfQ6WR3+i9FxWZpzBL5otoVmWW4fqFOKtGR0UedDdvrQrj4w==')
INSERT [dbo].[Users] ([id], [Username], [Email], [Password]) VALUES (5, N'Murad', N'murad@gmail.com', N'ANnrgsUvKGH2cGOIlzISrKcPqAQiVSEZt/vqNtmmgWyT/k2Smzm099hwIerCLVgCoA==')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [AuthUser] SET  READ_WRITE 
GO
