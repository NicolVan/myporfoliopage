/****** Object:  Database [NVanDB]    Script Date: 21. 12. 2024 15:25:26 ******/

/****** Object:  Table [dbo].[cmsContentNu]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[cmsContentNu](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[data] [ntext] NOT NULL,
	[rv] [bigint] NOT NULL,
 CONSTRAINT [PK_cmsContentNu] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[published] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
 
/****** Object:  Table [dbo].[cmsContentType]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[cmsContentType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](255) NULL,
	[icon] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NOT NULL,
	[description] [nvarchar](1500) NULL,
	[isContainer] [bit] NOT NULL,
	[isElement] [bit] NOT NULL,
	[allowAtRoot] [bit] NOT NULL,
	[variations] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[cmsContentType2ContentType]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[cmsContentType2ContentType](
	[parentContentTypeId] [int] NOT NULL,
	[childContentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY CLUSTERED 
(
	[parentContentTypeId] ASC,
	[childContentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[cmsContentTypeAllowedContentType]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[cmsContentTypeAllowedContentType](
	[Id] [int] NOT NULL,
	[AllowedId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[AllowedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[cmsDictionary]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[cmsDictionary](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[parent] [uniqueidentifier] NULL,
	[key] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_cmsDictionary] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[cmsDocumentType]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[cmsDocumentType](
	[contentTypeNodeId] [int] NOT NULL,
	[templateNodeId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY CLUSTERED 
(
	[contentTypeNodeId] ASC,
	[templateNodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[cmsLanguageText]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[cmsLanguageText](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[languageId] [int] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[cmsMacro]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[cmsMacro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniqueId] [uniqueidentifier] NOT NULL,
	[macroUseInEditor] [bit] NOT NULL,
	[macroRefreshRate] [int] NOT NULL,
	[macroAlias] [nvarchar](255) NOT NULL,
	[macroName] [nvarchar](255) NULL,
	[macroCacheByPage] [bit] NOT NULL,
	[macroCachePersonalized] [bit] NOT NULL,
	[macroDontRender] [bit] NOT NULL,
	[macroSource] [nvarchar](255) NOT NULL,
	[macroType] [int] NOT NULL,
 CONSTRAINT [PK_cmsMacro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[cmsMacroProperty]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[cmsMacroProperty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniquePropertyId] [uniqueidentifier] NOT NULL,
	[editorAlias] [nvarchar](255) NOT NULL,
	[macro] [int] NOT NULL,
	[macroPropertySortOrder] [int] NOT NULL,
	[macroPropertyAlias] [nvarchar](50) NOT NULL,
	[macroPropertyName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[cmsMember]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[cmsMember](
	[nodeId] [int] NOT NULL,
	[Email] [nvarchar](1000) NOT NULL,
	[LoginName] [nvarchar](1000) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsMember] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[cmsMember2MemberGroup]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[cmsMember2MemberGroup](
	[Member] [int] NOT NULL,
	[MemberGroup] [int] NOT NULL,
 CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY CLUSTERED 
(
	[Member] ASC,
	[MemberGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[cmsMemberType]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[cmsMemberType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[NodeId] [int] NOT NULL,
	[propertytypeId] [int] NOT NULL,
	[memberCanEdit] [bit] NOT NULL,
	[viewOnProfile] [bit] NOT NULL,
	[isSensitive] [bit] NOT NULL,
 CONSTRAINT [PK_cmsMemberType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[cmsPropertyType]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[cmsPropertyType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dataTypeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
	[propertyTypeGroupId] [int] NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[sortOrder] [int] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[mandatoryMessage] [nvarchar](500) NULL,
	[validationRegExp] [nvarchar](255) NULL,
	[validationRegExpMessage] [nvarchar](500) NULL,
	[Description] [nvarchar](2000) NULL,
	[variations] [int] NOT NULL,
	[UniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[cmsPropertyTypeGroup]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[cmsPropertyTypeGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contenttypeNodeId] [int] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[sortorder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[cmsTagRelationship]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[cmsTagRelationship](
	[nodeId] [int] NOT NULL,
	[tagId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[propertyTypeId] ASC,
	[tagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[cmsTags]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[cmsTags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group] [nvarchar](100) NOT NULL,
	[languageId] [int] NULL,
	[tag] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_cmsTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[cmsTemplate]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[cmsTemplate](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](100) NULL,
 CONSTRAINT [PK_cmsTemplate] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoAccess]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoAccess](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[loginNodeId] [int] NOT NULL,
	[noAccessNodeId] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccess] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoAccessRule]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoAccessRule](
	[id] [uniqueidentifier] NOT NULL,
	[accessId] [uniqueidentifier] NOT NULL,
	[ruleValue] [nvarchar](255) NOT NULL,
	[ruleType] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoAudit]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoAudit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[performingUserId] [int] NOT NULL,
	[performingDetails] [nvarchar](1024) NULL,
	[performingIp] [nvarchar](64) NULL,
	[eventDateUtc] [datetime] NOT NULL,
	[affectedUserId] [int] NOT NULL,
	[affectedDetails] [nvarchar](1024) NULL,
	[eventType] [nvarchar](256) NOT NULL,
	[eventDetails] [nvarchar](1024) NULL,
 CONSTRAINT [PK_umbracoAudit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoCacheInstruction]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoCacheInstruction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[utcStamp] [datetime] NOT NULL,
	[jsonInstruction] [ntext] NOT NULL,
	[originated] [nvarchar](500) NOT NULL,
	[instructionCount] [int] NOT NULL,
 CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoConsent]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoConsent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[current] [bit] NOT NULL,
	[source] [nvarchar](512) NOT NULL,
	[context] [nvarchar](128) NOT NULL,
	[action] [nvarchar](512) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[state] [int] NOT NULL,
	[comment] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoConsent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoContent]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoContent](
	[nodeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_umbracoContent] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoContentSchedule]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoContentSchedule](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[languageId] [int] NULL,
	[date] [datetime] NOT NULL,
	[action] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoContentSchedule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoContentVersion]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoContentVersion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[versionDate] [datetime] NOT NULL,
	[userId] [int] NULL,
	[current] [bit] NOT NULL,
	[text] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoContentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoContentVersionCultureVariation]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoContentVersionCultureVariation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[versionId] [int] NOT NULL,
	[languageId] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[date] [datetime] NOT NULL,
	[availableUserId] [int] NULL,
 CONSTRAINT [PK_umbracoContentVersionCultureVariation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoDataType]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoDataType](
	[nodeId] [int] NOT NULL,
	[propertyEditorAlias] [nvarchar](255) NOT NULL,
	[dbType] [nvarchar](50) NOT NULL,
	[config] [ntext] NULL,
 CONSTRAINT [PK_umbracoDataType] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoDocument]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoDocument](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[edited] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoDocument] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoDocumentCultureVariation]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoDocumentCultureVariation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[languageId] [int] NOT NULL,
	[edited] [bit] NOT NULL,
	[available] [bit] NOT NULL,
	[published] [bit] NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoDocumentCultureVariation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoDocumentVersion]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoDocumentVersion](
	[id] [int] NOT NULL,
	[templateId] [int] NULL,
	[published] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoDocumentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoDomain]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoDomain](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[domainDefaultLanguage] [int] NULL,
	[domainRootStructureID] [int] NULL,
	[domainName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoDomain] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoExternalLogin]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoExternalLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[loginProvider] [nvarchar](4000) NOT NULL,
	[providerKey] [nvarchar](4000) NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoKeyValue]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoKeyValue](
	[key] [nvarchar](256) NOT NULL,
	[value] [nvarchar](255) NULL,
	[updated] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoKeyValue] PRIMARY KEY CLUSTERED 
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoLanguage]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoLanguage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[languageISOCode] [nvarchar](14) NULL,
	[languageCultureName] [nvarchar](100) NULL,
	[isDefaultVariantLang] [bit] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[fallbackLanguageId] [int] NULL,
 CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoLock]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoLock](
	[id] [int] NOT NULL,
	[value] [int] NOT NULL,
	[name] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_umbracoLock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoLog]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[NodeId] [int] NOT NULL,
	[entityType] [nvarchar](50) NULL,
	[Datestamp] [datetime] NOT NULL,
	[logHeader] [nvarchar](50) NOT NULL,
	[logComment] [nvarchar](4000) NULL,
	[parameters] [nvarchar](500) NULL,
 CONSTRAINT [PK_umbracoLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoMediaVersion]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoMediaVersion](
	[id] [int] NOT NULL,
	[path] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoMediaVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoNode]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniqueId] [uniqueidentifier] NOT NULL,
	[parentId] [int] NOT NULL,
	[level] [int] NOT NULL,
	[path] [nvarchar](150) NOT NULL,
	[sortOrder] [int] NOT NULL,
	[trashed] [bit] NOT NULL,
	[nodeUser] [int] NULL,
	[text] [nvarchar](255) NULL,
	[nodeObjectType] [uniqueidentifier] NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoNode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoPropertyData]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoPropertyData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[versionId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
	[languageId] [int] NULL,
	[segment] [nvarchar](256) NULL,
	[intValue] [int] NULL,
	[decimalValue] [decimal](38, 6) NULL,
	[dateValue] [datetime] NULL,
	[varcharValue] [nvarchar](512) NULL,
	[textValue] [ntext] NULL,
 CONSTRAINT [PK_umbracoPropertyData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoRedirectUrl]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoRedirectUrl](
	[id] [uniqueidentifier] NOT NULL,
	[contentKey] [uniqueidentifier] NOT NULL,
	[createDateUtc] [datetime] NOT NULL,
	[url] [nvarchar](255) NOT NULL,
	[culture] [nvarchar](255) NULL,
	[urlHash] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_umbracoRedirectUrl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoRelation]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoRelation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NOT NULL,
	[childId] [int] NOT NULL,
	[relType] [int] NOT NULL,
	[datetime] [datetime] NOT NULL,
	[comment] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_umbracoRelation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoRelationType]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoRelationType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeUniqueId] [uniqueidentifier] NOT NULL,
	[dual] [bit] NOT NULL,
	[parentObjectType] [uniqueidentifier] NULL,
	[childObjectType] [uniqueidentifier] NULL,
	[name] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoServer]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoServer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[computerName] [nvarchar](255) NOT NULL,
	[registeredDate] [datetime] NOT NULL,
	[lastNotifiedDate] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
	[isMaster] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoServer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoUser]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userDisabled] [bit] NOT NULL,
	[userNoConsole] [bit] NOT NULL,
	[userName] [nvarchar](255) NOT NULL,
	[userLogin] [nvarchar](125) NOT NULL,
	[userPassword] [nvarchar](500) NOT NULL,
	[passwordConfig] [nvarchar](500) NULL,
	[userEmail] [nvarchar](255) NOT NULL,
	[userLanguage] [nvarchar](10) NULL,
	[securityStampToken] [nvarchar](255) NULL,
	[failedLoginAttempts] [int] NULL,
	[lastLockoutDate] [datetime] NULL,
	[lastPasswordChangeDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
	[emailConfirmedDate] [datetime] NULL,
	[invitedDate] [datetime] NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[avatar] [nvarchar](500) NULL,
	[tourData] [ntext] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoUser2NodeNotify]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoUser2NodeNotify](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[action] [nchar](1) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[action] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoUser2UserGroup]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoUser2UserGroup](
	[userId] [int] NOT NULL,
	[userGroupId] [int] NOT NULL,
 CONSTRAINT [PK_user2userGroup] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[userGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoUserGroup]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoUserGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userGroupAlias] [nvarchar](200) NOT NULL,
	[userGroupName] [nvarchar](200) NOT NULL,
	[userGroupDefaultPermissions] [nvarchar](50) NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[icon] [nvarchar](255) NULL,
	[startContentId] [int] NULL,
	[startMediaId] [int] NULL,
 CONSTRAINT [PK_umbracoUserGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoUserGroup2App]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoUserGroup2App](
	[userGroupId] [int] NOT NULL,
	[app] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_userGroup2App] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[app] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoUserGroup2NodePermission]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoUserGroup2NodePermission](
	[userGroupId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[permission] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoUserGroup2NodePermission] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[nodeId] ASC,
	[permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoUserLogin]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoUserLogin](
	[sessionId] [uniqueidentifier] NOT NULL,
	[userId] [int] NOT NULL,
	[loggedInUtc] [datetime] NOT NULL,
	[lastValidatedUtc] [datetime] NOT NULL,
	[loggedOutUtc] [datetime] NULL,
	[ipAddress] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoUserLogin] PRIMARY KEY CLUSTERED 
(
	[sessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
/****** Object:  Table [dbo].[umbracoUserStartNode]    Script Date: 21. 12. 2024 15:25:26 ******/
SET ANSI_NULLS ON
 
SET QUOTED_IDENTIFIER ON
 
CREATE TABLE [dbo].[umbracoUserStartNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[startNode] [int] NOT NULL,
	[startNodeType] [int] NOT NULL,
 CONSTRAINT [PK_userStartNode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1057, 0, N'{"properties":{"gridContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Headline\",\"id\":\"01b70116-2a9c-cb95-92b9-058870313a5c\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":{\"macroAlias\":\"vlny\",\"macroParamsDictionary\":{}},\"editor\":{\"alias\":\"macro\",\"view\":null},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"pageTitle":[{"culture":"","seg":"","val":"Domov"}],"metaDescription":[{"culture":"","seg":"","val":"Domov"}],"menuTitle":[{"culture":"","seg":"","val":"Domov"}],"umbracoNaviHide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"domov"}', 11)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (1057, 1, N'{"properties":{"gridContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Headline\",\"id\":\"01b70116-2a9c-cb95-92b9-058870313a5c\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":{\"macroAlias\":\"vlny\",\"macroParamsDictionary\":{}},\"editor\":{\"alias\":\"macro\",\"view\":\"macro\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"pageTitle":[{"culture":"","seg":"","val":"Domov"}],"metaDescription":[{"culture":"","seg":"","val":"Domov"}],"menuTitle":[{"culture":"","seg":"","val":"Domov"}],"umbracoNaviHide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"domov"}', 6)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2052, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/prchu35a/img_20240902_115022.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":3456}],"umbracoHeight":[{"culture":"","seg":"","val":4608}],"umbracoBytes":[{"culture":"","seg":"","val":"4286030"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-20240902-115022"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2053, 0, N'{"properties":{"gridContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Article\",\"id\":\"996afdda-e6e0-a577-006a-56ce66508a38\",\"areas\":[{\"grid\":\"4\",\"controls\":[{\"value\":\"<div id=\\\"vzdelanie-section\\\">\\n<div id=\\\"vzdelanie-content\\\">\\n<div class=\\\"image-wrapper\\\">\\n<div class=\\\"image-background\\\"></div>\\n<div class=\\\"image\\\"><img src=\\\"?width=374.99999999999994&amp;height=500\\\" alt=\\\"fotka\\\" width=\\\"374.99999999999994\\\" height=\\\"500\\\" data-udi=\\\"umb://media/776a457a2ce04512bd6c8150cb986db7\\\" /></div>\\n</div>\\n</div>\\n</div>\",\"editor\":{\"alias\":\"rte\",\"view\":\"rte\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null},{\"grid\":\"8\",\"controls\":[{\"value\":{\"macroAlias\":\"education\",\"macroParamsDictionary\":{}},\"editor\":{\"alias\":\"macro\",\"view\":\"macro\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"pageTitle":[{"culture":"","seg":"","val":"Vzdelanie"}],"metaDescription":[{"culture":"","seg":"","val":"Vzdelanie"}],"menuTitle":[{"culture":"","seg":"","val":"Vzdelanie"}],"umbracoNaviHide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"vzdelanie"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2053, 1, N'{"properties":{"gridContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Article\",\"id\":\"996afdda-e6e0-a577-006a-56ce66508a38\",\"areas\":[{\"grid\":\"4\",\"controls\":[{\"value\":\"<div id=\\\"vzdelanie-section\\\">\\n<div id=\\\"vzdelanie-content\\\">\\n<div class=\\\"image-wrapper\\\">\\n<div class=\\\"image-background\\\"></div>\\n<div class=\\\"image\\\"><img src=\\\"?width=374.99999999999994&amp;height=500\\\" alt=\\\"fotka\\\" width=\\\"374.99999999999994\\\" height=\\\"500\\\" data-udi=\\\"umb://media/776a457a2ce04512bd6c8150cb986db7\\\" /></div>\\n</div>\\n</div>\\n</div>\",\"editor\":{\"alias\":\"rte\",\"view\":\"rte\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null},{\"grid\":\"8\",\"controls\":[{\"value\":{\"macroAlias\":\"education\",\"macroParamsDictionary\":{}},\"editor\":{\"alias\":\"macro\",\"view\":\"macro\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"pageTitle":[{"culture":"","seg":"","val":"Vzdelanie"}],"metaDescription":[{"culture":"","seg":"","val":"Vzdelanie"}],"menuTitle":[{"culture":"","seg":"","val":"Vzdelanie"}],"umbracoNaviHide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"vzdelanie"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2054, 0, N'{"properties":{"gridContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"4/8\",\"id\":\"2ec1639d-2f69-5acf-6009-d1b63730c1e8\",\"areas\":[{\"grid\":\"4\",\"controls\":[{\"value\":\"<div id=\\\"vzdelanie-section\\\">\\n<div id=\\\"vzdelanie-content\\\">\\n<div class=\\\"image-wrapper\\\">\\n<div class=\\\"image-background\\\"></div>\\n<div class=\\\"image\\\"><img src=\\\"?width=374.99999999999994&amp;height=500\\\" alt=\\\"fotka\\\" width=\\\"374.99999999999994\\\" height=\\\"500\\\" data-udi=\\\"umb://media/776a457a2ce04512bd6c8150cb986db7\\\" /></div>\\n</div>\\n</div>\\n</div>\",\"editor\":{\"alias\":\"rte\",\"view\":null},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null},{\"grid\":\"8\",\"controls\":[{\"value\":{\"macroAlias\":\"contactForm\",\"macroParamsDictionary\":{}},\"editor\":{\"alias\":\"macro\",\"view\":null},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"pageTitle":[{"culture":"","seg":"","val":"Kontakt"}],"metaDescription":[{"culture":"","seg":"","val":" Kontakt"}],"menuTitle":[{"culture":"","seg":"","val":" Kontakt"}],"umbracoNaviHide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"kontakt"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2054, 1, N'{"properties":{"gridContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"4/8\",\"id\":\"2ec1639d-2f69-5acf-6009-d1b63730c1e8\",\"areas\":[{\"grid\":\"4\",\"controls\":[{\"value\":\"<div id=\\\"vzdelanie-section\\\">\\n<div id=\\\"vzdelanie-content\\\">\\n<div class=\\\"image-wrapper\\\">\\n<div class=\\\"image-background\\\"></div>\\n<div class=\\\"image\\\"><img src=\\\"?width=374.99999999999994&amp;height=500\\\" alt=\\\"fotka\\\" width=\\\"374.99999999999994\\\" height=\\\"500\\\" data-udi=\\\"umb://media/776a457a2ce04512bd6c8150cb986db7\\\" /></div>\\n</div>\\n</div>\\n</div>\",\"editor\":{\"alias\":\"rte\",\"view\":\"rte\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null},{\"grid\":\"8\",\"controls\":[{\"value\":{\"macroAlias\":\"contactForm\",\"macroParamsDictionary\":{}},\"editor\":{\"alias\":\"macro\",\"view\":\"macro\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"pageTitle":[{"culture":"","seg":"","val":"Kontakt"}],"metaDescription":[{"culture":"","seg":"","val":" Kontakt"}],"menuTitle":[{"culture":"","seg":"","val":" Kontakt"}],"umbracoNaviHide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"kontakt"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2055, 0, N'{"properties":{"gridContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Headline\",\"id\":\"ca79842f-d2dd-22b3-f934-b8294f68ade5\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":{\"macroAlias\":\"project\",\"macroParamsDictionary\":{}},\"editor\":{\"alias\":\"macro\",\"view\":\"macro\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"pageTitle":[{"culture":"","seg":"","val":"Projekty"}],"metaDescription":[{"culture":"","seg":"","val":"Projekty"}],"menuTitle":[{"culture":"","seg":"","val":"Projekty"}],"umbracoNaviHide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"projekty"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2055, 1, N'{"properties":{"gridContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Headline\",\"id\":\"ca79842f-d2dd-22b3-f934-b8294f68ade5\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":{\"macroAlias\":\"project\",\"macroParamsDictionary\":{}},\"editor\":{\"alias\":\"macro\",\"view\":\"macro\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"pageTitle":[{"culture":"","seg":"","val":"Projekty"}],"metaDescription":[{"culture":"","seg":"","val":"Projekty"}],"menuTitle":[{"culture":"","seg":"","val":"Projekty"}],"umbracoNaviHide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"projekty"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2056, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/340jbucn/screenshot-2024-12-06-115749.png\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":2539}],"umbracoHeight":[{"culture":"","seg":"","val":1186}],"umbracoBytes":[{"culture":"","seg":"","val":"1496658"}],"umbracoExtension":[{"culture":"","seg":"","val":"png"}]},"cultureData":{},"urlSegment":"screenshot-2024-12-06-115749"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2057, 0, N'{"properties":{"gridContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Headline\",\"id\":\"86613b3c-a6c3-5176-8270-4deca0bd45f6\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":{\"macroAlias\":\"plantoasis\",\"macroParamsDictionary\":{}},\"editor\":{\"alias\":\"macro\",\"view\":\"macro\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"pageTitle":[{"culture":"","seg":"","val":"PlantOasis"}],"metaDescription":[{"culture":"","seg":"","val":"PlantOasis"}],"menuTitle":[],"umbracoNaviHide":[{"culture":"","seg":"","val":1}]},"cultureData":{},"urlSegment":"plantoasis"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2057, 1, N'{"properties":{"gridContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Headline\",\"id\":\"86613b3c-a6c3-5176-8270-4deca0bd45f6\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":{\"macroAlias\":\"plantoasis\",\"macroParamsDictionary\":{}},\"editor\":{\"alias\":\"macro\",\"view\":\"macro\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"pageTitle":[{"culture":"","seg":"","val":"PlantOasis"}],"metaDescription":[{"culture":"","seg":"","val":"PlantOasis"}],"menuTitle":[],"umbracoNaviHide":[{"culture":"","seg":"","val":1}]},"cultureData":{},"urlSegment":"plantoasis"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2058, 0, N'{"properties":{"gridContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Headline\",\"id\":\"d80f9c7d-069f-2703-1919-52d5ccf76d8f\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":{\"macroAlias\":\"recipeapp\",\"macroParamsDictionary\":{}},\"editor\":{\"alias\":\"macro\",\"view\":\"macro\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"pageTitle":[{"culture":"","seg":"","val":"Recipe App"}],"metaDescription":[{"culture":"","seg":"","val":"Recipe App"}],"menuTitle":[],"umbracoNaviHide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"recipe-app"}', 2)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2058, 1, N'{"properties":{"gridContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Headline\",\"id\":\"d80f9c7d-069f-2703-1919-52d5ccf76d8f\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":{\"macroAlias\":\"recipeapp\",\"macroParamsDictionary\":{}},\"editor\":{\"alias\":\"macro\",\"view\":\"macro\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"pageTitle":[{"culture":"","seg":"","val":"Recipe App"}],"metaDescription":[{"culture":"","seg":"","val":"Recipe App"}],"menuTitle":[],"umbracoNaviHide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"recipe-app"}', 2)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2059, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/yjgno5w2/recipe-app.png\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1943}],"umbracoHeight":[{"culture":"","seg":"","val":1283}],"umbracoBytes":[{"culture":"","seg":"","val":"719513"}],"umbracoExtension":[{"culture":"","seg":"","val":"png"}]},"cultureData":{},"urlSegment":"recipe-app"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2067, 0, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"Moj osobny blog"}],"metaDescription":[{"culture":"","seg":"","val":"Moj osobny blog"}],"menuTitle":[{"culture":"","seg":"","val":"Blog"}],"umbracoNaviHide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"blog"}', 5)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2067, 1, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"Moj osobny blog"}],"metaDescription":[{"culture":"","seg":"","val":"Moj osobny blog"}],"menuTitle":[{"culture":"","seg":"","val":"Blog"}],"umbracoNaviHide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"blog"}', 3)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2076, 0, N'{"properties":{},"cultureData":{},"urlSegment":"autori"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2076, 1, N'{"properties":{},"cultureData":{},"urlSegment":"autori"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2077, 0, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"Nikola Vaniščáková"}],"metaDescription":[{"culture":"","seg":"","val":"Nikola Vaniščáková"}],"menuTitle":[],"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"authorImage":[{"culture":"","seg":"","val":"umb://media/776a457a2ce04512bd6c8150cb986db7"}],"authorDescription":[{"culture":"","seg":"","val":"<p>Som kreatívna duša s nadšením pre It svet a programovanie.</p>"}]},"cultureData":{},"urlSegment":"nikola"}', 2)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2077, 1, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"Nikola Vaniščáková"}],"metaDescription":[{"culture":"","seg":"","val":"Nikola Vaniščáková"}],"menuTitle":[],"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"authorImage":[{"culture":"","seg":"","val":"umb://media/776a457a2ce04512bd6c8150cb986db7"}],"authorDescription":[{"culture":"","seg":"","val":"<p>Som kreatívna duša s nadšením pre It svet a programovanie.</p>"}]},"cultureData":{},"urlSegment":"nikola"}', 2)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2078, 0, N'{"properties":{},"cultureData":{},"urlSegment":"kate rie"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2078, 1, N'{"properties":{},"cultureData":{},"urlSegment":"kate rie"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2079, 0, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"Začiatky programovania"}],"metaDescription":[{"culture":"","seg":"","val":"Začiatky programovania"}],"menuTitle":[{"culture":"","seg":"","val":"Začiatky programovania"}],"umbracoNaviHide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"zaciatky-programovania"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2079, 1, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"Začiatky programovania"}],"metaDescription":[{"culture":"","seg":"","val":"Začiatky programovania"}],"menuTitle":[{"culture":"","seg":"","val":"Začiatky programovania"}],"umbracoNaviHide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"zaciatky-programovania"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2080, 0, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"Cesta od prvého riadku kódu k nekonečným možnostiam"}],"metaDescription":[{"culture":"","seg":"","val":"Cesta od prvého riadku kódu k nekonečným možnostiam"}],"menuTitle":[{"culture":"","seg":"","val":"Cesta od prvého riadku kódu k nekonečným možnostiam"}],"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"articleAuthor":[{"culture":"","seg":"","val":"umb://document/2c9e5d33b73e42ef909434bbe347d42c"}],"articleContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Headline\",\"id\":\"d6fcfe5f-b4b1-9a04-65a7-9a0f1516a754\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":\"<p>Začiatky programovania sú ako prvé kroky dieťaťa – neisté, plné otázok, ale zároveň neuveriteľne vzrušujúce. Pamätám si svoj prvý riadok kódu – niečo jednoduché, ale zároveň to pre mňa znamenalo celý nový svet. Keď sa na obrazovke objavil prvý výsledok mojej práce, pocítila som nadšenie, aké som dovtedy nepoznala.</p>\\n<p>Programovanie ma naučilo mnoho vecí. Predovšetkým trpezlivosti. Kód sa nepíše sám a chyby nie sú nepriatelia, ale učitelia. Každý bug ma priviedol bližšie k riešeniu a každé riešenie ma naplnilo pocitom úspechu.</p>\\n<p>Tiež som pochopila, že programovanie nie je len o písaní kódu – je to o kreativite, riešení problémov a neustálom učení. Svet technológií sa mení neuveriteľnou rýchlosťou, a to, čo dnes považujeme za novinku, môže byť zajtra minulosťou. A práve to ma na tom fascinuje.</p>\\n<p>Začiatky nie sú nikdy ľahké, ale každý krok, každý projekt, každý riadok kódu je krokom vpred. Ak uvažujete nad tým, že by ste začali programovať, odkazujem vám toto: nikdy nie je neskoro začať. Svet technológií vás víta s otvorenou náručou.</p>\\n<p>Tento blog je pre mňa zároveň spôsob, ako zaznamenať svoju cestu. Verím, že raz sa na tieto riadky pozriem s úsmevom a spomienkou na to, kde to všetko začalo. A možno niekoho z vás inšpirujem, aby ste sa tiež pustili na túto fascinujúcu cestu.</p>\\n<p>Začnite jednoducho. Prvý riadok kódu. Prvá chybička. Prvá oprava. A potom... nekonečné možnosti.</p>\\n<p> </p>\",\"editor\":{\"alias\":\"rte\",\"view\":\"rte\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"articlePreviewText":[{"culture":"","seg":"","val":"Moje začiatky v programovaní ."}],"articlePreviewImage":[{"culture":"","seg":"","val":"umb://media/2d33e665f0bd47d5896851d7199d9e9a"}],"articleCate ries":[{"culture":"","seg":"","val":"umb://document/f1b8c0f9fb094153a0d43a4f260299a7"}]},"cultureData":{},"urlSegment":"cesta-od-prveho-riadku-kodu-k-nekonecnym-moznostiam"}', 7)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2080, 1, N'{"properties":{"pageTitle":[{"culture":"","seg":"","val":"Cesta od prvého riadku kódu k nekonečným možnostiam"}],"metaDescription":[{"culture":"","seg":"","val":"Cesta od prvého riadku kódu k nekonečným možnostiam"}],"menuTitle":[{"culture":"","seg":"","val":"Cesta od prvého riadku kódu k nekonečným možnostiam"}],"umbracoNaviHide":[{"culture":"","seg":"","val":0}],"articleAuthor":[{"culture":"","seg":"","val":"umb://document/2c9e5d33b73e42ef909434bbe347d42c"}],"articleContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Headline\",\"id\":\"d6fcfe5f-b4b1-9a04-65a7-9a0f1516a754\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":\"<p>Začiatky programovania sú ako prvé kroky dieťaťa – neisté, plné otázok, ale zároveň neuveriteľne vzrušujúce. Pamätám si svoj prvý riadok kódu – niečo jednoduché, ale zároveň to pre mňa znamenalo celý nový svet. Keď sa na obrazovke objavil prvý výsledok mojej práce, pocítila som nadšenie, aké som dovtedy nepoznala.</p>\\n<p>Programovanie ma naučilo mnoho vecí. Predovšetkým trpezlivosti. Kód sa nepíše sám a chyby nie sú nepriatelia, ale učitelia. Každý bug ma priviedol bližšie k riešeniu a každé riešenie ma naplnilo pocitom úspechu.</p>\\n<p>Tiež som pochopila, že programovanie nie je len o písaní kódu – je to o kreativite, riešení problémov a neustálom učení. Svet technológií sa mení neuveriteľnou rýchlosťou, a to, čo dnes považujeme za novinku, môže byť zajtra minulosťou. A práve to ma na tom fascinuje.</p>\\n<p>Začiatky nie sú nikdy ľahké, ale každý krok, každý projekt, každý riadok kódu je krokom vpred. Ak uvažujete nad tým, že by ste začali programovať, odkazujem vám toto: nikdy nie je neskoro začať. Svet technológií vás víta s otvorenou náručou.</p>\\n<p>Tento blog je pre mňa zároveň spôsob, ako zaznamenať svoju cestu. Verím, že raz sa na tieto riadky pozriem s úsmevom a spomienkou na to, kde to všetko začalo. A možno niekoho z vás inšpirujem, aby ste sa tiež pustili na túto fascinujúcu cestu.</p>\\n<p>Začnite jednoducho. Prvý riadok kódu. Prvá chybička. Prvá oprava. A potom... nekonečné možnosti.</p>\\n<p> </p>\",\"editor\":{\"alias\":\"rte\",\"view\":\"rte\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"articlePreviewText":[{"culture":"","seg":"","val":"Moje začiatky v programovaní ."}],"articlePreviewImage":[{"culture":"","seg":"","val":"umb://media/2d33e665f0bd47d5896851d7199d9e9a"}],"articleCate ries":[{"culture":"","seg":"","val":"umb://document/f1b8c0f9fb094153a0d43a4f260299a7"}]},"cultureData":{},"urlSegment":"cesta-od-prveho-riadku-kodu-k-nekonecnym-moznostiam"}', 5)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2081, 0, N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/mptdgln3/code.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1280}],"umbracoHeight":[{"culture":"","seg":"","val":848}],"umbracoBytes":[{"culture":"","seg":"","val":"138583"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"code"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2082, 0, N'{"properties":{"gridContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Headline\",\"id\":\"654fe847-a3d3-df37-d8fa-882dd7310ac3\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":{\"macroAlias\":\"todo\",\"macroParamsDictionary\":{}},\"editor\":{\"alias\":\"macro\",\"view\":\"macro\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"pageTitle":[{"culture":"","seg":"","val":"To do aplikacia"}],"metaDescription":[{"culture":"","seg":"","val":"To do aplikacia"}],"menuTitle":[],"umbracoNaviHide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"to-do"}', 3)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2082, 1, N'{"properties":{"gridContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Headline\",\"id\":\"654fe847-a3d3-df37-d8fa-882dd7310ac3\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":{\"macroAlias\":\"todo\",\"macroParamsDictionary\":{}},\"editor\":{\"alias\":\"macro\",\"view\":\"macro\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"pageTitle":[{"culture":"","seg":"","val":"To do aplikacia"}],"metaDescription":[{"culture":"","seg":"","val":"To do aplikacia"}],"menuTitle":[],"umbracoNaviHide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"to-do"}', 1)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2083, 0, N'{"properties":{"gridContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Headline\",\"id\":\"3dc143a3-c27f-9901-11a0-349e797f1141\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":\"<h1>Stránka neexistuje</h1>\\n<p>Ľutujeme, ale stránka, ktorú hľadáte, neexistuje.</p>\",\"editor\":{\"alias\":\"rte\",\"view\":\"rte\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"pageTitle":[{"culture":"","seg":"","val":"Stranka nenajdena"}],"metaDescription":[{"culture":"","seg":"","val":"Stranka nenajdena"}],"menuTitle":[],"umbracoNaviHide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"stranka-nanjdena"}', 0)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv]) VALUES (2083, 1, N'{"properties":{"gridContent":[{"culture":"","seg":"","val":"{\"name\":\"1 column layout\",\"sections\":[{\"grid\":\"12\",\"rows\":[{\"name\":\"Headline\",\"id\":\"3dc143a3-c27f-9901-11a0-349e797f1141\",\"areas\":[{\"grid\":\"12\",\"controls\":[{\"value\":\"<h1>Stránka neexistuje</h1>\\n<p>Ľutujeme, ale stránka, ktorú hľadáte, neexistuje.</p>\",\"editor\":{\"alias\":\"rte\",\"view\":\"rte\"},\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}],\"styles\":null,\"config\":null}]}]}"}],"pageTitle":[{"culture":"","seg":"","val":"Stranka nenajdena"}],"metaDescription":[{"culture":"","seg":"","val":"Stranka nenajdena"}],"menuTitle":[],"umbracoNaviHide":[{"culture":"","seg":"","val":0}]},"cultureData":{},"urlSegment":"stranka-nanjdena"}', 0)
 
SET IDENTITY_INSERT [dbo].[cmsContentType] ON 

INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (531, 1044, N'Member', N'icon-user', N'icon-user', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (532, 1031, N'Folder', N'icon-folder', N'icon-folder', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (533, 1032, N'Image', N'icon-picture', N'icon-picture', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (534, 1033, N'File', N'icon-document', N'icon-document', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (535, 1051, N'cmsContent', N'icon-document', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (536, 1052, N'sEO', N'icon-document', N'folder.png', N'Údaje SEO optimalizácie', 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (537, 1053, N'landingPage', N'icon-document', N'folder.png', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (1535, 2060, N'texty', N'icon-document', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (1536, 2063, N'blogPage', N'icon-document', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (1537, 2065, N'blogArticle', N'icon-document', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (1538, 2071, N'blogCate ry', N'icon-document', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (1539, 2072, N'blogCate ryList', N'icon-document', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (1540, 2074, N'blogAuthor', N'icon-document', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (1541, 2075, N'blogAuthorList', N'icon-document', N'folder.png', NULL, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[cmsContentType] OFF
 
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1051, 1053)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1052, 1053)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1052, 2063)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1052, 2065)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1052, 2071)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1052, 2074)
 
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1031, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1032, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1033, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1053, 1053, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1053, 2060, 1)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1053, 2063, 2)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (2063, 2065, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (2063, 2072, 1)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (2063, 2075, 2)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (2072, 2071, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (2075, 2074, 0)
 
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1053, 1056, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (2063, 2062, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (2065, 2064, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (2071, 2070, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (2074, 2073, 1)
 
SET IDENTITY_INSERT [dbo].[cmsMacro] ON 

INSERT [dbo].[cmsMacro] ([id], [uniqueId], [macroUseInEditor], [macroRefreshRate], [macroAlias], [macroName], [macroCacheByPage], [macroCachePersonalized], [macroDontRender], [macroSource], [macroType]) VALUES (1, N'12ce3e70-da12-4de4-bd5b-8b295224dc55', 1, 0, N'contactForm', N'contactForm', 0, 0, 1, N'~/Views/MacroPartials/contactForm.cshtml', 7)
INSERT [dbo].[cmsMacro] ([id], [uniqueId], [macroUseInEditor], [macroRefreshRate], [macroAlias], [macroName], [macroCacheByPage], [macroCachePersonalized], [macroDontRender], [macroSource], [macroType]) VALUES (2, N'7bf25bad-c9c9-4c5e-98e1-ac49a4cde548', 1, 0, N'education', N'education', 0, 0, 1, N'~/Views/MacroPartials/education.cshtml', 7)
INSERT [dbo].[cmsMacro] ([id], [uniqueId], [macroUseInEditor], [macroRefreshRate], [macroAlias], [macroName], [macroCacheByPage], [macroCachePersonalized], [macroDontRender], [macroSource], [macroType]) VALUES (3, N'387c81af-c32f-427e-8523-b819a9c78106', 1, 0, N'plantoasis', N'plantoasis', 0, 0, 1, N'~/Views/MacroPartials/plantoasis.cshtml', 7)
INSERT [dbo].[cmsMacro] ([id], [uniqueId], [macroUseInEditor], [macroRefreshRate], [macroAlias], [macroName], [macroCacheByPage], [macroCachePersonalized], [macroDontRender], [macroSource], [macroType]) VALUES (4, N'8e41e1c3-ffe3-40ce-b6f8-bd75f67b2fc9', 1, 0, N'project', N'project', 0, 0, 1, N'~/Views/MacroPartials/project.cshtml', 7)
INSERT [dbo].[cmsMacro] ([id], [uniqueId], [macroUseInEditor], [macroRefreshRate], [macroAlias], [macroName], [macroCacheByPage], [macroCachePersonalized], [macroDontRender], [macroSource], [macroType]) VALUES (5, N'9288e37e-33b2-4879-bd13-9b135e81315a', 1, 0, N'recipeapp', N'recipeapp', 0, 0, 1, N'~/Views/MacroPartials/recipeapp.cshtml', 7)
INSERT [dbo].[cmsMacro] ([id], [uniqueId], [macroUseInEditor], [macroRefreshRate], [macroAlias], [macroName], [macroCacheByPage], [macroCachePersonalized], [macroDontRender], [macroSource], [macroType]) VALUES (6, N'163faa7d-00df-4934-976f-5911d1c4f9a9', 1, 0, N'todo', N'todo', 0, 0, 1, N'~/Views/MacroPartials/todo.cshtml', 7)
INSERT [dbo].[cmsMacro] ([id], [uniqueId], [macroUseInEditor], [macroRefreshRate], [macroAlias], [macroName], [macroCacheByPage], [macroCachePersonalized], [macroDontRender], [macroSource], [macroType]) VALUES (7, N'c8b49377-0f9a-40d2-9cb6-072fc023dd26', 1, 0, N'vlny', N'vlny', 0, 0, 1, N'~/Views/MacroPartials/vlny.cshtml', 7)
SET IDENTITY_INSERT [dbo].[cmsMacro] OFF
 
SET IDENTITY_INSERT [dbo].[cmsPropertyType] ON 

INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (6, 1043, 1032, 3, N'umbracoFile', N'Upload image', 0, 1, NULL, NULL, NULL, NULL, 0, N'00000006-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (7, -91, 1032, 3, N'umbracoWidth', N'Width', 0, 0, NULL, NULL, NULL, N'in pixels', 0, N'00000007-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (8, -91, 1032, 3, N'umbracoHeight', N'Height', 0, 0, NULL, NULL, NULL, N'in pixels', 0, N'00000008-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (9, -93, 1032, 3, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, NULL, N'in bytes', 0, N'00000009-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (10, -92, 1032, 3, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, NULL, NULL, 0, N'0000000a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (24, -90, 1033, 4, N'umbracoFile', N'Upload file', 0, 1, NULL, NULL, NULL, NULL, 0, N'00000018-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (25, -92, 1033, 4, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, NULL, NULL, 0, N'00000019-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (26, -93, 1033, 4, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, NULL, N'in bytes', 0, N'0000001a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (28, -89, 1044, 11, N'umbracoMemberComments', N'Comments', 0, 0, NULL, NULL, NULL, NULL, 0, N'0000001c-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (29, -91, 1044, 11, N'umbracoMemberFailedPasswordAttempts', N'Failed Password Attempts', 1, 0, NULL, NULL, NULL, NULL, 0, N'0000001d-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (30, -49, 1044, 11, N'umbracoMemberApproved', N'Is Approved', 2, 0, NULL, NULL, NULL, NULL, 0, N'0000001e-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (31, -49, 1044, 11, N'umbracoMemberLockedOut', N'Is Locked Out', 3, 0, NULL, NULL, NULL, NULL, 0, N'0000001f-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (32, -94, 1044, 11, N'umbracoMemberLastLockoutDate', N'Last Lockout Date', 4, 0, NULL, NULL, NULL, NULL, 0, N'00000020-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (33, -94, 1044, 11, N'umbracoMemberLastLogin', N'Last Login Date', 5, 0, NULL, NULL, NULL, NULL, 0, N'00000021-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (34, -94, 1044, 11, N'umbracoMemberLastPasswordChangeDate', N'Last Password Change Date', 6, 0, NULL, NULL, NULL, NULL, 0, N'00000022-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (35, -94, 1044, 11, N'umbracoMemberPasswordRetrievalQuestion', N'Password Question', 7, 0, NULL, NULL, NULL, NULL, 0, N'00000023-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (36, -94, 1044, 11, N'umbracoMemberPasswordRetrievalAnswer', N'Password Answer', 8, 0, NULL, NULL, NULL, NULL, 0, N'00000024-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (37, 2051, 1051, 12, N'gridContent', N'GridContent', 0, 1, N'', NULL, N'', N'', 0, N'ed807ec0-64f4-49da-bdc9-92f4e035b9f2')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (38, -88, 1052, 13, N'pageTitle', N'Page Title', 0, 1, N'', NULL, N'', N'Názov stránky', 0, N'67765468-c253-4d47-bfd4-b16c4eaa89e3')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (39, -88, 1052, 13, N'metaDescription', N'Meta Description', 1, 1, N'', NULL, N'', N'Popis stránky', 0, N'5dd54209-cbf1-40d2-ab28-406f35e17017')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (40, -49, 1052, 13, N'umbracoNaviHide', N'UmbracoNaviHide', 3, 0, N'', NULL, N'', N'Ak je táto voľba zaškrtnutá, potom daná stránka nebude súčasťou menu', 0, N'46508e69-edb7-44a6-ad59-ae1048d79fdd')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (41, -88, 1052, 13, N'menuTitle', N'Menu Title', 2, 0, N'', NULL, N'', N'Názov stránky pre menu', 0, N'ceb6bb95-62b5-43f5-a3ad-532b2cc2400e')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (1037, -88, 2060, 1012, N'nikolaEmail', N'NikolaEmail', 0, 1, NULL, NULL, NULL, NULL, 0, N'9ea5e451-d680-4aa7-bad1-c773d1714759')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (1038, -88, 2060, 1012, N'nikolaTelefon', N'NikolaTelefon', 1, 1, NULL, NULL, NULL, NULL, 0, N'5f6172a8-f2d6-4cd3-9988-d428c976b5ea')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (1039, 2066, 2065, 1013, N'articleAuthor', N'ArticleAuthor', 0, 1, NULL, NULL, NULL, NULL, 0, N'5d6b157f-cc0d-432b-b624-e75b94c33410')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (1040, 2051, 2065, 1013, N'articleContent', N'ArticleContent', 1, 0, NULL, NULL, NULL, NULL, 0, N'9dba354e-8092-4b9d-82d3-e37e2f6044f0')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (1041, -89, 2065, 1013, N'articlePreviewText', N'ArticlePreviewText', 2, 1, NULL, NULL, NULL, NULL, 0, N'557a8d6b-dd68-4291-9c66-8389af3bf00e')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (1042, 2068, 2065, 1013, N'articlePreviewImage', N'ArticlePreviewImage', 3, 0, NULL, NULL, NULL, NULL, 0, N'6951ab0f-c20e-4880-824b-f11c920d2443')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (1043, 2069, 2065, 1013, N'articleCate ries', N'ArticleCate ries', 4, 1, NULL, NULL, NULL, NULL, 0, N'8aaf1840-99aa-4690-938a-c229aed6d847')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (1044, 1048, 2074, 1014, N'authorImage', N'AuthorImage', 0, 0, NULL, NULL, NULL, NULL, 0, N'e5d5f20c-f37d-4df3-962b-af3f246b4662')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [variations], [UniqueID]) VALUES (1045, -87, 2074, 1014, N'authorDescription', N'AuthorDescription', 1, 0, NULL, NULL, NULL, NULL, 0, N'f830e1da-2d7d-4026-9ba5-953d7afc2102')
SET IDENTITY_INSERT [dbo].[cmsPropertyType] OFF
 
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] ON 

INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (3, 1032, N'Image', 1, N'79ed4d07-254a-42cf-8fa9-ebe1c116a596')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (4, 1033, N'File', 1, N'50899f9c-023a-4466-b623-aba9049885fe')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (11, 1044, N'Membership', 1, N'0756729d-d665-46e3-b84a-37aceaa614f8')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (12, 1051, N'Content', 0, N'80f88356-e0e0-45a4-a4e4-13beadc2c35e')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (13, 1052, N'SEO', 0, N'2a161a74-c182-4223-a5e3-c3362ed7d4c6')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (1012, 2060, N'Nastavenie', 0, N'7c284d9a-177a-4c1a-82e8-ef550a2a8d61')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (1013, 2065, N'Article', 1, N'3494459a-a571-419d-a5ca-7de98ab8d1dd')
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [contenttypeNodeId], [text], [sortorder], [uniqueID]) VALUES (1014, 2074, N'Detail', 1, N'0e046073-b624-495a-8e30-7da8d4fc94f5')
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] OFF
 
SET IDENTITY_INSERT [dbo].[cmsTemplate] ON 

INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (1, 1054, N'layout')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (2, 1056, N'landingPage')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (1002, 2062, N'BlogPage')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (1003, 2064, N'BlogArticle')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (1004, 2070, N'BlogCate ry')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (1005, 2073, N'BlogAuthor')
SET IDENTITY_INSERT [dbo].[cmsTemplate] OFF
 
SET IDENTITY_INSERT [dbo].[umbracoAudit] ON 

INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-12T11:11:29.820' AS DateTime), -1, N'User "Administrator" ', N'umbraco/user/save', N'updating RawPasswordValue, LastPasswordChangeDate, UpdateDate, SecurityStamp')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (2, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-12T11:11:29.983' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating Email, Name, Username, UpdateDate, SecurityStamp')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (3, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-12T11:11:30.080' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (4, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-11-12T11:12:05.753' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating TourData, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (5, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-12T11:14:45.250' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (6, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-12T11:14:45.283' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (7, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-11-12T11:14:47.523' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating TourData, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1004, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T07:17:22.580' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1005, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T07:17:22.713' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1006, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-11-13T07:22:01.900' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1007, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T07:22:01.900' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1008, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T08:11:53.980' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1009, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T08:11:54.013' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1010, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T08:26:22.297' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1011, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T08:26:22.303' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1012, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-11-13T08:27:04.303' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1013, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T08:27:04.303' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1014, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-11-13T08:27:17.087' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1015, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T08:27:17.090' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1016, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T08:28:54.883' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1017, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T08:28:54.890' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1018, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T08:31:31.990' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1019, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T08:31:32.003' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1020, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T08:39:03.680' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1021, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T08:39:03.687' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1022, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T08:46:52.030' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1023, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T08:46:52.037' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1024, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T09:28:27.073' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1025, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T09:28:27.080' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1026, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T10:00:43.827' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1027, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T10:00:43.860' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1028, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T10:23:53.023' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1029, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T10:23:53.027' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1030, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T10:36:29.837' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1031, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T10:36:29.843' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1032, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T10:48:33.603' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1033, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T10:48:33.610' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1034, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T11:15:02.723' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1035, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T11:15:02.747' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1036, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T11:38:06.157' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1037, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T11:38:06.160' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1038, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T15:07:46.077' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1039, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-13T15:07:46.080' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1040, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-14T15:17:47.493' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1041, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-14T15:17:47.540' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1042, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-14T15:20:36.037' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1043, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-14T15:20:36.043' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1044, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-14T17:52:05.273' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1045, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-14T17:52:05.277' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1046, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-14T17:58:24.557' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1047, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-14T17:58:27.347' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1048, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-14T17:58:27.357' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1049, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-14T17:58:27.360' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1050, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-14T18:07:03.200' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1051, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-14T18:07:03.207' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1052, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-14T18:34:59.320' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1053, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-14T18:34:59.323' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1054, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-14T18:57:10.390' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1055, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-14T18:57:10.393' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1056, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-15T07:55:46.737' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1057, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-15T07:55:46.783' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1058, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-15T09:02:18.033' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1059, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-15T09:02:18.070' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1060, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-15T11:16:15.330' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1061, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-15T11:16:15.377' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1062, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-15T11:22:37.647' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1063, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-11-15T11:22:37.653' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1064, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-06T11:08:08.220' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1065, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-06T11:08:08.263' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1066, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-06T11:19:03.500' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1067, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-06T11:19:03.510' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1068, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-07T09:03:08.627' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1069, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-07T09:03:08.670' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1070, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-10T10:45:09.610' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1071, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-10T10:45:09.660' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1072, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-10T10:48:51.683' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1073, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-10T10:48:51.720' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1074, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-15T10:19:26.797' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1075, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-15T10:19:26.833' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1076, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-15T10:30:49.223' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1077, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-15T10:30:49.260' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1078, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T17:16:10.693' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1079, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T17:16:10.737' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1080, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T17:17:54.143' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1081, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T17:17:54.180' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1082, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T17:21:05.963' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1083, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T17:21:05.970' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1084, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T17:29:46.037' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1085, 1, N'User UNKNOWN:1', N'::1', CAST(N'2024-12-17T17:29:46.040' AS DateTime), 0, N'', N'umbraco/user/sign-in/failed', N'login failed')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1086, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T17:29:49.387' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1087, 1, N'User UNKNOWN:1', N'::1', CAST(N'2024-12-17T17:29:49.390' AS DateTime), 0, N'', N'umbraco/user/sign-in/failed', N'login failed')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1088, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T17:54:18.093' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1089, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T17:54:18.153' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1090, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T17:54:18.163' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1091, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T17:55:53.183' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1092, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T17:55:53.193' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1093, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T17:56:03.033' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1094, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T17:56:18.987' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1095, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T17:56:18.987' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
 
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1096, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T17:56:18.987' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1097, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T17:57:26.900' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1098, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T17:57:58.230' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1099, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T17:59:10.930' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1100, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T18:03:41.203' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1101, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T18:03:41.217' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1102, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:04:16.440' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1103, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:04:42.720' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1104, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:05:18.327' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1105, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:05:35.530' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1106, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:06:02.043' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1107, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:06:02.043' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1108, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:06:13.497' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1109, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:07:57.113' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1110, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:08:06.290' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1111, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T18:09:02.397' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1112, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T18:09:02.403' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1113, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:09:33.523' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1114, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:10:06.770' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1115, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T18:10:43.517' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1116, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T18:10:43.527' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1117, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:10:52.147' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1118, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:11:33.683' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1119, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:11:33.683' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1120, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:11:51.227' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1121, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:12:18.647' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1122, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:12:18.647' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1123, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:13:19.730' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1124, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:13:32.653' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1125, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T18:14:50.577' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1126, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T18:14:50.587' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1127, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:15:21.180' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1128, -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'::1', CAST(N'2024-12-17T18:15:21.180' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1129, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T18:34:49.153' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1130, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-17T18:34:49.187' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1131, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-18T15:27:44.870' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1132, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-18T15:27:44.923' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1133, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-18T15:38:03.297' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1134, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-18T15:38:03.303' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1135, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-18T15:44:40.233' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1136, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-18T15:44:40.243' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1137, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-18T15:57:43.360' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1138, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-18T15:57:43.400' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1139, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-18T16:12:14.600' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1140, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-18T16:12:14.610' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1141, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-18T16:53:00.523' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1142, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-18T16:53:00.567' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1143, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-19T19:15:29.987' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1144, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-19T19:15:30.033' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1145, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-21T11:48:33.557' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1146, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-21T11:48:33.600' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1147, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-21T12:09:19.173' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1148, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-21T12:09:19.180' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1149, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-21T12:56:13.413' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1150, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-21T12:56:13.460' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1151, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-21T13:06:23.060' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1152, 0, N'User "SYTEM" ', N'::1', CAST(N'2024-12-21T13:06:23.067' AS DateTime), -1, N'User "Nikola Vaniscak" <knihomolka2@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
SET IDENTITY_INSERT [dbo].[umbracoAudit] OFF
 
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] ON 

INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2299, CAST(N'2024-12-19T19:15:30.180' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P3652/D2] 09082312B2E449F8B637096D369DB7B9', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2300, CAST(N'2024-12-19T19:16:07.770' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":2058,\"Key\":\"3cbed408-9b8a-44ca-8c9b-126f6838377b\",\"ChangeTypes\":2}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P3652/D2] 09082312B2E449F8B637096D369DB7B9', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2301, CAST(N'2024-12-19T19:16:36.363' AS DateTime), N'[{"RefreshType":4,"RefresherId":"7b1e683c-5f34-43dd-803d-9699ea1e98ca","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":5,\"Alias\":\"recipeapp\"}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P3652/D2] 09082312B2E449F8B637096D369DB7B9', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2302, CAST(N'2024-12-19T19:16:49.280' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":2058,\"Key\":\"3cbed408-9b8a-44ca-8c9b-126f6838377b\",\"ChangeTypes\":2}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P3652/D2] 09082312B2E449F8B637096D369DB7B9', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2303, CAST(N'2024-12-19T19:17:19.047' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":2082,\"Key\":\"23a5828a-9733-4945-a67c-2352c1cca106\",\"ChangeTypes\":2}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P3652/D2] 09082312B2E449F8B637096D369DB7B9', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2304, CAST(N'2024-12-19T19:17:22.780' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":2082,\"Key\":\"23a5828a-9733-4945-a67c-2352c1cca106\",\"ChangeTypes\":4}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P3652/D2] 09082312B2E449F8B637096D369DB7B9', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2305, CAST(N'2024-12-19T19:17:33.323' AS DateTime), N'[{"RefreshType":4,"RefresherId":"7b1e683c-5f34-43dd-803d-9699ea1e98ca","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":6,\"Alias\":\"todo\"}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P3652/D2] 09082312B2E449F8B637096D369DB7B9', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2306, CAST(N'2024-12-19T19:17:38.887' AS DateTime), N'[{"RefreshType":4,"RefresherId":"7b1e683c-5f34-43dd-803d-9699ea1e98ca","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":6,\"Alias\":\"todo\"}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P3652/D2] 09082312B2E449F8B637096D369DB7B9', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2307, CAST(N'2024-12-19T19:17:46.753' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":2082,\"Key\":\"23a5828a-9733-4945-a67c-2352c1cca106\",\"ChangeTypes\":2}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P3652/D2] 09082312B2E449F8B637096D369DB7B9', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2308, CAST(N'2024-12-19T19:19:06.493' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":2083,\"Key\":\"9b9a8093-c05f-4afe-a903-18b6d85f1b4b\",\"ChangeTypes\":2}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P3652/D2] 09082312B2E449F8B637096D369DB7B9', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2309, CAST(N'2024-12-21T11:48:33.900' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P29384/D2] 1048422761474BD68DD038075ED7C5E2', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2310, CAST(N'2024-12-21T11:48:43.960' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":2082,\"Key\":\"23a5828a-9733-4945-a67c-2352c1cca106\",\"ChangeTypes\":4}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P29384/D2] 1048422761474BD68DD038075ED7C5E2', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2311, CAST(N'2024-12-21T12:09:19.183' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P29384/D2] 1048422761474BD68DD038075ED7C5E2', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2312, CAST(N'2024-12-21T12:09:49.413' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1057,\"Key\":\"4a0aef6e-5248-4b5a-977f-03ad295cd518\",\"ChangeTypes\":2}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P29384/D2] 1048422761474BD68DD038075ED7C5E2', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2313, CAST(N'2024-12-21T12:09:50.067' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1057,\"Key\":\"4a0aef6e-5248-4b5a-977f-03ad295cd518\",\"ChangeTypes\":2}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P29384/D2] 1048422761474BD68DD038075ED7C5E2', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2314, CAST(N'2024-12-21T12:13:12.473' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1057,\"Key\":\"4a0aef6e-5248-4b5a-977f-03ad295cd518\",\"ChangeTypes\":2}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P29384/D2] 1048422761474BD68DD038075ED7C5E2', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2315, CAST(N'2024-12-21T12:13:13.390' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1057,\"Key\":\"4a0aef6e-5248-4b5a-977f-03ad295cd518\",\"ChangeTypes\":2}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P29384/D2] 1048422761474BD68DD038075ED7C5E2', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2316, CAST(N'2024-12-21T12:14:00.417' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1057,\"Key\":\"4a0aef6e-5248-4b5a-977f-03ad295cd518\",\"ChangeTypes\":2}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P29384/D2] 1048422761474BD68DD038075ED7C5E2', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2317, CAST(N'2024-12-21T12:14:01.120' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1057,\"Key\":\"4a0aef6e-5248-4b5a-977f-03ad295cd518\",\"ChangeTypes\":2}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P29384/D2] 1048422761474BD68DD038075ED7C5E2', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2318, CAST(N'2024-12-21T12:16:44.217' AS DateTime), N'[{"RefreshType":4,"RefresherId":"7b1e683c-5f34-43dd-803d-9699ea1e98ca","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":7,\"Alias\":\"vlny\"}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P29384/D2] 1048422761474BD68DD038075ED7C5E2', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2319, CAST(N'2024-12-21T12:16:49.887' AS DateTime), N'[{"RefreshType":4,"RefresherId":"7b1e683c-5f34-43dd-803d-9699ea1e98ca","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":7,\"Alias\":\"vlny\"}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P29384/D2] 1048422761474BD68DD038075ED7C5E2', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2320, CAST(N'2024-12-21T12:16:58.030' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1057,\"Key\":\"4a0aef6e-5248-4b5a-977f-03ad295cd518\",\"ChangeTypes\":2}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P29384/D2] 1048422761474BD68DD038075ED7C5E2', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2321, CAST(N'2024-12-21T12:56:13.753' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P4400/D2] 410B665FEB9A4BE7B4F4A74E1AB67201', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2322, CAST(N'2024-12-21T12:56:39.883' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1057,\"Key\":\"4a0aef6e-5248-4b5a-977f-03ad295cd518\",\"ChangeTypes\":2}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P4400/D2] 410B665FEB9A4BE7B4F4A74E1AB67201', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2323, CAST(N'2024-12-21T12:56:40.903' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1057,\"Key\":\"4a0aef6e-5248-4b5a-977f-03ad295cd518\",\"ChangeTypes\":2}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P4400/D2] 410B665FEB9A4BE7B4F4A74E1AB67201', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2324, CAST(N'2024-12-21T13:06:23.070' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P4400/D2] 410B665FEB9A4BE7B4F4A74E1AB67201', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2325, CAST(N'2024-12-21T13:06:59.173' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1057,\"Key\":\"4a0aef6e-5248-4b5a-977f-03ad295cd518\",\"ChangeTypes\":2}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P4400/D2] 410B665FEB9A4BE7B4F4A74E1AB67201', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (2326, CAST(N'2024-12-21T13:07:01.503' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1057,\"Key\":\"4a0aef6e-5248-4b5a-977f-03ad295cd518\",\"ChangeTypes\":2}]"}]', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT [P4400/D2] 410B665FEB9A4BE7B4F4A74E1AB67201', 1)
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] OFF
 
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1057, 1053)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (2052, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (2053, 1053)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (2054, 1053)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (2055, 1053)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (2056, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (2057, 1053)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (2058, 1053)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (2059, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (2067, 2063)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (2076, 2075)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (2077, 2074)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (2078, 2072)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (2079, 2071)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (2080, 2065)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (2081, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (2082, 1053)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (2083, 1053)
 
SET IDENTITY_INSERT [dbo].[umbracoContentVersion] ON 

INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1, 1057, CAST(N'2024-11-12T12:21:19.737' AS DateTime), -1, 0, N'home')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2, 1057, CAST(N'2024-11-13T08:37:24.647' AS DateTime), -1, 0, N'home')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1002, 1057, CAST(N'2024-11-13T08:44:17.320' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1003, 2052, CAST(N'2024-11-13T08:43:06.173' AS DateTime), NULL, 1, N'IMG 20240902 115022')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1004, 1057, CAST(N'2024-11-13T08:44:38.893' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1005, 1057, CAST(N'2024-11-13T08:50:33.047' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1006, 1057, CAST(N'2024-11-13T08:51:37.237' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1007, 1057, CAST(N'2024-11-13T08:52:43.210' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1008, 1057, CAST(N'2024-11-13T09:12:22.613' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1009, 1057, CAST(N'2024-11-13T09:22:02.453' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1010, 1057, CAST(N'2024-11-13T09:26:49.667' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1011, 1057, CAST(N'2024-11-13T09:27:07.583' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1012, 1057, CAST(N'2024-11-13T09:28:02.000' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1013, 1057, CAST(N'2024-11-13T09:29:18.980' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1014, 1057, CAST(N'2024-11-13T09:30:20.933' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1015, 1057, CAST(N'2024-11-13T09:30:55.697' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1016, 1057, CAST(N'2024-11-13T09:40:30.003' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1017, 1057, CAST(N'2024-11-13T09:44:55.507' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1018, 1057, CAST(N'2024-11-13T09:46:04.077' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1019, 1057, CAST(N'2024-11-13T09:46:29.363' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1020, 1057, CAST(N'2024-11-13T09:46:40.357' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1021, 1057, CAST(N'2024-11-13T09:48:04.717' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1022, 1057, CAST(N'2024-11-13T09:52:46.630' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1023, 1057, CAST(N'2024-11-13T10:01:09.720' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1024, 1057, CAST(N'2024-11-13T10:01:36.127' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1025, 1057, CAST(N'2024-11-13T10:28:58.597' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1026, 1057, CAST(N'2024-11-13T11:03:22.437' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1027, 1057, CAST(N'2024-11-13T11:24:19.123' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1028, 1057, CAST(N'2024-11-13T11:27:33.610' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1029, 1057, CAST(N'2024-11-13T11:28:37.017' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1030, 1057, CAST(N'2024-11-13T11:29:32.127' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1031, 1057, CAST(N'2024-11-13T11:30:20.820' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1032, 1057, CAST(N'2024-11-13T11:36:56.790' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1033, 1057, CAST(N'2024-11-13T11:49:10.097' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1034, 1057, CAST(N'2024-11-13T11:49:50.510' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1035, 1057, CAST(N'2024-11-13T11:52:17.943' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1036, 1057, CAST(N'2024-11-13T11:56:57.370' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1037, 1057, CAST(N'2024-11-13T11:57:58.637' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1038, 1057, CAST(N'2024-11-14T16:39:23.287' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1039, 2053, CAST(N'2024-11-13T12:38:58.930' AS DateTime), -1, 0, N'vzdelanie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1040, 2053, CAST(N'2024-11-13T16:08:00.250' AS DateTime), -1, 0, N'vzdelanie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1041, 2054, CAST(N'2024-11-13T12:39:32.910' AS DateTime), -1, 0, N'kontakt')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1042, 2054, CAST(N'2024-11-13T12:40:19.653' AS DateTime), -1, 0, N'kontakt')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1043, 2054, CAST(N'2024-11-14T19:01:45.423' AS DateTime), -1, 0, N'kontakt')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1044, 2053, CAST(N'2024-11-13T16:08:50.020' AS DateTime), -1, 0, N'vzdelanie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1045, 2053, CAST(N'2024-11-13T16:11:36.477' AS DateTime), -1, 0, N'vzdelanie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1046, 2053, CAST(N'2024-11-14T18:59:37.453' AS DateTime), -1, 0, N'vzdelanie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1047, 1057, CAST(N'2024-11-14T16:40:07.530' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1048, 1057, CAST(N'2024-11-14T16:42:29.270' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1049, 1057, CAST(N'2024-11-14T16:43:20.107' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1050, 1057, CAST(N'2024-11-14T16:44:50.893' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1051, 1057, CAST(N'2024-11-14T16:45:28.993' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1052, 1057, CAST(N'2024-11-14T16:45:36.363' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1053, 1057, CAST(N'2024-11-14T16:45:45.090' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1054, 1057, CAST(N'2024-11-14T18:52:25.677' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1055, 1057, CAST(N'2024-11-14T18:56:27.277' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1056, 1057, CAST(N'2024-11-14T18:59:22.190' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1057, 1057, CAST(N'2024-11-14T19:06:12.443' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1058, 2053, CAST(N'2024-11-14T19:02:19.173' AS DateTime), -1, 0, N'vzdelanie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1059, 2054, CAST(N'2024-11-14T19:01:49.403' AS DateTime), -1, 0, N'kontakt')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1060, 2054, CAST(N'2024-11-14T19:17:16.640' AS DateTime), -1, 0, N'kontakt')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1061, 2053, CAST(N'2024-11-14T19:02:26.527' AS DateTime), -1, 0, N'vzdelanie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1062, 2053, CAST(N'2024-11-14T19:18:01.537' AS DateTime), -1, 0, N'vzdelanie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1063, 1057, CAST(N'2024-11-14T19:06:25.860' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1064, 1057, CAST(N'2024-11-14T19:07:19.453' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1065, 1057, CAST(N'2024-11-14T19:15:32.493' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1066, 1057, CAST(N'2024-11-15T12:20:54.433' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1067, 2054, CAST(N'2024-11-15T08:59:37.667' AS DateTime), -1, 0, N'kontakt')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1068, 2053, CAST(N'2024-11-14T19:26:39.753' AS DateTime), -1, 0, N'vzdelanie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1069, 2053, CAST(N'2024-11-14T19:27:14.013' AS DateTime), -1, 0, N'vzdelanie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1070, 2053, CAST(N'2024-11-14T19:28:35.210' AS DateTime), -1, 0, N'vzdelanie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1071, 2053, CAST(N'2024-11-14T19:29:33.427' AS DateTime), -1, 0, N'vzdelanie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1072, 2053, CAST(N'2024-11-14T19:35:49.823' AS DateTime), -1, 0, N'vzdelanie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1073, 2053, CAST(N'2024-11-14T19:36:30.777' AS DateTime), -1, 0, N'vzdelanie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1074, 2053, CAST(N'2024-11-14T19:36:53.160' AS DateTime), -1, 0, N'vzdelanie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1075, 2053, CAST(N'2024-11-14T19:37:16.997' AS DateTime), -1, 0, N'vzdelanie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1076, 2053, CAST(N'2024-11-14T19:57:46.090' AS DateTime), -1, 0, N'vzdelanie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1077, 2053, CAST(N'2024-11-15T12:18:05.270' AS DateTime), -1, 0, N'vzdelanie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1078, 2054, CAST(N'2024-11-15T09:00:02.520' AS DateTime), -1, 0, N'kontakt')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1079, 2054, CAST(N'2024-11-15T10:02:37.583' AS DateTime), -1, 0, N'kontakt')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1080, 2054, CAST(N'2024-11-15T10:08:55.573' AS DateTime), -1, 0, N'kontakt')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1081, 2054, CAST(N'2024-12-17T19:31:04.480' AS DateTime), -1, 1, N'kontakt')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1082, 2055, CAST(N'2024-11-15T12:16:47.933' AS DateTime), -1, 0, N'Projekty')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1083, 2055, CAST(N'2024-11-15T12:23:09.177' AS DateTime), -1, 0, N'projekty')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1084, 2053, CAST(N'2024-12-17T19:31:04.377' AS DateTime), -1, 1, N'vzdelanie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1085, 1057, CAST(N'2024-12-15T11:20:09.180' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (1086, 2055, CAST(N'2024-12-06T12:12:47.067' AS DateTime), -1, 0, N'projekty')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2086, 2055, CAST(N'2024-12-06T12:15:52.200' AS DateTime), -1, 0, N'projekty')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2087, 2056, CAST(N'2024-12-06T12:12:52.927' AS DateTime), NULL, 1, N'Screenshot 2024 12 06 115749')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2088, 2055, CAST(N'2024-12-06T12:17:07.897' AS DateTime), -1, 0, N'projekty')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2089, 2055, CAST(N'2024-12-06T12:17:45.800' AS DateTime), -1, 0, N'projekty')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2090, 2055, CAST(N'2024-12-06T12:19:23.160' AS DateTime), -1, 0, N'projekty')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2091, 2055, CAST(N'2024-12-06T12:22:25.513' AS DateTime), -1, 0, N'projekty')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2092, 2055, CAST(N'2024-12-10T11:46:45.260' AS DateTime), -1, 0, N'projekty')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2093, 2057, CAST(N'2024-12-10T11:45:41.163' AS DateTime), -1, 0, N'plantoasis')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2094, 2057, CAST(N'2024-12-10T11:48:10.433' AS DateTime), -1, 0, N'plantoasis')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2095, 2055, CAST(N'2024-12-10T11:49:15.263' AS DateTime), -1, 0, N'projekty')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2096, 2057, CAST(N'2024-12-10T11:48:16.313' AS DateTime), -1, 0, N'plantoasis')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2097, 2057, CAST(N'2024-12-10T11:49:08.480' AS DateTime), -1, 0, N'plantoasis')
 
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2098, 2057, CAST(N'2024-12-10T11:49:08.480' AS DateTime), -1, 1, N'plantoasis')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2099, 2055, CAST(N'2024-12-17T19:31:04.473' AS DateTime), -1, 1, N'projekty')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2100, 1057, CAST(N'2024-12-15T11:31:18.923' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2101, 1057, CAST(N'2024-12-21T13:09:49.303' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2102, 2058, CAST(N'2024-12-17T18:18:25.557' AS DateTime), -1, 0, N'recipe-app')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2103, 2058, CAST(N'2024-12-19T20:16:07.467' AS DateTime), -1, 0, N'recipe-app')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2104, 2059, CAST(N'2024-12-17T18:19:11.837' AS DateTime), NULL, 1, N'Recipe App')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2105, 2067, CAST(N'2024-12-17T18:59:10.973' AS DateTime), -1, 0, N'Blog')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2106, 2067, CAST(N'2024-12-17T19:30:40.840' AS DateTime), -1, 0, N'Blog')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2107, 2076, CAST(N'2024-12-17T19:10:24.547' AS DateTime), -1, 0, N'autori')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2108, 2076, CAST(N'2024-12-17T19:10:24.547' AS DateTime), -1, 1, N'autori')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2109, 2077, CAST(N'2024-12-17T19:11:26.820' AS DateTime), -1, 0, N'nikola')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2110, 2077, CAST(N'2024-12-18T16:34:31.873' AS DateTime), -1, 0, N'nikola')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2111, 2078, CAST(N'2024-12-17T19:13:32.667' AS DateTime), -1, 0, N'kate rie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2112, 2078, CAST(N'2024-12-17T19:13:32.667' AS DateTime), -1, 1, N'kate rie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2113, 2079, CAST(N'2024-12-17T19:14:50.623' AS DateTime), -1, 0, N'moje-zoznamovanie-sa-s-programovanim')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2114, 2079, CAST(N'2024-12-18T16:28:37.600' AS DateTime), -1, 0, N'zaciatky-programovania')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2115, 2080, CAST(N'2024-12-17T19:16:04.217' AS DateTime), -1, 0, N'moje-prve-programovanie')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2116, 2080, CAST(N'2024-12-18T16:33:36.060' AS DateTime), -1, 0, N'cesta-od-prveho-riadku-kodu-k-nekonecnym-moznostiam')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2117, 2067, CAST(N'2024-12-17T19:31:05.773' AS DateTime), -1, 0, N'Blog')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2118, 2067, CAST(N'2024-12-18T16:35:23.147' AS DateTime), -1, 0, N'blog')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2119, 2079, CAST(N'2024-12-18T16:28:37.600' AS DateTime), -1, 1, N'zaciatky-programovania')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2120, 2080, CAST(N'2024-12-18T16:33:57.687' AS DateTime), -1, 0, N'cesta-od-prveho-riadku-kodu-k-nekonecnym-moznostiam')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2121, 2081, CAST(N'2024-12-18T16:33:50.677' AS DateTime), NULL, 1, N'Code')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2122, 2080, CAST(N'2024-12-18T16:39:15.787' AS DateTime), -1, 0, N'cesta-od-prveho-riadku-kodu-k-nekonecnym-moznostiam')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2123, 2077, CAST(N'2024-12-18T16:35:01.813' AS DateTime), -1, 0, N'nikola')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2124, 2077, CAST(N'2024-12-18T16:35:01.813' AS DateTime), -1, 1, N'nikola')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2125, 2067, CAST(N'2024-12-18T16:35:23.147' AS DateTime), -1, 1, N'blog')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2126, 2080, CAST(N'2024-12-18T16:39:57.907' AS DateTime), -1, 0, N'cesta-od-prveho-riadku-kodu-k-nekonecnym-moznostiam')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2127, 2080, CAST(N'2024-12-18T16:45:43.080' AS DateTime), -1, 0, N'cesta-od-prveho-riadku-kodu-k-nekonecnym-moznostiam')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2128, 2080, CAST(N'2024-12-18T16:45:43.080' AS DateTime), -1, 1, N'cesta-od-prveho-riadku-kodu-k-nekonecnym-moznostiam')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2129, 2058, CAST(N'2024-12-19T20:16:49.207' AS DateTime), -1, 0, N'recipe-app')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2130, 2058, CAST(N'2024-12-19T20:16:49.207' AS DateTime), -1, 1, N'recipe-app')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2131, 2082, CAST(N'2024-12-19T20:17:22.670' AS DateTime), -1, 0, N'to-do')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2132, 2082, CAST(N'2024-12-19T20:17:46.717' AS DateTime), -1, 0, N'to-do')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2133, 2082, CAST(N'2024-12-21T12:48:42.553' AS DateTime), -1, 1, N'to-do')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2134, 2083, CAST(N'2024-12-19T20:19:06.413' AS DateTime), -1, 0, N'stranka-nanjdena')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2135, 2083, CAST(N'2024-12-19T20:19:06.413' AS DateTime), -1, 1, N'stranka-nanjdena')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2136, 1057, CAST(N'2024-12-21T13:13:12.377' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2137, 1057, CAST(N'2024-12-21T13:14:00.347' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2138, 1057, CAST(N'2024-12-21T13:16:57.960' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2139, 1057, CAST(N'2024-12-21T13:56:38.737' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2140, 1057, CAST(N'2024-12-21T14:06:59.100' AS DateTime), -1, 0, N'domov')
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text]) VALUES (2141, 1057, CAST(N'2024-12-21T14:07:01.423' AS DateTime), -1, 1, N'domov')
SET IDENTITY_INSERT [dbo].[umbracoContentVersion] OFF
 
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-99, N'Umbraco.Label', N'Decimal', N'{"umbracoDataValueType":"DECIMAL"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-98, N'Umbraco.Label', N'Date', N'{"umbracoDataValueType":"TIME"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-97, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":10, "orderBy":"username", "orderDirection":"asc", "includeProperties":[{"alias":"username","isSystem":1},{"alias":"email","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-96, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":100, "orderBy":"updateDate", "orderDirection":"desc", "layouts":[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}], "includeProperties":[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-95, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":100, "orderBy":"updateDate", "orderDirection":"desc", "layouts":[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}], "includeProperties":[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-94, N'Umbraco.Label', N'Date', N'{"umbracoDataValueType":"DATETIME"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-93, N'Umbraco.Label', N'Nvarchar', N'{"umbracoDataValueType":"BIGINT"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-92, N'Umbraco.Label', N'Nvarchar', N'{"umbracoDataValueType":"STRING"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-91, N'Umbraco.Label', N'Integer', N'{"umbracoDataValueType":"INT"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-90, N'Umbraco.UploadField', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-89, N'Umbraco.TextArea', N'Ntext', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-88, N'Umbraco.TextBox', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-87, N'Umbraco.TinyMCE', N'Ntext', N'{"value":",code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-51, N'Umbraco.Integer', N'Integer', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-49, N'Umbraco.TrueFalse', N'Integer', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-43, N'Umbraco.CheckBoxList', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-42, N'Umbraco.DropDown.Flexible', N'Nvarchar', N'{"multiple":true}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-41, N'Umbraco.DateTime', N'Date', N'{"format":"YYYY-MM-DD"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-40, N'Umbraco.RadioButtonList', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-39, N'Umbraco.DropDown.Flexible', N'Nvarchar', N'{"multiple":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-37, N'Umbraco.ColorPicker', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-36, N'Umbraco.DateTime', N'Date', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1041, N'Umbraco.Tags', N'Ntext', N'{"group":"default", "storageType":"Json"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1043, N'Umbraco.ImageCropper', N'Ntext', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1046, N'Umbraco.ContentPicker', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1047, N'Umbraco.MemberPicker', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1048, N'Umbraco.MediaPicker', N'Ntext', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1049, N'Umbraco.MediaPicker', N'Ntext', N'{"multiPicker":1}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1050, N'Umbraco.MultiUrlPicker', N'Ntext', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (2051, N'Umbraco.Grid', N'Ntext', N'{"items":{"styles":[{"label":"Set a background image","description":"Set a row background","key":"background-image","view":"imagepicker","modifier":"url({0})"}],"config":[{"label":"Class","description":"Set a css class","key":"class","view":"textstring"}],"columns":12,"templates":[{"name":"1 column layout","sections":[{"grid":12}]},{"name":"2 column layout","sections":[{"grid":4},{"grid":8}]}],"layouts":[{"label":"Headline","name":"Headline","areas":[{"grid":12,"editors":["headline"]}]},{"label":"Article","name":"Article","areas":[{"grid":4},{"grid":8}]},{"name":"4/8","areas":[{"grid":4,"allowAll":true},{"grid":8,"allowAll":true}],"label":"4/8"},{"name":"three","areas":[{"grid":4,"allowAll":true},{"grid":4,"allowAll":true},{"grid":4,"allowAll":true}],"label":"three"}]},"rte":{"toolbar":["ace","removeformat","undo","redo","cut","copy","paste","styleselect","bold","italic","underline","strikethrough","alignleft","aligncenter","alignright","alignjustify","bullist","numlist","outdent","indent","link","unlink","anchor","umbmediapicker","umbmacro","table","umbembeddialog","hr","subscript","superscript","charmap","rtl","ltr","fullscreen"],"stylesheets":[],"maxImageSize":500,"mode":"classic"},"ignoreUserStartNodes":false,"mediaParentId":null}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (2066, N'Umbraco.ContentPicker', N'Nvarchar', N'{"showOpenButton":false,"startNodeId":"umb://document/178ac764f162484b8c1dac065e2029a5","ignoreUserStartNodes":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (2068, N'Umbraco.MediaPicker', N'Ntext', N'{"multiPicker":false,"onlyImages":true,"disableFolderSelect":true,"startNodeId":null,"ignoreUserStartNodes":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (2069, N'Umbraco.MultiNodeTreePicker', N'Ntext', N'{"startNode":{"type":"content","query":null,"id":null},"filter":null,"minNumber":0,"maxNumber":0,"showOpenButton":false,"ignoreUserStartNodes":false}')
 
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1057, 1, 1)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (2053, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (2054, 1, 1)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (2055, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (2057, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (2058, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (2067, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (2076, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (2077, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (2078, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (2079, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (2080, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (2082, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (2083, 1, 0)
 
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1002, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1004, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1005, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1006, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1007, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1008, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1009, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1010, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1011, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1012, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1013, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1014, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1015, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1016, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1017, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1018, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1019, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1020, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1021, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1022, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1023, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1024, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1025, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1026, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1027, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1028, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1029, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1030, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1031, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1032, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1033, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1034, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1035, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1036, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1037, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1038, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1039, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1040, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1041, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1042, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1043, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1044, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1045, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1046, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1047, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1048, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1049, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1050, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1051, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1052, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1053, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1054, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1055, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1056, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1057, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1058, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1059, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1060, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1061, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1062, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1063, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1064, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1065, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1066, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1067, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1068, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1069, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1070, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1071, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1072, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1073, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1074, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1075, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1076, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1077, 1056, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1078, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1079, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1080, 1056, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1081, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1082, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1083, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1084, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1085, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1086, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2086, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2088, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2089, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2090, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2091, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2092, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2093, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2094, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2095, 1056, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2096, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2097, 1056, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2098, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2099, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2100, 1056, 0)
 
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2101, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2102, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2103, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2105, 2062, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2106, 2062, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2107, NULL, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2108, NULL, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2109, 2073, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2110, 2073, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2111, NULL, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2112, NULL, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2113, 2070, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2114, 2070, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2115, 2064, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2116, 2064, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2117, 2062, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2118, 2062, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2119, 2070, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2120, 2064, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2122, 2064, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2123, 2073, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2124, 2073, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2125, 2062, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2126, 2064, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2127, 2064, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2128, 2064, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2129, 1056, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2130, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2131, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2132, 1056, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2133, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2134, 1056, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2135, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2136, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2137, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2138, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2139, 1056, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2140, 1056, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2141, 1056, 0)
 
INSERT [dbo].[umbracoKeyValue] ([key], [value], [updated]) VALUES (N'Umbraco.Core.Upgrader.State+Umbraco.Core', N'{2AB29964-02A1-474D-BD6B-72148D2A53A2}', CAST(N'2024-11-12T12:11:29.573' AS DateTime))
 
SET IDENTITY_INSERT [dbo].[umbracoLanguage] ON 

INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName], [isDefaultVariantLang], [mandatory], [fallbackLanguageId]) VALUES (1, N'en-US', N'English (United States)', 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[umbracoLanguage] OFF
 
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-1000, 1, N'MainDom')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-340, 1, N'Languages')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-339, 1, N'KeyValues')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-338, 1, N'Domains')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-337, 1, N'MemberTypes')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-336, 1, N'MediaTypes')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-335, 1, N'MemberTree')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-334, 1, N'MediaTree')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-333, 1, N'ContentTree')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-332, -1, N'ContentTypes')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-331, 1, N'Servers')
 
SET IDENTITY_INSERT [dbo].[umbracoLog] ON 

INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1, -1, -1, N'DocumentType', CAST(N'2024-11-12T12:15:06.510' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2, -1, -1, N'DocumentType', CAST(N'2024-11-12T12:15:12.313' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (3, -1, -1, N'DocumentType', CAST(N'2024-11-12T12:15:17.307' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (4, -1, -1, N'DocumentType', CAST(N'2024-11-12T12:15:17.380' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (5, -1, 1054, N'Template', CAST(N'2024-11-12T12:15:34.810' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (6, -1, 1055, N'DataType', CAST(N'2024-11-12T12:16:16.800' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (7, -1, 1055, N'DataType', CAST(N'2024-11-12T12:16:28.113' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (8, -1, 1056, N'Template', CAST(N'2024-11-12T12:16:53.017' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (9, -1, 1053, N'DocumentType', CAST(N'2024-11-12T12:17:06.663' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (10, -1, 1057, N'Document', CAST(N'2024-11-12T12:21:19.820' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (11, -1, 1057, N'Document', CAST(N'2024-11-12T12:21:21.193' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1002, -1, 1051, N'DocumentType', CAST(N'2024-11-13T08:22:30.090' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1003, -1, 2051, N'DataType', CAST(N'2024-11-13T08:23:11.067' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1004, -1, 1051, N'DocumentType', CAST(N'2024-11-13T08:23:13.613' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1005, -1, 1057, N'Document', CAST(N'2024-11-13T08:32:05.693' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1006, -1, 1057, N'Document', CAST(N'2024-11-13T08:32:07.387' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1007, -1, 1057, N'Document', CAST(N'2024-11-13T08:37:24.663' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1008, -1, 1057, N'Document', CAST(N'2024-11-13T08:37:50.600' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1009, -1, 2052, N'Media', CAST(N'2024-11-13T08:43:06.230' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1010, -1, 1057, N'Document', CAST(N'2024-11-13T08:44:17.463' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1011, -1, 1057, N'Document', CAST(N'2024-11-13T08:44:19.777' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1012, -1, 1057, N'Document', CAST(N'2024-11-13T08:44:38.943' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1013, -1, 1057, N'Document', CAST(N'2024-11-13T08:44:39.567' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1014, -1, 1057, N'Document', CAST(N'2024-11-13T08:50:33.097' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1015, -1, 1057, N'Document', CAST(N'2024-11-13T08:50:34.460' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1016, -1, 1057, N'Document', CAST(N'2024-11-13T08:51:37.287' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1017, -1, 1057, N'Document', CAST(N'2024-11-13T08:51:38.543' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1018, -1, 1057, N'Document', CAST(N'2024-11-13T08:52:43.260' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1019, -1, 1057, N'Document', CAST(N'2024-11-13T09:12:19.610' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1020, -1, 1057, N'Document', CAST(N'2024-11-13T09:12:22.630' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1021, -1, 1057, N'Document', CAST(N'2024-11-13T09:12:23.457' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1022, -1, 1057, N'Document', CAST(N'2024-11-13T09:22:02.503' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1023, -1, 1057, N'Document', CAST(N'2024-11-13T09:22:03.147' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1024, -1, 1057, N'Document', CAST(N'2024-11-13T09:26:49.717' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1025, -1, 1057, N'Document', CAST(N'2024-11-13T09:27:07.633' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1026, -1, 1057, N'Document', CAST(N'2024-11-13T09:28:01.100' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1027, -1, 1057, N'Document', CAST(N'2024-11-13T09:28:02.013' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1028, -1, 1057, N'Document', CAST(N'2024-11-13T09:29:19.030' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1029, -1, 1057, N'Document', CAST(N'2024-11-13T09:30:20.330' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1030, -1, 1057, N'Document', CAST(N'2024-11-13T09:30:20.943' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1031, -1, 1057, N'Document', CAST(N'2024-11-13T09:30:55.743' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1032, -1, 1057, N'Document', CAST(N'2024-11-13T09:30:56.393' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1033, -1, 1057, N'Document', CAST(N'2024-11-13T09:31:35.127' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1034, -1, 1057, N'Document', CAST(N'2024-11-13T09:36:20.480' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1035, -1, 1057, N'Document', CAST(N'2024-11-13T09:40:30.057' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1036, -1, 1057, N'Document', CAST(N'2024-11-13T09:40:31.947' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1037, -1, 1057, N'Document', CAST(N'2024-11-13T09:44:55.557' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1038, -1, 1057, N'Document', CAST(N'2024-11-13T09:46:04.157' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1039, -1, 1057, N'Document', CAST(N'2024-11-13T09:46:05.193' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1040, -1, 1057, N'Document', CAST(N'2024-11-13T09:46:29.370' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1041, -1, 1057, N'Document', CAST(N'2024-11-13T09:46:29.963' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1042, -1, 1057, N'Document', CAST(N'2024-11-13T09:46:40.367' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1043, -1, 1057, N'Document', CAST(N'2024-11-13T09:48:04.767' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1044, -1, 1057, N'Document', CAST(N'2024-11-13T09:48:05.470' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1045, -1, 1057, N'Document', CAST(N'2024-11-13T09:52:46.680' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1046, -1, 1057, N'Document', CAST(N'2024-11-13T09:52:47.397' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1047, -1, 1057, N'Document', CAST(N'2024-11-13T10:01:09.743' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1048, -1, 1057, N'Document', CAST(N'2024-11-13T10:01:10.543' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1049, -1, 1057, N'Document', CAST(N'2024-11-13T10:01:36.150' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1050, -1, 1057, N'Document', CAST(N'2024-11-13T10:01:38.797' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1051, -1, 1057, N'Document', CAST(N'2024-11-13T10:28:58.620' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1052, -1, 1057, N'Document', CAST(N'2024-11-13T10:28:59.203' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1053, -1, 1057, N'Document', CAST(N'2024-11-13T11:03:22.503' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1054, -1, 1057, N'Document', CAST(N'2024-11-13T11:03:23.847' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1055, -1, 1057, N'Document', CAST(N'2024-11-13T11:04:24.117' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1056, -1, 1057, N'Document', CAST(N'2024-11-13T11:24:19.147' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1057, -1, 1057, N'Document', CAST(N'2024-11-13T11:27:33.637' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1058, -1, 1057, N'Document', CAST(N'2024-11-13T11:27:34.457' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1059, -1, 1057, N'Document', CAST(N'2024-11-13T11:28:37.043' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1060, -1, 1057, N'Document', CAST(N'2024-11-13T11:28:40.367' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1061, -1, 1057, N'Document', CAST(N'2024-11-13T11:29:32.150' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1062, -1, 1057, N'Document', CAST(N'2024-11-13T11:29:33.143' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1063, -1, 1057, N'Document', CAST(N'2024-11-13T11:30:20.843' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1064, -1, 1057, N'Document', CAST(N'2024-11-13T11:30:21.357' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1065, -1, 1057, N'Document', CAST(N'2024-11-13T11:36:56.813' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1066, -1, 1057, N'Document', CAST(N'2024-11-13T11:36:57.403' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1067, -1, 1057, N'Document', CAST(N'2024-11-13T11:49:10.123' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1068, -1, 1057, N'Document', CAST(N'2024-11-13T11:49:12.313' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1069, -1, 1057, N'Document', CAST(N'2024-11-13T11:49:50.540' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1070, -1, 1057, N'Document', CAST(N'2024-11-13T11:52:17.967' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1071, -1, 1057, N'Document', CAST(N'2024-11-13T11:56:57.437' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1072, -1, 1057, N'Document', CAST(N'2024-11-13T11:57:58.660' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1073, -1, 1057, N'Document', CAST(N'2024-11-13T11:57:59.310' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1074, -1, 2053, N'Document', CAST(N'2024-11-13T12:38:58.967' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1075, -1, 2053, N'Document', CAST(N'2024-11-13T12:39:00.163' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1076, -1, 2054, N'Document', CAST(N'2024-11-13T12:39:32.937' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1077, -1, -1, N'PartialViewMacro', CAST(N'2024-11-13T12:40:05.040' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1078, -1, -1, N'Macro', CAST(N'2024-11-13T12:40:05.060' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1079, -1, -1, N'Macro', CAST(N'2024-11-13T12:40:09.737' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1080, -1, 2054, N'Document', CAST(N'2024-11-13T12:40:19.680' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1081, -1, 2053, N'Document', CAST(N'2024-11-13T16:08:00.320' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1082, -1, 2053, N'Document', CAST(N'2024-11-13T16:08:50.073' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1083, -1, 2053, N'Document', CAST(N'2024-11-13T16:11:36.523' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1084, -1, 1057, N'Document', CAST(N'2024-11-14T16:17:55.013' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1085, -1, 1057, N'Document', CAST(N'2024-11-14T16:39:23.353' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1086, -1, 1057, N'Document', CAST(N'2024-11-14T16:40:07.557' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1087, -1, 1057, N'Document', CAST(N'2024-11-14T16:40:08.393' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1088, -1, 1057, N'Document', CAST(N'2024-11-14T16:42:29.293' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1089, -1, 1057, N'Document', CAST(N'2024-11-14T16:42:30.260' AS DateTime), N'Save', NULL, NULL)
 
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1090, -1, 1057, N'Document', CAST(N'2024-11-14T16:43:20.130' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1091, -1, 1057, N'Document', CAST(N'2024-11-14T16:43:20.880' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1092, -1, 1057, N'Document', CAST(N'2024-11-14T16:44:50.917' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1093, -1, 1057, N'Document', CAST(N'2024-11-14T16:44:51.470' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1094, -1, 1057, N'Document', CAST(N'2024-11-14T16:45:29.017' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1095, -1, 1057, N'Document', CAST(N'2024-11-14T16:45:36.370' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1096, -1, 1057, N'Document', CAST(N'2024-11-14T16:45:45.093' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1097, -1, 1057, N'Document', CAST(N'2024-11-14T18:52:24.900' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1098, -1, 1057, N'Document', CAST(N'2024-11-14T18:52:24.900' AS DateTime), N'RollBack', N'Content ''domov'' was rolled back to version ''1037''', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1099, -1, 1057, N'Document', CAST(N'2024-11-14T18:52:25.687' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1100, -1, 1057, N'Document', CAST(N'2024-11-14T18:52:26.347' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1101, -1, 1057, N'Document', CAST(N'2024-11-14T18:56:27.303' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1102, -1, 1057, N'Document', CAST(N'2024-11-14T18:59:22.217' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1103, -1, 2053, N'Document', CAST(N'2024-11-14T18:59:37.560' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1104, -1, -1, N'PartialViewMacro', CAST(N'2024-11-14T19:00:27.440' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1105, -1, -1, N'Macro', CAST(N'2024-11-14T19:00:27.460' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1106, -1, -1, N'Macro', CAST(N'2024-11-14T19:00:43.573' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1107, -1, 1055, N'DataType', CAST(N'2024-11-14T19:01:00.160' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1108, -1, 2051, N'DataType', CAST(N'2024-11-14T19:01:12.787' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1109, -1, 2054, N'Document', CAST(N'2024-11-14T19:01:45.470' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1110, -1, 2054, N'Document', CAST(N'2024-11-14T19:01:49.413' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1111, -1, 2053, N'Document', CAST(N'2024-11-14T19:02:19.183' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1112, -1, 2053, N'Document', CAST(N'2024-11-14T19:02:26.537' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1113, -1, 1057, N'Document', CAST(N'2024-11-14T19:06:12.467' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1114, -1, 1057, N'Document', CAST(N'2024-11-14T19:06:13.047' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1115, -1, 1057, N'Document', CAST(N'2024-11-14T19:06:25.863' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1116, -1, 1057, N'Document', CAST(N'2024-11-14T19:06:26.567' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1117, -1, 1057, N'Document', CAST(N'2024-11-14T19:07:19.473' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1118, -1, 1057, N'Document', CAST(N'2024-11-14T19:15:32.517' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1119, -1, 1057, N'Document', CAST(N'2024-11-14T19:15:33.663' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1120, -1, 2054, N'Document', CAST(N'2024-11-14T19:17:16.687' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1121, -1, 2053, N'Document', CAST(N'2024-11-14T19:18:01.583' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1122, -1, 2053, N'Document', CAST(N'2024-11-14T19:26:39.783' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1123, -1, 2053, N'Document', CAST(N'2024-11-14T19:26:41.400' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1124, -1, 2053, N'Document', CAST(N'2024-11-14T19:27:14.047' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1125, -1, 2053, N'Document', CAST(N'2024-11-14T19:27:14.807' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1126, -1, 2053, N'Document', CAST(N'2024-11-14T19:28:35.257' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1127, -1, 2053, N'Document', CAST(N'2024-11-14T19:28:35.760' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1128, -1, 2053, N'Document', CAST(N'2024-11-14T19:29:33.477' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1129, -1, 2053, N'Document', CAST(N'2024-11-14T19:29:34.157' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1130, -1, 2053, N'Document', CAST(N'2024-11-14T19:35:49.880' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1131, -1, 2053, N'Document', CAST(N'2024-11-14T19:35:50.950' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1132, -1, 2053, N'Document', CAST(N'2024-11-14T19:36:30.830' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1133, -1, 2053, N'Document', CAST(N'2024-11-14T19:36:31.823' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1134, -1, 2053, N'Document', CAST(N'2024-11-14T19:36:53.207' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1135, -1, 2053, N'Document', CAST(N'2024-11-14T19:36:54.177' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1136, -1, 2053, N'Document', CAST(N'2024-11-14T19:37:17.003' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1137, -1, 2053, N'Document', CAST(N'2024-11-14T19:37:17.930' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1138, -1, 2053, N'Document', CAST(N'2024-11-14T19:57:46.140' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1139, -1, 2054, N'Document', CAST(N'2024-11-15T08:59:37.833' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1140, -1, 2054, N'Document', CAST(N'2024-11-15T08:59:48.357' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1141, -1, 2054, N'Document', CAST(N'2024-11-15T09:00:02.530' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1142, -1, 2054, N'Document', CAST(N'2024-11-15T09:00:03.823' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1143, -1, 2054, N'Document', CAST(N'2024-11-15T10:02:37.733' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1144, -1, 2054, N'Document', CAST(N'2024-11-15T10:02:38.687' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1145, -1, 2054, N'Document', CAST(N'2024-11-15T10:08:55.627' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1146, -1, 2054, N'Document', CAST(N'2024-11-15T10:08:56.273' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1147, -1, 2055, N'Document', CAST(N'2024-11-15T12:16:48.017' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1148, -1, 2053, N'Document', CAST(N'2024-11-15T12:18:05.383' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1149, -1, 1057, N'Document', CAST(N'2024-11-15T12:20:54.460' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1150, -1, 1057, N'Document', CAST(N'2024-11-15T12:20:55.017' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1151, -1, 0, N'Document', CAST(N'2024-11-15T12:22:58.247' AS DateTime), N'Sort', N'Sorting content performed by user', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1152, -1, 2055, N'Document', CAST(N'2024-11-15T12:23:05.490' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1153, -1, 2055, N'Document', CAST(N'2024-11-15T12:23:09.183' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2151, -1, 2055, N'Document', CAST(N'2024-12-06T12:12:47.147' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2152, -1, 2056, N'Media', CAST(N'2024-12-06T12:12:52.947' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2153, -1, 2055, N'Document', CAST(N'2024-12-06T12:15:52.323' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2154, -1, 2055, N'Document', CAST(N'2024-12-06T12:17:07.947' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2155, -1, 2055, N'Document', CAST(N'2024-12-06T12:17:08.900' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2156, -1, 2055, N'Document', CAST(N'2024-12-06T12:17:45.807' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2157, -1, 2055, N'Document', CAST(N'2024-12-06T12:19:23.210' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2158, -1, 2055, N'Document', CAST(N'2024-12-06T12:19:24.150' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2159, -1, -1, N'PartialViewMacro', CAST(N'2024-12-06T12:21:59.630' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2160, -1, -1, N'Macro', CAST(N'2024-12-06T12:21:59.677' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2161, -1, -1, N'Macro', CAST(N'2024-12-06T12:22:12.673' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2162, -1, 2055, N'Document', CAST(N'2024-12-06T12:22:25.583' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2163, -1, 2057, N'Document', CAST(N'2024-12-10T11:45:41.253' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2164, -1, -1, N'PartialViewMacro', CAST(N'2024-12-10T11:45:54.197' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2165, -1, -1, N'Macro', CAST(N'2024-12-10T11:45:54.223' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2166, -1, -1, N'Macro', CAST(N'2024-12-10T11:46:36.527' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2167, -1, 2055, N'Document', CAST(N'2024-12-10T11:46:45.290' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2168, -1, 2057, N'Document', CAST(N'2024-12-10T11:48:10.510' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2169, -1, 2057, N'Document', CAST(N'2024-12-10T11:48:16.340' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2170, -1, 2057, N'Document', CAST(N'2024-12-10T11:49:08.507' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2171, -1, 2055, N'Document', CAST(N'2024-12-10T11:49:15.270' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2172, -1, 1057, N'Document', CAST(N'2024-12-15T11:20:09.260' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2173, -1, 1057, N'Document', CAST(N'2024-12-15T11:31:18.993' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2174, -1, 2058, N'Document', CAST(N'2024-12-17T18:18:25.647' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2175, -1, 2059, N'Media', CAST(N'2024-12-17T18:19:11.863' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2176, -1, -1, N'PartialViewMacro', CAST(N'2024-12-17T18:19:43.560' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2177, -1, -1, N'Macro', CAST(N'2024-12-17T18:19:43.587' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2178, -1, 2060, N'DocumentType', CAST(N'2024-12-17T18:25:22.637' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2179, -1, 1053, N'DocumentType', CAST(N'2024-12-17T18:25:38.573' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2180, -1, 2062, N'Template', CAST(N'2024-12-17T18:27:50.367' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2181, -1, 2063, N'DocumentType', CAST(N'2024-12-17T18:27:50.387' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2182, -1, 2064, N'Template', CAST(N'2024-12-17T18:57:07.537' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2183, -1, 2065, N'DocumentType', CAST(N'2024-12-17T18:57:07.597' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2184, -1, 2066, N'DataType', CAST(N'2024-12-17T18:57:50.787' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2185, -1, 1053, N'DocumentType', CAST(N'2024-12-17T18:58:17.367' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2186, -1, 2063, N'DocumentType', CAST(N'2024-12-17T18:58:23.967' AS DateTime), N'Save', NULL, NULL)
 
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2187, -1, 2067, N'Document', CAST(N'2024-12-17T18:59:11.030' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2188, -1, 2063, N'DocumentType', CAST(N'2024-12-17T19:03:41.327' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2189, -1, 2068, N'DataType', CAST(N'2024-12-17T19:04:35.720' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2190, -1, 2069, N'DataType', CAST(N'2024-12-17T19:04:59.657' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2191, -1, 2070, N'Template', CAST(N'2024-12-17T19:05:25.630' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2192, -1, 2071, N'DocumentType', CAST(N'2024-12-17T19:05:25.643' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2193, -1, 2072, N'DocumentType', CAST(N'2024-12-17T19:05:36.697' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2194, -1, 2072, N'DocumentType', CAST(N'2024-12-17T19:05:46.163' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2195, -1, 2065, N'DocumentType', CAST(N'2024-12-17T19:06:44.493' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2196, -1, 2065, N'DocumentType', CAST(N'2024-12-17T19:07:03.397' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2197, -1, 2065, N'DocumentType', CAST(N'2024-12-17T19:07:21.097' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2198, -1, 2063, N'DocumentType', CAST(N'2024-12-17T19:07:57.143' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2199, -1, 2073, N'Template', CAST(N'2024-12-17T19:08:32.537' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2200, -1, 2074, N'DocumentType', CAST(N'2024-12-17T19:08:32.557' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2201, -1, 2074, N'DocumentType', CAST(N'2024-12-17T19:09:17.817' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2202, -1, 2074, N'DocumentType', CAST(N'2024-12-17T19:09:21.350' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2203, -1, 2075, N'DocumentType', CAST(N'2024-12-17T19:09:39.050' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2204, -1, 2075, N'DocumentType', CAST(N'2024-12-17T19:09:40.423' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2205, -1, 2063, N'DocumentType', CAST(N'2024-12-17T19:09:49.687' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2206, -1, 2076, N'Document', CAST(N'2024-12-17T19:10:24.570' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2207, -1, 2077, N'Document', CAST(N'2024-12-17T19:11:26.847' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2208, -1, 2066, N'DataType', CAST(N'2024-12-17T19:12:03.707' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2209, -1, 2065, N'DocumentType', CAST(N'2024-12-17T19:12:49.980' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2210, -1, 2078, N'Document', CAST(N'2024-12-17T19:13:32.697' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2211, -1, 2079, N'Document', CAST(N'2024-12-17T19:14:50.667' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2212, -1, 2080, N'Document', CAST(N'2024-12-17T19:16:04.347' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2213, -1, 2067, N'Document', CAST(N'2024-12-17T19:30:20.813' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2214, -1, 2067, N'Document', CAST(N'2024-12-17T19:30:40.853' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2215, -1, 0, N'Document', CAST(N'2024-12-17T19:30:54.703' AS DateTime), N'Sort', N'Sorting content performed by user', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2216, -1, 0, N'Document', CAST(N'2024-12-17T19:31:04.487' AS DateTime), N'Sort', N'Sorting content performed by user', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2217, -1, 2067, N'Document', CAST(N'2024-12-17T19:31:05.797' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2218, -1, 2079, N'Document', CAST(N'2024-12-18T16:28:37.677' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2219, -1, 2080, N'Document', CAST(N'2024-12-18T16:33:36.190' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2220, -1, 2081, N'Media', CAST(N'2024-12-18T16:33:50.697' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2221, -1, 2080, N'Document', CAST(N'2024-12-18T16:33:57.700' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2222, -1, 2077, N'Document', CAST(N'2024-12-18T16:34:31.923' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2223, -1, 2077, N'Document', CAST(N'2024-12-18T16:35:01.820' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2224, -1, 2067, N'Document', CAST(N'2024-12-18T16:35:23.170' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2225, -1, 2080, N'Document', CAST(N'2024-12-18T16:39:15.840' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2226, -1, 2080, N'Document', CAST(N'2024-12-18T16:39:25.727' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2227, -1, 2080, N'Document', CAST(N'2024-12-18T16:39:57.960' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2228, -1, 2080, N'Document', CAST(N'2024-12-18T16:39:59.047' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2229, -1, 2080, N'Document', CAST(N'2024-12-18T16:45:43.133' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2230, -1, 2058, N'Document', CAST(N'2024-12-19T20:16:07.550' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2231, -1, -1, N'Macro', CAST(N'2024-12-19T20:16:36.350' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2232, -1, 2058, N'Document', CAST(N'2024-12-19T20:16:49.230' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2233, -1, 2082, N'Document', CAST(N'2024-12-19T20:17:18.930' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2234, -1, 2082, N'Document', CAST(N'2024-12-19T20:17:22.697' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2235, -1, -1, N'PartialViewMacro', CAST(N'2024-12-19T20:17:33.283' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2236, -1, -1, N'Macro', CAST(N'2024-12-19T20:17:33.320' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2237, -1, -1, N'Macro', CAST(N'2024-12-19T20:17:38.880' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2238, -1, 2082, N'Document', CAST(N'2024-12-19T20:17:46.723' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2239, -1, 2083, N'Document', CAST(N'2024-12-19T20:19:06.440' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2240, -1, 2082, N'Document', CAST(N'2024-12-21T12:48:42.673' AS DateTime), N'Move', N'Moved to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2241, -1, 2082, N'Document', CAST(N'2024-12-21T12:48:43.693' AS DateTime), N'Delete', N'Trashed content with Id: 2082 related to original parent content with Id: 2055', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2242, -1, 1057, N'Document', CAST(N'2024-12-21T13:09:49.340' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2243, -1, 1057, N'Document', CAST(N'2024-12-21T13:09:50.040' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2244, -1, 1057, N'Document', CAST(N'2024-12-21T13:13:12.410' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2245, -1, 1057, N'Document', CAST(N'2024-12-21T13:13:13.350' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2246, -1, 1057, N'Document', CAST(N'2024-12-21T13:14:00.370' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2247, -1, 1057, N'Document', CAST(N'2024-12-21T13:14:01.100' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2248, -1, -1, N'PartialViewMacro', CAST(N'2024-12-21T13:16:44.173' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2249, -1, -1, N'Macro', CAST(N'2024-12-21T13:16:44.203' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2250, -1, -1, N'Macro', CAST(N'2024-12-21T13:16:49.883' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2251, -1, 1057, N'Document', CAST(N'2024-12-21T13:16:57.983' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2252, -1, 1057, N'Document', CAST(N'2024-12-21T13:56:38.807' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2253, -1, 1057, N'Document', CAST(N'2024-12-21T13:56:40.873' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2254, -1, 1057, N'Document', CAST(N'2024-12-21T14:06:59.123' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2255, -1, 1057, N'Document', CAST(N'2024-12-21T14:07:01.460' AS DateTime), N'Save', NULL, NULL)
SET IDENTITY_INSERT [dbo].[umbracoLog] OFF
 
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (1003, N'/media/prchu35a/img_20240902_115022.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (2087, N'/media/340jbucn/screenshot-2024-12-06-115749.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (2104, N'/media/yjgno5w2/recipe-app.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (2121, N'/media/mptdgln3/code.jpg')
 
SET IDENTITY_INSERT [dbo].[umbracoNode] ON 

INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-99, N'8f1ef1e1-9de4-40d3-a072-6673f631ca64', -1, 1, N'-1,-99', 39, 0, -1, N'Label (decimal)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-98, N'a97cec69-9b71-4c30-8b12-ec398860d7e8', -1, 1, N'-1,-98', 38, 0, -1, N'Label (time)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-97, N'aa2c52a0-ce87-4e65-a47c-7df09358585d', -1, 1, N'-1,-97', 2, 0, -1, N'List View - Members', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-96, N'3a0156c4-3b8c-4803-bdc1-6871faa83fff', -1, 1, N'-1,-96', 2, 0, -1, N'List View - Media', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-95, N'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4', -1, 1, N'-1,-95', 2, 0, -1, N'List View - Content', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-94, N'0e9794eb-f9b5-4f20-a788-93acd233a7e4', -1, 1, N'-1,-94', 37, 0, -1, N'Label (datetime)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-93, N'930861bf-e262-4ead-a704-f99453565708', -1, 1, N'-1,-93', 36, 0, -1, N'Label (bigint)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.320' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-92, N'f0bc4bfb-b499-40d6-ba86-058885a5178c', -1, 1, N'-1,-92', 35, 0, -1, N'Label (string)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.320' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-91, N'8e7f995c-bd81-4627-9932-c40e568ec788', -1, 1, N'-1,-91', 36, 0, -1, N'Label (integer)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.320' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-90, N'84c6b441-31df-4ffe-b67e-67d5bc3ae65a', -1, 1, N'-1,-90', 34, 0, -1, N'Upload', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-89, N'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3', -1, 1, N'-1,-89', 33, 0, -1, N'Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-88, N'0cc0eba1-9960-42c9-bf9b-60e150b429ae', -1, 1, N'-1,-88', 32, 0, -1, N'Textstring', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-87, N'ca90c950-0aff-4e72-b976-a30b1ac57dad', -1, 1, N'-1,-87', 4, 0, -1, N'Richtext editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-51, N'2e6d3631-066e-44b8-aec4-96f09099b2b5', -1, 1, N'-1,-51', 2, 0, -1, N'Numeric', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-49, N'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49', -1, 1, N'-1,-49', 2, 0, -1, N'True/false', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-43, N'fbaf13a8-4036-41f2-93a3-974f678c312a', -1, 1, N'-1,-43', 2, 0, -1, N'Checkbox list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-42, N'f38f0ac7-1d27-439c-9f3f-089cd8825a53', -1, 1, N'-1,-42', 2, 0, -1, N'Dropdown multiple', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-41, N'5046194e-4237-453c-a547-15db3a07c4e1', -1, 1, N'-1,-41', 2, 0, -1, N'Date Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-40, N'bb5f57c9-ce2b-4bb9-b697-4caca783a805', -1, 1, N'-1,-40', 2, 0, -1, N'Radiobox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-39, N'0b6a45e7-44ba-430d-9da5-4e46060b9e03', -1, 1, N'-1,-39', 2, 0, -1, N'Dropdown', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-37, N'0225af17-b302-49cb-9176-b9f35cab9c17', -1, 1, N'-1,-37', 2, 0, -1, N'Approved Color', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-36, N'e4d66c0f-b935-4200-81f0-025f7256b89a', -1, 1, N'-1,-36', 2, 0, -1, N'Date Picker with time', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.323' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-21, N'bf7c7cbc-952f-4518-97a2-69e9c7b33842', -1, 0, N'-1,-21', 0, 0, -1, N'Recycle Bin', N'cf3d8e34-1c1c-41e9-ae56-878b57b32113', CAST(N'2024-11-12T12:11:29.320' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-20, N'0f582a79-1e41-4cf0-bfa0-76340651891a', -1, 0, N'-1,-20', 0, 0, -1, N'Recycle Bin', N'01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8', CAST(N'2024-11-12T12:11:29.320' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-1, N'916724a5-173d-4619-b97e-b9de133dd6f5', -1, 0, N'-1', 0, 0, -1, N'SYSTEM DATA: umbraco master root', N'ea7d8624-4cfe-4578-a871-24aa946bf34d', CAST(N'2024-11-12T12:11:29.320' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1031, N'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d', -1, 1, N'-1,1031', 2, 0, -1, N'Folder', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2024-11-12T12:11:29.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1032, N'cc07b313-0843-4aa8-bbda-871c8da728c8', -1, 1, N'-1,1032', 2, 0, -1, N'Image', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2024-11-12T12:11:29.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1033, N'4c52d8ab-54e6-40cd-999c-7a5f24903e4d', -1, 1, N'-1,1033', 2, 0, -1, N'File', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2024-11-12T12:11:29.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1041, N'b6b73142-b9c1-4bf8-a16d-e1c23320b549', -1, 1, N'-1,1041', 2, 0, -1, N'Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1043, N'1df9f033-e6d4-451f-b8d2-e0cbc50a836f', -1, 1, N'-1,1043', 2, 0, -1, N'Image Cropper', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1044, N'd59be02f-1df9-4228-aa1e-01917d806cda', -1, 1, N'-1,1044', 0, 0, -1, N'Member', N'9b5416fb-e72f-45a9-a07b-5a9a2709ce43', CAST(N'2024-11-12T12:11:29.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1046, N'fd1e0da5-5606-4862-b679-5d0cf3a52a59', -1, 1, N'-1,1046', 2, 0, -1, N'Content Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1047, N'1ea2e01f-ebd8-4ce1-8d71-6b1149e63548', -1, 1, N'-1,1047', 2, 0, -1, N'Member Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1048, N'135d60e0-64d9-49ed-ab08-893c9ba44ae5', -1, 1, N'-1,1048', 2, 0, -1, N'Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1049, N'9dbbcbbb-2327-434a-b355-af1b84e5010a', -1, 1, N'-1,1049', 2, 0, -1, N'Multiple Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1050, N'b4e3535a-1753-47e2-8568-602cf8cfee6f', -1, 1, N'-1,1050', 2, 0, -1, N'Multi URL Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-12T12:11:29.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1051, N'8f5ab295-ae27-4e85-a357-583539745105', -1, 1, N'-1,1051', 0, 0, -1, N'CmsContent', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2024-11-12T12:15:06.473' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1052, N'1a3ed5f5-d416-4598-94f9-46197760dc09', -1, 1, N'-1,1052', 1, 0, -1, N'SEO', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2024-11-12T12:15:12.310' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1053, N'9929fbb9-d341-4573-a616-d57248d957bd', -1, 1, N'-1,1053', 2, 0, -1, N'LandingPage', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2024-11-12T12:15:17.303' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1054, N'51e59ac6-2d03-4bef-ad88-bfbd057a719a', -1, 1, N'-1,1054', 0, 0, NULL, N'_Layout', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2024-11-12T12:15:34.797' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1056, N'bd1a2cf0-5fbd-4efe-9df2-8f6fce042fa3', -1, 1, N'-1,1056', 0, 0, NULL, N'LandingPage', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2024-11-12T12:16:53.010' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1057, N'4a0aef6e-5248-4b5a-977f-03ad295cd518', -1, 1, N'-1,1057', 0, 0, -1, N'domov', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2024-11-12T12:21:19.737' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2051, N'092e839b-3a53-4177-9e02-a1624a1b7ddb', -1, 1, N'-1,2051', 30, 0, -1, N'CmsContent - GridContent - Grid layout', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-11-13T08:23:11.040' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2052, N'776a457a-2ce0-4512-bd6c-8150cb986db7', -1, 1, N'-1,2052', 0, 0, -1, N'IMG 20240902 115022', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2024-11-13T08:43:06.173' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2053, N'77b6b631-d494-4a2f-b21e-c0e843ba14a9', 1057, 2, N'-1,1057,2053', 1, 0, -1, N'vzdelanie', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2024-11-13T12:38:58.930' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2054, N'4ebb0aeb-5098-4f3b-a594-6ea60fcd9b57', 1057, 2, N'-1,1057,2054', 3, 0, -1, N'kontakt', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2024-11-13T12:39:32.910' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2055, N'5c624e88-ff0a-4711-88f9-46c47625ee55', 1057, 2, N'-1,1057,2055', 2, 0, -1, N'projekty', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2024-11-15T12:16:47.933' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2056, N'd080b5e9-4f4d-4706-8458-7e22e30893af', -1, 1, N'-1,2056', 1, 0, -1, N'Screenshot 2024 12 06 115749', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2024-12-06T12:12:52.927' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2057, N'06a0f5b7-795a-4221-9ae7-e32c53d1ce50', 2055, 3, N'-1,1057,2055,2057', 0, 0, -1, N'plantoasis', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2024-12-10T11:45:41.163' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2058, N'3cbed408-9b8a-44ca-8c9b-126f6838377b', 2055, 3, N'-1,1057,2055,2058', 1, 0, -1, N'recipe-app', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2024-12-17T18:18:25.557' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2059, N'7ec74dc4-99dc-4fd0-800d-02dc9484d86a', -1, 1, N'-1,2059', 1, 0, -1, N'Recipe App', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2024-12-17T18:19:11.837' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2060, N'295592e9-9340-497e-a759-1c598748c805', -1, 1, N'-1,2060', 3, 0, -1, N'Texty', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2024-12-17T18:25:22.603' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2061, N'1f782332-ee88-4df9-96ca-66f095da4a6b', -1, 1, N'-1,2061', 0, 0, -1, N'Blog', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(N'2024-12-17T18:27:30.230' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2062, N'8f24db60-2eeb-4d4e-8a04-993425d185b4', -1, 1, N'-1,2062', 0, 0, NULL, N'BlogPage', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2024-12-17T18:27:50.353' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2063, N'4073675b-f817-49e2-a739-92e2f7471775', 2061, 2, N'-1,2061,2063', 0, 0, -1, N'BlogPage', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2024-12-17T18:27:50.377' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2064, N'02ddcef1-71ae-4976-9df7-5a4d03a4829e', -1, 1, N'-1,2064', 0, 0, NULL, N'Blog Article', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2024-12-17T18:57:07.517' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2065, N'0609ea12-3257-4bbc-bbcd-ec8d671b5148', 2061, 2, N'-1,2061,2065', 1, 0, -1, N'Blog Article', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2024-12-17T18:57:07.567' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2066, N'e5e1958b-083d-433c-9d54-aeb56ecd56fd', -1, 1, N'-1,2066', 30, 0, -1, N'BlogArticle-Article-Author', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-12-17T18:57:50.760' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2067, N'9fdc8f1f-a4a6-41a8-a5d2-dfdd478f6f42', 1057, 2, N'-1,1057,2067', 0, 0, -1, N'blog', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2024-12-17T18:59:10.973' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2068, N'98448c59-e562-4c23-936d-e4e0bbeef3af', -1, 1, N'-1,2068', 31, 0, -1, N'BlogArticle - ArticlePreviewImage - Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-12-17T19:04:35.703' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2069, N'771d065b-e9bb-497e-8275-77ed0df53d0a', -1, 1, N'-1,2069', 32, 0, -1, N'BlogArticle - ArticleCate ries - Multinode Treepicker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2024-12-17T19:04:59.637' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2070, N'a8d5b797-1330-4c2f-93ca-a4ede36cf196', -1, 1, N'-1,2070', 0, 0, NULL, N'BlogCate ry', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2024-12-17T19:05:25.623' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2071, N'7b3e552f-65e8-4033-9341-c428dcacd8ac', 2061, 2, N'-1,2061,2071', 2, 0, -1, N'BlogCate ry', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2024-12-17T19:05:25.637' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2072, N'2b31a29f-6194-4a9d-9c4a-2f170de7901b', 2061, 2, N'-1,2061,2072', 3, 0, -1, N'BlogCate ryList', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2024-12-17T19:05:36.697' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2073, N'fce52216-ba1a-4a47-8707-b82b5ab07e8a', -1, 1, N'-1,2073', 0, 0, NULL, N'BlogAuthor', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2024-12-17T19:08:32.527' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2074, N'ca34bbe4-93b9-4cae-88b8-9cc09613dcc4', 2061, 2, N'-1,2061,2074', 4, 0, -1, N'BlogAuthor', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2024-12-17T19:08:32.543' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2075, N'47ec6756-2572-4773-be69-aefcff06bec4', 2061, 2, N'-1,2061,2075', 5, 0, -1, N'BlogAuthorList', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2024-12-17T19:09:39.043' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2076, N'178ac764-f162-484b-8c1d-ac065e2029a5', 2067, 3, N'-1,1057,2067,2076', 0, 0, -1, N'autori', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2024-12-17T19:10:24.547' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2077, N'2c9e5d33-b73e-42ef-9094-34bbe347d42c', 2076, 4, N'-1,1057,2067,2076,2077', 0, 0, -1, N'nikola', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2024-12-17T19:11:26.820' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2078, N'0705cdd2-6270-4565-88d3-7ffe1e585060', 2067, 3, N'-1,1057,2067,2078', 1, 0, -1, N'kate rie', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2024-12-17T19:13:32.667' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2079, N'f1b8c0f9-fb09-4153-a0d4-3a4f260299a7', 2078, 4, N'-1,1057,2067,2078,2079', 0, 0, -1, N'zaciatky-programovania', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2024-12-17T19:14:50.623' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2080, N'647a738f-8d41-4339-9dff-ec6eccc8d3db', 2067, 3, N'-1,1057,2067,2080', 2, 0, -1, N'cesta-od-prveho-riadku-kodu-k-nekonecnym-moznostiam', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2024-12-17T19:16:04.217' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2081, N'2d33e665-f0bd-47d5-8968-51d7199d9e9a', -1, 1, N'-1,2081', 2, 0, -1, N'Code', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2024-12-18T16:33:50.677' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2082, N'23a5828a-9733-4945-a67c-2352c1cca106', -20, 1, N'-1,-20,2082', 0, 1, -1, N'to-do', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2024-12-19T20:17:18.883' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (2083, N'9b9a8093-c05f-4afe-a903-18b6d85f1b4b', 1057, 2, N'-1,1057,2083', 4, 0, -1, N'stranka-nanjdena', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2024-12-19T20:19:06.413' AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoNode] OFF
 
SET IDENTITY_INSERT [dbo].[umbracoPropertyData] ON 

INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1, 1, 38, NULL, NULL, NULL, NULL, NULL, N'home', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3, 1, 39, NULL, NULL, NULL, NULL, NULL, N'home', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (5, 1, 41, NULL, NULL, NULL, NULL, NULL, N'home', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (7, 1, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1007, 2, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex justify-content-between align-items-center\">\n<div class=\"lo \">\n<h3>TAMARA SREDOJEVIC</h3>\n</div>\n<!-- Profile Image with shadow -->\n<div class=\"profile-img my-4\"><img src=\"https://via.placeholder.com/150\" alt=\"Profile\" /></div>\n<!-- Name and Subtitle -->\n<h2 class=\"fw-bold\">Tamara Sredojevic</h2>\n<p class=\"text-muted\">(yes, it''s a mouthful)</p>\n<p class=\"bio-text\">I''m a freelance UX designer specializing in accessibility and neuroinclusive design.</p>\n<!-- Social Icons -->\n<div class=\"social-icons mt-3\"><a href=\"#\"></a> <a href=\"#\"></a> <a href=\"#\"></a> <a href=\"#\"></a> <a href=\"#\"></a></div>\n<!-- Language Toggle Buttons -->\n<div class=\"lang-toggle mt-5\"><button class=\"btn btn-lang\">EN</button> <button class=\"btn btn-lang\">SK</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1009, 2, 38, NULL, NULL, NULL, NULL, NULL, N'home', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1011, 2, 39, NULL, NULL, NULL, NULL, NULL, N'home', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1013, 2, 41, NULL, NULL, NULL, NULL, NULL, N'home', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1015, 2, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1022, 1003, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/prchu35a/img_20240902_115022.jpg","crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1023, 1003, 7, NULL, NULL, 3456, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1024, 1003, 8, NULL, NULL, 4608, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1025, 1003, 9, NULL, NULL, NULL, NULL, NULL, N'4286030', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1026, 1003, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1027, 1002, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex justify-content-between align-items-center\">\n<div class=\"lo \">\n<h3>TAMARA SREDOJEVIC</h3>\n</div>\n<!-- Profile Image with shadow -->\n<div class=\"profile-img my-4\"><img src=\"?width=374.99999999999994&amp;height=300\" alt=\"\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n<!-- Name and Subtitle -->\n<h2 class=\"fw-bold\">Tamara Sredojevic</h2>\n<p class=\"text-muted\">(yes, it''s a mouthful)</p>\n<p class=\"bio-text\">I''m a freelance UX designer specializing in accessibility and neuroinclusive design.</p>\n<!-- Social Icons -->\n<div class=\"social-icons mt-3\"><a href=\"#\"></a> <a href=\"#\"></a> <a href=\"#\"></a> <a href=\"#\"></a> <a href=\"#\"></a></div>\n<!-- Language Toggle Buttons -->\n<div class=\"lang-toggle mt-5\"><button class=\"btn btn-lang\">EN</button> <button class=\"btn btn-lang\">SK</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1029, 1002, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1031, 1002, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1033, 1002, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1035, 1002, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1042, 1004, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex justify-content-between align-items-center\">\n<div class=\"lo \">\n<h3>TAMARA SREDOJEVIC</h3>\n</div>\n<!-- Profile Image with shadow -->\n<div class=\"profile-img my-4\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n<!-- Name and Subtitle -->\n<h2 class=\"fw-bold\">Tamara Sredojevic</h2>\n<p class=\"text-muted\">(yes, it''s a mouthful)</p>\n<p class=\"bio-text\">I''m a freelance UX designer specializing in accessibility and neuroinclusive design.</p>\n<!-- Social Icons -->\n<div class=\"social-icons mt-3\"><a href=\"#\"></a> <a href=\"#\"></a> <a href=\"#\"></a> <a href=\"#\"></a> <a href=\"#\"></a></div>\n<!-- Language Toggle Buttons -->\n<div class=\"lang-toggle mt-5\"><button class=\"btn btn-lang\">EN</button> <button class=\"btn btn-lang\">SK</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1044, 1004, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1046, 1004, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1048, 1004, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1050, 1004, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1057, 1005, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex justify-content-between align-items-center\">\n<div class=\"lo \">\n<h3>TAMARA SREDOJEVIC</h3>\n</div>\n<div class=\"circle-container\">\n<div class=\"circle-outer\"></div>\n<div class=\"circle-inner\"></div>\n<!-- Profile Image with shadow -->\n<div class=\"profile-img my-4\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n</div>\n<!-- Name and Subtitle -->\n<h2 class=\"fw-bold\">Tamara Sredojevic</h2>\n<p class=\"text-muted\">(yes, it''s a mouthful)</p>\n<p class=\"bio-text\">I''m a freelance UX designer specializing in accessibility and neuroinclusive design.</p>\n<!-- Social Icons -->\n<div class=\"social-icons mt-3\"><a href=\"#\"></a> <a href=\"#\"></a> <a href=\"#\"></a> <a href=\"#\"></a> <a href=\"#\"></a></div>\n<!-- Language Toggle Buttons -->\n<div class=\"lang-toggle mt-5\"><button class=\"btn btn-lang\">EN</button> <button class=\"btn btn-lang\">SK</button></div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1059, 1005, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1061, 1005, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1063, 1005, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1065, 1005, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1072, 1006, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex justify-content-between align-items-center\">\n<div class=\"lo \">\n<h3>TAMARA SREDOJEVIC</h3>\n</div>\n<div class=\"circle-container\">\n<div class=\"circle-outer\"></div>\n<div class=\"circle-inner\"></div>\n<div class=\"profile-img my-4\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"profileimg\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n<!-- Name and Subtitle -->\n<h2 class=\"fw-bold\">Tamara Sredojevic</h2>\n<p class=\"text-muted\">(yes, it''s a mouthful)</p>\n<p class=\"bio-text\">I''m a freelance UX designer specializing in accessibility and neuroinclusive design.</p>\n<!-- Social Icons -->\n<div class=\"social-icons mt-3\"><a href=\"#\"></a> <a href=\"#\"></a> <a href=\"#\"></a> <a href=\"#\"></a> <a href=\"#\"></a></div>\n<!-- Language Toggle Buttons -->\n<div class=\"lang-toggle mt-5\"><button class=\"btn btn-lang\">EN</button> <button class=\"btn btn-lang\">SK</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1074, 1006, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1076, 1006, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1078, 1006, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1080, 1006, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1087, 1007, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex justify-content-between align-items-center\">\n<div class=\"lo \">\n<h3>TAMARA SREDOJEVIC</h3>\n</div>\n<div class=\"circle-container\">\n<div class=\"circle-outer\"></div>\n<div class=\"profile-img my-4\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"profileimg\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n<!-- Name and Subtitle -->\n<h2 class=\"fw-bold\">Tamara Sredojevic</h2>\n<p class=\"text-muted\">(yes, it''s a mouthful)</p>\n<p class=\"bio-text\">I''m a freelance UX designer specializing in accessibility and neuroinclusive design.</p>\n<!-- Social Icons -->\n<div class=\"social-icons mt-3\"><a href=\"#\"></a> <a href=\"#\"></a> <a href=\"#\"></a> <a href=\"#\"></a> <a href=\"#\"></a></div>\n<!-- Language Toggle Buttons -->\n<div class=\"lang-toggle mt-5\"><button class=\"btn btn-lang\">EN</button> <button class=\"btn btn-lang\">SK</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1089, 1007, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1091, 1007, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1093, 1007, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1095, 1007, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1102, 1008, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex justify-content-between align-items-center\">\n<div class=\"lo \">\n<h3>TAMARA SREDOJEVIC</h3>\n</div>\n<div class=\"circle-container\">\n<div class=\"circle-outer\"></div>\n<div class=\"profile-img my-4\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"profileimg\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n<!-- Name and Subtitle -->\n<h2 class=\"fw-bold\">Tamara Sredojevic</h2>\n<p class=\"text-muted\">(yes, it''s a mouthful)</p>\n<p class=\"bio-text\">I''m a freelance UX designer specializing in accessibility and neuroinclusive design.</p>\n<!-- Social Icons -->\n<div class=\"social-icons mt-3\"></div>\n<!-- Language Toggle Buttons -->\n<div class=\"lang-toggle mt-5\"><button class=\"btn btn-lang\">EN</button> <button class=\"btn btn-lang\">SK</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1104, 1008, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1106, 1008, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1108, 1008, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1110, 1008, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1117, 1009, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex justify-content-between align-items-center\">\n<div class=\"circle-container\">\n<div class=\"circle-outer\"></div>\n<div class=\"profile-img my-4\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"profileimg\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n<!-- Name and Subtitle -->\n<h2 class=\"fw-bold\">Tamara Sredojevic</h2>\n<p class=\"text-muted\">(yes, it''s a mouthful)</p>\n<p class=\"bio-text\">I''m a freelance UX designer specializing in accessibility and neuroinclusive design.</p>\n<!-- Social Icons --><hr /><a rel=\"noopener\" href=\"https://www.instagram.com\" target=\"_blank\" class=\"text-decoration-none\"> </a> <!-- Language Toggle Buttons -->\n<div class=\"lang-toggle mt-5\"><button class=\"btn btn-lang\">EN</button> <button class=\"btn btn-lang\">SK</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1119, 1009, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1121, 1009, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1123, 1009, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1125, 1009, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1132, 1010, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex align-items-center\">\n<div class=\"circle-container\">\n<div class=\"circle-outer\"></div>\n<div class=\"profile-img my-4\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"profileimg\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n<!-- Name and Subtitle -->\n<h2 class=\"fw-bold\">Tamara Sredojevic</h2>\n<p class=\"text-muted\">(yes, it''s a mouthful)</p>\n<p class=\"bio-text\">I''m a freelance UX designer specializing in accessibility and neuroinclusive design.</p>\n<!-- Social Icons --><hr /><a rel=\"noopener\" href=\"https://www.instagram.com\" target=\"_blank\" class=\"text-decoration-none\"> </a> <!-- Language Toggle Buttons -->\n<div class=\"lang-toggle mt-5\"><button class=\"btn btn-lang\">EN</button> <button class=\"btn btn-lang\">SK</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1134, 1010, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1136, 1010, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1138, 1010, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1140, 1010, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1142, 1011, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex align-items-center\">\n<div class=\"circle-container\">\n<div class=\"circle-outer\"></div>\n<div class=\"profile-img my-4\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"profileimg\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n<!-- Name and Subtitle -->\n<h2 class=\"fw-bold\">Tamara Sredojevic</h2>\n<p class=\"text-muted\">(yes, it''s a mouthful)</p>\n<p class=\"bio-text\">I''m a freelance UX designer specializing in accessibility and neuroinclusive design.</p>\n<!-- Social Icons --><hr /><a rel=\"noopener\" href=\"https://www.instagram.com\" target=\"_blank\" class=\"text-decoration-none\"> </a> <!-- Language Toggle Buttons -->\n<div class=\"lang-toggle mt-5\"><button class=\"btn btn-lang\">EN</button> <button class=\"btn btn-lang\">SK</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1144, 1011, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1146, 1011, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1148, 1011, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1150, 1011, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1157, 1012, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex  justify-items-center align-items-center\">\n<div class=\"circle-container\">\n<div class=\"circle-outer\"></div>\n<div class=\"profile-img my-4\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"profileimg\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n<!-- Name and Subtitle -->\n<h2 class=\"fw-bold\">Tamara Sredojevic</h2>\n<p class=\"text-muted\">(yes, it''s a mouthful)</p>\n<p class=\"bio-text\">I''m a freelance UX designer specializing in accessibility and neuroinclusive design.</p>\n<!-- Social Icons --><hr /><a rel=\"noopener\" href=\"https://www.instagram.com\" target=\"_blank\" class=\"text-decoration-none\"> </a> <!-- Language Toggle Buttons -->\n<div class=\"lang-toggle mt-5\"><button class=\"btn btn-lang\">EN</button> <button class=\"btn btn-lang\">SK</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1159, 1012, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1161, 1012, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1163, 1012, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1165, 1012, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1167, 1013, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex  justify-items-center\">\n<div class=\"circle-container\">\n<div class=\"circle-outer\"></div>\n<div class=\"profile-img my-4\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"profileimg\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n<!-- Name and Subtitle -->\n<h2 class=\"fw-bold\">Tamara Sredojevic</h2>\n<p class=\"text-muted\">(yes, it''s a mouthful)</p>\n<p class=\"bio-text\">I''m a freelance UX designer specializing in accessibility and neuroinclusive design.</p>\n<!-- Social Icons --><hr /><a rel=\"noopener\" href=\"https://www.instagram.com\" target=\"_blank\" class=\"text-decoration-none\"> </a> <!-- Language Toggle Buttons -->\n<div class=\"lang-toggle mt-5\"><button class=\"btn btn-lang\">EN</button> <button class=\"btn btn-lang\">SK</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1169, 1013, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1171, 1013, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1173, 1013, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1175, 1013, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1182, 1014, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex\">\n<div class=\"circle-container\">\n<div class=\"circle-outer\"></div>\n<div class=\"profile-img my-4\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"profileimg\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n<!-- Name and Subtitle -->\n<h2 class=\"fw-bold\">Tamara Sredojevic</h2>\n<p class=\"text-muted\">(yes, it''s a mouthful)</p>\n<p class=\"bio-text\">I''m a freelance UX designer specializing in accessibility and neuroinclusive design.</p>\n<!-- Social Icons --><hr /><a rel=\"noopener\" href=\"https://www.instagram.com\" target=\"_blank\" class=\"text-decoration-none\"> </a> <!-- Language Toggle Buttons -->\n<div class=\"lang-toggle mt-5\"><button class=\"btn btn-lang\">EN</button> <button class=\"btn btn-lang\">SK</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1184, 1014, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1186, 1014, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1188, 1014, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1190, 1014, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1192, 1015, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex justify-content-between align-items-center\">\n<div class=\"circle-container\">\n<div class=\"circle-outer\"></div>\n<div class=\"profile-img my-4\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"profileimg\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n<!-- Name and Subtitle -->\n<h2 class=\"fw-bold\">Tamara Sredojevic</h2>\n<p class=\"text-muted\">(yes, it''s a mouthful)</p>\n<p class=\"bio-text\">I''m a freelance UX designer specializing in accessibility and neuroinclusive design.</p>\n<!-- Social Icons --><hr /><a rel=\"noopener\" href=\"https://www.instagram.com\" target=\"_blank\" class=\"text-decoration-none\"> </a> <!-- Language Toggle Buttons -->\n<div class=\"lang-toggle mt-5\"><button class=\"btn btn-lang\">EN</button> <button class=\"btn btn-lang\">SK</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1194, 1015, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1196, 1015, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1198, 1015, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1200, 1015, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1207, 1016, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex justify-content-between align-items-center\">\n<div class=\"circle-container\">\n<div class=\"circle-outer\"></div>\n<div class=\"profile-img my-4\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"profileimg\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n<!-- Name and Subtitle -->\n<h2 class=\"fw-bold\">Nikola Vaniščáková</h2>\n<p class=\"text-muted\">Ahojte 👋</p>\n<p class=\"bio-text\">I''m a freelance UX designer specializing in accessibility and neuroinclusive design.</p>\n<!-- Social Icons --><hr /><a rel=\"noopener\" href=\"https://www.instagram.com\" target=\"_blank\" class=\"text-decoration-none\"> </a> <!-- Language Toggle Buttons -->\n<div class=\"lang-toggle mt-5\"><button class=\"btn btn-lang\">EN</button> <button class=\"btn btn-lang\">SK</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1209, 1016, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1211, 1016, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1213, 1016, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1215, 1016, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1222, 1017, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex justify-content-between align-items-center\">\n<div class=\"circle-container\">\n<div class=\"circle-outer\"></div>\n<div class=\"profile-img my-4\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"profileimg\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n<p class=\"text-muted\">👋 Ahojte!</p>\n<h2 class=\"fw-bold\">Nikola Vaniščáková</h2>\n<p class=\"bio-text\">Som Full.</p>\n<!-- Social Icons --><hr /><a rel=\"noopener\" href=\"https://www.instagram.com\" target=\"_blank\" class=\"text-decoration-none\"> </a> <!-- Language Toggle Buttons -->\n<div class=\"lang-toggle mt-5\"><button class=\"btn btn-lang\">EN</button> <button class=\"btn btn-lang\">SK</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1224, 1017, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1226, 1017, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1228, 1017, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1230, 1017, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1232, 1018, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex justify-content-between align-items-center\">\n<div class=\"circle-container\">\n<div class=\"circle-outer\"></div>\n<div class=\"profile-img my-4\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"profileimg\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n<h2 class=\"fw-bold\">Nikola Vaniščáková</h2>\n<p class=\"text-muted\">👋 Ahojte!</p>\n<p class=\"bio-text\">Som It nadšenec a vytváram webové stránky.</p>\n<!-- Social Icons --><hr /><a rel=\"noopener\" href=\"https://www.instagram.com\" target=\"_blank\" class=\"text-decoration-none\"> </a> <!-- Language Toggle Buttons -->\n<div class=\"lang-toggle mt-5\"><button class=\"btn btn-lang\">EN</button> <button class=\"btn btn-lang\">SK</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1234, 1018, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1236, 1018, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1238, 1018, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1240, 1018, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1247, 1019, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex justify-content-between align-items-center\">\n<div class=\"circle-container\">\n<div class=\"circle-outer\"></div>\n<div class=\"profile-img my-4\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"profileimg\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n<h1 class=\"fw-bold\">Nikola Vaniščáková</h1>\n<p class=\"text-muted\">👋 Ahojte!</p>\n<h2 class=\"bio-text\">Som It nadšenec a vytváram webové stránky.</h2>\n<!-- Social Icons --><hr /><a rel=\"noopener\" href=\"https://www.instagram.com\" target=\"_blank\" class=\"text-decoration-none\"> </a> <!-- Language Toggle Buttons -->\n<div class=\"lang-toggle mt-5\"><button class=\"btn btn-lang\">EN</button> <button class=\"btn btn-lang\">SK</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1249, 1019, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1251, 1019, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1253, 1019, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1255, 1019, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
 
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1262, 1020, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex justify-content-between align-items-center\">\n<div class=\"circle-container\">\n<div class=\"circle-outer\"></div>\n<div class=\"profile-img my-4\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"profileimg\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n<h1 class=\"fw-bold\">Nikola Vaniščáková</h1>\n<p class=\"text-muted\">👋 Ahojte!</p>\n<h2 class=\"bio-text\">Som It nadšenec a vytváram webové stránky.</h2>\n<!-- Social Icons --><hr /><a rel=\"noopener\" href=\"https://www.instagram.com\" target=\"_blank\" class=\"text-decoration-none\"> </a> <!-- Language Toggle Buttons -->\n<div class=\"lang-toggle mt-5\"><button class=\"btn btn-lang\">EN</button> <button class=\"btn btn-lang\">SK</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1264, 1020, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1266, 1020, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1268, 1020, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1270, 1020, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1272, 1021, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex justify-content-between align-items-center\">\n<div class=\"circle-container\">\n<div class=\"circle-outer\"></div>\n<div class=\"profile-img my-4\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"profileimg\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n<h1 class=\"fw-bold\">Nikola Vaniščáková</h1>\n<p class=\"text-muted\">👋 Ahojte!</p>\n<h2>Som It nadšenec a vytváram webové stránky.</h2>\n<!-- Social Icons --><hr /><a rel=\"noopener\" href=\"https://www.instagram.com\" target=\"_blank\" class=\"text-decoration-none\"> </a> <!-- Language Toggle Buttons -->\n<div class=\"lang-toggle mt-5\"><button class=\"btn btn-lang\">EN</button> <button class=\"btn btn-lang\">SK</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1274, 1021, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1276, 1021, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1278, 1021, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1280, 1021, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1287, 1022, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container text-center\">\n<div class=\"d-flex justify-content-between align-items-center\">\n<div class=\"circle-container\">\n<div class=\"circle-outer\"></div>\n<div class=\"profile-img my-4\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"profileimg\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n<h1 class=\"fw-bold\">Nikola Vaniščáková</h1>\n<p class=\"text-muted\">👋 Ahojte!</p>\n<h2>Som It nadšenec a vytváram webové stránky.</h2>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1289, 1022, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1291, 1022, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1293, 1022, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1295, 1022, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1302, 1023, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container mt-5\">\n<div class=\"text-center\">\n<p class=\"text-primary\">Ahoj, som</p>\n<h1 class=\"display-3 fw-bold\">Nikola Vaniščáková</h1>\n<h2 class=\"display-5 fw-bold\"><span id=\"typing-text\"></span> <span class=\"cursor\">|</span></h2>\n<p class=\"mt-4\">Som full stack web developer s nadšením pre It. Špecializujem sa na Umbraco, C#, JavaSkript ale rada sa naučím aj niečo iné.</p>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1304, 1023, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1306, 1023, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1308, 1023, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1310, 1023, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1317, 1024, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container mt-5\">\n<div class=\"text-center\">\n<p class=\"text-primary\">Ahoj, som</p>\n<h1 class=\"display-3 fw-bold\">Nikola Vaniščáková</h1>\n<p class=\"mt-4\">Som full stack web developer s nadšením pre It. Špecializujem sa na Umbraco, C#, JavaSkript ale rada sa naučím aj niečo iné.</p>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1319, 1024, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1321, 1024, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1323, 1024, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1325, 1024, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1332, 1025, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container mt-5\">\n<div class=\"text-center\">\n<p class=\"text-primary\">Ahoj, som</p>\n<h1 class=\"display-3 fw-bold\">Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<p class=\"mt-4\">Špecializujem sa na Umbraco, C#, JavaSkript ale rada sa naučím aj niečo iné.</p>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1334, 1025, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1336, 1025, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1338, 1025, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1340, 1025, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1347, 1026, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container mt-10\">\n<div class=\"text-center\">\n<p class=\"text-primary\">Ahoj, som</p>\n<h1 class=\"display-3 fw-bold\">Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<p class=\"mt-4\">Špecializujem sa na Umbraco, C#, JavaSkript ale rada sa naučím aj niečo iné.</p>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1349, 1026, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1351, 1026, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1353, 1026, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1355, 1026, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1362, 1027, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"text\">\n<div class=\"text-center\">\n<p class=\"text-primary\">Ahoj, som</p>\n<h1 class=\"display-3 fw-bold\">Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<p class=\"mt-4\">Špecializujem sa na Umbraco, C#, JavaSkript ale rada sa naučím aj niečo iné.</p>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1364, 1027, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1366, 1027, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1368, 1027, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1370, 1027, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1372, 1028, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"text\">\n<p class=\"text-primary\">Ahoj, som</p>\n<h1 class=\"display-3 fw-bold\">Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<p class=\"mt-4\">Špecializujem sa na Umbraco, C#, JavaSkript ale rada sa naučím aj niečo iné.</p>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1374, 1028, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1376, 1028, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1378, 1028, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1380, 1028, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1387, 1029, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"text\">\n<p class=\"text-primary\">Ahoj, som</p>\n<h1 class=\"display-3 fw-bold\">Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C#, JavaSkript ale rada sa naučím aj niečo iné.</h2>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1389, 1029, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1391, 1029, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1393, 1029, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1395, 1029, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1402, 1030, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"text\">\n<p class=\"text-primary\">Ahoj, som</p>\n<h1 class=\"display-3 fw-bold\">Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C#, JavaSkript ale rada sa naučím aj niečo iné.</h2>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1404, 1030, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1406, 1030, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1408, 1030, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1410, 1030, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1417, 1031, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"text\">\n<p class=\"text-primary\">Ahoj, som</p>\n<h1>Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C#, JavaSkript ale rada sa naučím aj niečo iné.</h2>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1419, 1031, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1421, 1031, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1423, 1031, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1425, 1031, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1432, 1032, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"centered-text\">\n<p class=\"text-primary\">Ahoj, som</p>\n<h1>Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C#, JavaSkript ale rada sa naučím aj niečo iné.</h2>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1434, 1032, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1436, 1032, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1438, 1032, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1440, 1032, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1447, 1033, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"centered-text\">\n<p class=\"text-primary\">Ahoj, som</p>\n<h1>Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C#, JavaSkript ale rada sa naučím aj niečo iné.</h2>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1449, 1033, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1451, 1033, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1453, 1033, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1455, 1033, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1462, 1034, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"centered-text\">\n<p class=\"text-primary\">Ahoj, volám sa</p>\n<h1>Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C#, JavaSkript ale rada sa naučím aj niečo iné.</h2>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1464, 1034, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1466, 1034, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1468, 1034, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1470, 1034, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1472, 1035, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"centered-text\">\n<p class=\"text-primary\">Ahoj, volám sa</p>\n<h1>Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C# a JavaSkript ale rada sa naučím aj niečo iné.</h2>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1474, 1035, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1476, 1035, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1478, 1035, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1480, 1035, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1482, 1036, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"centered-text\">\n<p class=\"text-primary\">Ahoj, volám sa</p>\n<h1>Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C# a JavaSkript ale rada sa naučím aj niečo iné.</h2>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1484, 1036, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1486, 1036, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1488, 1036, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1490, 1036, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1492, 1037, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"centered-text\">\n<p class=\"text-primary\">Ahoj, volám sa</p>\n<h1>Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C# a JavaSkript ale rada sa naučím aj niečo iné.</h2>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1494, 1037, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1496, 1037, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1498, 1037, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1500, 1037, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1507, 1039, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"996afdda-e6e0-a577-006a-56ce66508a38","areas":[{"grid":"4","controls":[],"styles":null,"config":null},{"grid":"8","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1509, 1039, 38, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1511, 1039, 39, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1513, 1039, 41, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1515, 1039, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1517, 1041, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"2 column layout","sections":[{"grid":"4","rows":[]},{"grid":"8","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1519, 1041, 38, NULL, NULL, NULL, NULL, NULL, N'Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1521, 1041, 39, NULL, NULL, NULL, NULL, NULL, N' Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1523, 1041, 41, NULL, NULL, NULL, NULL, NULL, N' Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1525, 1041, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
 
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1527, 1042, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"99364ba5-75f5-83f1-a98b-7287f81e72b9","areas":[{"grid":"4","controls":[],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"contactForm","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1529, 1042, 38, NULL, NULL, NULL, NULL, NULL, N'Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1531, 1042, 39, NULL, NULL, NULL, NULL, NULL, N' Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1533, 1042, 41, NULL, NULL, NULL, NULL, NULL, N' Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1535, 1042, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1537, 1040, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"996afdda-e6e0-a577-006a-56ce66508a38","areas":[{"grid":"4","controls":[{"value":"<p><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1539, 1040, 38, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1541, 1040, 39, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1543, 1040, 41, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1545, 1040, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1547, 1044, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"996afdda-e6e0-a577-006a-56ce66508a38","areas":[{"grid":"4","controls":[{"value":"<p><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":"<h1>Vzdelanie</h1>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1549, 1044, 38, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1551, 1044, 39, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1553, 1044, 41, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1555, 1044, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1557, 1045, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"996afdda-e6e0-a577-006a-56ce66508a38","areas":[{"grid":"4","controls":[{"value":"<p><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":"<h1>Vzdelanie</h1>\n<p>2014 - 2018 Stredná škola Podnikania</p>\n<p>Interierový dizajn</p>\n<p>2018 - 2020 Architektúra a Urbanizmus</p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1559, 1045, 38, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1561, 1045, 39, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1563, 1045, 41, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1565, 1045, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1567, 1038, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container my-5\">\n<div class=\"row justify-content-center text-center\">\n<div class=\"col-md-8\">\n<p class=\"text-muted mb-0\">Ahoj, som</p>\n<h1 class=\"display-4 font-weight-bold\">Erik Masný</h1>\n<h2 class=\"display-5 text-secondary\"><span class=\"typing-cursor\">|</span></h2>\n<p class=\"mt-4 text-muted\">Špecializujem sa na Umbraco, C# a JavaSkript ale rada sa naučím aj niečo iné.</p>\n<a href=\"#about\" class=\"btn btn-outline-primary mt-3\">Chcem vedieť viac</a></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1569, 1038, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1571, 1038, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1573, 1038, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1575, 1038, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1577, 1047, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container my-5\">\n<div class=\"row justify-content-center text-center\">\n<div class=\"col-md-8\">\n<p class=\"text-muted mb-0\">Ahoj, som</p>\n<h1 class=\"display-4 font-weight-bold\">Nikola Vaniščáková</h1>\n<h2 class=\"display-5 text-secondary\"><span class=\"typing-cursor\">|</span></h2>\n<p class=\"mt-4 text-muted\">Špecializujem sa na Umbraco, C# a JavaSkript ale rada sa naučím aj niečo iné.</p>\n<a href=\"#about\" class=\"btn btn-outline-primary mt-3\">Chcem vedieť viac</a></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1579, 1047, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1581, 1047, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1583, 1047, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1585, 1047, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1592, 1048, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container my-5\">\n<div class=\"row justify-content-center text-center\">\n<div class=\"col-md-8\">\n<p class=\"text-muted mb-0\">Ahoj, som</p>\n<h1 class=\"display-4 font-weight-bold\">Nikola Vaniščáková</h1>\n<p class=\"mt-4 text-muted\">Špecializujem sa na Umbraco, C# a JavaSkript ale rada sa naučím aj niečo iné.</p>\n<a href=\"#about\" class=\"btn btn-outline-primary mt-3\">Chcem vedieť viac</a></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1594, 1048, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1596, 1048, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1598, 1048, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1600, 1048, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1607, 1049, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container my-5\">\n<div class=\"row justify-content-center text-center\">\n<div class=\"col-md-8\">\n<p class=\"text-muted mb-0\">Ahoj, som</p>\n<h1 class=\"display-4 font-weight-bold\">Nikola Vaniščáková</h1>\n<p class=\"mt-4 text-muted\">Špecializujem sa na Umbraco, C# a JavaSkript ale rada sa naučím aj niečo iné.</p>\n<a href=\"#about\" class=\"btn btn-outline-primary mt-3\">Chcem vedieť viac</a></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1609, 1049, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1611, 1049, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1613, 1049, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1615, 1049, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1622, 1050, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container my-5\">\n<div class=\"row justify-content-center text-center\">\n<div class=\"col-md-8\">\n<p class=\"text-muted mb-0\">Ahoj, som</p>\n<h1 class=\"display-4 font-weight-bold\">Nikola Vaniščáková</h1>\n<h2 class=\"display-5 text-secondary\"><span class=\"typing-cursor\">|</span></h2>\n<p class=\"mt-4 text-muted\">Špecializujem sa na Umbraco, C# a JavaSkript ale rada sa naučím aj niečo iné.</p>\n<a href=\"#about\" class=\"btn btn-outline-primary mt-3\">Chcem vedieť viac</a></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1624, 1050, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1626, 1050, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1628, 1050, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1630, 1050, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1637, 1051, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container my-5\">\n<div class=\"row justify-content-center text-center\">\n<div class=\"col-md-8\">\n<p class=\"text-muted mb-0\">Ahoj, som</p>\n<h1 class=\"display-4 font-weight-bold\">Nikola Vaniščáková</h1>\n<h2 class=\"display-5 text-secondary\">SOm full stack web developer<span class=\"typing-cursor\"></span></h2>\n<p class=\"mt-4 text-muted\">Špecializujem sa na Umbraco, C# a JavaSkript ale rada sa naučím aj niečo iné.</p>\n<a href=\"#about\" class=\"btn btn-outline-primary mt-3\">Chcem vedieť viac</a></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1639, 1051, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1641, 1051, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1643, 1051, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1645, 1051, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1647, 1052, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container my-5\">\n<div class=\"row justify-content-center text-center\">\n<div class=\"col-md-8\">\n<p class=\"text-muted mb-0\">Ahoj, som</p>\n<h1 class=\"display-4 font-weight-bold\">Nikola Vaniščáková</h1>\n<h2 class=\"display-5 text-secondary\">SOm full stack web developer<span class=\"typing-cursor\"></span></h2>\n<p class=\"mt-4 text-muted\">Špecializujem sa na Umbraco, C# a JavaSkript ale rada sa naučím aj niečo iné.</p>\n<a href=\"#about\" class=\"btn btn-outline-primary mt-3\">Chcem vedieť viac</a></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1649, 1052, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1651, 1052, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1653, 1052, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1655, 1052, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1657, 1053, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container my-5\">\n<div class=\"row justify-content-center text-center\">\n<div class=\"col-md-8\">\n<p class=\"text-muted mb-0\">Ahoj, som</p>\n<h1 class=\"display-4 font-weight-bold\">Nikola Vaniščáková</h1>\n<h2 class=\"display-5 text-secondary\">Som full stack web developer<span class=\"typing-cursor\"></span></h2>\n<p class=\"mt-4 text-muted\">Špecializujem sa na Umbraco, C# a JavaSkript ale rada sa naučím aj niečo iné.</p>\n<a href=\"#about\" class=\"btn btn-outline-primary mt-3\">Chcem vedieť viac</a></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1659, 1053, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1661, 1053, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1663, 1053, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1665, 1053, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1672, 1054, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"centered-text\">\n<p class=\"text-primary\">Ahoj, volám sa</p>\n<h1>Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C# a JavaSkript ale rada sa naučím aj niečo iné.</h2>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1674, 1054, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1676, 1054, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1678, 1054, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1680, 1054, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1687, 1055, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container\">\n<div class=\"row justify-content-center\">\n<div class=\"col-12 col-md-10 centered-text\">\n<p class=\"text-primary\">Ahoj, volám sa</p>\n<h1 class=\"display-1\">Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C# a JavaScript, ale rada sa naučím aj niečo iné.</h2>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1689, 1055, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1691, 1055, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1693, 1055, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1695, 1055, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1697, 1056, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container\">\n<div class=\"row justify-content-center\">\n<div class=\"col-12 col-md-10 centered-text\">\n<p class=\"text-primary\">Ahoj, volám sa</p>\n<h1 class=\"display-1\">Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C# a JavaScript, ale rada sa naučím aj niečo iné.</h2>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1699, 1056, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1701, 1056, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1703, 1056, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1705, 1056, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1707, 1046, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"996afdda-e6e0-a577-006a-56ce66508a38","areas":[{"grid":"4","controls":[{"value":"<p><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"contactForm","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1709, 1046, 38, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1711, 1046, 39, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1713, 1046, 41, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1715, 1046, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1717, 1043, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"three","id":"10d55b3a-27c6-5476-785f-6a5ad0e8b5ba","areas":[{"grid":"4","controls":[{"value":"<p><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"4","controls":[{"value":"","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"4","controls":[{"value":{"macroAlias":"contactForm","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1719, 1043, 38, NULL, NULL, NULL, NULL, NULL, N'Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1721, 1043, 39, NULL, NULL, NULL, NULL, NULL, N' Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1723, 1043, 41, NULL, NULL, NULL, NULL, NULL, N' Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1725, 1043, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1727, 1059, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"three","id":"10d55b3a-27c6-5476-785f-6a5ad0e8b5ba","areas":[{"grid":"4","controls":[{"value":"<p><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"4","controls":[{"value":"","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"4","controls":[{"value":{"macroAlias":"contactForm","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1729, 1059, 38, NULL, NULL, NULL, NULL, NULL, N'Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1731, 1059, 39, NULL, NULL, NULL, NULL, NULL, N' Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1733, 1059, 41, NULL, NULL, NULL, NULL, NULL, N' Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1735, 1059, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1737, 1058, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"996afdda-e6e0-a577-006a-56ce66508a38","areas":[{"grid":"4","controls":[{"value":"<p><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"education","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1739, 1058, 38, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1741, 1058, 39, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1743, 1058, 41, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1745, 1058, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1747, 1061, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"996afdda-e6e0-a577-006a-56ce66508a38","areas":[{"grid":"4","controls":[{"value":"<p><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"education","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1749, 1061, 38, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1751, 1061, 39, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1753, 1061, 41, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1755, 1061, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
 
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1757, 1057, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container\">\n<div class=\"row justify-content-flex-start\">\n<div class=\"col-12 col-md-10 centered-text\">\n<p class=\"text-primary\">Ahoj, volám sa</p>\n<h1 class=\"display-1\">Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C# a JavaScript, ale rada sa naučím aj niečo iné.</h2>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1759, 1057, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1761, 1057, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1763, 1057, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1765, 1057, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1772, 1063, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container-fluid\">\n<div class=\"row justify-content-flex-start\">\n<div class=\"col-12 col-md-10 centered-text\">\n<p class=\"text-primary\">Ahoj, volám sa</p>\n<h1 class=\"display-1\">Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C# a JavaScript, ale rada sa naučím aj niečo iné.</h2>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1774, 1063, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1776, 1063, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1778, 1063, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1780, 1063, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1787, 1064, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container-fluid\">\n<div class=\"row justify-content-flex-start\">\n<div class=\"col-12 col-md-10 centered-text\">\n<p class=\"text-primary\">Ahoj, volám sa</p>\n<h1 class=\"display-1\">Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C# a JavaScript, ale rada sa naučím aj niečo iné.</h2>\n<button class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</button></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1789, 1064, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1791, 1064, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1793, 1064, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1795, 1064, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1797, 1065, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container-fluid\">\n<div class=\"row justify-content-flex-start\">\n<div class=\"col-12 col-md-10 centered-text\">\n<p class=\"text-primary\">Ahoj, volám sa</p>\n<h1 class=\"display-1\">Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C# a JavaScript, ale rada sa naučím aj niečo iné.</h2>\n<a href=\"/vzdelanie\" class=\"btn btn-outline-primary mt-4\">Chcem vedieť viac</a></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1799, 1065, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1801, 1065, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1803, 1065, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1805, 1065, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1812, 1060, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"three","id":"10d55b3a-27c6-5476-785f-6a5ad0e8b5ba","areas":[{"grid":"4","controls":[{"value":"<div>\n<div class=\"backgraound\"></div>\n<p><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></p>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"4","controls":[{"value":"","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"4","controls":[{"value":{"macroAlias":"contactForm","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1814, 1060, 38, NULL, NULL, NULL, NULL, NULL, N'Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1816, 1060, 39, NULL, NULL, NULL, NULL, NULL, N' Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1818, 1060, 41, NULL, NULL, NULL, NULL, NULL, N' Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1820, 1060, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1822, 1062, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"996afdda-e6e0-a577-006a-56ce66508a38","areas":[{"grid":"4","controls":[{"value":"<div>\n<div class=\"backgraound\"></div>\n<p><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></p>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"education","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1824, 1062, 38, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1826, 1062, 39, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1828, 1062, 41, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1830, 1062, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1832, 1068, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"996afdda-e6e0-a577-006a-56ce66508a38","areas":[{"grid":"4","controls":[{"value":"<div id=\"vzdelanie-content\">\n<div class=\"image-wrapper\">\n<div class=\"image-background\"></div>\n<img src=\"/path_to_image.jpg\" alt=\"Profilová fotka\" /></div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"education","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1834, 1068, 38, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1836, 1068, 39, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1838, 1068, 41, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1840, 1068, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1847, 1069, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"996afdda-e6e0-a577-006a-56ce66508a38","areas":[{"grid":"4","controls":[{"value":"<div id=\"vzdelanie-content\">\n<div class=\"image-wrapper\">\n<div class=\"image-background\"></div>\n<img src=\"?width=374.99999999999994&amp;height=500\" alt=\"fotka\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"education","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1849, 1069, 38, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1851, 1069, 39, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1853, 1069, 41, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1855, 1069, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1862, 1070, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"996afdda-e6e0-a577-006a-56ce66508a38","areas":[{"grid":"4","controls":[{"value":"<div id=\"vzdelanie-content\">\n<div class=\"image-wrapper\">\n<div class=\"image-background\"></div>\n<img src=\"?width=374.99999999999994&amp;height=500\" alt=\"fotka\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"education","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1864, 1070, 38, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1866, 1070, 39, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1868, 1070, 41, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1870, 1070, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1877, 1071, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"996afdda-e6e0-a577-006a-56ce66508a38","areas":[{"grid":"4","controls":[{"value":"<div class=\"image-wrapper\">\n<div class=\"image-background\"></div>\n<img src=\"?width=374.99999999999994&amp;height=500\" alt=\"fotka\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"education","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1879, 1071, 38, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1881, 1071, 39, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1883, 1071, 41, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1885, 1071, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1892, 1072, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"996afdda-e6e0-a577-006a-56ce66508a38","areas":[{"grid":"4","controls":[{"value":"<div id=\"vzdelanie-content\">\n<div class=\"image-wrapper\">\n<div class=\"image-background\"></div>\n<img src=\"?width=374.99999999999994&amp;height=500\" alt=\"fotka\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"education","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1894, 1072, 38, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1896, 1072, 39, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1898, 1072, 41, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1900, 1072, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1907, 1073, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"996afdda-e6e0-a577-006a-56ce66508a38","areas":[{"grid":"4","controls":[{"value":"<div id=\"vzdelanie-section\">\n<div id=\"vzdelanie-content\">\n<div class=\"image-wrapper\">\n<div class=\"image-background\"></div>\n<img src=\"?width=374.99999999999994&amp;height=500\" alt=\"fotka\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"education","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1909, 1073, 38, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1911, 1073, 39, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1913, 1073, 41, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1915, 1073, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1922, 1074, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"996afdda-e6e0-a577-006a-56ce66508a38","areas":[{"grid":"4","controls":[{"value":"<div id=\"vzdelanie-section\">\n<div id=\"vzdelanie-content\">\n<div class=\"image-wrapper\">\n<div class=\"image-background\"></div>\n<img src=\"?width=374.99999999999994&amp;height=300\" alt=\"fotka\" width=\"374.99999999999994\" height=\"300\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"education","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1924, 1074, 38, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1926, 1074, 39, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1928, 1074, 41, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1930, 1074, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1937, 1075, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"996afdda-e6e0-a577-006a-56ce66508a38","areas":[{"grid":"4","controls":[{"value":"<div id=\"vzdelanie-section\">\n<div id=\"vzdelanie-content\">\n<div class=\"image-wrapper\">\n<div class=\"image-background\"></div>\n<img src=\"?width=374.99999999999994&amp;height=500\" alt=\"fotka\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"education","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1939, 1075, 38, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1941, 1075, 39, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1943, 1075, 41, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1945, 1075, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1952, 1076, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"996afdda-e6e0-a577-006a-56ce66508a38","areas":[{"grid":"4","controls":[{"value":"<div id=\"vzdelanie-section\">\n<div id=\"vzdelanie-content\">\n<div class=\"image-wrapper\">\n<div class=\"image-background\"></div>\n<div class=\"image\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"fotka\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"education","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1954, 1076, 38, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1956, 1076, 39, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1958, 1076, 41, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1960, 1076, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1962, 1067, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"4/8","id":"2ec1639d-2f69-5acf-6009-d1b63730c1e8","areas":[{"grid":"4","controls":[{"value":"<p><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"contactForm","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1964, 1067, 38, NULL, NULL, NULL, NULL, NULL, N'Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1966, 1067, 39, NULL, NULL, NULL, NULL, NULL, N' Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1968, 1067, 41, NULL, NULL, NULL, NULL, NULL, N' Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1970, 1067, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1977, 1078, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"4/8","id":"2ec1639d-2f69-5acf-6009-d1b63730c1e8","areas":[{"grid":"4","controls":[{"value":"<p><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"contactForm","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1979, 1078, 38, NULL, NULL, NULL, NULL, NULL, N'Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1981, 1078, 39, NULL, NULL, NULL, NULL, NULL, N' Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1983, 1078, 41, NULL, NULL, NULL, NULL, NULL, N' Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1985, 1078, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1992, 1079, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"4/8","id":"2ec1639d-2f69-5acf-6009-d1b63730c1e8","areas":[{"grid":"4","controls":[{"value":"<div id=\"vzdelanie-section\">\n<div id=\"vzdelanie-content\">\n<div class=\"image-wrapper\">\n<div class=\"image-background\"></div>\n<div class=\"image\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"fotka\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"contactForm","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1994, 1079, 38, NULL, NULL, NULL, NULL, NULL, N'Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1996, 1079, 39, NULL, NULL, NULL, NULL, NULL, N' Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1998, 1079, 41, NULL, NULL, NULL, NULL, NULL, N' Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2000, 1079, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2007, 1080, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"4/8","id":"2ec1639d-2f69-5acf-6009-d1b63730c1e8","areas":[{"grid":"4","controls":[{"value":"<div id=\"vzdelanie-section\">\n<div id=\"vzdelanie-content\">\n<div class=\"image-wrapper\">\n<div class=\"image-background\"></div>\n<div class=\"image\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"fotka\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"contactForm","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2009, 1080, 38, NULL, NULL, NULL, NULL, NULL, N'Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2011, 1080, 39, NULL, NULL, NULL, NULL, NULL, N' Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2013, 1080, 41, NULL, NULL, NULL, NULL, NULL, N' Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2015, 1080, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2022, 1082, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2024, 1082, 38, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2026, 1082, 39, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2028, 1082, 41, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2030, 1082, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
 
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2032, 1077, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"996afdda-e6e0-a577-006a-56ce66508a38","areas":[{"grid":"4","controls":[{"value":"<div id=\"vzdelanie-section\">\n<div id=\"vzdelanie-content\">\n<div class=\"image-wrapper\">\n<div class=\"image-background\"></div>\n<div class=\"image\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"fotka\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"education","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2034, 1077, 38, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2036, 1077, 39, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2038, 1077, 41, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2040, 1077, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2042, 1066, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container-fluid\">\n<div class=\"row justify-content-flex-start\">\n<div class=\"col-12 col-md-10 centered-text\">\n<p class=\"text-primary\">Ahoj, volám sa</p>\n<h1 class=\"display-1\">Nikola Vaniščáková</h1>\n<span id=\"typing-text\"></span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C# a JavaScript, ale rada sa naučím aj niečo iné.</h2>\n<a href=\"/vzdelanie\" class=\"btn\">Chcem vedieť viac</a></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2044, 1066, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2046, 1066, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2048, 1066, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2050, 1066, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2071, 1083, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2073, 1083, 38, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2075, 1083, 39, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2077, 1083, 41, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2079, 1083, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3062, 1086, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"4/8","id":"0e80d894-5848-4c2a-97f5-ed3b5cd5a28f","areas":[{"grid":"4","controls":[{"value":"","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3064, 1086, 38, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3066, 1086, 39, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3068, 1086, 41, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3070, 1086, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3072, 2087, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/340jbucn/screenshot-2024-12-06-115749.png","crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3073, 2087, 7, NULL, NULL, 2539, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3074, 2087, 8, NULL, NULL, 1186, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3075, 2087, 9, NULL, NULL, NULL, NULL, NULL, N'1496658', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3076, 2087, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3077, 2086, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"4/8","id":"0e80d894-5848-4c2a-97f5-ed3b5cd5a28f","areas":[{"grid":"4","controls":[{"value":"<p><img src=\"?width=500&amp;height=233.55651831429697\" alt=\"\" width=\"500\" height=\"233.55651831429697\" data-udi=\"umb://media/d080b5e94f4d470684587e22e30893af\" /></p>\n<p> </p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":"<h1>Plant Oasis</h1>\n<p>E-shop s mäsožravými rastlinamy,bonai a riasogule</p>\n<p><a href=\"https://plant-oasis.sk\">Navštív E-shop</a></p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3079, 2086, 38, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3081, 2086, 39, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3083, 2086, 41, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3085, 2086, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3087, 2088, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"4/8","id":"0e80d894-5848-4c2a-97f5-ed3b5cd5a28f","areas":[{"grid":"4","controls":[{"value":"<p><img src=\"?width=500&amp;height=233.55651831429697\" alt=\"\" width=\"500\" height=\"233.55651831429697\" data-udi=\"umb://media/d080b5e94f4d470684587e22e30893af\" /></p>\n<p> </p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":"<h1>Plant Oasis</h1>\n<p>E-shop s mäsožravými rastlinamy,bonai a riasogule</p>\n<p><a href=\"https://plant-oasis.sk\">Navštív E-shop</a></p>\n<p><a href=\"https://github.com/NicolVan/plantOasis/tree/main/PlantOasis\">Kód tu</a></p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3089, 2088, 38, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3091, 2088, 39, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3093, 2088, 41, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3095, 2088, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3102, 2089, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"4/8","id":"0e80d894-5848-4c2a-97f5-ed3b5cd5a28f","areas":[{"grid":"4","controls":[{"value":"<p><img class=\"eshop\" src=\"?width=500&amp;height=233.55651831429697\" alt=\"\" width=\"500\" height=\"233.55651831429697\" data-udi=\"umb://media/d080b5e94f4d470684587e22e30893af\" /></p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":"<h1>Plant Oasis</h1>\n<p>E-shop s mäsožravými rastlinamy,bonai a riasogule</p>\n<p><a href=\"https://plant-oasis.sk\">Navštív E-shop</a></p>\n<p><a href=\"https://github.com/NicolVan/plantOasis/tree/main/PlantOasis\">Kód tu</a></p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3104, 2089, 38, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3106, 2089, 39, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3108, 2089, 41, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3110, 2089, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3112, 2090, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"4/8","id":"0e80d894-5848-4c2a-97f5-ed3b5cd5a28f","areas":[{"grid":"4","controls":[{"value":"<h1>Plant Oasis</h1>\n<p>E-shop s mäsožravými rastlinamy,bonai a riasogule</p>\n<p><a href=\"https://plant-oasis.sk\">Navštív E-shop</a></p>\n<p><a href=\"https://github.com/NicolVan/plantOasis/tree/main/PlantOasis\">Kód tu</a></p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":"<p><img class=\"eshop\" src=\"?width=500&amp;height=233.55651831429697\" alt=\"\" width=\"500\" height=\"233.55651831429697\" data-udi=\"umb://media/d080b5e94f4d470684587e22e30893af\" /></p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3114, 2090, 38, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3116, 2090, 39, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3118, 2090, 41, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3120, 2090, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3127, 2091, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"ca79842f-d2dd-22b3-f934-b8294f68ade5","areas":[{"grid":"12","controls":[{"value":{"macroAlias":"plantoasis","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3129, 2091, 38, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3131, 2091, 39, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3133, 2091, 41, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3135, 2091, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3137, 2093, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"86613b3c-a6c3-5176-8270-4deca0bd45f6","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3139, 2093, 38, NULL, NULL, NULL, NULL, NULL, N'PlantOasis', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3141, 2093, 39, NULL, NULL, NULL, NULL, NULL, N'PlantOasis', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3143, 2093, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3145, 2092, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"ca79842f-d2dd-22b3-f934-b8294f68ade5","areas":[{"grid":"12","controls":[{"value":{"macroAlias":"plantoasis","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null},{"value":{"macroAlias":"project","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3147, 2092, 38, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3149, 2092, 39, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3151, 2092, 41, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3153, 2092, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3155, 2094, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"86613b3c-a6c3-5176-8270-4deca0bd45f6","areas":[{"grid":"12","controls":[{"value":{"macroAlias":"plantoasis","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3157, 2094, 38, NULL, NULL, NULL, NULL, NULL, N'PlantOasis', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3159, 2094, 39, NULL, NULL, NULL, NULL, NULL, N'PlantOasis', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3161, 2094, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3163, 2096, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"86613b3c-a6c3-5176-8270-4deca0bd45f6","areas":[{"grid":"12","controls":[{"value":{"macroAlias":"plantoasis","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3165, 2096, 38, NULL, NULL, NULL, NULL, NULL, N'PlantOasis', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3167, 2096, 39, NULL, NULL, NULL, NULL, NULL, N'PlantOasis', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3169, 2096, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3171, 2097, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"86613b3c-a6c3-5176-8270-4deca0bd45f6","areas":[{"grid":"12","controls":[{"value":{"macroAlias":"plantoasis","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3172, 2098, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"86613b3c-a6c3-5176-8270-4deca0bd45f6","areas":[{"grid":"12","controls":[{"value":{"macroAlias":"plantoasis","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3173, 2097, 38, NULL, NULL, NULL, NULL, NULL, N'PlantOasis', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3174, 2098, 38, NULL, NULL, NULL, NULL, NULL, N'PlantOasis', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3175, 2097, 39, NULL, NULL, NULL, NULL, NULL, N'PlantOasis', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3176, 2098, 39, NULL, NULL, NULL, NULL, NULL, N'PlantOasis', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3177, 2097, 40, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3178, 2098, 40, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3179, 2095, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"ca79842f-d2dd-22b3-f934-b8294f68ade5","areas":[{"grid":"12","controls":[{"value":{"macroAlias":"project","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3181, 2095, 38, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3183, 2095, 39, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3185, 2095, 41, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3187, 2095, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3189, 1085, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container-fluid\">\n<div class=\"row justify-content-flex-start\">\n<div class=\"col-12 col-md-10 centered-text\">\n<p class=\"text-primary\">Ahoj, volám sa</p>\n<h1 class=\"display-1\">Nikola Vaniščáková</h1>\n<span id=\"typing-text\">Som junior fullstack developer</span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C# a JavaScript, ale rada sa naučím aj niečo iné.</h2>\n<a href=\"/vzdelanie\" class=\"btn\">Chcem vedieť viac</a></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"451409b1-2aef-a23c-a3b6-2f08f2c57319","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3191, 1085, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3193, 1085, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3195, 1085, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3197, 1085, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3199, 2100, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container-fluid\">\n<div class=\"row justify-content-flex-start\">\n<div class=\"col-12 col-md-10 centered-text\">\n<p class=\"text-primary\">Ahoj, volám sa</p>\n<h1 class=\"display-1\">Nikola Vaniščáková</h1>\n<span id=\"typing-text\">Som junior fullstack developer</span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C# a JavaScript, ale rada sa naučím aj niečo iné.</h2>\n<a href=\"/projekty\" class=\"btn\">Chcem vedieť viac</a></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3201, 2100, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3203, 2100, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3205, 2100, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3207, 2100, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3209, 2102, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"d80f9c7d-069f-2703-1919-52d5ccf76d8f","areas":[{"grid":"12","controls":[],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3211, 2102, 38, NULL, NULL, NULL, NULL, NULL, N'Recipe App', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3213, 2102, 39, NULL, NULL, NULL, NULL, NULL, N'Recipe App', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3215, 2102, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3217, 2104, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/yjgno5w2/recipe-app.png","crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3218, 2104, 7, NULL, NULL, 1943, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3219, 2104, 8, NULL, NULL, 1283, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3220, 2104, 9, NULL, NULL, NULL, NULL, NULL, N'719513', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3221, 2104, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3222, 2105, 38, NULL, NULL, NULL, NULL, NULL, N'Moj osobny blog', NULL)
 
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3224, 2105, 39, NULL, NULL, NULL, NULL, NULL, N'Moj osobny blog', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3226, 2105, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3228, 2109, 38, NULL, NULL, NULL, NULL, NULL, N'Nikola Vaniscak', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3230, 2109, 39, NULL, NULL, NULL, NULL, NULL, N'Nikola Vaniscak', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3232, 2109, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3234, 2109, 1045, NULL, NULL, NULL, NULL, NULL, NULL, N'<p>Som junior programator</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3236, 2113, 38, NULL, NULL, NULL, NULL, NULL, N'Moje zoznamovanie sa s programovanim', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3238, 2113, 39, NULL, NULL, NULL, NULL, NULL, N'Moje zoznamovanie sa s programovanim', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3240, 2113, 41, NULL, NULL, NULL, NULL, NULL, N'Moje zoznamovanie sa s programovanim', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3242, 2113, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3244, 2115, 38, NULL, NULL, NULL, NULL, NULL, N'Moje prve programovanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3246, 2115, 39, NULL, NULL, NULL, NULL, NULL, N'Moje prve programovanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3248, 2115, 41, NULL, NULL, NULL, NULL, NULL, N'Moje prve programovanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3250, 2115, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3252, 2115, 1039, NULL, NULL, NULL, NULL, NULL, N'umb://document/2c9e5d33b73e42ef909434bbe347d42c', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3254, 2115, 1040, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"d6fcfe5f-b4b1-9a04-65a7-9a0f1516a754","areas":[{"grid":"12","controls":[{"value":"<p>zxzxxcas</p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3256, 2115, 1041, NULL, NULL, NULL, NULL, NULL, NULL, N'xcxcxzc')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3258, 2115, 1043, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://document/f1b8c0f9fb094153a0d43a4f260299a7')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3263, 2106, 38, NULL, NULL, NULL, NULL, NULL, N'Moj osobny blog', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3265, 2106, 39, NULL, NULL, NULL, NULL, NULL, N'Moj osobny blog', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3267, 2106, 41, NULL, NULL, NULL, NULL, NULL, N'Blog', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3269, 2106, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3275, 1084, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Article","id":"996afdda-e6e0-a577-006a-56ce66508a38","areas":[{"grid":"4","controls":[{"value":"<div id=\"vzdelanie-section\">\n<div id=\"vzdelanie-content\">\n<div class=\"image-wrapper\">\n<div class=\"image-background\"></div>\n<div class=\"image\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"fotka\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"education","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3276, 1084, 38, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3277, 1084, 39, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3278, 1084, 41, NULL, NULL, NULL, NULL, NULL, N'Vzdelanie', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3279, 1084, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3280, 2099, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"ca79842f-d2dd-22b3-f934-b8294f68ade5","areas":[{"grid":"12","controls":[{"value":{"macroAlias":"project","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3281, 2099, 38, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3282, 2099, 39, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3283, 2099, 41, NULL, NULL, NULL, NULL, NULL, N'Projekty', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3284, 2099, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3285, 1081, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"4/8","id":"2ec1639d-2f69-5acf-6009-d1b63730c1e8","areas":[{"grid":"4","controls":[{"value":"<div id=\"vzdelanie-section\">\n<div id=\"vzdelanie-content\">\n<div class=\"image-wrapper\">\n<div class=\"image-background\"></div>\n<div class=\"image\"><img src=\"?width=374.99999999999994&amp;height=500\" alt=\"fotka\" width=\"374.99999999999994\" height=\"500\" data-udi=\"umb://media/776a457a2ce04512bd6c8150cb986db7\" /></div>\n</div>\n</div>\n</div>","editor":{"alias":"rte","view":null},"styles":null,"config":null}],"styles":null,"config":null},{"grid":"8","controls":[{"value":{"macroAlias":"contactForm","macroParamsDictionary":{}},"editor":{"alias":"macro","view":null},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3286, 1081, 38, NULL, NULL, NULL, NULL, NULL, N'Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3287, 1081, 39, NULL, NULL, NULL, NULL, NULL, N' Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3288, 1081, 41, NULL, NULL, NULL, NULL, NULL, N' Kontakt', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3289, 1081, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3290, 2117, 38, NULL, NULL, NULL, NULL, NULL, N'Moj osobny blog', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3292, 2117, 39, NULL, NULL, NULL, NULL, NULL, N'Moj osobny blog', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3294, 2117, 41, NULL, NULL, NULL, NULL, NULL, N'Blog', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3296, 2117, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3298, 2114, 38, NULL, NULL, NULL, NULL, NULL, N'Začiatky programovania', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3299, 2119, 38, NULL, NULL, NULL, NULL, NULL, N'Začiatky programovania', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3300, 2114, 39, NULL, NULL, NULL, NULL, NULL, N'Začiatky programovania', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3301, 2119, 39, NULL, NULL, NULL, NULL, NULL, N'Začiatky programovania', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3302, 2114, 41, NULL, NULL, NULL, NULL, NULL, N'Začiatky programovania', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3303, 2119, 41, NULL, NULL, NULL, NULL, NULL, N'Začiatky programovania', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3304, 2114, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3305, 2119, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3306, 2116, 38, NULL, NULL, NULL, NULL, NULL, N'Cesta od prvého riadku kódu k nekonečným možnostiam', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3308, 2116, 39, NULL, NULL, NULL, NULL, NULL, N'Cesta od prvého riadku kódu k nekonečným možnostiam', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3310, 2116, 41, NULL, NULL, NULL, NULL, NULL, N'Cesta od prvého riadku kódu k nekonečným možnostiam', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3312, 2116, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3314, 2116, 1039, NULL, NULL, NULL, NULL, NULL, N'umb://document/2c9e5d33b73e42ef909434bbe347d42c', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3316, 2116, 1040, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"d6fcfe5f-b4b1-9a04-65a7-9a0f1516a754","areas":[{"grid":"12","controls":[{"value":"<p><strong>Cesta od prvého riadku kódu k nekonečným možnostiam</strong></p>\n<p> </p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3318, 2116, 1041, NULL, NULL, NULL, NULL, NULL, NULL, N'Začiatky programovania sú ako prvé kroky dieťaťa – neisté, plné otázok, ale zároveň neuveriteľne vzrušujúce. Pamätám si svoj prvý riadok kódu – niečo jednoduché, ale zároveň to pre mňa znamenalo celý nový svet. Keď sa na obrazovke objavil prvý výsledok mojej práce, pocítila som nadšenie, aké som dovtedy nepoznala.

Programovanie ma naučilo mnoho vecí. Predovšetkým trpezlivosti. Kód sa nepíše sám a chyby nie sú nepriatelia, ale učitelia. Každý bug ma priviedol bližšie k riešeniu a každé riešenie ma naplnilo pocitom úspechu.

Tiež som pochopila, že programovanie nie je len o písaní kódu – je to o kreativite, riešení problémov a neustálom učení. Svet technológií sa mení neuveriteľnou rýchlosťou, a to, čo dnes považujeme za novinku, môže byť zajtra minulosťou. A práve to ma na tom fascinuje.

Začiatky nie sú nikdy ľahké, ale každý krok, každý projekt, každý riadok kódu je krokom vpred. Ak uvažujete nad tým, že by ste začali programovať, odkazujem vám toto: nikdy nie je neskoro začať. Svet technológií vás víta s otvorenou náručou.

Tento blog je pre mňa zároveň spôsob, ako zaznamenať svoju cestu. Verím, že raz sa na tieto riadky pozriem s úsmevom a spomienkou na to, kde to všetko začalo. A možno niekoho z vás inšpirujem, aby ste sa tiež pustili na túto fascinujúcu cestu.

Začnite jednoducho. Prvý riadok kódu. Prvá chybička. Prvá oprava. A potom... nekonečné možnosti.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3320, 2116, 1043, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://document/f1b8c0f9fb094153a0d43a4f260299a7')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3322, 2121, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/mptdgln3/code.jpg","crops":null}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3323, 2121, 7, NULL, NULL, 1280, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3324, 2121, 8, NULL, NULL, 848, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3325, 2121, 9, NULL, NULL, NULL, NULL, NULL, N'138583', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3326, 2121, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3327, 2120, 38, NULL, NULL, NULL, NULL, NULL, N'Cesta od prvého riadku kódu k nekonečným možnostiam', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3329, 2120, 39, NULL, NULL, NULL, NULL, NULL, N'Cesta od prvého riadku kódu k nekonečným možnostiam', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3331, 2120, 41, NULL, NULL, NULL, NULL, NULL, N'Cesta od prvého riadku kódu k nekonečným možnostiam', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3333, 2120, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3335, 2120, 1039, NULL, NULL, NULL, NULL, NULL, N'umb://document/2c9e5d33b73e42ef909434bbe347d42c', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3337, 2120, 1040, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"d6fcfe5f-b4b1-9a04-65a7-9a0f1516a754","areas":[{"grid":"12","controls":[{"value":"<p><strong>Cesta od prvého riadku kódu k nekonečným možnostiam</strong></p>\n<p> </p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3339, 2120, 1041, NULL, NULL, NULL, NULL, NULL, NULL, N'Začiatky programovania sú ako prvé kroky dieťaťa – neisté, plné otázok, ale zároveň neuveriteľne vzrušujúce. Pamätám si svoj prvý riadok kódu – niečo jednoduché, ale zároveň to pre mňa znamenalo celý nový svet. Keď sa na obrazovke objavil prvý výsledok mojej práce, pocítila som nadšenie, aké som dovtedy nepoznala.

Programovanie ma naučilo mnoho vecí. Predovšetkým trpezlivosti. Kód sa nepíše sám a chyby nie sú nepriatelia, ale učitelia. Každý bug ma priviedol bližšie k riešeniu a každé riešenie ma naplnilo pocitom úspechu.

Tiež som pochopila, že programovanie nie je len o písaní kódu – je to o kreativite, riešení problémov a neustálom učení. Svet technológií sa mení neuveriteľnou rýchlosťou, a to, čo dnes považujeme za novinku, môže byť zajtra minulosťou. A práve to ma na tom fascinuje.

Začiatky nie sú nikdy ľahké, ale každý krok, každý projekt, každý riadok kódu je krokom vpred. Ak uvažujete nad tým, že by ste začali programovať, odkazujem vám toto: nikdy nie je neskoro začať. Svet technológií vás víta s otvorenou náručou.

Tento blog je pre mňa zároveň spôsob, ako zaznamenať svoju cestu. Verím, že raz sa na tieto riadky pozriem s úsmevom a spomienkou na to, kde to všetko začalo. A možno niekoho z vás inšpirujem, aby ste sa tiež pustili na túto fascinujúcu cestu.

Začnite jednoducho. Prvý riadok kódu. Prvá chybička. Prvá oprava. A potom... nekonečné možnosti.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3341, 2120, 1042, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/2d33e665f0bd47d5896851d7199d9e9a')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3343, 2120, 1043, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://document/f1b8c0f9fb094153a0d43a4f260299a7')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3345, 2110, 38, NULL, NULL, NULL, NULL, NULL, N'Nikola Vaniščáková', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3347, 2110, 39, NULL, NULL, NULL, NULL, NULL, N'Nikola Vaniščáková', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3349, 2110, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3351, 2110, 1044, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/776a457a2ce04512bd6c8150cb986db7')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3353, 2110, 1045, NULL, NULL, NULL, NULL, NULL, NULL, N'<p>Som junior programator</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3355, 2123, 38, NULL, NULL, NULL, NULL, NULL, N'Nikola Vaniščáková', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3356, 2124, 38, NULL, NULL, NULL, NULL, NULL, N'Nikola Vaniščáková', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3357, 2123, 39, NULL, NULL, NULL, NULL, NULL, N'Nikola Vaniščáková', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3358, 2124, 39, NULL, NULL, NULL, NULL, NULL, N'Nikola Vaniščáková', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3359, 2123, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3360, 2124, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3361, 2123, 1044, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/776a457a2ce04512bd6c8150cb986db7')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3362, 2124, 1044, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/776a457a2ce04512bd6c8150cb986db7')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3363, 2123, 1045, NULL, NULL, NULL, NULL, NULL, NULL, N'<p>Som kreatívna duša s nadšením pre It svet a programovanie.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3364, 2124, 1045, NULL, NULL, NULL, NULL, NULL, NULL, N'<p>Som kreatívna duša s nadšením pre It svet a programovanie.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3365, 2118, 38, NULL, NULL, NULL, NULL, NULL, N'Moj osobny blog', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3366, 2125, 38, NULL, NULL, NULL, NULL, NULL, N'Moj osobny blog', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3367, 2118, 39, NULL, NULL, NULL, NULL, NULL, N'Moj osobny blog', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3368, 2125, 39, NULL, NULL, NULL, NULL, NULL, N'Moj osobny blog', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3369, 2118, 41, NULL, NULL, NULL, NULL, NULL, N'Blog', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3370, 2125, 41, NULL, NULL, NULL, NULL, NULL, N'Blog', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3371, 2118, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3372, 2125, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3373, 2122, 38, NULL, NULL, NULL, NULL, NULL, N'Cesta od prvého riadku kódu k nekonečným možnostiam', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3375, 2122, 39, NULL, NULL, NULL, NULL, NULL, N'Cesta od prvého riadku kódu k nekonečným možnostiam', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3377, 2122, 41, NULL, NULL, NULL, NULL, NULL, N'Cesta od prvého riadku kódu k nekonečným možnostiam', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3379, 2122, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3381, 2122, 1039, NULL, NULL, NULL, NULL, NULL, N'umb://document/2c9e5d33b73e42ef909434bbe347d42c', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3383, 2122, 1040, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"d6fcfe5f-b4b1-9a04-65a7-9a0f1516a754","areas":[{"grid":"12","controls":[{"value":"<p><strong>Cesta od prvého riadku kódu k nekonečným možnostiam</strong></p>\n<p> </p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
 
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3385, 2122, 1041, NULL, NULL, NULL, NULL, NULL, NULL, N'Začiatky mojej cesty k programovaniu.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3387, 2122, 1042, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/2d33e665f0bd47d5896851d7199d9e9a')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3389, 2122, 1043, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://document/f1b8c0f9fb094153a0d43a4f260299a7')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3400, 2126, 38, NULL, NULL, NULL, NULL, NULL, N'Cesta od prvého riadku kódu k nekonečným možnostiam', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3402, 2126, 39, NULL, NULL, NULL, NULL, NULL, N'Cesta od prvého riadku kódu k nekonečným možnostiam', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3404, 2126, 41, NULL, NULL, NULL, NULL, NULL, N'Cesta od prvého riadku kódu k nekonečným možnostiam', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3406, 2126, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3408, 2126, 1039, NULL, NULL, NULL, NULL, NULL, N'umb://document/2c9e5d33b73e42ef909434bbe347d42c', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3410, 2126, 1040, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"d6fcfe5f-b4b1-9a04-65a7-9a0f1516a754","areas":[{"grid":"12","controls":[{"value":"<p>Začiatky programovania sú ako prvé kroky dieťaťa – neisté, plné otázok, ale zároveň neuveriteľne vzrušujúce. Pamätám si svoj prvý riadok kódu – niečo jednoduché, ale zároveň to pre mňa znamenalo celý nový svet. Keď sa na obrazovke objavil prvý výsledok mojej práce, pocítila som nadšenie, aké som dovtedy nepoznala.</p>\n<p>Programovanie ma naučilo mnoho vecí. Predovšetkým trpezlivosti. Kód sa nepíše sám a chyby nie sú nepriatelia, ale učitelia. Každý bug ma priviedol bližšie k riešeniu a každé riešenie ma naplnilo pocitom úspechu.</p>\n<p>Tiež som pochopila, že programovanie nie je len o písaní kódu – je to o kreativite, riešení problémov a neustálom učení. Svet technológií sa mení neuveriteľnou rýchlosťou, a to, čo dnes považujeme za novinku, môže byť zajtra minulosťou. A práve to ma na tom fascinuje.</p>\n<p>Začiatky nie sú nikdy ľahké, ale každý krok, každý projekt, každý riadok kódu je krokom vpred. Ak uvažujete nad tým, že by ste začali programovať, odkazujem vám toto: nikdy nie je neskoro začať. Svet technológií vás víta s otvorenou náručou.</p>\n<p>Tento blog je pre mňa zároveň spôsob, ako zaznamenať svoju cestu. Verím, že raz sa na tieto riadky pozriem s úsmevom a spomienkou na to, kde to všetko začalo. A možno niekoho z vás inšpirujem, aby ste sa tiež pustili na túto fascinujúcu cestu.</p>\n<p>Začnite jednoducho. Prvý riadok kódu. Prvá chybička. Prvá oprava. A potom... nekonečné možnosti.</p>\n<p> </p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3412, 2126, 1041, NULL, NULL, NULL, NULL, NULL, NULL, N'Cesta od prvého riadku kódu k nekonečným možnostiam')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3414, 2126, 1042, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/2d33e665f0bd47d5896851d7199d9e9a')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3416, 2126, 1043, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://document/f1b8c0f9fb094153a0d43a4f260299a7')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3427, 2127, 38, NULL, NULL, NULL, NULL, NULL, N'Cesta od prvého riadku kódu k nekonečným možnostiam', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3428, 2128, 38, NULL, NULL, NULL, NULL, NULL, N'Cesta od prvého riadku kódu k nekonečným možnostiam', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3429, 2127, 39, NULL, NULL, NULL, NULL, NULL, N'Cesta od prvého riadku kódu k nekonečným možnostiam', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3430, 2128, 39, NULL, NULL, NULL, NULL, NULL, N'Cesta od prvého riadku kódu k nekonečným možnostiam', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3431, 2127, 41, NULL, NULL, NULL, NULL, NULL, N'Cesta od prvého riadku kódu k nekonečným možnostiam', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3432, 2128, 41, NULL, NULL, NULL, NULL, NULL, N'Cesta od prvého riadku kódu k nekonečným možnostiam', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3433, 2127, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3434, 2128, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3435, 2127, 1039, NULL, NULL, NULL, NULL, NULL, N'umb://document/2c9e5d33b73e42ef909434bbe347d42c', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3436, 2128, 1039, NULL, NULL, NULL, NULL, NULL, N'umb://document/2c9e5d33b73e42ef909434bbe347d42c', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3437, 2127, 1040, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"d6fcfe5f-b4b1-9a04-65a7-9a0f1516a754","areas":[{"grid":"12","controls":[{"value":"<p>Začiatky programovania sú ako prvé kroky dieťaťa – neisté, plné otázok, ale zároveň neuveriteľne vzrušujúce. Pamätám si svoj prvý riadok kódu – niečo jednoduché, ale zároveň to pre mňa znamenalo celý nový svet. Keď sa na obrazovke objavil prvý výsledok mojej práce, pocítila som nadšenie, aké som dovtedy nepoznala.</p>\n<p>Programovanie ma naučilo mnoho vecí. Predovšetkým trpezlivosti. Kód sa nepíše sám a chyby nie sú nepriatelia, ale učitelia. Každý bug ma priviedol bližšie k riešeniu a každé riešenie ma naplnilo pocitom úspechu.</p>\n<p>Tiež som pochopila, že programovanie nie je len o písaní kódu – je to o kreativite, riešení problémov a neustálom učení. Svet technológií sa mení neuveriteľnou rýchlosťou, a to, čo dnes považujeme za novinku, môže byť zajtra minulosťou. A práve to ma na tom fascinuje.</p>\n<p>Začiatky nie sú nikdy ľahké, ale každý krok, každý projekt, každý riadok kódu je krokom vpred. Ak uvažujete nad tým, že by ste začali programovať, odkazujem vám toto: nikdy nie je neskoro začať. Svet technológií vás víta s otvorenou náručou.</p>\n<p>Tento blog je pre mňa zároveň spôsob, ako zaznamenať svoju cestu. Verím, že raz sa na tieto riadky pozriem s úsmevom a spomienkou na to, kde to všetko začalo. A možno niekoho z vás inšpirujem, aby ste sa tiež pustili na túto fascinujúcu cestu.</p>\n<p>Začnite jednoducho. Prvý riadok kódu. Prvá chybička. Prvá oprava. A potom... nekonečné možnosti.</p>\n<p> </p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3438, 2128, 1040, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"d6fcfe5f-b4b1-9a04-65a7-9a0f1516a754","areas":[{"grid":"12","controls":[{"value":"<p>Začiatky programovania sú ako prvé kroky dieťaťa – neisté, plné otázok, ale zároveň neuveriteľne vzrušujúce. Pamätám si svoj prvý riadok kódu – niečo jednoduché, ale zároveň to pre mňa znamenalo celý nový svet. Keď sa na obrazovke objavil prvý výsledok mojej práce, pocítila som nadšenie, aké som dovtedy nepoznala.</p>\n<p>Programovanie ma naučilo mnoho vecí. Predovšetkým trpezlivosti. Kód sa nepíše sám a chyby nie sú nepriatelia, ale učitelia. Každý bug ma priviedol bližšie k riešeniu a každé riešenie ma naplnilo pocitom úspechu.</p>\n<p>Tiež som pochopila, že programovanie nie je len o písaní kódu – je to o kreativite, riešení problémov a neustálom učení. Svet technológií sa mení neuveriteľnou rýchlosťou, a to, čo dnes považujeme za novinku, môže byť zajtra minulosťou. A práve to ma na tom fascinuje.</p>\n<p>Začiatky nie sú nikdy ľahké, ale každý krok, každý projekt, každý riadok kódu je krokom vpred. Ak uvažujete nad tým, že by ste začali programovať, odkazujem vám toto: nikdy nie je neskoro začať. Svet technológií vás víta s otvorenou náručou.</p>\n<p>Tento blog je pre mňa zároveň spôsob, ako zaznamenať svoju cestu. Verím, že raz sa na tieto riadky pozriem s úsmevom a spomienkou na to, kde to všetko začalo. A možno niekoho z vás inšpirujem, aby ste sa tiež pustili na túto fascinujúcu cestu.</p>\n<p>Začnite jednoducho. Prvý riadok kódu. Prvá chybička. Prvá oprava. A potom... nekonečné možnosti.</p>\n<p> </p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3439, 2127, 1041, NULL, NULL, NULL, NULL, NULL, NULL, N'Moje začiatky v programovaní .')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3440, 2128, 1041, NULL, NULL, NULL, NULL, NULL, NULL, N'Moje začiatky v programovaní .')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3441, 2127, 1042, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/2d33e665f0bd47d5896851d7199d9e9a')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3442, 2128, 1042, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://media/2d33e665f0bd47d5896851d7199d9e9a')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3443, 2127, 1043, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://document/f1b8c0f9fb094153a0d43a4f260299a7')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3444, 2128, 1043, NULL, NULL, NULL, NULL, NULL, NULL, N'umb://document/f1b8c0f9fb094153a0d43a4f260299a7')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3445, 2103, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"d80f9c7d-069f-2703-1919-52d5ccf76d8f","areas":[{"grid":"12","controls":[{"value":null,"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3447, 2103, 38, NULL, NULL, NULL, NULL, NULL, N'Recipe App', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3449, 2103, 39, NULL, NULL, NULL, NULL, NULL, N'Recipe App', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3451, 2103, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3453, 2129, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"d80f9c7d-069f-2703-1919-52d5ccf76d8f","areas":[{"grid":"12","controls":[{"value":{"macroAlias":"recipeapp","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3454, 2130, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"d80f9c7d-069f-2703-1919-52d5ccf76d8f","areas":[{"grid":"12","controls":[{"value":{"macroAlias":"recipeapp","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3455, 2129, 38, NULL, NULL, NULL, NULL, NULL, N'Recipe App', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3456, 2130, 38, NULL, NULL, NULL, NULL, NULL, N'Recipe App', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3457, 2129, 39, NULL, NULL, NULL, NULL, NULL, N'Recipe App', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3458, 2130, 39, NULL, NULL, NULL, NULL, NULL, N'Recipe App', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3459, 2129, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3460, 2130, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3464, 2131, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3466, 2131, 38, NULL, NULL, NULL, NULL, NULL, N'To do aplikacia', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3468, 2131, 39, NULL, NULL, NULL, NULL, NULL, N'To do aplikacia', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3470, 2131, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3472, 2132, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"654fe847-a3d3-df37-d8fa-882dd7310ac3","areas":[{"grid":"12","controls":[{"value":{"macroAlias":"todo","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3474, 2132, 38, NULL, NULL, NULL, NULL, NULL, N'To do aplikacia', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3476, 2132, 39, NULL, NULL, NULL, NULL, NULL, N'To do aplikacia', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3478, 2132, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3480, 2134, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"3dc143a3-c27f-9901-11a0-349e797f1141","areas":[{"grid":"12","controls":[{"value":"<h1>Stránka neexistuje</h1>\n<p>Ľutujeme, ale stránka, ktorú hľadáte, neexistuje.</p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3481, 2135, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"3dc143a3-c27f-9901-11a0-349e797f1141","areas":[{"grid":"12","controls":[{"value":"<h1>Stránka neexistuje</h1>\n<p>Ľutujeme, ale stránka, ktorú hľadáte, neexistuje.</p>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3482, 2134, 38, NULL, NULL, NULL, NULL, NULL, N'Stranka nenajdena', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3483, 2135, 38, NULL, NULL, NULL, NULL, NULL, N'Stranka nenajdena', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3484, 2134, 39, NULL, NULL, NULL, NULL, NULL, N'Stranka nenajdena', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3485, 2135, 39, NULL, NULL, NULL, NULL, NULL, N'Stranka nenajdena', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3486, 2134, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3487, 2135, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3488, 2133, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"654fe847-a3d3-df37-d8fa-882dd7310ac3","areas":[{"grid":"12","controls":[{"value":{"macroAlias":"todo","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3489, 2133, 38, NULL, NULL, NULL, NULL, NULL, N'To do aplikacia', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3490, 2133, 39, NULL, NULL, NULL, NULL, NULL, N'To do aplikacia', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3491, 2133, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3492, 2101, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container-fluid\">\n<div class=\"row justify-content-flex-start\">\n<div class=\"col-12 col-md-10 centered-text\">\n<p class=\"text-primary\">Ahoj, volám sa</p>\n<h1 class=\"display-1\">Nikola Vaniščáková</h1>\n<span id=\"typing-text\">Som junior fullstack developer</span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C# a JavaScript, ale rada sa naučím aj niečo iné.</h2>\n<a href=\"/projekty\" class=\"btn\">Chcem vedieť viac</a></div>\n</div>\n</div>\n<div class=\"wave\"></div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3494, 2101, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3496, 2101, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3498, 2101, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3500, 2101, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3507, 2136, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container-fluid\">\n<div class=\"row justify-content-flex-start\">\n<div class=\"col-12 col-md-10 centered-text\">\n<p class=\"text-primary\">Ahoj, volám sa</p>\n<h1 class=\"display-1\">Nikola Vaniščáková</h1>\n<span id=\"typing-text\">Som junior fullstack developer</span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C# a JavaScript, ale rada sa naučím aj niečo iné.</h2>\n<a href=\"/projekty\" class=\"btn\">Chcem vedieť viac</a></div>\n</div>\n</div>\n<div class=\"wave\"><!-- SVG vlny --> <!-- SVG path pro vlnu --></div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3509, 2136, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3511, 2136, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3513, 2136, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3515, 2136, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3522, 2137, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container-fluid\">\n<div class=\"row justify-content-flex-start\">\n<div class=\"col-12 col-md-10 centered-text\">\n<p class=\"text-primary\">Ahoj, volám sa</p>\n<h1 class=\"display-1\">Nikola Vaniščáková</h1>\n<span id=\"typing-text\">Som junior fullstack developer</span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C# a JavaScript, ale rada sa naučím aj niečo iné.</h2>\n<a href=\"/projekty\" class=\"btn\">Chcem vedieť viac</a></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null},{"value":"<div class=\"wave\"><!-- SVG vlny --> <!-- SVG path pro vlnu --></div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3524, 2137, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3526, 2137, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3528, 2137, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3530, 2137, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3537, 2138, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container-fluid\">\n<div class=\"row justify-content-flex-start\">\n<div class=\"col-12 col-md-10 centered-text\">\n<p class=\"text-primary\">Ahoj, volám sa</p>\n<h1 class=\"display-1\">Nikola Vaniščáková</h1>\n<span id=\"typing-text\">Som junior fullstack developer</span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C# a JavaScript, ale rada sa naučím aj niečo iné.</h2>\n<a href=\"/projekty\" class=\"btn\">Chcem vedieť viac</a></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null},{"value":"<div class=\"wave\"><!-- SVG vlny --> <!-- SVG path pro vlnu --></div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null},{"value":{"macroAlias":"vlny","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3539, 2138, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3541, 2138, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3543, 2138, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3545, 2138, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3547, 2139, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"e2f10234-8c03-0068-5f46-28a4e8a89df8","areas":[{"grid":"12","controls":[{"value":"<div class=\"container-fluid\">\n<div class=\"row justify-content-flex-start\">\n<div class=\"col-12 col-md-10 centered-text\">\n<p class=\"text-primary\">Ahoj, volám sa</p>\n<h1 class=\"display-1\">Nikola Vaniščáková</h1>\n<span id=\"typing-text\">Som junior fullstack developer</span>\n<h2 class=\"mt-4\">Špecializujem sa na Umbraco, C# a JavaScript, ale rada sa naučím aj niečo iné.</h2>\n<a href=\"/projekty\" class=\"btn\">Chcem vedieť viac</a></div>\n</div>\n</div>","editor":{"alias":"rte","view":"rte"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null},{"name":"Headline","id":"01b70116-2a9c-cb95-92b9-058870313a5c","areas":[{"grid":"12","controls":[{"value":{"macroAlias":"vlny","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3549, 2139, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3551, 2139, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3553, 2139, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3555, 2139, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3562, 2140, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"01b70116-2a9c-cb95-92b9-058870313a5c","areas":[{"grid":"12","controls":[{"value":{"macroAlias":"vlny","macroParamsDictionary":{}},"editor":{"alias":"macro","view":"macro"},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3564, 2140, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3566, 2140, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3568, 2140, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3570, 2140, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3572, 2141, 37, NULL, NULL, NULL, NULL, NULL, NULL, N'{"name":"1 column layout","sections":[{"grid":"12","rows":[{"name":"Headline","id":"01b70116-2a9c-cb95-92b9-058870313a5c","areas":[{"grid":"12","controls":[{"value":{"macroAlias":"vlny","macroParamsDictionary":{}},"editor":{"alias":"macro","view":null},"styles":null,"config":null}],"styles":null,"config":null}],"styles":null,"config":null}]}]}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3573, 2141, 38, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3574, 2141, 39, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3575, 2141, 41, NULL, NULL, NULL, NULL, NULL, N'Domov', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3576, 2141, 40, NULL, NULL, 0, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[umbracoPropertyData] OFF
 
INSERT [dbo].[umbracoRedirectUrl] ([id], [contentKey], [createDateUtc], [url], [culture], [urlHash]) VALUES (N'd06a78fc-1833-4056-9a34-a43fbba54fa9', N'f1b8c0f9-fb09-4153-a0d4-3a4f260299a7', CAST(N'2024-12-18T15:28:38.740' AS DateTime), N'/blog/kate rie/moje-zoznamovanie-sa-s-programovanim', N'', N'2f5036fbd757440a497860286299c9dea9a45644')
INSERT [dbo].[umbracoRedirectUrl] ([id], [contentKey], [createDateUtc], [url], [culture], [urlHash]) VALUES (N'a6503f81-0515-49bf-97ce-d1a997b67bbd', N'647a738f-8d41-4339-9dff-ec6eccc8d3db', CAST(N'2024-12-18T15:33:36.227' AS DateTime), N'/blog/moje-prve-programovanie', N'', N'408c1f56074391927d8509d19045f4645a094857')
 
SET IDENTITY_INSERT [dbo].[umbracoRelation] ON 

INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (1078, 2053, 2052, 4, CAST(N'2024-12-17T19:31:04.403' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (1079, 2054, 2052, 4, CAST(N'2024-12-17T19:31:04.483' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (1086, 2077, 2052, 4, CAST(N'2024-12-18T16:35:01.820' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (1099, 2080, 2077, 5, CAST(N'2024-12-18T16:45:43.107' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (1100, 2080, 2081, 4, CAST(N'2024-12-18T16:45:43.107' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (1101, 2080, 2079, 5, CAST(N'2024-12-18T16:45:43.107' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (1102, 2055, 2082, 2, CAST(N'2024-12-21T12:48:43.687' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[umbracoRelation] OFF
 
SET IDENTITY_INSERT [dbo].[umbracoRelationType] ON 

INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (1, N'4cbeb612-e689-3563-b755-bf3ede295433', 1, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Document On Copy', N'relateDocumentOnCopy')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (2, N'0cc3507c-66ab-3091-8913-3d998148e423', 0, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Parent Document On Delete', N'relateParentDocumentOnDelete')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (3, N'8307994f-faf2-3844-bab9-72d34514edf2', 0, N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', N'Relate Parent Media Folder On Delete', N'relateParentMediaFolderOnDelete')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (4, N'4954ce93-3bf9-3d1e-9cd2-21bf9f9c2abf', 0, NULL, NULL, N'Related Media', N'umbMedia')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (5, N'0b93e414-5abe-36ec-a6bb-516e56f12238', 0, NULL, NULL, N'Related Document', N'umbDocument')
SET IDENTITY_INSERT [dbo].[umbracoRelationType] OFF
 
SET IDENTITY_INSERT [dbo].[umbracoServer] ON 

INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isMaster]) VALUES (1, N'http://localhost:52533/umbraco', N'DESKTOP-FHLL6UH//LM/W3SVC/2/ROOT', CAST(N'2024-11-12T12:12:12.150' AS DateTime), CAST(N'2024-12-21T15:15:35.540' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[umbracoServer] OFF
 
SET IDENTITY_INSERT [dbo].[umbracoUser] ON 

INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userName], [userLogin], [userPassword], [passwordConfig], [userEmail], [userLanguage], [securityStampToken], [failedLoginAttempts], [lastLockoutDate], [lastPasswordChangeDate], [lastLoginDate], [emailConfirmedDate], [invitedDate], [createDate], [updateDate], [avatar], [tourData]) VALUES (-1, 0, 0, N'Nikola Vaniscak', N'knihomolka2@gmail.com', N'tirUakJ6mnRdZOUPJp5kQA==6sJTSAkxKHAUgd6cteSycuQGXpV7JO/Q2FoekE4RbcY=', N'{"hashAl rithm":"HMACSHA256"}', N'knihomolka2@gmail.com', N'en-US', N'61ed18b3-b81e-4a7f-8e05-dfc294ad840e', 0, NULL, CAST(N'2024-11-12T12:11:29.797' AS DateTime), CAST(N'2024-12-21T14:06:23.057' AS DateTime), NULL, NULL, CAST(N'2024-11-12T12:11:29.283' AS DateTime), CAST(N'2024-12-21T14:06:23.057' AS DateTime), NULL, N'[{"alias":"umbIntroIntroduction","completed":false,"disabled":true},{"alias":"umbEmailMarketing","completed":false,"disabled":true}]')
SET IDENTITY_INSERT [dbo].[umbracoUser] OFF
 
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (-1, 1)
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (-1, 5)
 
SET IDENTITY_INSERT [dbo].[umbracoUserGroup] ON 

INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (1, N'admin', N'Administrators', N'CADMOSKTPIURZ:5F7ï', CAST(N'2024-11-12T12:11:29.527' AS DateTime), CAST(N'2024-11-12T12:11:29.527' AS DateTime), N'icon-medal', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (2, N'writer', N'Writers', N'CAH:F', CAST(N'2024-11-12T12:11:29.530' AS DateTime), CAST(N'2024-11-12T12:11:29.530' AS DateTime), N'icon-edit', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (3, N'editor', N'Editors', N'CADMOSKTPUZ:5Fï', CAST(N'2024-11-12T12:11:29.530' AS DateTime), CAST(N'2024-11-12T12:11:29.530' AS DateTime), N'icon-tools', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (4, N'translator', N'Translators', N'AF', CAST(N'2024-11-12T12:11:29.530' AS DateTime), CAST(N'2024-11-12T12:11:29.530' AS DateTime), N'icon-globe', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (5, N'sensitiveData', N'Sensitive data', N'', CAST(N'2024-11-12T12:11:29.530' AS DateTime), CAST(N'2024-11-12T12:11:29.530' AS DateTime), N'icon-lock', -1, -1)
SET IDENTITY_INSERT [dbo].[umbracoUserGroup] OFF
 
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'forms')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'media')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'member')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'packages')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'settings')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'translation')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'users')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (2, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'forms')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'media')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (4, N'translation')
 
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'611357ee-d9e3-4ae7-acba-00de292f8920', -1, CAST(N'2024-12-17T17:57:26.910' AS DateTime), CAST(N'2024-12-17T17:57:26.910' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'0a1a6a53-19c9-4571-856a-02814b50dca4', -1, CAST(N'2024-12-17T18:14:50.593' AS DateTime), CAST(N'2024-12-17T18:14:50.593' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'2f56ef92-4706-4a9a-ae96-0476a507ce4d', -1, CAST(N'2024-12-17T18:11:33.687' AS DateTime), CAST(N'2024-12-17T18:11:33.687' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'6022f0ea-9079-4941-b59e-053d9401f05f', -1, CAST(N'2024-12-17T18:13:19.767' AS DateTime), CAST(N'2024-12-17T18:13:19.767' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'7e88bbc1-6a3a-40d6-ba02-05e3e6a11468', -1, CAST(N'2024-12-18T16:53:00.883' AS DateTime), CAST(N'2024-12-18T16:53:00.883' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'a6811c3d-41ce-4de7-bceb-085158cf26b6', -1, CAST(N'2024-12-17T18:15:21.183' AS DateTime), CAST(N'2024-12-17T18:15:21.183' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'762d7c77-7522-47df-8f2e-0c61a0c4640f', -1, CAST(N'2024-12-17T18:05:18.330' AS DateTime), CAST(N'2024-12-17T18:05:18.330' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'debcb682-18d3-4384-82d2-147222553d85', -1, CAST(N'2024-12-17T18:06:02.053' AS DateTime), CAST(N'2024-12-17T18:06:02.053' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'0dba6206-46c6-4e49-b3aa-18a1aa2726bf', -1, CAST(N'2024-12-17T18:12:18.650' AS DateTime), CAST(N'2024-12-17T18:12:18.650' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'b8591802-cbc5-4237-86ac-19154d1d53e4', -1, CAST(N'2024-12-17T17:16:11.040' AS DateTime), CAST(N'2024-12-17T17:16:11.040' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'376e664c-d212-435c-ae73-1f92e7302898', -1, CAST(N'2024-12-17T18:11:51.233' AS DateTime), CAST(N'2024-12-17T18:11:51.233' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'7d9cf7a2-9d4b-47a5-82b9-20349114fd1f', -1, CAST(N'2024-12-17T17:21:05.973' AS DateTime), CAST(N'2024-12-17T17:26:53.640' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'57d311d1-5474-4cbb-8e39-2564d7bd57c0', -1, CAST(N'2024-12-17T17:56:19.000' AS DateTime), CAST(N'2024-12-17T17:56:19.000' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'229c5db0-eb9f-45d5-a234-391b604ae13f', -1, CAST(N'2024-12-18T15:27:45.240' AS DateTime), CAST(N'2024-12-18T15:34:31.853' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'd5f4c240-93f0-45a8-af2c-436f2cb6aae0', -1, CAST(N'2024-12-17T18:13:32.753' AS DateTime), CAST(N'2024-12-17T18:13:32.753' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'1a6f2011-0b9e-40f4-8974-454319639b7b', -1, CAST(N'2024-12-17T17:57:58.250' AS DateTime), CAST(N'2024-12-17T17:57:58.250' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'f2a36ccb-ffc5-4ead-b745-4631f1be7901', -1, CAST(N'2024-12-17T18:10:07.037' AS DateTime), CAST(N'2024-12-17T18:10:07.037' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'089f6c23-a106-4c4c-bd3f-5090035425ce', -1, CAST(N'2024-12-17T17:54:18.337' AS DateTime), CAST(N'2024-12-17T17:54:18.337' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'04432637-4e71-4f00-82c2-54bcd77014bf', -1, CAST(N'2024-12-17T17:56:18.997' AS DateTime), CAST(N'2024-12-17T17:56:18.997' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'7ac5ad93-eb1f-4319-b2c5-558da83d8c6b', -1, CAST(N'2024-12-15T10:30:49.560' AS DateTime), CAST(N'2024-12-15T10:30:49.560' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'e771e6cd-8179-455e-a081-5698ac748fff', -1, CAST(N'2024-12-17T18:07:57.200' AS DateTime), CAST(N'2024-12-17T18:07:57.200' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'c159b89d-328b-4e9e-9d35-589151c8bff0', -1, CAST(N'2024-12-17T17:56:19.017' AS DateTime), CAST(N'2024-12-17T17:56:19.017' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'c2fd4268-e591-40be-87d3-5c1dc5f25dcf', -1, CAST(N'2024-12-21T11:48:33.910' AS DateTime), CAST(N'2024-12-21T11:48:33.910' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'c72e2c4e-a872-4340-9f84-5c3a15714e93', -1, CAST(N'2024-12-17T18:04:42.723' AS DateTime), CAST(N'2024-12-17T18:04:42.723' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'6035fc06-e784-4115-a417-636c260eee76', -1, CAST(N'2024-12-17T18:34:49.200' AS DateTime), CAST(N'2024-12-17T18:37:30.537' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'813553ab-9f4a-4878-8cc8-66fe392bd71f', -1, CAST(N'2024-12-17T18:15:21.183' AS DateTime), CAST(N'2024-12-17T18:30:06.230' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'3e64c53c-204c-4c2e-9d0e-745b33afe9b9', -1, CAST(N'2024-12-17T18:04:16.450' AS DateTime), CAST(N'2024-12-17T18:04:16.450' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'73c912a1-68d5-4692-815f-75b59fe46481', -1, CAST(N'2024-12-17T18:08:06.297' AS DateTime), CAST(N'2024-12-17T18:08:24.133' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'd9ae5c13-7f42-4d0a-a049-7d6c1d97d550', -1, CAST(N'2024-12-17T18:05:35.530' AS DateTime), CAST(N'2024-12-17T18:05:35.530' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'51c963d1-5ad3-47ef-bddb-8130f200ed91', -1, CAST(N'2024-12-17T18:10:52.157' AS DateTime), CAST(N'2024-12-17T18:10:52.157' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'dcdf28c8-388b-47a1-8802-94e8ab8b3b5f', -1, CAST(N'2024-12-18T15:44:40.247' AS DateTime), CAST(N'2024-12-18T15:45:43.063' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'76d9f874-9419-437a-b75a-9d1a57dc229f', -1, CAST(N'2024-12-17T18:09:02.410' AS DateTime), CAST(N'2024-12-17T18:09:25.397' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'1c5e103a-5f38-4541-8c7b-a1cf175d9222', -1, CAST(N'2024-12-10T10:45:09.847' AS DateTime), CAST(N'2024-12-10T10:47:55.597' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'6298b981-3379-4cb5-8ce6-a7536c04354a', -1, CAST(N'2024-12-17T18:10:43.530' AS DateTime), CAST(N'2024-12-17T18:10:43.530' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'6595e48e-cd8e-4445-aac6-b3e1bcf67e47', -1, CAST(N'2024-12-17T17:56:03.047' AS DateTime), CAST(N'2024-12-17T17:56:03.047' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'dc1d40b2-aafa-43db-a137-b46d29228f2d', -1, CAST(N'2024-12-21T12:09:19.183' AS DateTime), CAST(N'2024-12-21T12:16:36.680' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'efcaba97-2583-4be0-bd63-b82f233d4e38', -1, CAST(N'2024-12-18T15:38:03.310' AS DateTime), CAST(N'2024-12-18T15:44:21.360' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'f4956377-a6f5-468a-8c77-bc785388bc67', -1, CAST(N'2024-12-21T13:06:23.070' AS DateTime), CAST(N'2024-12-21T13:15:12.133' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'e070f359-7c9a-4e06-bd42-bfd225e705ea', -1, CAST(N'2024-12-18T16:12:14.613' AS DateTime), CAST(N'2024-12-18T16:12:14.613' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'65ed7d20-98dd-4ec9-806d-c0a7a34e8020', -1, CAST(N'2024-12-17T18:11:33.687' AS DateTime), CAST(N'2024-12-17T18:11:33.687' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'4c886397-f797-4db9-8400-c6733f05cfe3', -1, CAST(N'2024-12-18T15:57:43.597' AS DateTime), CAST(N'2024-12-18T15:58:43.113' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'8d5310f1-8cef-497b-bea5-c6975030b0b0', -1, CAST(N'2024-12-17T17:59:11.157' AS DateTime), CAST(N'2024-12-17T17:59:11.157' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'2da978a0-1bf8-4229-af6c-cd41db706bce', -1, CAST(N'2024-12-17T18:12:18.657' AS DateTime), CAST(N'2024-12-17T18:12:18.657' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'1f12369f-76c7-4077-8cc6-ce4d06d24340', -1, CAST(N'2024-12-21T12:56:13.763' AS DateTime), CAST(N'2024-12-21T12:56:13.763' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'4cf9717d-a2fe-4932-9d73-ce6ebb274948', -1, CAST(N'2024-12-17T18:03:41.223' AS DateTime), CAST(N'2024-12-17T18:03:41.223' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'c9e662b3-3c47-44f2-b645-d8a804952769', -1, CAST(N'2024-12-17T17:55:53.203' AS DateTime), CAST(N'2024-12-17T17:55:53.203' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'ea273350-30bc-4a63-99c6-d8d6ef062a2d', -1, CAST(N'2024-12-17T17:17:54.483' AS DateTime), CAST(N'2024-12-17T17:19:11.720' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'198e8424-3935-4e45-a99d-d92d1b5e9716', -1, CAST(N'2024-12-17T18:09:33.530' AS DateTime), CAST(N'2024-12-17T18:09:33.530' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'4153b7f8-f639-4da0-95f5-d9c34664ba71', -1, CAST(N'2024-12-10T10:48:51.730' AS DateTime), CAST(N'2024-12-10T10:48:51.730' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'aeabd2d4-8431-4869-965e-db8cef51760e', -1, CAST(N'2024-12-07T09:03:08.990' AS DateTime), CAST(N'2024-12-07T09:03:08.990' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'9c09dd02-6a29-44d3-9fea-ddf67ebea18a', -1, CAST(N'2024-12-17T18:06:13.500' AS DateTime), CAST(N'2024-12-17T18:07:21.073' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'9318f951-b54b-4df1-af6d-e5d745ac3a28', -1, CAST(N'2024-12-17T18:06:02.050' AS DateTime), CAST(N'2024-12-17T18:06:02.050' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'f42659bc-83a6-4b9d-b21b-e69ec5364323', -1, CAST(N'2024-12-19T19:15:30.193' AS DateTime), CAST(N'2024-12-19T19:19:06.380' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'45e4f699-f7fa-41fe-ab65-ea680741b1ee', -1, CAST(N'2024-12-15T10:19:27.167' AS DateTime), CAST(N'2024-12-15T10:19:27.167' AS DateTime), NULL, N'::1')
 
/****** Object:  Index [IX_cmsContentType]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentType] ON [dbo].[cmsContentType]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
SET ANSI_PADDING ON
 
/****** Object:  Index [IX_cmsContentType_icon]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_cmsContentType_icon] ON [dbo].[cmsContentType]
(
	[icon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_cmsDictionary_id]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDictionary_id] ON [dbo].[cmsDictionary]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
SET ANSI_PADDING ON
 
/****** Object:  Index [IX_cmsDictionary_key]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_cmsDictionary_key] ON [dbo].[cmsDictionary]
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_cmsMacro_UniqueId]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacro_UniqueId] ON [dbo].[cmsMacro]
(
	[uniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
SET ANSI_PADDING ON
 
/****** Object:  Index [IX_cmsMacroPropertyAlias]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroPropertyAlias] ON [dbo].[cmsMacro]
(
	[macroAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
SET ANSI_PADDING ON
 
/****** Object:  Index [IX_cmsMacroProperty_Alias]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroProperty_Alias] ON [dbo].[cmsMacroProperty]
(
	[macro] ASC,
	[macroPropertyAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_cmsMacroProperty_UniquePropertyId]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroProperty_UniquePropertyId] ON [dbo].[cmsMacroProperty]
(
	[uniquePropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
SET ANSI_PADDING ON
 
/****** Object:  Index [IX_cmsMember_LoginName]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_cmsMember_LoginName] ON [dbo].[cmsMember]
(
	[LoginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
SET ANSI_PADDING ON
 
/****** Object:  Index [IX_cmsPropertyTypeAlias]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_cmsPropertyTypeAlias] ON [dbo].[cmsPropertyType]
(
	[Alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_cmsPropertyTypeUniqueID]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeUniqueID] ON [dbo].[cmsPropertyType]
(
	[UniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_cmsPropertyTypeGroupUniqueID]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeGroupUniqueID] ON [dbo].[cmsPropertyTypeGroup]
(
	[uniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
SET ANSI_PADDING ON
 
/****** Object:  Index [IX_cmsTags]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsTags] ON [dbo].[cmsTags]
(
	[group] ASC,
	[tag] ASC,
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_cmsTags_LanguageId]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_cmsTags_LanguageId] ON [dbo].[cmsTags]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_cmsTemplate_nodeId]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsTemplate_nodeId] ON [dbo].[cmsTemplate]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoAccess_nodeId]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccess_nodeId] ON [dbo].[umbracoAccess]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
SET ANSI_PADDING ON
 
/****** Object:  Index [IX_umbracoAccessRule]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccessRule] ON [dbo].[umbracoAccessRule]
(
	[ruleValue] ASC,
	[ruleType] ASC,
	[accessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoContentVersion_NodeId]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoContentVersion_NodeId] ON [dbo].[umbracoContentVersion]
(
	[nodeId] ASC,
	[current] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoContentVersionCultureVariation_LanguageId]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoContentVersionCultureVariation_LanguageId] ON [dbo].[umbracoContentVersionCultureVariation]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoContentVersionCultureVariation_VersionId]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoContentVersionCultureVariation_VersionId] ON [dbo].[umbracoContentVersionCultureVariation]
(
	[versionId] ASC,
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoDocument_Published]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoDocument_Published] ON [dbo].[umbracoDocument]
(
	[published] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoDocumentCultureVariation_LanguageId]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoDocumentCultureVariation_LanguageId] ON [dbo].[umbracoDocumentCultureVariation]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoDocumentCultureVariation_NodeId]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoDocumentCultureVariation_NodeId] ON [dbo].[umbracoDocumentCultureVariation]
(
	[nodeId] ASC,
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoLanguage_fallbackLanguageId]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoLanguage_fallbackLanguageId] ON [dbo].[umbracoLanguage]
(
	[fallbackLanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
SET ANSI_PADDING ON
 
/****** Object:  Index [IX_umbracoLanguage_languageISOCode]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoLanguage_languageISOCode] ON [dbo].[umbracoLanguage]
(
	[languageISOCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoLog]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoLog] ON [dbo].[umbracoLog]
(
	[NodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
SET ANSI_PADDING ON
 
/****** Object:  Index [IX_umbracoMediaVersion]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoMediaVersion] ON [dbo].[umbracoMediaVersion]
(
	[id] ASC,
	[path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoNode_ObjectType]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_ObjectType] ON [dbo].[umbracoNode]
(
	[nodeObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoNode_ParentId]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_ParentId] ON [dbo].[umbracoNode]
(
	[parentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
SET ANSI_PADDING ON
 
/****** Object:  Index [IX_umbracoNode_Path]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_Path] ON [dbo].[umbracoNode]
(
	[path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoNode_Trashed]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_Trashed] ON [dbo].[umbracoNode]
(
	[trashed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoNode_UniqueId]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoNode_UniqueId] ON [dbo].[umbracoNode]
(
	[uniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoPropertyData_LanguageId]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoPropertyData_LanguageId] ON [dbo].[umbracoPropertyData]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoPropertyData_PropertyTypeId]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoPropertyData_PropertyTypeId] ON [dbo].[umbracoPropertyData]
(
	[propertyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
SET ANSI_PADDING ON
 
/****** Object:  Index [IX_umbracoPropertyData_Segment]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoPropertyData_Segment] ON [dbo].[umbracoPropertyData]
(
	[segment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
SET ANSI_PADDING ON
 
/****** Object:  Index [IX_umbracoPropertyData_VersionId]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoPropertyData_VersionId] ON [dbo].[umbracoPropertyData]
(
	[versionId] ASC,
	[propertyTypeId] ASC,
	[languageId] ASC,
	[segment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
SET ANSI_PADDING ON
 
/****** Object:  Index [IX_umbracoRedirectUrl]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRedirectUrl] ON [dbo].[umbracoRedirectUrl]
(
	[urlHash] ASC,
	[contentKey] ASC,
	[culture] ASC,
	[createDateUtc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoRelation_parentChildType]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelation_parentChildType] ON [dbo].[umbracoRelation]
(
	[parentId] ASC,
	[childId] ASC,
	[relType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
SET ANSI_PADDING ON
 
/****** Object:  Index [IX_umbracoRelationType_alias]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_alias] ON [dbo].[umbracoRelationType]
(
	[alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
SET ANSI_PADDING ON
 
/****** Object:  Index [IX_umbracoRelationType_name]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_name] ON [dbo].[umbracoRelationType]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoRelationType_UniqueId]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_UniqueId] ON [dbo].[umbracoRelationType]
(
	[typeUniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
SET ANSI_PADDING ON
 
/****** Object:  Index [IX_computerName]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_computerName] ON [dbo].[umbracoServer]
(
	[computerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoServer_isActive]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoServer_isActive] ON [dbo].[umbracoServer]
(
	[isActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
SET ANSI_PADDING ON
 
/****** Object:  Index [IX_umbracoUser_userLogin]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUser_userLogin] ON [dbo].[umbracoUser]
(
	[userLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
SET ANSI_PADDING ON
 
/****** Object:  Index [IX_umbracoUserGroup_userGroupAlias]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserGroup_userGroupAlias] ON [dbo].[umbracoUserGroup]
(
	[userGroupAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
SET ANSI_PADDING ON
 
/****** Object:  Index [IX_umbracoUserGroup_userGroupName]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserGroup_userGroupName] ON [dbo].[umbracoUserGroup]
(
	[userGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoUser2NodePermission_nodeId]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUser2NodePermission_nodeId] ON [dbo].[umbracoUserGroup2NodePermission]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoUserLogin_lastValidatedUtc]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUserLogin_lastValidatedUtc] ON [dbo].[umbracoUserLogin]
(
	[lastValidatedUtc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
/****** Object:  Index [IX_umbracoUserStartNode_startNodeType]    Script Date: 21. 12. 2024 15:25:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserStartNode_startNodeType] ON [dbo].[umbracoUserStartNode]
(
	[startNodeType] ASC,
	[startNode] ASC,
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
 
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_thumbnail]  DEFAULT ('folder.png') FOR [thumbnail]
 
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_isContainer]  DEFAULT ('0') FOR [isContainer]
 
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_isElement]  DEFAULT ('0') FOR [isElement]
 
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_allowAtRoot]  DEFAULT ('0') FOR [allowAtRoot]
 
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_variations]  DEFAULT ('1') FOR [variations]
 
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] ADD  CONSTRAINT [df_cmsContentTypeAllowedContentType_sortOrder]  DEFAULT ('0') FOR [SortOrder]
 
ALTER TABLE [dbo].[cmsDocumentType] ADD  CONSTRAINT [DF_cmsDocumentType_IsDefault]  DEFAULT ('0') FOR [IsDefault]
 
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroUseInEditor]  DEFAULT ('0') FOR [macroUseInEditor]
 
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroRefreshRate]  DEFAULT ('0') FOR [macroRefreshRate]
 
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCacheByPage]  DEFAULT ('1') FOR [macroCacheByPage]
 
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCachePersonalized]  DEFAULT ('0') FOR [macroCachePersonalized]
 
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroDontRender]  DEFAULT ('0') FOR [macroDontRender]
 
ALTER TABLE [dbo].[cmsMacroProperty] ADD  CONSTRAINT [DF_cmsMacroProperty_macroPropertySortOrder]  DEFAULT ('0') FOR [macroPropertySortOrder]
 
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Email]  DEFAULT ('''') FOR [Email]
 
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_LoginName]  DEFAULT ('''') FOR [LoginName]
 
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Password]  DEFAULT ('''') FOR [Password]
 
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_memberCanEdit]  DEFAULT ('0') FOR [memberCanEdit]
 
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_viewOnProfile]  DEFAULT ('0') FOR [viewOnProfile]
 
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_isSensitive]  DEFAULT ('0') FOR [isSensitive]
 
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_sortOrder]  DEFAULT ('0') FOR [sortOrder]
 
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_mandatory]  DEFAULT ('0') FOR [mandatory]
 
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_variations]  DEFAULT ('1') FOR [variations]
 
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_UniqueID]  DEFAULT (newid()) FOR [UniqueID]
 
ALTER TABLE [dbo].[cmsPropertyTypeGroup] ADD  CONSTRAINT [DF_cmsPropertyTypeGroup_uniqueID]  DEFAULT (newid()) FOR [uniqueID]
 
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_createDate]  DEFAULT (getdate()) FOR [createDate]
 
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_updateDate]  DEFAULT (getdate()) FOR [updateDate]
 
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_createDate]  DEFAULT (getdate()) FOR [createDate]
 
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_updateDate]  DEFAULT (getdate()) FOR [updateDate]
 
ALTER TABLE [dbo].[umbracoAudit] ADD  CONSTRAINT [DF_umbracoAudit_eventDateUtc]  DEFAULT (getdate()) FOR [eventDateUtc]
 
ALTER TABLE [dbo].[umbracoCacheInstruction] ADD  CONSTRAINT [DF_umbracoCacheInstruction_instructionCount]  DEFAULT ('1') FOR [instructionCount]
 
ALTER TABLE [dbo].[umbracoConsent] ADD  CONSTRAINT [DF_umbracoConsent_createDate]  DEFAULT (getdate()) FOR [createDate]
 
ALTER TABLE [dbo].[umbracoContentVersion] ADD  CONSTRAINT [DF_umbracoContentVersion_versionDate]  DEFAULT (getdate()) FOR [versionDate]
 
ALTER TABLE [dbo].[umbracoExternalLogin] ADD  CONSTRAINT [DF_umbracoExternalLogin_createDate]  DEFAULT (getdate()) FOR [createDate]
 
ALTER TABLE [dbo].[umbracoKeyValue] ADD  CONSTRAINT [DF_umbracoKeyValue_updated]  DEFAULT (getdate()) FOR [updated]
 
ALTER TABLE [dbo].[umbracoLanguage] ADD  CONSTRAINT [DF_umbracoLanguage_isDefaultVariantLang]  DEFAULT ('0') FOR [isDefaultVariantLang]
 
ALTER TABLE [dbo].[umbracoLanguage] ADD  CONSTRAINT [DF_umbracoLanguage_mandatory]  DEFAULT ('0') FOR [mandatory]
 
ALTER TABLE [dbo].[umbracoLog] ADD  CONSTRAINT [DF_umbracoLog_Datestamp]  DEFAULT (getdate()) FOR [Datestamp]
 
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_uniqueId]  DEFAULT (newid()) FOR [uniqueId]
 
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_trashed]  DEFAULT ('0') FOR [trashed]
 
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_createDate]  DEFAULT (getdate()) FOR [createDate]
 
ALTER TABLE [dbo].[umbracoRelation] ADD  CONSTRAINT [DF_umbracoRelation_datetime]  DEFAULT (getdate()) FOR [datetime]
 
ALTER TABLE [dbo].[umbracoServer] ADD  CONSTRAINT [DF_umbracoServer_registeredDate]  DEFAULT (getdate()) FOR [registeredDate]
 
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userDisabled]  DEFAULT ('0') FOR [userDisabled]
 
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userNoConsole]  DEFAULT ('0') FOR [userNoConsole]
 
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_createDate]  DEFAULT (getdate()) FOR [createDate]
 
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_updateDate]  DEFAULT (getdate()) FOR [updateDate]
 
ALTER TABLE [dbo].[umbracoUserGroup] ADD  CONSTRAINT [DF_umbracoUserGroup_createDate]  DEFAULT (getdate()) FOR [createDate]
 
ALTER TABLE [dbo].[umbracoUserGroup] ADD  CONSTRAINT [DF_umbracoUserGroup_updateDate]  DEFAULT (getdate()) FOR [updateDate]
 
ALTER TABLE [dbo].[cmsContentNu]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentNu_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
ON DELETE CASCADE
 
ALTER TABLE [dbo].[cmsContentNu] CHECK CONSTRAINT [FK_cmsContentNu_umbracoContent_nodeId]
 
ALTER TABLE [dbo].[cmsContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[cmsContentType] CHECK CONSTRAINT [FK_cmsContentType_umbracoNode_id]
 
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY([childContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child]
 
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY([parentContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent]
 
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType] FOREIGN KEY([Id])
REFERENCES [dbo].[cmsContentType] ([nodeId])
 
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType]
 
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1] FOREIGN KEY([AllowedId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
 
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1]
 
ALTER TABLE [dbo].[cmsDictionary]  WITH CHECK ADD  CONSTRAINT [FK_cmsDictionary_cmsDictionary_id] FOREIGN KEY([parent])
REFERENCES [dbo].[cmsDictionary] ([id])
 
ALTER TABLE [dbo].[cmsDictionary] CHECK CONSTRAINT [FK_cmsDictionary_cmsDictionary_id]
 
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
 
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId]
 
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId] FOREIGN KEY([templateNodeId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
 
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId]
 
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_umbracoNode_id]
 
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id] FOREIGN KEY([UniqueId])
REFERENCES [dbo].[cmsDictionary] ([id])
 
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id]
 
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
 
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id]
 
ALTER TABLE [dbo].[cmsMacroProperty]  WITH CHECK ADD  CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY([macro])
REFERENCES [dbo].[cmsMacro] ([id])
 
ALTER TABLE [dbo].[cmsMacroProperty] CHECK CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id]
 
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
 
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_umbracoContent_nodeId]
 
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY([Member])
REFERENCES [dbo].[cmsMember] ([nodeId])
 
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId]
 
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY([MemberGroup])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id]
 
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
 
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId]
 
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY([NodeId])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_umbracoNode_id]
 
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
 
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId]
 
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY([propertyTypeGroupId])
REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
 
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id]
 
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_umbracoDataType_nodeId] FOREIGN KEY([dataTypeId])
REFERENCES [dbo].[umbracoDataType] ([nodeId])
 
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_umbracoDataType_nodeId]
 
ALTER TABLE [dbo].[cmsPropertyTypeGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId] FOREIGN KEY([contenttypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
 
ALTER TABLE [dbo].[cmsPropertyTypeGroup] CHECK CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId]
 
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsContent] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
 
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsContent]
 
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
 
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType]
 
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY([tagId])
REFERENCES [dbo].[cmsTags] ([id])
 
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsTags_id]
 
ALTER TABLE [dbo].[cmsTags]  WITH CHECK ADD  CONSTRAINT [FK_cmsTags_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
 
ALTER TABLE [dbo].[cmsTags] CHECK CONSTRAINT [FK_cmsTags_umbracoLanguage_id]
 
ALTER TABLE [dbo].[cmsTemplate]  WITH CHECK ADD  CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[cmsTemplate] CHECK CONSTRAINT [FK_cmsTemplate_umbracoNode]
 
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id]
 
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY([loginNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id1]
 
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY([noAccessNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id2]
 
ALTER TABLE [dbo].[umbracoAccessRule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY([accessId])
REFERENCES [dbo].[umbracoAccess] ([id])
 
ALTER TABLE [dbo].[umbracoAccessRule] CHECK CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id]
 
ALTER TABLE [dbo].[umbracoContent]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContent_cmsContentType_NodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
 
ALTER TABLE [dbo].[umbracoContent] CHECK CONSTRAINT [FK_umbracoContent_cmsContentType_NodeId]
 
ALTER TABLE [dbo].[umbracoContent]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContent_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[umbracoContent] CHECK CONSTRAINT [FK_umbracoContent_umbracoNode_id]
 
ALTER TABLE [dbo].[umbracoContentSchedule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentSchedule_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
 
ALTER TABLE [dbo].[umbracoContentSchedule] CHECK CONSTRAINT [FK_umbracoContentSchedule_umbracoContent_nodeId]
 
ALTER TABLE [dbo].[umbracoContentSchedule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentSchedule_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
 
ALTER TABLE [dbo].[umbracoContentSchedule] CHECK CONSTRAINT [FK_umbracoContentSchedule_umbracoLanguage_id]
 
ALTER TABLE [dbo].[umbracoContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersion_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
 
ALTER TABLE [dbo].[umbracoContentVersion] CHECK CONSTRAINT [FK_umbracoContentVersion_umbracoContent_nodeId]
 
ALTER TABLE [dbo].[umbracoContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersion_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
 
ALTER TABLE [dbo].[umbracoContentVersion] CHECK CONSTRAINT [FK_umbracoContentVersion_umbracoUser_id]
 
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoContentVersion_id] FOREIGN KEY([versionId])
REFERENCES [dbo].[umbracoContentVersion] ([id])
 
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoContentVersion_id]
 
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
 
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoLanguage_id]
 
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoUser_id] FOREIGN KEY([availableUserId])
REFERENCES [dbo].[umbracoUser] ([id])
 
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoUser_id]
 
ALTER TABLE [dbo].[umbracoDataType]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDataType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[umbracoDataType] CHECK CONSTRAINT [FK_umbracoDataType_umbracoNode_id]
 
ALTER TABLE [dbo].[umbracoDocument]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocument_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
 
ALTER TABLE [dbo].[umbracoDocument] CHECK CONSTRAINT [FK_umbracoDocument_umbracoContent_nodeId]
 
ALTER TABLE [dbo].[umbracoDocumentCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
 
ALTER TABLE [dbo].[umbracoDocumentCultureVariation] CHECK CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoLanguage_id]
 
ALTER TABLE [dbo].[umbracoDocumentCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[umbracoDocumentCultureVariation] CHECK CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoNode_id]
 
ALTER TABLE [dbo].[umbracoDocumentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentVersion_cmsTemplate_nodeId] FOREIGN KEY([templateId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
 
ALTER TABLE [dbo].[umbracoDocumentVersion] CHECK CONSTRAINT [FK_umbracoDocumentVersion_cmsTemplate_nodeId]
 
ALTER TABLE [dbo].[umbracoDocumentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentVersion_umbracoContentVersion_id] FOREIGN KEY([id])
REFERENCES [dbo].[umbracoContentVersion] ([id])
 
ALTER TABLE [dbo].[umbracoDocumentVersion] CHECK CONSTRAINT [FK_umbracoDocumentVersion_umbracoContentVersion_id]
 
ALTER TABLE [dbo].[umbracoDomain]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDomain_umbracoNode_id] FOREIGN KEY([domainRootStructureID])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[umbracoDomain] CHECK CONSTRAINT [FK_umbracoDomain_umbracoNode_id]
 
ALTER TABLE [dbo].[umbracoLanguage]  WITH CHECK ADD  CONSTRAINT [FK_umbracoLanguage_umbracoLanguage_id] FOREIGN KEY([fallbackLanguageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
 
ALTER TABLE [dbo].[umbracoLanguage] CHECK CONSTRAINT [FK_umbracoLanguage_umbracoLanguage_id]
 
ALTER TABLE [dbo].[umbracoLog]  WITH CHECK ADD  CONSTRAINT [FK_umbracoLog_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
 
ALTER TABLE [dbo].[umbracoLog] CHECK CONSTRAINT [FK_umbracoLog_umbracoUser_id]
 
ALTER TABLE [dbo].[umbracoMediaVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoMediaVersion_umbracoContentVersion_id] FOREIGN KEY([id])
REFERENCES [dbo].[umbracoContentVersion] ([id])
 
ALTER TABLE [dbo].[umbracoMediaVersion] CHECK CONSTRAINT [FK_umbracoMediaVersion_umbracoContentVersion_id]
 
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoNode_id]
 
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoUser_id] FOREIGN KEY([nodeUser])
REFERENCES [dbo].[umbracoUser] ([id])
 
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoUser_id]
 
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_cmsPropertyType_id] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
 
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_cmsPropertyType_id]
 
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_umbracoContentVersion_id] FOREIGN KEY([versionId])
REFERENCES [dbo].[umbracoContentVersion] ([id])
 
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_umbracoContentVersion_id]
 
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
 
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_umbracoLanguage_id]
 
ALTER TABLE [dbo].[umbracoRedirectUrl]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID] FOREIGN KEY([contentKey])
REFERENCES [dbo].[umbracoNode] ([uniqueId])
 
ALTER TABLE [dbo].[umbracoRedirectUrl] CHECK CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID]
 
ALTER TABLE [dbo].[umbracoRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode]
 
ALTER TABLE [dbo].[umbracoRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY([childId])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode1]
 
ALTER TABLE [dbo].[umbracoRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY([relType])
REFERENCES [dbo].[umbracoRelationType] ([id])
 
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id]
 
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id]
 
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
 
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id]
 
ALTER TABLE [dbo].[umbracoUser2UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
 
ALTER TABLE [dbo].[umbracoUser2UserGroup] CHECK CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id]
 
ALTER TABLE [dbo].[umbracoUser2UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
 
ALTER TABLE [dbo].[umbracoUser2UserGroup] CHECK CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id]
 
ALTER TABLE [dbo].[umbracoUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_startContentId_umbracoNode_id] FOREIGN KEY([startContentId])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[umbracoUserGroup] CHECK CONSTRAINT [FK_startContentId_umbracoNode_id]
 
ALTER TABLE [dbo].[umbracoUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_startMediaId_umbracoNode_id] FOREIGN KEY([startMediaId])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[umbracoUserGroup] CHECK CONSTRAINT [FK_startMediaId_umbracoNode_id]
 
ALTER TABLE [dbo].[umbracoUserGroup2App]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
 
ALTER TABLE [dbo].[umbracoUserGroup2App] CHECK CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id]
 
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission] CHECK CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id]
 
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
 
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission] CHECK CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id]
 
ALTER TABLE [dbo].[umbracoUserLogin]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
 
ALTER TABLE [dbo].[umbracoUserLogin] CHECK CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id]
 
ALTER TABLE [dbo].[umbracoUserStartNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id] FOREIGN KEY([startNode])
REFERENCES [dbo].[umbracoNode] ([id])
 
ALTER TABLE [dbo].[umbracoUserStartNode] CHECK CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id]
 
ALTER TABLE [dbo].[umbracoUserStartNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
 
ALTER TABLE [dbo].[umbracoUserStartNode] CHECK CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id]
 
