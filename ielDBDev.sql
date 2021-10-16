USE [master]
GO
/****** Object:  Database [ielDBDev]    Script Date: 20/09/2021 15:00:02 ******/
CREATE DATABASE [ielDBDev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ielDBDev_Data', FILENAME = N'/var/opt/mssql/data\ielDBDev.mdf' , SIZE = 14336KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ielDBDev_Log', FILENAME = N'/var/opt/mssql/data\ielDBDev.ldf' , SIZE = 99520KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ielDBDev] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ielDBDev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ielDBDev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ielDBDev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ielDBDev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ielDBDev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ielDBDev] SET ARITHABORT OFF 
GO
ALTER DATABASE [ielDBDev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ielDBDev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ielDBDev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ielDBDev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ielDBDev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ielDBDev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ielDBDev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ielDBDev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ielDBDev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ielDBDev] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ielDBDev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ielDBDev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ielDBDev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ielDBDev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ielDBDev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ielDBDev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ielDBDev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ielDBDev] SET RECOVERY FULL 
GO
ALTER DATABASE [ielDBDev] SET  MULTI_USER 
GO
ALTER DATABASE [ielDBDev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ielDBDev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ielDBDev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ielDBDev] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ielDBDev] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ielDBDev', N'ON'
GO
ALTER DATABASE [ielDBDev] SET QUERY_STORE = OFF
GO
USE [ielDBDev]
GO
/****** Object:  Table [dbo].[addresses]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[addresses](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[public_place] [varchar](300) NULL,
	[postal_code] [varchar](8) NULL,
	[district] [varchar](155) NULL,
	[number] [varchar](100) NULL,
	[complement] [varchar](255) NULL,
	[city_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_745d8f43d3af10ab8247465e450] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[app_user_token]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[app_user_token](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[token] [nvarchar](255) NOT NULL,
	[expiration] [datetime] NOT NULL,
	[canceled] [bit] NOT NULL,
	[isConsumed] [bit] NOT NULL,
	[dateConsumed] [datetime] NULL,
	[user_id] [uniqueidentifier] NULL,
	[type] [varchar](255) NOT NULL,
 CONSTRAINT [PK_e96febc439498cf497b73976d32] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[campi]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[campi](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[delete_at] [datetime2](7) NULL,
	[name] [varchar](255) NULL,
	[company_name] [varchar](255) NULL,
	[fantasy_name] [varchar](255) NULL,
	[initials] [varchar](100) NULL,
	[cnpj] [varchar](14) NULL,
	[phone] [varchar](20) NULL,
	[secondary_phone] [varchar](20) NULL,
	[address_id] [uniqueidentifier] NULL,
	[educational_institution_id] [uniqueidentifier] NULL,
 CONSTRAINT [campi_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[campi_responsible]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[campi_responsible](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[delete_at] [datetime2](7) NULL,
	[campi_id] [uniqueidentifier] NULL,
	[responsible_id] [uniqueidentifier] NULL,
 CONSTRAINT [campi_responsible_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[candidate]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[candidate](
	[id] [int] NOT NULL,
	[vacancyId] [int] NULL,
	[studentId] [int] NULL,
	[status] [varchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cities](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[name] [varchar](75) NOT NULL,
	[ibge] [numeric](18, 0) NOT NULL,
	[uf] [varchar](2) NOT NULL,
 CONSTRAINT [PK_4762ffb6e5d198cfec5606bc11e] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[companies]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[companies](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[has_national_contract] [bit] NULL,
	[is_draft] [bit] NULL,
	[cnpj] [varchar](14) NULL,
	[employees_number] [numeric](18, 0) NULL,
	[phone] [varchar](20) NULL,
	[company_name] [varchar](255) NULL,
	[logo] [varchar](255) NULL,
	[recruitment_description] [varchar](800) NULL,
	[owner_description] [varchar](800) NULL,
	[linkedin] [varchar](155) NULL,
	[facebook] [varchar](155) NULL,
	[instagram] [varchar](155) NULL,
	[youtube] [varchar](155) NULL,
	[website] [varchar](155) NULL,
	[address_id] [uniqueidentifier] NULL,
	[segment_id] [uniqueidentifier] NULL,
	[iel_unit_id] [uniqueidentifier] NULL,
	[company_matriz_id] [uniqueidentifier] NULL,
	[company_type] [varchar](255) NULL,
	[company_status] [varchar](255) NULL,
	[state_registry] [varchar](255) NULL,
	[municipal_registry] [varchar](255) NULL,
	[cnae] [varchar](255) NULL,
	[first_access] [bit] NULL,
 CONSTRAINT [PK_d4bc3e82a314fa9e29f652c2c22] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company_contracts]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company_contracts](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[name] [varchar](255) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[content_body] [text] NOT NULL,
	[companiesId] [uniqueidentifier] NULL,
	[ielUnityId] [uniqueidentifier] NULL,
	[contractSignatureId] [uniqueidentifier] NULL,
	[company_responsible_id] [uniqueidentifier] NULL,
	[signature_date] [datetime2](7) NULL,
	[end_date_of_contract_term] [int] NULL,
	[automatic_readjustment_date] [int] NULL,
	[unique_contract_number] [varchar](255) NULL,
	[contract_type_id] [uniqueidentifier] NULL,
	[iel_unity_responsible_id] [uniqueidentifier] NULL,
	[signature_id] [uniqueidentifier] NULL,
	[term_type] [varchar](50) NULL,
	[reset_frequency] [varchar](50) NULL,
	[index_used] [varchar](50) NULL,
	[last_12month] [varchar](4) NULL,
 CONSTRAINT [PK_7a97e49fbf4614bca6f251e36ac] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company_has_documents]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company_has_documents](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[file_id] [varchar](100) NOT NULL,
	[size] [int] NOT NULL,
	[content_type] [varchar](255) NOT NULL,
	[original_name] [varchar](255) NOT NULL,
	[company_id] [uniqueidentifier] NULL,
	[document_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_775c9fe65d100b50ae57783e710] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company_responsible]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company_responsible](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[company_id] [uniqueidentifier] NULL,
	[responsible_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_5506f0e6686653d68e647e96b8b] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company_templates]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company_templates](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[delete_at] [datetime2](7) NULL,
	[company_id] [uniqueidentifier] NULL,
	[template_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_company_templates] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company_values]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company_values](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[value] [varchar](255) NOT NULL,
	[description] [varchar](800) NOT NULL,
	[company_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_4ff35dbeceb486f0503b53137e8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contract_services]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contract_services](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[description] [text] NULL,
	[value] [decimal](18, 0) NOT NULL,
	[minimum_value] [decimal](18, 0) NULL,
	[guarantee] [numeric](18, 0) NULL,
	[company_service_type] [varchar](255) NOT NULL,
	[level_education_type] [varchar](255) NULL,
	[billing_rule_type] [varchar](255) NULL,
	[billing_mode_type] [varchar](255) NULL,
	[billing_trigger_type] [varchar](255) NULL,
	[cancellation_rule_type] [varchar](255) NULL,
	[company_contract_id] [uniqueidentifier] NULL,
	[expiration_day] [int] NULL,
 CONSTRAINT [PK_45f045ee7b47452e187cafbd37e] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contract_services_level_educations]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contract_services_level_educations](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[delete_at] [datetime2](7) NULL,
	[contract_service_id] [uniqueidentifier] NOT NULL,
	[level_education_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_contract_services_level_educations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contract_signatory]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contract_signatory](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[request_signature_key] [varchar](255) NOT NULL,
	[signer_key] [varchar](255) NOT NULL,
	[email] [varchar](255) NULL,
	[auths] [varchar](10) NULL,
	[name] [varchar](255) NULL,
	[documentation] [varchar](14) NULL,
	[birthday] [varchar](10) NULL,
	[ip_address] [varchar](20) NULL,
	[sign_as] [varchar](20) NOT NULL,
	[url_signer] [varchar](255) NOT NULL,
	[status_date] [datetime] NULL,
	[company_contract_signature_id] [uniqueidentifier] NULL,
	[list_key] [varchar](255) NOT NULL,
	[phone_number] [varchar](12) NULL,
	[status] [bit] NOT NULL,
	[responsibleType] [varchar](255) NULL,
	[validation_status] [varchar](255) NULL,
	[responsible_id] [varchar](255) NULL,
	[order] [numeric](18, 0) NULL,
 CONSTRAINT [PK_b3122af0b1c263c7b779b565ce6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contract_signature]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contract_signature](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[sign_document_id] [varchar](255) NOT NULL,
	[status_date] [datetime] NULL,
	[status] [varchar](255) NULL,
	[url_signed_document] [varchar](3000) NULL,
	[contract_type] [varchar](255) NOT NULL,
	[provider] [varchar](255) NULL,
 CONSTRAINT [PK_381e2aed89dc2a1bcba4cc46be5] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contract_templates]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contract_templates](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[name] [varchar](255) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[content_body] [text] NOT NULL,
	[contract_type_id] [uniqueidentifier] NULL,
	[iel_unity_id] [uniqueidentifier] NULL,
	[default_template] [bit] NULL,
 CONSTRAINT [PK_59af2fd9eadd293fe10fdb2c702] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contract_templates_types]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contract_templates_types](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[name] [varchar](255) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[entity] [varchar](255) NULL,
 CONSTRAINT [PK_c6fb6a8b60ae95ba174e1013afe] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contract_templates_types_has_variables]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contract_templates_types_has_variables](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[delete_at] [datetime2](7) NULL,
	[types_id] [uniqueidentifier] NULL,
	[variables_id] [uniqueidentifier] NULL,
 CONSTRAINT [contract_templates_types_has_variables_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contract_templates_variables]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contract_templates_variables](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[description] [varchar](255) NOT NULL,
	[propriety] [varchar](255) NOT NULL,
	[entity] [varchar](255) NOT NULL,
	[service_type] [varchar](255) NOT NULL,
 CONSTRAINT [PK_668cc8f655aafe707c3cee85267] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_12cd3fe8800b3b1ba39516f0296] UNIQUE NONCLUSTERED 
(
	[description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[knowledge_area] [nvarchar](255) NULL,
	[level] [nvarchar](255) NULL,
	[status] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[name] [varchar](300) NOT NULL,
	[frequency] [varchar](255) NOT NULL,
	[shift] [varchar](255) NOT NULL,
	[duration] [numeric](18, 0) NOT NULL,
	[from_which_period_is_released] [numeric](18, 0) NULL,
	[maximum_weekly_hourly_allowed] [numeric](18, 0) NOT NULL,
	[maximum_month_internship_period] [numeric](18, 0) NOT NULL,
	[is_record_advice_supervisor] [bit] NOT NULL,
	[campi_id] [uniqueidentifier] NULL,
	[level] [varchar](255) NOT NULL,
	[code] [int] IDENTITY(1,1) NOT NULL,
	[mandatory_internship] [bit] NULL,
	[educational_institution_id] [uniqueidentifier] NULL,
	[modality] [varchar](255) NULL,
	[general_courses_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_3f70a487cc718ad8eda4e6d58c9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses_responsible]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses_responsible](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[delete_at] [datetime2](7) NULL,
	[courses_id] [uniqueidentifier] NULL,
	[responsible_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_courses_responsible] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[documents]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[documents](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[description] [varchar](100) NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_ac51aa5181ee2036f5ca482857c] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[educational_institution]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[educational_institution](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[branch] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[educational_institution_responsible]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[educational_institution_responsible](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[delete_at] [datetime2](7) NULL,
	[educational_institution_id] [uniqueidentifier] NULL,
	[responsible_id] [uniqueidentifier] NULL,
 CONSTRAINT [educational_institution_responsible_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[educational_institution1]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[educational_institution1](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[delete_at] [datetime2](7) NULL,
	[company_name] [varchar](255) NULL,
	[fantasy_name] [varchar](255) NULL,
	[initials] [varchar](100) NULL,
	[cnpj] [varchar](14) NULL,
	[phone] [varchar](20) NULL,
	[secondary_phone] [varchar](20) NULL,
	[address_id] [uniqueidentifier] NULL,
	[iel_unity_id] [uniqueidentifier] NULL,
 CONSTRAINT [educational_institution_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[general_courses]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[general_courses](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[delete_at] [datetime2](7) NULL,
	[name] [varchar](255) NULL,
	[initials] [varchar](255) NULL,
 CONSTRAINT [PK_general_courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[iel_units]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iel_units](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[type] [varchar](255) NULL,
	[cnpj] [varchar](14) NOT NULL,
	[company_name] [varchar](255) NOT NULL,
	[url_webhook] [varchar](255) NULL,
	[security_token] [varchar](255) NULL,
	[address_id] [uniqueidentifier] NULL,
	[state_registry] [varchar](255) NULL,
	[municipal_registry] [varchar](255) NULL,
	[security_token_api_clicksign] [varchar](3000) NULL,
	[security_token_webhook_clicksign] [varchar](3000) NULL,
	[url_webhook_receita_federal] [varchar](3000) NULL,
	[security_token_receita_federal] [varchar](3000) NULL,
	[iel_units_id] [uniqueidentifier] NULL,
	[request_type_receita_federal] [varchar](255) NULL,
	[default_docusign] [bit] NOT NULL,
	[dsClientId] [varchar](255) NULL,
	[impersonatedUserGuid] [varchar](255) NULL,
	[privateKey] [text] NULL,
 CONSTRAINT [PK_6d8eab1c99b0af01b836a37ab32] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[iel_unity_responsible]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iel_unity_responsible](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[responsible_id] [uniqueidentifier] NULL,
	[iel_unity_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_dd367f1204c55077b6a88ed2819] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[level_education]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[level_education](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[delete_at] [datetime2](7) NULL,
	[name] [varchar](255) NULL,
 CONSTRAINT [PK_level_education_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[migrations]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[migrations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[timestamp] [bigint] NOT NULL,
	[name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_da8eb9c653ce61d0b46b4723bdb] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permissions]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permissions](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[name] [varchar](255) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[authorization] [varchar](255) NOT NULL,
 CONSTRAINT [PK_920331560282b8bd21bb02290df] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profiles]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profiles](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[name] [varchar](255) NOT NULL,
	[description] [varchar](255) NOT NULL,
 CONSTRAINT [PK_8e520eb4da7dc01d0e190447c8e] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profiles_has_permission]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profiles_has_permission](
	[profilesId] [uniqueidentifier] NOT NULL,
	[permissionsId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_13f970600807a70223d89c692eb] PRIMARY KEY CLUSTERED 
(
	[profilesId] ASC,
	[permissionsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[responsible]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[responsible](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[responsible_name] [varchar](255) NULL,
	[responsible_rg] [varchar](255) NULL,
	[responsible_cpf] [varchar](11) NULL,
	[responsible_email] [varchar](320) NULL,
	[responsible_birthday_date] [datetime2](7) NULL,
	[responsible_occupation] [varchar](255) NULL,
	[responsible_formation] [varchar](255) NULL,
	[work_class_number] [varchar](255) NULL,
	[is_responsible] [bit] NOT NULL,
	[is_supervisor] [bit] NOT NULL,
	[experience] [numeric](18, 0) NULL,
	[responsible_phone] [varchar](20) NULL,
	[is_internship] [bit] NOT NULL,
	[is_coordinator] [bit] NULL,
 CONSTRAINT [PK_17e34c82bd39c71ea31099833ca] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[segments]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[segments](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_beff1eec19679fe8ad4f291f04e] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[states]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[states](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[name] [varchar](75) NOT NULL,
	[uf] [varchar](2) NOT NULL,
	[ibge] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_09ab30ca0975c02656483265f4f] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[cpf] [nvarchar](11) NULL,
	[photo] [nvarchar](255) NULL,
	[rg] [nvarchar](255) NULL,
	[rgIssuer] [nvarchar](255) NULL,
	[birthdate] [datetimeoffset](7) NULL,
	[nationality] [nvarchar](255) NULL,
	[maritalStatus] [nvarchar](255) NULL,
	[race] [nvarchar](255) NULL,
	[sex] [nvarchar](255) NULL,
	[isDisabled] [bit] NULL,
	[deficiency] [nvarchar](255) NULL,
	[hasCar] [bit] NULL,
	[email] [nvarchar](255) NULL,
	[alternateEmail] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[phoneDdd] [nvarchar](3) NULL,
	[celphoneDdd] [nvarchar](3) NULL,
	[celphone] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[district] [nvarchar](255) NULL,
	[ufCity] [nvarchar](255) NULL,
	[cep] [nvarchar](8) NULL,
	[complement] [nvarchar](255) NULL,
	[educationalInstitution] [nvarchar](255) NULL,
	[course] [nvarchar](255) NULL,
	[startYear] [nvarchar](255) NULL,
	[currentSemester] [nvarchar](255) NULL,
	[conclusionYear] [nvarchar](255) NULL,
	[conclusionSemester] [nvarchar](255) NULL,
	[enrollment] [nvarchar](255) NULL,
	[hasScholarship] [bit] NULL,
	[isIndigenousScholarship] [bit] NULL,
	[studyPeriod] [nvarchar](255) NULL,
	[frequency] [nvarchar](255) NULL,
	[internshipPlacesOfInterest] [nvarchar](255) NULL,
	[linkedinId] [nvarchar](255) NULL,
	[facebookId] [nvarchar](255) NULL,
	[googleId] [nvarchar](255) NULL,
	[pipefyId] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[registerDone] [bit] NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_additional_document]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_additional_document](
	[id] [int] NOT NULL,
	[description] [nvarchar](255) NULL,
	[fileUrl] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[studentId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_courses]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_courses](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[time_course] [decimal](18, 0) NOT NULL,
	[academic_record] [varchar](100) NULL,
	[student_id] [uniqueidentifier] NULL,
	[course_id] [uniqueidentifier] NULL,
	[registration_number] [varchar](255) NULL,
 CONSTRAINT [PK_6c63b56af68884a5a69dde6a32d] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_knowledge_area]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_knowledge_area](
	[id] [int] NOT NULL,
	[knowledgeType] [nvarchar](255) NULL,
	[educationInstitution] [nvarchar](255) NULL,
	[formation] [nvarchar](255) NULL,
	[startYear] [nvarchar](4) NULL,
	[endYear] [nvarchar](4) NULL,
	[knowledgeLevel] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[studentId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_knowledge_area_file]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_knowledge_area_file](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[fileUrl] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[studentKnowledgeAreaId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_previous_experience]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_previous_experience](
	[id] [int] NOT NULL,
	[startDate] [datetimeoffset](7) NOT NULL,
	[endDate] [datetimeoffset](7) NOT NULL,
	[companyName] [nvarchar](255) NULL,
	[role] [nvarchar](255) NULL,
	[performedActivities] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[studentId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_recover_request]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_recover_request](
	[id] [int] NOT NULL,
	[recoveryToken] [nvarchar](4000) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[studentId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[student_name] [varchar](255) NULL,
	[student_cpf] [varchar](11) NULL,
	[student_rg] [varchar](255) NULL,
	[student_phone] [varchar](100) NULL,
	[birth_date] [date] NULL,
	[address_id] [uniqueidentifier] NULL,
	[iel_unit_id] [uniqueidentifier] NULL,
	[student_email] [varchar](255) NULL,
 CONSTRAINT [PK_7d7f07271ad4ce999880713f05e] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tce]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tce](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[delete_at] [datetime2](7) NULL,
	[common_notes] [text] NULL,
	[template_id] [uniqueidentifier] NULL,
	[student_id] [uniqueidentifier] NULL,
	[vacancy_id] [uniqueidentifier] NULL,
	[start_date_internship] [datetime2](7) NULL,
	[end_date_internship] [datetime2](7) NULL,
	[status] [varchar](255) NULL,
	[courses_id] [uniqueidentifier] NULL,
	[signature_id] [uniqueidentifier] NULL,
	[contact_number] [varchar](255) NULL,
	[primary_vacancy_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tce] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tce_additive_rescission]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tce_additive_rescission](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[code] [varchar](255) NULL,
	[date_start_internship] [datetime2](7) NULL,
	[date_end_internship] [datetime2](7) NULL,
	[status] [varchar](255) NOT NULL,
	[type] [varchar](255) NOT NULL,
	[change_type] [ntext] NULL,
	[content_body] [text] NOT NULL,
	[tce_id] [uniqueidentifier] NULL,
	[vacancy_id] [uniqueidentifier] NULL,
	[signature_id] [uniqueidentifier] NULL,
	[template_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_0923cafccd88526a7c0ec27a2fe] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tce_batch_import]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tce_batch_import](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[status] [varchar](40) NOT NULL,
	[type] [varchar](40) NULL,
	[batch_code] [varchar](30) NULL,
	[company_id] [uniqueidentifier] NULL,
	[iel_unity_id] [uniqueidentifier] NULL,
	[common_notes] [text] NULL,
	[templates_id] [uniqueidentifier] NULL,
	[user_id] [uniqueidentifier] NULL,
	[import_date] [datetime2](7) NULL,
	[finish_date] [datetime2](7) NULL,
	[total_itens] [numeric](18, 0) NULL,
	[total_items_processed] [numeric](18, 0) NULL,
 CONSTRAINT [PK_4166fd736ed6328912a66ec86d9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tce_batch_import_item]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tce_batch_import_item](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[status] [varchar](40) NULL,
	[cause_failure] [varchar](255) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[student_id] [uniqueidentifier] NULL,
	[vacancy_id] [uniqueidentifier] NULL,
	[tce_batch_import_id] [uniqueidentifier] NULL,
	[course_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_0b1b7fbe93ef5598f00eab0ce35] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tce_batch_import_step]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tce_batch_import_step](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[step] [varchar](255) NULL,
	[validating] [varchar](255) NULL,
	[success] [bit] NULL,
	[report] [text] NULL,
	[tce_batch_import_id] [uniqueidentifier] NULL,
	[order] [numeric](38, 0) NULL,
 CONSTRAINT [PK_b417f5c760a92c6ddb54fd66c15] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[name] [varchar](255) NOT NULL,
	[email] [varchar](320) NOT NULL,
	[password] [nvarchar](255) NULL,
	[verifiedAccount] [bit] NOT NULL,
	[dateVerifiedAccount] [date] NULL,
	[iel_unit_id] [uniqueidentifier] NULL,
	[company_id] [uniqueidentifier] NULL,
	[role] [varchar](255) NOT NULL,
	[status] [varchar](255) NOT NULL,
	[first_access] [bit] NOT NULL,
 CONSTRAINT [PK_a3ffb1c0c8416b9fc6f907b7433] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_has_profiles]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_has_profiles](
	[usersId] [uniqueidentifier] NOT NULL,
	[profilesId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_5f9a325cec1a625345d40be6548] PRIMARY KEY CLUSTERED 
(
	[usersId] ASC,
	[profilesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vacancies]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vacancies](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[vacancy_title] [varchar](155) NOT NULL,
	[is_free_company_name] [bit] NOT NULL,
	[vacancy_level] [varchar](255) NOT NULL,
	[activities_description] [varchar](800) NULL,
	[necessary_knowledge] [varchar](500) NULL,
	[desirable_knowledge] [varchar](500) NULL,
	[languages] [varchar](500) NULL,
	[number_of_positions] [numeric](18, 0) NOT NULL,
	[internship_mode] [varchar](255) NOT NULL,
	[scholarship_aid_value] [decimal](18, 0) NOT NULL,
	[scholarship_aid_type] [varchar](255) NOT NULL,
	[is_disclose_scholarship_aid] [bit] NOT NULL,
	[is_pcd] [bit] NOT NULL,
	[internship_term] [int] NOT NULL,
	[additional_information] [varchar](500) NULL,
	[responsible_id] [uniqueidentifier] NULL,
	[address_id] [uniqueidentifier] NULL,
	[supervisor_id] [uniqueidentifier] NULL,
	[vacancy_time_id] [uniqueidentifier] NULL,
	[company_id] [uniqueidentifier] NULL,
	[iel_unity_id] [uniqueidentifier] NULL,
	[status] [varchar](255) NOT NULL,
	[origin] [varchar](255) NOT NULL,
	[partial_ai_amount] [decimal](18, 0) NULL,
	[other_benefits] [varchar](500) NULL,
 CONSTRAINT [PK_3b45154a366568190cc15be2906] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vacancy]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vacancy](
	[id] [int] NOT NULL,
	[title] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[cityUf] [nvarchar](255) NULL,
	[publiciseCompanyName] [bit] NOT NULL,
	[accountableName] [nvarchar](255) NULL,
	[accountableEmail] [nvarchar](255) NULL,
	[supervisorName] [nvarchar](255) NULL,
	[supervisorEmail] [nvarchar](255) NULL,
	[supervisorCpf] [nvarchar](11) NULL,
	[semesterMin] [tinyint] NULL,
	[semesterMax] [tinyint] NULL,
	[description] [nvarchar](4000) NULL,
	[requirements] [nvarchar](4000) NULL,
	[weeklyWorkload] [int] NOT NULL,
	[workTimeStart] [nvarchar](255) NULL,
	[workTimeEnd] [nvarchar](255) NULL,
	[duration] [tinyint] NOT NULL,
	[wage] [float] NOT NULL,
	[publiciseWage] [bit] NOT NULL,
	[foodTicket] [bit] NULL,
	[transportTicket] [bit] NULL,
	[lifeInsurance] [bit] NULL,
	[healthInsurance] [bit] NULL,
	[paidVacations] [bit] NULL,
	[otherBenefits] [nvarchar](4000) NULL,
	[status] [varchar](255) NULL,
	[pipefyId] [nvarchar](255) NULL,
	[cardId] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[companyId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vacancy_benefits]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vacancy_benefits](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[benefit] [varchar](255) NOT NULL,
	[vacancy_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_492329cebd6247160b8e6c46ee9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vacancy_course]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vacancy_course](
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[vacancyId] [int] NOT NULL,
	[courseId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vacancy_courses]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vacancy_courses](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[vacancy_id] [uniqueidentifier] NULL,
	[maximum_period] [decimal](18, 0) NOT NULL,
	[minimum_period] [decimal](18, 0) NOT NULL,
	[general_courses_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_bdc665784f32c7a869bf320968b] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vacancy_process]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vacancy_process](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[process] [varchar](255) NOT NULL,
	[vacancy_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_0a2c5977cf74779d4b6a1c408fd] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vacancy_responsible]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vacancy_responsible](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[company_responsible_id] [uniqueidentifier] NULL,
	[vacancy_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_183c20530fe90898181621f012c] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vacancy_supervisor]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vacancy_supervisor](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[company_responsible_id] [uniqueidentifier] NULL,
	[vacancy_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_febba02ceea4e8ef8763e7ef186] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vacancy_time_day_scale]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vacancy_time_day_scale](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[vacancy_scale_time_day_scale_id] [uniqueidentifier] NULL,
	[entry_time] [varchar](255) NULL,
	[departure_time] [varchar](255) NULL,
	[break_time_start] [varchar](255) NULL,
	[break_time_stop] [varchar](255) NULL,
 CONSTRAINT [PK_740a0853e21b3de04d8d51063b3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vacancy_time_days]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vacancy_time_days](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[day] [varchar](255) NOT NULL,
	[vacancy_time_day_id] [uniqueidentifier] NULL,
	[vacancy_time_day_scale_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_135cf30f4b506bccad06cafbbf1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vacancy_times]    Script Date: 20/09/2021 15:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vacancy_times](
	[id] [uniqueidentifier] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
	[delete_at] [datetime2](7) NULL,
	[type] [varchar](255) NOT NULL,
	[shift] [varchar](255) NOT NULL,
	[weekly_workload] [decimal](18, 0) NOT NULL,
	[total_workload] [decimal](18, 0) NOT NULL,
	[entry_time] [varchar](255) NULL,
	[departure_time] [varchar](255) NULL,
	[break_time_start] [varchar](255) NULL,
	[break_time_stop] [varchar](255) NULL,
 CONSTRAINT [PK_2ab09345cd7b672d37486243d09] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [REL_aac62a0a98d6b76bfcd3a60f31]    Script Date: 20/09/2021 15:00:03 ******/
CREATE UNIQUE NONCLUSTERED INDEX [REL_aac62a0a98d6b76bfcd3a60f31] ON [dbo].[company_responsible]
(
	[responsible_id] ASC
)
WHERE ([responsible_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [sign-document-idx]    Script Date: 20/09/2021 15:00:03 ******/
CREATE NONCLUSTERED INDEX [sign-document-idx] ON [dbo].[contract_signature]
(
	[sign_document_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [REL_e15991a2ec2a8f01335afb16a0]    Script Date: 20/09/2021 15:00:03 ******/
CREATE UNIQUE NONCLUSTERED INDEX [REL_e15991a2ec2a8f01335afb16a0] ON [dbo].[iel_unity_responsible]
(
	[responsible_id] ASC
)
WHERE ([responsible_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_12625d39a40d55a86d9c156bce]    Script Date: 20/09/2021 15:00:03 ******/
CREATE NONCLUSTERED INDEX [IDX_12625d39a40d55a86d9c156bce] ON [dbo].[profiles_has_permission]
(
	[profilesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER INDEX [IDX_12625d39a40d55a86d9c156bce] ON [dbo].[profiles_has_permission] DISABLE
GO
/****** Object:  Index [IDX_30f504cb3691ef4f9df8acc3ff]    Script Date: 20/09/2021 15:00:03 ******/
CREATE NONCLUSTERED INDEX [IDX_30f504cb3691ef4f9df8acc3ff] ON [dbo].[profiles_has_permission]
(
	[permissionsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER INDEX [IDX_30f504cb3691ef4f9df8acc3ff] ON [dbo].[profiles_has_permission] DISABLE
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [student-cpf-idx]    Script Date: 20/09/2021 15:00:03 ******/
CREATE NONCLUSTERED INDEX [student-cpf-idx] ON [dbo].[students]
(
	[student_cpf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_9040a230c5a13359523923b3fd]    Script Date: 20/09/2021 15:00:03 ******/
CREATE NONCLUSTERED INDEX [IDX_9040a230c5a13359523923b3fd] ON [dbo].[users_has_profiles]
(
	[profilesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER INDEX [IDX_9040a230c5a13359523923b3fd] ON [dbo].[users_has_profiles] DISABLE
GO
/****** Object:  Index [IDX_e09efff06ad44f0852f3b59d48]    Script Date: 20/09/2021 15:00:03 ******/
CREATE NONCLUSTERED INDEX [IDX_e09efff06ad44f0852f3b59d48] ON [dbo].[users_has_profiles]
(
	[usersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER INDEX [IDX_e09efff06ad44f0852f3b59d48] ON [dbo].[users_has_profiles] DISABLE
GO
ALTER TABLE [dbo].[addresses] ADD  CONSTRAINT [DF_745d8f43d3af10ab8247465e450]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[addresses] ADD  CONSTRAINT [DF_fb681748736596039e3ead8620a]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[addresses] ADD  CONSTRAINT [DF_165d4de59b3dc4c4508fcdbb7d8]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[addresses] ADD  CONSTRAINT [DF_8813e791fe4c6cc9de77c950c70]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[addresses] ADD  CONSTRAINT [DF_f695ee88c4fefac775eb871aea2]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[app_user_token] ADD  CONSTRAINT [DF_e96febc439498cf497b73976d32]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[app_user_token] ADD  CONSTRAINT [DF_1ab8201617b9017523de78747ba]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[app_user_token] ADD  CONSTRAINT [DF_e82864ab026b2f7afd081753c7d]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[app_user_token] ADD  CONSTRAINT [DF_6a71b0545459a6230a0fec7456c]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[app_user_token] ADD  CONSTRAINT [DF_d8256dddc57c58b67723ade3f30]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[app_user_token] ADD  CONSTRAINT [DF_721ee726b3637ca32619e71111c]  DEFAULT ((0)) FOR [canceled]
GO
ALTER TABLE [dbo].[app_user_token] ADD  CONSTRAINT [DF_e73810f24f11bd3e377b7f7f536]  DEFAULT ((0)) FOR [isConsumed]
GO
ALTER TABLE [dbo].[campi] ADD  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[campi] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[campi] ADD  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[campi_responsible] ADD  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[campi_responsible] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[campi_responsible] ADD  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[cities] ADD  CONSTRAINT [DF_4762ffb6e5d198cfec5606bc11e]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[cities] ADD  CONSTRAINT [DF_036a385ff10683894db756325b5]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[cities] ADD  CONSTRAINT [DF_2d10c9d423b18991ed1a14a69fe]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[cities] ADD  CONSTRAINT [DF_019a396ecfeb124a47356f5ec90]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[cities] ADD  CONSTRAINT [DF_145ff20c70c4afa6a67415c7393]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[companies] ADD  CONSTRAINT [DF_d4bc3e82a314fa9e29f652c2c22]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[companies] ADD  CONSTRAINT [DF_4d0632c00306eec5feecbbdc9f0]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[companies] ADD  CONSTRAINT [DF_8a25145cb77e66c398790e1107e]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[companies] ADD  CONSTRAINT [DF_b559ae26b6f801536d281094530]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[companies] ADD  CONSTRAINT [DF_309c37c80e3d34b32ca2381880f]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[companies] ADD  CONSTRAINT [DF_4b34ff71cf25577a08ca601d3df]  DEFAULT ((0)) FOR [has_national_contract]
GO
ALTER TABLE [dbo].[companies] ADD  CONSTRAINT [DF_9f804d1c92eed266f4fdabd3329]  DEFAULT ((0)) FOR [is_draft]
GO
ALTER TABLE [dbo].[company_contracts] ADD  CONSTRAINT [DF_7a97e49fbf4614bca6f251e36ac]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[company_contracts] ADD  CONSTRAINT [DF_33c059c4a35303a7bbb5cb3d4b3]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[company_contracts] ADD  CONSTRAINT [DF_ca82a6781cfaa58e3a07ae8094d]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[company_contracts] ADD  CONSTRAINT [DF_694015015d31c78b9a49b515b48]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[company_contracts] ADD  CONSTRAINT [DF_6674a9ca3e7e479d6599c53aa82]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[company_has_documents] ADD  CONSTRAINT [DF_775c9fe65d100b50ae57783e710]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[company_has_documents] ADD  CONSTRAINT [DF_140551c3e20c5ec43e36081bc6a]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[company_has_documents] ADD  CONSTRAINT [DF_fd41aa23cefe855821d2a926922]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[company_has_documents] ADD  CONSTRAINT [DF_2617fce312b6e63410921347cda]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[company_has_documents] ADD  CONSTRAINT [DF_6c645aab26d5264f55b75f8d82e]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[company_responsible] ADD  CONSTRAINT [DF_5506f0e6686653d68e647e96b8b]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[company_responsible] ADD  CONSTRAINT [DF_531f28545da4eb90d8802f998b7]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[company_responsible] ADD  CONSTRAINT [DF_d2074c445b9ef3d33d1e98edc5f]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[company_responsible] ADD  CONSTRAINT [DF_a6cf20493e0f8ed69cf97981f40]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[company_responsible] ADD  CONSTRAINT [DF_4d629e468d921c48d7d6613d6ad]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[company_templates] ADD  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[company_templates] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[company_templates] ADD  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[company_values] ADD  CONSTRAINT [DF_4ff35dbeceb486f0503b53137e8]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[company_values] ADD  CONSTRAINT [DF_098310d79d56f7c8d8250d08a72]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[company_values] ADD  CONSTRAINT [DF_81c3b2f9f67d7f5c32d5e2807a6]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[company_values] ADD  CONSTRAINT [DF_3065f56cb4caed404209edfd45a]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[company_values] ADD  CONSTRAINT [DF_97ad97172278b3113ee37be78c0]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[contract_services] ADD  CONSTRAINT [DF_45f045ee7b47452e187cafbd37e]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[contract_services] ADD  CONSTRAINT [DF_7ac7df017f653fba46b6ad7054a]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[contract_services] ADD  CONSTRAINT [DF_f3ba7320dbc32780dba4ef11cd8]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[contract_services] ADD  CONSTRAINT [DF_734b5c10befc8d57229050f1d7c]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[contract_services] ADD  CONSTRAINT [DF_0fc26c658f1e0c77658990e9cdd]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[contract_services_level_educations] ADD  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[contract_services_level_educations] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[contract_services_level_educations] ADD  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[contract_signatory] ADD  CONSTRAINT [DF_b3122af0b1c263c7b779b565ce6]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[contract_signatory] ADD  CONSTRAINT [DF_4de22ce8b721933f2fa7d4aa3f9]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[contract_signatory] ADD  CONSTRAINT [DF_869f2b210115fe2cb96b3ca83aa]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[contract_signatory] ADD  CONSTRAINT [DF_060f7b51a41d28796eb52455bcb]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[contract_signatory] ADD  CONSTRAINT [DF_f71d4a1479cc72d39b45538536d]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[contract_signatory] ADD  CONSTRAINT [DF_9d9c2723a9ffbb8fd6d05030cd0]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[contract_signature] ADD  CONSTRAINT [DF_381e2aed89dc2a1bcba4cc46be5]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[contract_signature] ADD  CONSTRAINT [DF_ce6645f2a5b6e91bbdebcfa24a0]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[contract_signature] ADD  CONSTRAINT [DF_6dd4db4c531422efec69e1edb03]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[contract_signature] ADD  CONSTRAINT [DF_1947910619c98b027244d985bf6]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[contract_signature] ADD  CONSTRAINT [DF_dceedbf02ed1831e4e2022fdbaf]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[contract_templates] ADD  CONSTRAINT [DF_59af2fd9eadd293fe10fdb2c702]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[contract_templates] ADD  CONSTRAINT [DF_293d3d89a973c387d7068444fbb]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[contract_templates] ADD  CONSTRAINT [DF_21f5194f20fb2d2547c560f9721]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[contract_templates] ADD  CONSTRAINT [DF_0a497d572a09d2966501527e696]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[contract_templates] ADD  CONSTRAINT [DF_a6a0e82de54c6c955d88ddcc191]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[contract_templates] ADD  CONSTRAINT [DF_805fe9bf1e7780e633182139f6f]  DEFAULT ((0)) FOR [default_template]
GO
ALTER TABLE [dbo].[contract_templates_types] ADD  CONSTRAINT [DF_c6fb6a8b60ae95ba174e1013afe]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[contract_templates_types] ADD  CONSTRAINT [DF_5a4ec62b1b7413af63c33597e6f]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[contract_templates_types] ADD  CONSTRAINT [DF_138b6f9b1f5682ac84e96f745f8]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[contract_templates_types] ADD  CONSTRAINT [DF_72f943be51e6117cf65b033f0d4]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[contract_templates_types] ADD  CONSTRAINT [DF_4e3a643d970c7ef67c4201f3933]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[contract_templates_types_has_variables] ADD  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[contract_templates_types_has_variables] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[contract_templates_types_has_variables] ADD  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[contract_templates_variables] ADD  CONSTRAINT [DF_668cc8f655aafe707c3cee85267]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[contract_templates_variables] ADD  CONSTRAINT [DF_e0f34eda2d87cc53b3c2fe81a09]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[contract_templates_variables] ADD  CONSTRAINT [DF_8a328bb79dc9d2a07e7001156b7]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[contract_templates_variables] ADD  CONSTRAINT [DF_8a16ce3d652c962f5787a804301]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[contract_templates_variables] ADD  CONSTRAINT [DF_f61b4effd95a330cc67c36b10ef]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[courses] ADD  CONSTRAINT [DF_3f70a487cc718ad8eda4e6d58c9]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[courses] ADD  CONSTRAINT [DF_d3b5b08d0853d2e2bb6397994af]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[courses] ADD  CONSTRAINT [DF_9a13c7918902ae323e728cfe53b]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[courses] ADD  CONSTRAINT [DF_f333f9047acd049641eba7f1c00]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[courses] ADD  CONSTRAINT [DF_2a0e895f16991fcb064052b020b]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[courses_responsible] ADD  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[courses_responsible] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[courses_responsible] ADD  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[documents] ADD  CONSTRAINT [DF_ac51aa5181ee2036f5ca482857c]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[documents] ADD  CONSTRAINT [DF_11d074e9eee20fbbf0e35ca8714]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[documents] ADD  CONSTRAINT [DF_62175c2439dac99a828315002b2]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[documents] ADD  CONSTRAINT [DF_0ac6db0be1ba323e80e653b0e6d]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[documents] ADD  CONSTRAINT [DF_0fa0f20571d78848ea6e36f75b5]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[educational_institution_responsible] ADD  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[educational_institution_responsible] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[educational_institution_responsible] ADD  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[educational_institution1] ADD  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[educational_institution1] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[educational_institution1] ADD  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[general_courses] ADD  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[general_courses] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[general_courses] ADD  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[iel_units] ADD  CONSTRAINT [DF_6d8eab1c99b0af01b836a37ab32]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[iel_units] ADD  CONSTRAINT [DF_f57d0400fa8348397617836395e]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[iel_units] ADD  CONSTRAINT [DF_9fd0160cac98dac72b361a6dfa0]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[iel_units] ADD  CONSTRAINT [DF_f8d28c5e2b1a92a0ea853e36f14]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[iel_units] ADD  CONSTRAINT [DF_54e54f41d7f2ef1145612b30efe]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[iel_units] ADD  DEFAULT ((0)) FOR [default_docusign]
GO
ALTER TABLE [dbo].[iel_unity_responsible] ADD  CONSTRAINT [DF_dd367f1204c55077b6a88ed2819]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[iel_unity_responsible] ADD  CONSTRAINT [DF_6cf4adc5dc2426172b14c91a2bd]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[iel_unity_responsible] ADD  CONSTRAINT [DF_bc50bee2545f8dfddce1737b306]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[iel_unity_responsible] ADD  CONSTRAINT [DF_861c08cd16065f7c953f5b68ac5]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[iel_unity_responsible] ADD  CONSTRAINT [DF_33686e18983b4e00208f70d6b5e]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[level_education] ADD  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[level_education] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[level_education] ADD  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[permissions] ADD  CONSTRAINT [DF_920331560282b8bd21bb02290df]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[permissions] ADD  CONSTRAINT [DF_67f9ede5c9877307048f957a1c9]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[permissions] ADD  CONSTRAINT [DF_f9aa10682275958c98018606e2e]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[permissions] ADD  CONSTRAINT [DF_337088ff813c697c964f49f58fd]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[permissions] ADD  CONSTRAINT [DF_b01aa3668b2d129f4bf24f002cf]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[profiles] ADD  CONSTRAINT [DF_8e520eb4da7dc01d0e190447c8e]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[profiles] ADD  CONSTRAINT [DF_0b58ce47240167f230b3d02c764]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[profiles] ADD  CONSTRAINT [DF_79ed27d308594ce7795e94e97dd]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[profiles] ADD  CONSTRAINT [DF_4366b023132e3c83106c6d38bca]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[profiles] ADD  CONSTRAINT [DF_8f9310dd5afeb38d7239af6ed4e]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[responsible] ADD  CONSTRAINT [DF_17e34c82bd39c71ea31099833ca]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[responsible] ADD  CONSTRAINT [DF_89c66d52b571ca94d4be1592ad9]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[responsible] ADD  CONSTRAINT [DF_8d8022fdcca0ab01bbf0f659509]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[responsible] ADD  CONSTRAINT [DF_c883106dff6e56e58b9692510ad]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[responsible] ADD  CONSTRAINT [DF_35d86fa077cd059b09f1b3a39ee]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[responsible] ADD  CONSTRAINT [DF_e989261c33272f2fa0f77936596]  DEFAULT ((0)) FOR [is_responsible]
GO
ALTER TABLE [dbo].[responsible] ADD  CONSTRAINT [DF_0d9420403c5a004bc6b43704b4f]  DEFAULT ((0)) FOR [is_supervisor]
GO
ALTER TABLE [dbo].[responsible] ADD  CONSTRAINT [DF_58702f8b15b32fac98acf5303d5]  DEFAULT ((0)) FOR [is_internship]
GO
ALTER TABLE [dbo].[responsible] ADD  DEFAULT ((0)) FOR [is_coordinator]
GO
ALTER TABLE [dbo].[segments] ADD  CONSTRAINT [DF_beff1eec19679fe8ad4f291f04e]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[segments] ADD  CONSTRAINT [DF_61310082fdd77e622ec51479ce3]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[segments] ADD  CONSTRAINT [DF_3cbf0fdbbdab10d9ba86d0cfb3f]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[segments] ADD  CONSTRAINT [DF_168008afb3cdb7ec24a16d2bfa9]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[segments] ADD  CONSTRAINT [DF_ae452711da6d030f5d8dbed234f]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[states] ADD  CONSTRAINT [DF_09ab30ca0975c02656483265f4f]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[states] ADD  CONSTRAINT [DF_1e7ec6ff49cf5414182fbd57e8c]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[states] ADD  CONSTRAINT [DF_7013dd8ee8d0f5944fa365d79bc]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[states] ADD  CONSTRAINT [DF_cd5b93bc25f79ba99763dce16a7]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[states] ADD  CONSTRAINT [DF_8393c6f2ac87da4c8ae27fe38aa]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[student_courses] ADD  CONSTRAINT [DF_6c63b56af68884a5a69dde6a32d]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[student_courses] ADD  CONSTRAINT [DF_e8f19020f77c5deae7ddacbcc91]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[student_courses] ADD  CONSTRAINT [DF_3c1bbbaa77b1b7a0445d1e24073]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[student_courses] ADD  CONSTRAINT [DF_378cbd80a7fdae1614bd11957be]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[student_courses] ADD  CONSTRAINT [DF_0e52060456ff75582fafc8f3f00]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[students] ADD  CONSTRAINT [DF_7d7f07271ad4ce999880713f05e]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[students] ADD  CONSTRAINT [DF_b9c95c7e37499f9963da1c8d73b]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[students] ADD  CONSTRAINT [DF_67f2d5e96eb68f023730e97109d]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[students] ADD  CONSTRAINT [DF_e5b62e6d1b34a877967a34ca0f9]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[students] ADD  CONSTRAINT [DF_539ab5182af6bc1bcadf4dc57b5]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tce] ADD  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[tce] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[tce] ADD  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[tce_additive_rescission] ADD  CONSTRAINT [DF_0923cafccd88526a7c0ec27a2fe]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[tce_additive_rescission] ADD  CONSTRAINT [DF_7c5bd8ece9828d2e1801039e2ce]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[tce_additive_rescission] ADD  CONSTRAINT [DF_00f5eac9e296e1fc04f4ebc665b]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[tce_additive_rescission] ADD  CONSTRAINT [DF_e1709ad246ecb1fff27fa1253cc]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tce_additive_rescission] ADD  CONSTRAINT [DF_729b3f6401a61bafda8681d1649]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tce_batch_import] ADD  CONSTRAINT [DF_4166fd736ed6328912a66ec86d9]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[tce_batch_import] ADD  CONSTRAINT [DF_48029ee0557f811207a6e54d124]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[tce_batch_import] ADD  CONSTRAINT [DF_e09ad829226f41456d927fde802]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[tce_batch_import] ADD  CONSTRAINT [DF_0b810149c5e1fdce90fbc64ad3d]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tce_batch_import] ADD  CONSTRAINT [DF_9039a1723f1a8dd20c33049f31c]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tce_batch_import_item] ADD  CONSTRAINT [DF_0b1b7fbe93ef5598f00eab0ce35]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[tce_batch_import_item] ADD  CONSTRAINT [DF_d8542306423222d9fb0759fd8ce]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[tce_batch_import_item] ADD  CONSTRAINT [DF_2de2042b83bdcbe7eaa79c6b2bc]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[tce_batch_import_item] ADD  CONSTRAINT [DF_a87fd1a8716f8cd927c05ee2aee]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tce_batch_import_item] ADD  CONSTRAINT [DF_61ed5cc51e595e65770f620dfd0]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tce_batch_import_step] ADD  CONSTRAINT [DF_b417f5c760a92c6ddb54fd66c15]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[tce_batch_import_step] ADD  CONSTRAINT [DF_842844bbb54add35406c4dc8e74]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[tce_batch_import_step] ADD  CONSTRAINT [DF_03e36d9fa32f57240d7e47712ab]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[tce_batch_import_step] ADD  CONSTRAINT [DF_140922fa9820253de959875a803]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tce_batch_import_step] ADD  CONSTRAINT [DF_41a40e2f0f86586dc1c6ccdf4ce]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tce_batch_import_step] ADD  CONSTRAINT [DF_1e79431b5e18a1eb9aab936df69]  DEFAULT ((0)) FOR [success]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_a3ffb1c0c8416b9fc6f907b7433]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_20c7aea6112bef71528210f631d]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_ead8dad2246900ed148b4f197bc]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_c9b5b525a96ddc2c5647d7f7fa5]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_6d596d799f9cb9dac6f7bf7c23c]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_0d5fbe90b077a63fc2e8888ae93]  DEFAULT ((0)) FOR [verifiedAccount]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_3676155292d72c67cd4e090514f]  DEFAULT ('Inativo') FOR [status]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((1)) FOR [first_access]
GO
ALTER TABLE [dbo].[vacancies] ADD  CONSTRAINT [DF_3b45154a366568190cc15be2906]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[vacancies] ADD  CONSTRAINT [DF_060a1d82542fadb66c71742c567]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[vacancies] ADD  CONSTRAINT [DF_67c6aa6468b9bacae5967a91b6f]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[vacancies] ADD  CONSTRAINT [DF_48712cf1fdb899ccf9b7e740b8c]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[vacancies] ADD  CONSTRAINT [DF_30a5e098a7675343fa67e116da8]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[vacancy_benefits] ADD  CONSTRAINT [DF_492329cebd6247160b8e6c46ee9]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[vacancy_benefits] ADD  CONSTRAINT [DF_7a3401d56b98d83af6928033dff]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[vacancy_benefits] ADD  CONSTRAINT [DF_7d1ced951d7d54e120800fe6973]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[vacancy_benefits] ADD  CONSTRAINT [DF_8d6612b9a63e0a09a9a4e5d84ad]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[vacancy_benefits] ADD  CONSTRAINT [DF_e2264dd6c6d782bfbb9b3ac95b9]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[vacancy_courses] ADD  CONSTRAINT [DF_bdc665784f32c7a869bf320968b]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[vacancy_courses] ADD  CONSTRAINT [DF_c40f52d28557907b3ec72c231d3]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[vacancy_courses] ADD  CONSTRAINT [DF_8255a03a49e808e2f6dc0164a01]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[vacancy_courses] ADD  CONSTRAINT [DF_81d9f9cb571ef2da06527bd975b]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[vacancy_courses] ADD  CONSTRAINT [DF_11afc28f308f48bff5f833fe851]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[vacancy_process] ADD  CONSTRAINT [DF_0a2c5977cf74779d4b6a1c408fd]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[vacancy_process] ADD  CONSTRAINT [DF_14f5ffc864dd4286c70c3c6b8bc]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[vacancy_process] ADD  CONSTRAINT [DF_4cb0d1b76f562c56a68c55c8d41]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[vacancy_process] ADD  CONSTRAINT [DF_dbd2a2e7c856cbc198424a82dce]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[vacancy_process] ADD  CONSTRAINT [DF_136d12a07c6584b5b295840f0bf]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[vacancy_responsible] ADD  CONSTRAINT [DF_183c20530fe90898181621f012c]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[vacancy_responsible] ADD  CONSTRAINT [DF_3046add074b918255774b44e09f]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[vacancy_responsible] ADD  CONSTRAINT [DF_6c136d3e26ba125c87cd0e2d7f6]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[vacancy_responsible] ADD  CONSTRAINT [DF_13d7499f3e7a548ca26a057c2c6]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[vacancy_responsible] ADD  CONSTRAINT [DF_e947de5c61cb90ad3227ffb43dd]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[vacancy_supervisor] ADD  CONSTRAINT [DF_febba02ceea4e8ef8763e7ef186]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[vacancy_supervisor] ADD  CONSTRAINT [DF_9beac0107664ccfaae93cc82009]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[vacancy_supervisor] ADD  CONSTRAINT [DF_b50f2e500f19100cd33c8b91ee4]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[vacancy_supervisor] ADD  CONSTRAINT [DF_96db0f90cfb589a6d9f7aabeda8]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[vacancy_supervisor] ADD  CONSTRAINT [DF_7d57f881859e5cef7e542acca04]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[vacancy_time_day_scale] ADD  CONSTRAINT [DF_740a0853e21b3de04d8d51063b3]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[vacancy_time_day_scale] ADD  CONSTRAINT [DF_1d1728dd3791ea0377c18ece54e]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[vacancy_time_day_scale] ADD  CONSTRAINT [DF_c3c212920d839413800a18d4426]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[vacancy_time_day_scale] ADD  CONSTRAINT [DF_797e1c7965b7ab7531be429c2db]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[vacancy_time_day_scale] ADD  CONSTRAINT [DF_d8decfee1447612cb16468e6322]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[vacancy_time_days] ADD  CONSTRAINT [DF_135cf30f4b506bccad06cafbbf1]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[vacancy_time_days] ADD  CONSTRAINT [DF_0fd78f016df6c99ba6fe7b60572]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[vacancy_time_days] ADD  CONSTRAINT [DF_5c626a87a000f85f7b343dce051]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[vacancy_time_days] ADD  CONSTRAINT [DF_b49a9316f43a4b46fa10b612908]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[vacancy_time_days] ADD  CONSTRAINT [DF_5ce8a74ad1fb9cac3061c006f9e]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[vacancy_times] ADD  CONSTRAINT [DF_2ab09345cd7b672d37486243d09]  DEFAULT (newsequentialid()) FOR [id]
GO
ALTER TABLE [dbo].[vacancy_times] ADD  CONSTRAINT [DF_cdefddae9e9ac861c1634e3ba8d]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[vacancy_times] ADD  CONSTRAINT [DF_1ad254606380d4829d7517699b6]  DEFAULT ((0)) FOR [is_archived]
GO
ALTER TABLE [dbo].[vacancy_times] ADD  CONSTRAINT [DF_2df82573be625df4f243213c758]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[vacancy_times] ADD  CONSTRAINT [DF_e5f8ec3acf1c3a0d69df4ed74e2]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[addresses]  WITH NOCHECK ADD  CONSTRAINT [FK_baebeb388634106e4cbb46192b9] FOREIGN KEY([city_id])
REFERENCES [dbo].[cities] ([id])
GO
ALTER TABLE [dbo].[addresses] NOCHECK CONSTRAINT [FK_baebeb388634106e4cbb46192b9]
GO
ALTER TABLE [dbo].[app_user_token]  WITH NOCHECK ADD  CONSTRAINT [FK_adf47c9218b58a93766cf106425] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[app_user_token] NOCHECK CONSTRAINT [FK_adf47c9218b58a93766cf106425]
GO
ALTER TABLE [dbo].[campi]  WITH CHECK ADD  CONSTRAINT [FK_campi_address_addresses_id] FOREIGN KEY([address_id])
REFERENCES [dbo].[addresses] ([id])
GO
ALTER TABLE [dbo].[campi] CHECK CONSTRAINT [FK_campi_address_addresses_id]
GO
ALTER TABLE [dbo].[campi]  WITH CHECK ADD  CONSTRAINT [FK_campi_educational_institution_id] FOREIGN KEY([educational_institution_id])
REFERENCES [dbo].[educational_institution1] ([id])
GO
ALTER TABLE [dbo].[campi] CHECK CONSTRAINT [FK_campi_educational_institution_id]
GO
ALTER TABLE [dbo].[campi_responsible]  WITH CHECK ADD  CONSTRAINT [FK_campi_responsible_campi_id] FOREIGN KEY([campi_id])
REFERENCES [dbo].[campi] ([id])
GO
ALTER TABLE [dbo].[campi_responsible] CHECK CONSTRAINT [FK_campi_responsible_campi_id]
GO
ALTER TABLE [dbo].[campi_responsible]  WITH CHECK ADD  CONSTRAINT [FK_campi_responsible_responsible_id] FOREIGN KEY([responsible_id])
REFERENCES [dbo].[responsible] ([id])
GO
ALTER TABLE [dbo].[campi_responsible] CHECK CONSTRAINT [FK_campi_responsible_responsible_id]
GO
ALTER TABLE [dbo].[companies]  WITH NOCHECK ADD  CONSTRAINT [FK_03957bfd5f2e742a4bb7505509f] FOREIGN KEY([segment_id])
REFERENCES [dbo].[segments] ([id])
GO
ALTER TABLE [dbo].[companies] NOCHECK CONSTRAINT [FK_03957bfd5f2e742a4bb7505509f]
GO
ALTER TABLE [dbo].[companies]  WITH CHECK ADD  CONSTRAINT [FK_1e9cf8bb2473540f1dbd58b2df4] FOREIGN KEY([company_matriz_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[companies] CHECK CONSTRAINT [FK_1e9cf8bb2473540f1dbd58b2df4]
GO
ALTER TABLE [dbo].[companies]  WITH NOCHECK ADD  CONSTRAINT [FK_8d4d8c261aa9611797ef95e2d4c] FOREIGN KEY([iel_unit_id])
REFERENCES [dbo].[iel_units] ([id])
GO
ALTER TABLE [dbo].[companies] NOCHECK CONSTRAINT [FK_8d4d8c261aa9611797ef95e2d4c]
GO
ALTER TABLE [dbo].[companies]  WITH NOCHECK ADD  CONSTRAINT [FK_ad150e1e829fc0c9013267f3e4c] FOREIGN KEY([address_id])
REFERENCES [dbo].[addresses] ([id])
GO
ALTER TABLE [dbo].[companies] NOCHECK CONSTRAINT [FK_ad150e1e829fc0c9013267f3e4c]
GO
ALTER TABLE [dbo].[company_contracts]  WITH NOCHECK ADD  CONSTRAINT [FK_3a9d654f2f50238ff1ef791acd5] FOREIGN KEY([ielUnityId])
REFERENCES [dbo].[iel_units] ([id])
GO
ALTER TABLE [dbo].[company_contracts] NOCHECK CONSTRAINT [FK_3a9d654f2f50238ff1ef791acd5]
GO
ALTER TABLE [dbo].[company_contracts]  WITH NOCHECK ADD  CONSTRAINT [FK_52da71d94b739cdfd3678969c33] FOREIGN KEY([companiesId])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[company_contracts] NOCHECK CONSTRAINT [FK_52da71d94b739cdfd3678969c33]
GO
ALTER TABLE [dbo].[company_contracts]  WITH CHECK ADD  CONSTRAINT [FK_8c0b2d5f860aff89f1cef9d98b3] FOREIGN KEY([iel_unity_responsible_id])
REFERENCES [dbo].[iel_unity_responsible] ([id])
GO
ALTER TABLE [dbo].[company_contracts] CHECK CONSTRAINT [FK_8c0b2d5f860aff89f1cef9d98b3]
GO
ALTER TABLE [dbo].[company_contracts]  WITH CHECK ADD  CONSTRAINT [FK_cd5531519ac39ec82777072a070] FOREIGN KEY([contractSignatureId])
REFERENCES [dbo].[contract_signature] ([id])
GO
ALTER TABLE [dbo].[company_contracts] CHECK CONSTRAINT [FK_cd5531519ac39ec82777072a070]
GO
ALTER TABLE [dbo].[company_contracts]  WITH CHECK ADD  CONSTRAINT [FK_company_contracts_contract_type_id] FOREIGN KEY([contract_type_id])
REFERENCES [dbo].[contract_templates_types] ([id])
GO
ALTER TABLE [dbo].[company_contracts] CHECK CONSTRAINT [FK_company_contracts_contract_type_id]
GO
ALTER TABLE [dbo].[company_contracts]  WITH CHECK ADD  CONSTRAINT [FK_d4826d530cc63707fe040166071] FOREIGN KEY([signature_id])
REFERENCES [dbo].[contract_signature] ([id])
GO
ALTER TABLE [dbo].[company_contracts] CHECK CONSTRAINT [FK_d4826d530cc63707fe040166071]
GO
ALTER TABLE [dbo].[company_has_documents]  WITH NOCHECK ADD  CONSTRAINT [FK_b80cf1d08a133d235c8c91731dd] FOREIGN KEY([company_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[company_has_documents] NOCHECK CONSTRAINT [FK_b80cf1d08a133d235c8c91731dd]
GO
ALTER TABLE [dbo].[company_has_documents]  WITH NOCHECK ADD  CONSTRAINT [FK_ed73a32fdef4a72885748291d58] FOREIGN KEY([document_id])
REFERENCES [dbo].[documents] ([id])
GO
ALTER TABLE [dbo].[company_has_documents] NOCHECK CONSTRAINT [FK_ed73a32fdef4a72885748291d58]
GO
ALTER TABLE [dbo].[company_responsible]  WITH CHECK ADD  CONSTRAINT [FK_427f2ae41a9816da1f7418773b6] FOREIGN KEY([company_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[company_responsible] CHECK CONSTRAINT [FK_427f2ae41a9816da1f7418773b6]
GO
ALTER TABLE [dbo].[company_responsible]  WITH CHECK ADD  CONSTRAINT [FK_aac62a0a98d6b76bfcd3a60f313] FOREIGN KEY([responsible_id])
REFERENCES [dbo].[responsible] ([id])
GO
ALTER TABLE [dbo].[company_responsible] CHECK CONSTRAINT [FK_aac62a0a98d6b76bfcd3a60f313]
GO
ALTER TABLE [dbo].[company_templates]  WITH CHECK ADD  CONSTRAINT [FK_company_templates_company_id] FOREIGN KEY([company_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[company_templates] CHECK CONSTRAINT [FK_company_templates_company_id]
GO
ALTER TABLE [dbo].[company_templates]  WITH CHECK ADD  CONSTRAINT [FK_company_templates_template_id] FOREIGN KEY([template_id])
REFERENCES [dbo].[contract_templates] ([id])
GO
ALTER TABLE [dbo].[company_templates] CHECK CONSTRAINT [FK_company_templates_template_id]
GO
ALTER TABLE [dbo].[company_values]  WITH NOCHECK ADD  CONSTRAINT [FK_0c93f47b08515bccdd0a9fccb76] FOREIGN KEY([company_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[company_values] NOCHECK CONSTRAINT [FK_0c93f47b08515bccdd0a9fccb76]
GO
ALTER TABLE [dbo].[contract_services]  WITH CHECK ADD  CONSTRAINT [FK_81fddba20b8e7abad53aed029de] FOREIGN KEY([company_contract_id])
REFERENCES [dbo].[company_contracts] ([id])
GO
ALTER TABLE [dbo].[contract_services] CHECK CONSTRAINT [FK_81fddba20b8e7abad53aed029de]
GO
ALTER TABLE [dbo].[contract_services_level_educations]  WITH CHECK ADD  CONSTRAINT [FK_contract_services_level_educations_contract_service_id] FOREIGN KEY([contract_service_id])
REFERENCES [dbo].[contract_services] ([id])
GO
ALTER TABLE [dbo].[contract_services_level_educations] CHECK CONSTRAINT [FK_contract_services_level_educations_contract_service_id]
GO
ALTER TABLE [dbo].[contract_services_level_educations]  WITH CHECK ADD  CONSTRAINT [FK_contract_services_level_educations_level_education_id] FOREIGN KEY([level_education_id])
REFERENCES [dbo].[level_education] ([id])
GO
ALTER TABLE [dbo].[contract_services_level_educations] CHECK CONSTRAINT [FK_contract_services_level_educations_level_education_id]
GO
ALTER TABLE [dbo].[contract_signatory]  WITH CHECK ADD  CONSTRAINT [FK_68914bea2f25d5727c4cb021aba] FOREIGN KEY([company_contract_signature_id])
REFERENCES [dbo].[contract_signature] ([id])
GO
ALTER TABLE [dbo].[contract_signatory] CHECK CONSTRAINT [FK_68914bea2f25d5727c4cb021aba]
GO
ALTER TABLE [dbo].[contract_templates]  WITH NOCHECK ADD  CONSTRAINT [FK_1bcb39574f057fb9ea341243d9e] FOREIGN KEY([contract_type_id])
REFERENCES [dbo].[contract_templates_types] ([id])
GO
ALTER TABLE [dbo].[contract_templates] NOCHECK CONSTRAINT [FK_1bcb39574f057fb9ea341243d9e]
GO
ALTER TABLE [dbo].[contract_templates]  WITH NOCHECK ADD  CONSTRAINT [FK_d60e9e91e148aa9a7583f2199d1] FOREIGN KEY([iel_unity_id])
REFERENCES [dbo].[iel_units] ([id])
GO
ALTER TABLE [dbo].[contract_templates] NOCHECK CONSTRAINT [FK_d60e9e91e148aa9a7583f2199d1]
GO
ALTER TABLE [dbo].[contract_templates_types_has_variables]  WITH CHECK ADD  CONSTRAINT [FK_contract_templates_types_id] FOREIGN KEY([types_id])
REFERENCES [dbo].[contract_templates_types] ([id])
GO
ALTER TABLE [dbo].[contract_templates_types_has_variables] CHECK CONSTRAINT [FK_contract_templates_types_id]
GO
ALTER TABLE [dbo].[contract_templates_types_has_variables]  WITH CHECK ADD  CONSTRAINT [FK_contract_templates_variables_id] FOREIGN KEY([variables_id])
REFERENCES [dbo].[contract_templates_variables] ([id])
GO
ALTER TABLE [dbo].[contract_templates_types_has_variables] CHECK CONSTRAINT [FK_contract_templates_variables_id]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_1b5ff1deff9daafddbb723f6253] FOREIGN KEY([campi_id])
REFERENCES [dbo].[campi] ([id])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_1b5ff1deff9daafddbb723f6253]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_educational_institution_id] FOREIGN KEY([educational_institution_id])
REFERENCES [dbo].[educational_institution1] ([id])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_educational_institution_id]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_general_courses_id] FOREIGN KEY([general_courses_id])
REFERENCES [dbo].[general_courses] ([id])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_general_courses_id]
GO
ALTER TABLE [dbo].[courses_responsible]  WITH CHECK ADD  CONSTRAINT [FK_courses_responsible_courses_id] FOREIGN KEY([courses_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[courses_responsible] CHECK CONSTRAINT [FK_courses_responsible_courses_id]
GO
ALTER TABLE [dbo].[courses_responsible]  WITH CHECK ADD  CONSTRAINT [FK_courses_responsible_responsible_id] FOREIGN KEY([responsible_id])
REFERENCES [dbo].[responsible] ([id])
GO
ALTER TABLE [dbo].[courses_responsible] CHECK CONSTRAINT [FK_courses_responsible_responsible_id]
GO
ALTER TABLE [dbo].[educational_institution_responsible]  WITH CHECK ADD  CONSTRAINT [FK_educational_institution_responsible_educational_institution_id] FOREIGN KEY([educational_institution_id])
REFERENCES [dbo].[educational_institution1] ([id])
GO
ALTER TABLE [dbo].[educational_institution_responsible] CHECK CONSTRAINT [FK_educational_institution_responsible_educational_institution_id]
GO
ALTER TABLE [dbo].[educational_institution_responsible]  WITH CHECK ADD  CONSTRAINT [FK_educational_institution_responsible_responsible_id] FOREIGN KEY([responsible_id])
REFERENCES [dbo].[responsible] ([id])
GO
ALTER TABLE [dbo].[educational_institution_responsible] CHECK CONSTRAINT [FK_educational_institution_responsible_responsible_id]
GO
ALTER TABLE [dbo].[educational_institution1]  WITH CHECK ADD  CONSTRAINT [FK_educational_institution_address_addresses_id] FOREIGN KEY([address_id])
REFERENCES [dbo].[addresses] ([id])
GO
ALTER TABLE [dbo].[educational_institution1] CHECK CONSTRAINT [FK_educational_institution_address_addresses_id]
GO
ALTER TABLE [dbo].[educational_institution1]  WITH CHECK ADD  CONSTRAINT [FK_educational_institution_iel_unity_iel_units_id] FOREIGN KEY([iel_unity_id])
REFERENCES [dbo].[iel_units] ([id])
GO
ALTER TABLE [dbo].[educational_institution1] CHECK CONSTRAINT [FK_educational_institution_iel_unity_iel_units_id]
GO
ALTER TABLE [dbo].[iel_units]  WITH NOCHECK ADD  CONSTRAINT [FK_650acde55ec3dbc7e1b2a470b1e] FOREIGN KEY([address_id])
REFERENCES [dbo].[addresses] ([id])
GO
ALTER TABLE [dbo].[iel_units] NOCHECK CONSTRAINT [FK_650acde55ec3dbc7e1b2a470b1e]
GO
ALTER TABLE [dbo].[iel_units]  WITH CHECK ADD  CONSTRAINT [FK_97b08532ced21da09afa74f4355] FOREIGN KEY([iel_units_id])
REFERENCES [dbo].[iel_units] ([id])
GO
ALTER TABLE [dbo].[iel_units] CHECK CONSTRAINT [FK_97b08532ced21da09afa74f4355]
GO
ALTER TABLE [dbo].[iel_unity_responsible]  WITH CHECK ADD  CONSTRAINT [FK_835c8e87b198be7c38e50cb55f3] FOREIGN KEY([iel_unity_id])
REFERENCES [dbo].[iel_units] ([id])
GO
ALTER TABLE [dbo].[iel_unity_responsible] CHECK CONSTRAINT [FK_835c8e87b198be7c38e50cb55f3]
GO
ALTER TABLE [dbo].[iel_unity_responsible]  WITH CHECK ADD  CONSTRAINT [FK_e15991a2ec2a8f01335afb16a09] FOREIGN KEY([responsible_id])
REFERENCES [dbo].[responsible] ([id])
GO
ALTER TABLE [dbo].[iel_unity_responsible] CHECK CONSTRAINT [FK_e15991a2ec2a8f01335afb16a09]
GO
ALTER TABLE [dbo].[profiles_has_permission]  WITH CHECK ADD  CONSTRAINT [FK_12625d39a40d55a86d9c156bce1] FOREIGN KEY([profilesId])
REFERENCES [dbo].[profiles] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[profiles_has_permission] CHECK CONSTRAINT [FK_12625d39a40d55a86d9c156bce1]
GO
ALTER TABLE [dbo].[profiles_has_permission]  WITH CHECK ADD  CONSTRAINT [FK_30f504cb3691ef4f9df8acc3ff7] FOREIGN KEY([permissionsId])
REFERENCES [dbo].[permissions] ([id])
GO
ALTER TABLE [dbo].[profiles_has_permission] CHECK CONSTRAINT [FK_30f504cb3691ef4f9df8acc3ff7]
GO
ALTER TABLE [dbo].[student_courses]  WITH CHECK ADD  CONSTRAINT [FK_72bf56a78827a9ef805699a3609] FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([id])
GO
ALTER TABLE [dbo].[student_courses] CHECK CONSTRAINT [FK_72bf56a78827a9ef805699a3609]
GO
ALTER TABLE [dbo].[student_courses]  WITH CHECK ADD  CONSTRAINT [FK_aef3395fbde21c0c377cb836d08] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[student_courses] CHECK CONSTRAINT [FK_aef3395fbde21c0c377cb836d08]
GO
ALTER TABLE [dbo].[students]  WITH CHECK ADD  CONSTRAINT [FK_0d34b21f53be82a095f8003151e] FOREIGN KEY([iel_unit_id])
REFERENCES [dbo].[iel_units] ([id])
GO
ALTER TABLE [dbo].[students] CHECK CONSTRAINT [FK_0d34b21f53be82a095f8003151e]
GO
ALTER TABLE [dbo].[students]  WITH CHECK ADD  CONSTRAINT [FK_8219c255aced4d4591b6d99c758] FOREIGN KEY([address_id])
REFERENCES [dbo].[addresses] ([id])
GO
ALTER TABLE [dbo].[students] CHECK CONSTRAINT [FK_8219c255aced4d4591b6d99c758]
GO
ALTER TABLE [dbo].[tce]  WITH CHECK ADD  CONSTRAINT [FK_9446306660099a5919d1a696279] FOREIGN KEY([primary_vacancy_id])
REFERENCES [dbo].[vacancies] ([id])
GO
ALTER TABLE [dbo].[tce] CHECK CONSTRAINT [FK_9446306660099a5919d1a696279]
GO
ALTER TABLE [dbo].[tce]  WITH CHECK ADD  CONSTRAINT [FK_tce_courses_id] FOREIGN KEY([courses_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[tce] CHECK CONSTRAINT [FK_tce_courses_id]
GO
ALTER TABLE [dbo].[tce]  WITH CHECK ADD  CONSTRAINT [FK_tce_signature_id] FOREIGN KEY([signature_id])
REFERENCES [dbo].[contract_signature] ([id])
GO
ALTER TABLE [dbo].[tce] CHECK CONSTRAINT [FK_tce_signature_id]
GO
ALTER TABLE [dbo].[tce]  WITH CHECK ADD  CONSTRAINT [FK_tce_student_id] FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([id])
GO
ALTER TABLE [dbo].[tce] CHECK CONSTRAINT [FK_tce_student_id]
GO
ALTER TABLE [dbo].[tce]  WITH CHECK ADD  CONSTRAINT [FK_tce_template_id] FOREIGN KEY([template_id])
REFERENCES [dbo].[contract_templates] ([id])
GO
ALTER TABLE [dbo].[tce] CHECK CONSTRAINT [FK_tce_template_id]
GO
ALTER TABLE [dbo].[tce]  WITH CHECK ADD  CONSTRAINT [FK_tce_vacancy_id] FOREIGN KEY([vacancy_id])
REFERENCES [dbo].[vacancies] ([id])
GO
ALTER TABLE [dbo].[tce] CHECK CONSTRAINT [FK_tce_vacancy_id]
GO
ALTER TABLE [dbo].[tce_additive_rescission]  WITH CHECK ADD  CONSTRAINT [FK_53dc1aca6ec8f68c22a0b955d06] FOREIGN KEY([signature_id])
REFERENCES [dbo].[contract_signature] ([id])
GO
ALTER TABLE [dbo].[tce_additive_rescission] CHECK CONSTRAINT [FK_53dc1aca6ec8f68c22a0b955d06]
GO
ALTER TABLE [dbo].[tce_additive_rescission]  WITH CHECK ADD  CONSTRAINT [FK_60984ca300573a6dfaed960f24c] FOREIGN KEY([tce_id])
REFERENCES [dbo].[tce] ([id])
GO
ALTER TABLE [dbo].[tce_additive_rescission] CHECK CONSTRAINT [FK_60984ca300573a6dfaed960f24c]
GO
ALTER TABLE [dbo].[tce_additive_rescission]  WITH CHECK ADD  CONSTRAINT [FK_7a4a1c10eb003e8022055e8575c] FOREIGN KEY([template_id])
REFERENCES [dbo].[contract_templates] ([id])
GO
ALTER TABLE [dbo].[tce_additive_rescission] CHECK CONSTRAINT [FK_7a4a1c10eb003e8022055e8575c]
GO
ALTER TABLE [dbo].[tce_additive_rescission]  WITH CHECK ADD  CONSTRAINT [FK_87ad2808df2e9a2cb9fb2681527] FOREIGN KEY([vacancy_id])
REFERENCES [dbo].[vacancies] ([id])
GO
ALTER TABLE [dbo].[tce_additive_rescission] CHECK CONSTRAINT [FK_87ad2808df2e9a2cb9fb2681527]
GO
ALTER TABLE [dbo].[tce_batch_import]  WITH CHECK ADD  CONSTRAINT [FK_0fc3e6c8ca89bb8841a2df6203a] FOREIGN KEY([company_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[tce_batch_import] CHECK CONSTRAINT [FK_0fc3e6c8ca89bb8841a2df6203a]
GO
ALTER TABLE [dbo].[tce_batch_import]  WITH CHECK ADD  CONSTRAINT [FK_77a4e8206ee8d3e6b82ad81bcf6] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[tce_batch_import] CHECK CONSTRAINT [FK_77a4e8206ee8d3e6b82ad81bcf6]
GO
ALTER TABLE [dbo].[tce_batch_import]  WITH CHECK ADD  CONSTRAINT [FK_b3afd0a5ab717d8a4725bb58293] FOREIGN KEY([iel_unity_id])
REFERENCES [dbo].[iel_units] ([id])
GO
ALTER TABLE [dbo].[tce_batch_import] CHECK CONSTRAINT [FK_b3afd0a5ab717d8a4725bb58293]
GO
ALTER TABLE [dbo].[tce_batch_import]  WITH CHECK ADD  CONSTRAINT [FK_tce_batch_import_templates_id] FOREIGN KEY([templates_id])
REFERENCES [dbo].[contract_templates] ([id])
GO
ALTER TABLE [dbo].[tce_batch_import] CHECK CONSTRAINT [FK_tce_batch_import_templates_id]
GO
ALTER TABLE [dbo].[tce_batch_import_item]  WITH CHECK ADD  CONSTRAINT [FK_1acddffd0eaf4d2abe7cc6d614b] FOREIGN KEY([vacancy_id])
REFERENCES [dbo].[vacancies] ([id])
GO
ALTER TABLE [dbo].[tce_batch_import_item] CHECK CONSTRAINT [FK_1acddffd0eaf4d2abe7cc6d614b]
GO
ALTER TABLE [dbo].[tce_batch_import_item]  WITH CHECK ADD  CONSTRAINT [FK_9f3422dd7f47cbe3114a80d23cf] FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([id])
GO
ALTER TABLE [dbo].[tce_batch_import_item] CHECK CONSTRAINT [FK_9f3422dd7f47cbe3114a80d23cf]
GO
ALTER TABLE [dbo].[tce_batch_import_item]  WITH CHECK ADD  CONSTRAINT [FK_a5d7bc1ab6e84f0b8361a242f79] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[tce_batch_import_item] CHECK CONSTRAINT [FK_a5d7bc1ab6e84f0b8361a242f79]
GO
ALTER TABLE [dbo].[tce_batch_import_item]  WITH CHECK ADD  CONSTRAINT [FK_tce_batch_import_item_import_id] FOREIGN KEY([tce_batch_import_id])
REFERENCES [dbo].[tce_batch_import] ([id])
GO
ALTER TABLE [dbo].[tce_batch_import_item] CHECK CONSTRAINT [FK_tce_batch_import_item_import_id]
GO
ALTER TABLE [dbo].[tce_batch_import_step]  WITH CHECK ADD  CONSTRAINT [FK_89e2226f5df31ccd57b5f987fca] FOREIGN KEY([tce_batch_import_id])
REFERENCES [dbo].[tce_batch_import] ([id])
GO
ALTER TABLE [dbo].[tce_batch_import_step] CHECK CONSTRAINT [FK_89e2226f5df31ccd57b5f987fca]
GO
ALTER TABLE [dbo].[users]  WITH NOCHECK ADD  CONSTRAINT [FK_0ef8e6d060d0edb011968c20556] FOREIGN KEY([iel_unit_id])
REFERENCES [dbo].[iel_units] ([id])
GO
ALTER TABLE [dbo].[users] NOCHECK CONSTRAINT [FK_0ef8e6d060d0edb011968c20556]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_7ae6334059289559722437bcc1c] FOREIGN KEY([company_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_7ae6334059289559722437bcc1c]
GO
ALTER TABLE [dbo].[users_has_profiles]  WITH CHECK ADD  CONSTRAINT [FK_9040a230c5a13359523923b3fd2] FOREIGN KEY([profilesId])
REFERENCES [dbo].[profiles] ([id])
GO
ALTER TABLE [dbo].[users_has_profiles] CHECK CONSTRAINT [FK_9040a230c5a13359523923b3fd2]
GO
ALTER TABLE [dbo].[users_has_profiles]  WITH CHECK ADD  CONSTRAINT [FK_e09efff06ad44f0852f3b59d48a] FOREIGN KEY([usersId])
REFERENCES [dbo].[users] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[users_has_profiles] CHECK CONSTRAINT [FK_e09efff06ad44f0852f3b59d48a]
GO
ALTER TABLE [dbo].[vacancies]  WITH CHECK ADD  CONSTRAINT [FK_053198d00d977357314f47d1cf2] FOREIGN KEY([company_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[vacancies] CHECK CONSTRAINT [FK_053198d00d977357314f47d1cf2]
GO
ALTER TABLE [dbo].[vacancies]  WITH CHECK ADD  CONSTRAINT [FK_67512205f48a396cbc5f3ee6ee9] FOREIGN KEY([vacancy_time_id])
REFERENCES [dbo].[vacancy_times] ([id])
GO
ALTER TABLE [dbo].[vacancies] CHECK CONSTRAINT [FK_67512205f48a396cbc5f3ee6ee9]
GO
ALTER TABLE [dbo].[vacancies]  WITH CHECK ADD  CONSTRAINT [FK_679af4b736e0f9e61a3715ed30c] FOREIGN KEY([address_id])
REFERENCES [dbo].[addresses] ([id])
GO
ALTER TABLE [dbo].[vacancies] CHECK CONSTRAINT [FK_679af4b736e0f9e61a3715ed30c]
GO
ALTER TABLE [dbo].[vacancies]  WITH CHECK ADD  CONSTRAINT [FK_a67c56bc5609243a4008669c21f] FOREIGN KEY([supervisor_id])
REFERENCES [dbo].[vacancy_supervisor] ([id])
GO
ALTER TABLE [dbo].[vacancies] CHECK CONSTRAINT [FK_a67c56bc5609243a4008669c21f]
GO
ALTER TABLE [dbo].[vacancies]  WITH CHECK ADD  CONSTRAINT [FK_cfbd1068bd19d86bab7557d6461] FOREIGN KEY([responsible_id])
REFERENCES [dbo].[vacancy_responsible] ([id])
GO
ALTER TABLE [dbo].[vacancies] CHECK CONSTRAINT [FK_cfbd1068bd19d86bab7557d6461]
GO
ALTER TABLE [dbo].[vacancies]  WITH CHECK ADD  CONSTRAINT [FK_f1586cc16d52199f493879cd430] FOREIGN KEY([iel_unity_id])
REFERENCES [dbo].[iel_units] ([id])
GO
ALTER TABLE [dbo].[vacancies] CHECK CONSTRAINT [FK_f1586cc16d52199f493879cd430]
GO
ALTER TABLE [dbo].[vacancy_benefits]  WITH CHECK ADD  CONSTRAINT [FK_1f9434011b4e8afbaf0e8e8a86a] FOREIGN KEY([vacancy_id])
REFERENCES [dbo].[vacancies] ([id])
GO
ALTER TABLE [dbo].[vacancy_benefits] CHECK CONSTRAINT [FK_1f9434011b4e8afbaf0e8e8a86a]
GO
ALTER TABLE [dbo].[vacancy_courses]  WITH CHECK ADD  CONSTRAINT [FK_a2628c991cbc2c396af89a5fe44] FOREIGN KEY([vacancy_id])
REFERENCES [dbo].[vacancies] ([id])
GO
ALTER TABLE [dbo].[vacancy_courses] CHECK CONSTRAINT [FK_a2628c991cbc2c396af89a5fe44]
GO
ALTER TABLE [dbo].[vacancy_courses]  WITH CHECK ADD  CONSTRAINT [FK_vacancy_courses_general_courses_id] FOREIGN KEY([general_courses_id])
REFERENCES [dbo].[general_courses] ([id])
GO
ALTER TABLE [dbo].[vacancy_courses] CHECK CONSTRAINT [FK_vacancy_courses_general_courses_id]
GO
ALTER TABLE [dbo].[vacancy_process]  WITH CHECK ADD  CONSTRAINT [FK_2ac856edddac1e2c45cc013a53a] FOREIGN KEY([vacancy_id])
REFERENCES [dbo].[vacancies] ([id])
GO
ALTER TABLE [dbo].[vacancy_process] CHECK CONSTRAINT [FK_2ac856edddac1e2c45cc013a53a]
GO
ALTER TABLE [dbo].[vacancy_responsible]  WITH CHECK ADD  CONSTRAINT [FK_255c724b8c90b9ad9daa9dd14be] FOREIGN KEY([company_responsible_id])
REFERENCES [dbo].[company_responsible] ([id])
GO
ALTER TABLE [dbo].[vacancy_responsible] CHECK CONSTRAINT [FK_255c724b8c90b9ad9daa9dd14be]
GO
ALTER TABLE [dbo].[vacancy_responsible]  WITH CHECK ADD  CONSTRAINT [FK_ecfaecd1d798b9ee67be3232095] FOREIGN KEY([vacancy_id])
REFERENCES [dbo].[vacancies] ([id])
GO
ALTER TABLE [dbo].[vacancy_responsible] CHECK CONSTRAINT [FK_ecfaecd1d798b9ee67be3232095]
GO
ALTER TABLE [dbo].[vacancy_supervisor]  WITH CHECK ADD  CONSTRAINT [FK_29549bb50109d8d620429283557] FOREIGN KEY([vacancy_id])
REFERENCES [dbo].[vacancies] ([id])
GO
ALTER TABLE [dbo].[vacancy_supervisor] CHECK CONSTRAINT [FK_29549bb50109d8d620429283557]
GO
ALTER TABLE [dbo].[vacancy_supervisor]  WITH CHECK ADD  CONSTRAINT [FK_485442381d96b480675489d8014] FOREIGN KEY([company_responsible_id])
REFERENCES [dbo].[company_responsible] ([id])
GO
ALTER TABLE [dbo].[vacancy_supervisor] CHECK CONSTRAINT [FK_485442381d96b480675489d8014]
GO
ALTER TABLE [dbo].[vacancy_time_day_scale]  WITH CHECK ADD  CONSTRAINT [FK_6d9303136c2c4247a58e30384a1] FOREIGN KEY([vacancy_scale_time_day_scale_id])
REFERENCES [dbo].[vacancy_time_days] ([id])
GO
ALTER TABLE [dbo].[vacancy_time_day_scale] CHECK CONSTRAINT [FK_6d9303136c2c4247a58e30384a1]
GO
ALTER TABLE [dbo].[vacancy_time_days]  WITH CHECK ADD  CONSTRAINT [FK_3b47eeb219078c30359360448d9] FOREIGN KEY([vacancy_time_day_id])
REFERENCES [dbo].[vacancy_times] ([id])
GO
ALTER TABLE [dbo].[vacancy_time_days] CHECK CONSTRAINT [FK_3b47eeb219078c30359360448d9]
GO
ALTER TABLE [dbo].[vacancy_time_days]  WITH CHECK ADD  CONSTRAINT [FK_774f5af17808513982f963263ac] FOREIGN KEY([vacancy_time_day_scale_id])
REFERENCES [dbo].[vacancy_time_day_scale] ([id])
GO
ALTER TABLE [dbo].[vacancy_time_days] CHECK CONSTRAINT [FK_774f5af17808513982f963263ac]
GO
ALTER TABLE [dbo].[app_user_token]  WITH CHECK ADD  CONSTRAINT [CHK_c612eb69062bebdfa133a2a163_ENUM] CHECK  (([type]='VERIFY_ACCOUNT' OR [type]='RECOVER_PASSWORD'))
GO
ALTER TABLE [dbo].[app_user_token] CHECK CONSTRAINT [CHK_c612eb69062bebdfa133a2a163_ENUM]
GO
ALTER TABLE [dbo].[companies]  WITH CHECK ADD  CONSTRAINT [CHK_8dd85903662a793359af2d8a8e_ENUM] CHECK  (([company_status]='WAITING_INFORMATION' OR [company_status]='WAITING_CONTRACT' OR [company_status]='WAITING_SIGNATURE' OR [company_status]='WAITING_CONCLUSION' OR [company_status]='DRAFT' OR [company_status]='INACTIVE' OR [company_status]='ACTIVE'))
GO
ALTER TABLE [dbo].[companies] CHECK CONSTRAINT [CHK_8dd85903662a793359af2d8a8e_ENUM]
GO
ALTER TABLE [dbo].[companies]  WITH CHECK ADD  CONSTRAINT [CHK_d7bd3190beb4be67da51776d34_ENUM] CHECK  (([company_type]='FILIAL' OR [company_type]='MATRIZ'))
GO
ALTER TABLE [dbo].[companies] CHECK CONSTRAINT [CHK_d7bd3190beb4be67da51776d34_ENUM]
GO
USE [master]
GO
ALTER DATABASE [ielDBDev] SET  READ_WRITE 
GO
