﻿USE [DBUnitTesting]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 12/18/2017 4:41:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Company_IsActive]  DEFAULT ((0)),
	[CreatedDate] [date] NOT NULL,
	[ModifiedDate] [date] NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 12/18/2017 4:41:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
	[CompanyId] [numeric](18, 0) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Deaprtment_IsActive]  DEFAULT ((0)),
	[CreatedDate] [date] NOT NULL,
	[ModifiedDate] [date] NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Deaprtment] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubDepartment]    Script Date: 12/18/2017 4:41:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubDepartment](
	[SubDepartmentId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SubDepartmentName] [nvarchar](50) NOT NULL,
	[DepartmentId] [numeric](18, 0) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Employee_IsActive]  DEFAULT ((0)),
	[CreatedDate] [date] NOT NULL,
	[ModifiedDate] [date] NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[SubDepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubDepartmentLog]    Script Date: 12/18/2017 4:41:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubDepartmentLog](
	[SubDepartmentLogId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SubDepartmentId] [numeric](18, 0) NULL,
	[SubDepartmentName] [nvarchar](50) NULL,
	[DepartmentId] [numeric](18, 0) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_SubDepartmentLog] PRIMARY KEY CLUSTERED 
(
	[SubDepartmentLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Company]
GO
ALTER TABLE [dbo].[SubDepartment]  WITH CHECK ADD  CONSTRAINT [FK_SubDepartment_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[SubDepartment] CHECK CONSTRAINT [FK_SubDepartment_Department]
GO


/***********Company*****************/
INSERT INTO [company] ([CompanyName],[IsActive],[CreatedDate],[ModifiedDate],[CreatedBy],[ModifiedBy])VALUES('Gaja Digital Agency',1,getdate(),NULL,'System',NULL)
INSERT INTO [company] ([CompanyName],[IsActive],[CreatedDate],[ModifiedDate],[CreatedBy],[ModifiedBy])VALUES('Palmex',1,getdate(),NULL,'System',NULL)
INSERT INTO [company] ([CompanyName],[IsActive],[CreatedDate],[ModifiedDate],[CreatedBy],[ModifiedBy])VALUES('Arsha Consulting',1,getdate(),NULL,'System',NULL)
INSERT INTO [company] ([CompanyName],[IsActive],[CreatedDate],[ModifiedDate],[CreatedBy],[ModifiedBy])VALUES('Toboc',1,getdate(),NULL,'System',NULL)

/***********Department*****************/
INSERT INTO [department] ([DepartmentName],[CompanyId],[IsActive],[CreatedDate],[ModifiedDate],[CreatedBy],[ModifiedBy])VALUES('Software Development',1,1,getdate(),NULL,'System',NULL)
INSERT INTO [department] ([DepartmentName],[CompanyId],[IsActive],[CreatedDate],[ModifiedDate],[CreatedBy],[ModifiedBy])VALUES('Application Maintenance',1,1,getdate(),NULL,'System',NULL)
INSERT INTO [department] ([DepartmentName],[CompanyId],[IsActive],[CreatedDate],[ModifiedDate],[CreatedBy],[ModifiedBy])VALUES('Sales & Marketing',2,1,getdate(),NULL,'System',NULL)
INSERT INTO [department] ([DepartmentName],[CompanyId],[IsActive],[CreatedDate],[ModifiedDate],[CreatedBy],[ModifiedBy])VALUES('Consulting',3,1,getdate(),NULL,'System',NULL)
INSERT INTO [department] ([DepartmentName],[CompanyId],[IsActive],[CreatedDate],[ModifiedDate],[CreatedBy],[ModifiedBy])VALUES('Management',4,1,getdate(),NULL,'System',NULL)
INSERT INTO [department] ([DepartmentName],[CompanyId],[IsActive],[CreatedDate],[ModifiedDate],[CreatedBy],[ModifiedBy])VALUES('Toboc Deals',4,1,getdate(),NULL,'System',NULL)

/***********SubDepartment*****************/
INSERT INTO [subdepartment] ([SubDepartmentName],[DepartmentId],[IsActive],[CreatedDate],[ModifiedDate],[CreatedBy],[ModifiedBy])VALUES('Dotnet',1,1,getdate(),NULL,'System',NULL)
INSERT INTO [subdepartment] ([SubDepartmentName],[DepartmentId],[IsActive],[CreatedDate],[ModifiedDate],[CreatedBy],[ModifiedBy])VALUES('Nopcommerce',1,1,getdate(),NULL,'System',NULL)
INSERT INTO [subdepartment] ([SubDepartmentName],[DepartmentId],[IsActive],[CreatedDate],[ModifiedDate],[CreatedBy],[ModifiedBy])VALUES('Umbraco',2,1,getdate(),NULL,'System',NULL)
INSERT INTO [subdepartment] ([SubDepartmentName],[DepartmentId],[IsActive],[CreatedDate],[ModifiedDate],[CreatedBy],[ModifiedBy])VALUES('Palmex Commercial',3,1,getdate(),NULL,'System',NULL)
INSERT INTO [subdepartment] ([SubDepartmentName],[DepartmentId],[IsActive],[CreatedDate],[ModifiedDate],[CreatedBy],[ModifiedBy])VALUES('Palmex Individual',3,1,getdate(),NULL,'System',NULL)
INSERT INTO [subdepartment] ([SubDepartmentName],[DepartmentId],[IsActive],[CreatedDate],[ModifiedDate],[CreatedBy],[ModifiedBy])VALUES('Business Consultation',4,1,getdate(),NULL,'System',NULL)
INSERT INTO [subdepartment] ([SubDepartmentName],[DepartmentId],[IsActive],[CreatedDate],[ModifiedDate],[CreatedBy],[ModifiedBy])VALUES('HR',5,1,getdate(),NULL,'System',NULL)
INSERT INTO [subdepartment] ([SubDepartmentName],[DepartmentId],[IsActive],[CreatedDate],[ModifiedDate],[CreatedBy],[ModifiedBy])VALUES('Finance',5,1,getdate(),NULL,'System',NULL)
INSERT INTO [subdepartment] ([SubDepartmentName],[DepartmentId],[IsActive],[CreatedDate],[ModifiedDate],[CreatedBy],[ModifiedBy])VALUES('Toboc Deals Website',6,1,getdate(),NULL,'System',NULL)
