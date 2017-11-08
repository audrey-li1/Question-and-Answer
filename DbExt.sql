USE [fc]
GO

/****** Object:  Table [dbo].[TaskStatus]    Script Date: 11/10/2015 22:07:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TaskStatus](
	[TaskStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_TaskStatus] PRIMARY KEY CLUSTERED 
(
	[TaskStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [fc]
GO

/****** Object:  Table [dbo].[TaskType]    Script Date: 11/10/2015 22:07:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TaskType](
	[TaskTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TaskDescription] [nvarchar](200) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_TaskType] PRIMARY KEY CLUSTERED 
(
	[TaskTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [fc]
GO

 
USE [fc]
GO

/****** Object:  Table [dbo].[FASchoolList]    Script Date: 11/10/2015 22:07:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FASchoolList](
	[SchoolListID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CollegeName] [nvarchar](100) NOT NULL,
	[Comment] [nvarchar](500) NULL,
	[CollegeID] [int] NULL,
 CONSTRAINT [PK_FASchoolList] PRIMARY KEY CLUSTERED 
(
	[SchoolListID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[FASchoolList]  WITH CHECK ADD  CONSTRAINT [FK_FASchoolList_FAUser] FOREIGN KEY([CollegeID])
REFERENCES [dbo].[College] ([CollegeID])
GO

ALTER TABLE [dbo].[FASchoolList] CHECK CONSTRAINT [FK_FASchoolList_FAUser]
GO


USE [fc]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FAEssayIdea_FAUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[FAEssayIdea]'))
ALTER TABLE [dbo].[FAEssayIdea] DROP CONSTRAINT [FK_FAEssayIdea_FAUser]
GO

USE [fc]
GO

/****** Object:  Table [dbo].[FAEssayIdea]    Script Date: 11/10/2015 22:11:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FAEssayIdea]') AND type in (N'U'))
DROP TABLE [dbo].[FAEssayIdea]
GO

USE [fc]
GO

/****** Object:  Table [dbo].[FAEssayIdea]    Script Date: 11/10/2015 22:11:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FAEssayIdea](
	[EssayIdeaID] [int] IDENTITY(1,1) NOT NULL,
	[Idea] [nvarchar](500) NOT NULL,
	[UserID] [int] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[Comment] [nvarchar](500) NULL,
 CONSTRAINT [PK_FAEssayIdea] PRIMARY KEY CLUSTERED 
(
	[EssayIdeaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[FAEssayIdea]  WITH CHECK ADD  CONSTRAINT [FK_FAEssayIdea_FAUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[FAUser] ([UserID])
GO

ALTER TABLE [dbo].[FAEssayIdea] CHECK CONSTRAINT [FK_FAEssayIdea_FAUser]
GO



 

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FARecLetter_FAUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[FARecLetter]'))
ALTER TABLE [dbo].[FARecLetter] DROP CONSTRAINT [FK_FARecLetter_FAUser]
GO

USE [fc]
GO

/****** Object:  Table [dbo].[FARecLetter]    Script Date: 11/10/2015 22:26:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FARecLetter]') AND type in (N'U'))
DROP TABLE [dbo].[FARecLetter]
GO

USE [fc]
GO

/****** Object:  Table [dbo].[FARecLetter]    Script Date: 11/10/2015 22:26:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FARecLetter](
	[FARecLetterID] [int] IDENTITY(1,1) NOT NULL,
	[TeacherName] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
	[MeetingTime] [datetime] NOT NULL,
	[Agenda] [nvarchar](500) NOT NULL,
	[GradeLevel] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[Comment] [nvarchar](500) NULL,
 CONSTRAINT [PK_FARecLetter] PRIMARY KEY CLUSTERED 
(
	[FARecLetterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[FARecLetter]  WITH CHECK ADD  CONSTRAINT [FK_FARecLetter_FAUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[FAUser] ([UserID])
GO

ALTER TABLE [dbo].[FARecLetter] CHECK CONSTRAINT [FK_FARecLetter_FAUser]
GO

insert into tasktype (Taskdescription,isactive) values('Counselor Appointment',1);
insert into tasktype (Taskdescription,isactive) values('Independant Project',1);
insert into tasktype (Taskdescription,isactive) values('Standard Test',1);
insert into tasktype (Taskdescription,isactive) values('Extracurricular Activity',1);

insert into tasktype (Taskdescription,isactive) values('CommonApp',1);
insert into tasktype (Taskdescription,isactive) values('Personal Statement',1);
insert into tasktype (Taskdescription,isactive) values('Suppliment Essay',1);
insert into tasktype (Taskdescription,isactive) values('Profilio',1);
insert into tasktype (Taskdescription,isactive) values('School List',1);
insert into tasktype (Taskdescription,isactive) values('Interview',1);
insert into tasktype (Taskdescription,isactive) values('Other',1);


insert into [TaskStatus] ([Status],isactive) values('Planned',1);
insert into [TaskStatus] ([Status],isactive) values('Started',1);
insert into [TaskStatus] ([Status],isactive) values('Completed',1);
insert into [TaskStatus] ([Status],isactive) values('Delayed',1);
USE [FC]
GO

ALTER TABLE [dbo].[FATask] DROP CONSTRAINT [FK_FATask_TaskType]
GO

ALTER TABLE [dbo].[FATask] DROP CONSTRAINT [FK_FATask_TaskStatus]
GO

ALTER TABLE [dbo].[FATask] DROP CONSTRAINT [FK_FATask_FAUser]
GO

/****** Object:  Table [dbo].[FATask]    Script Date: 11/11/2015 2:16:07 PM ******/
DROP TABLE [dbo].[FATask]
GO

/****** Object:  Table [dbo].[FATask]    Script Date: 11/11/2015 2:16:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FATask](
	[TaskID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[TaskTypeID] [int] NOT NULL,
	[Remark] [nvarchar](200) NULL,
	[IsActive] [bit] NOT NULL,
	[DueDate] [datetime] NULL,
	[StatusID] [int] NOT NULL,
	[TaskDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_FATask] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[FATask]  WITH CHECK ADD  CONSTRAINT [FK_FATask_FAUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[FAUser] ([UserID])
GO

ALTER TABLE [dbo].[FATask] CHECK CONSTRAINT [FK_FATask_FAUser]
GO

ALTER TABLE [dbo].[FATask]  WITH CHECK ADD  CONSTRAINT [FK_FATask_TaskStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[TaskStatus] ([TaskStatusID])
GO

ALTER TABLE [dbo].[FATask] CHECK CONSTRAINT [FK_FATask_TaskStatus]
GO

ALTER TABLE [dbo].[FATask]  WITH CHECK ADD  CONSTRAINT [FK_FATask_TaskType] FOREIGN KEY([TaskTypeID])
REFERENCES [dbo].[TaskType] ([TaskTypeID])
GO

ALTER TABLE [dbo].[FATask] CHECK CONSTRAINT [FK_FATask_TaskType]
GO

----------------
USE [FC]
GO

ALTER TABLE [dbo].[FAProfile] DROP CONSTRAINT [FK_FAProfile_FAUser]
GO

/****** Object:  Table [dbo].[FAProfile]    Script Date: 11/13/2015 11:10:05 AM ******/
DROP TABLE [dbo].[FAProfile]
GO

/****** Object:  Table [dbo].[FAProfile]    Script Date: 11/13/2015 11:10:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FAProfile](
	[ProfileID] [int] NOT NULL,
	[UserID] [int] NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Cell] [nvarchar](15) NULL,
	[Tel] [nvarchar](15) NULL,
	[Bio] [nvarchar](500) NULL,
	[CreationDate] [datetime] NULL,
	[Zip] [nvarchar](10) NULL,
	[GraduationYear] [int] NULL,
	[HighSchool] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[FristName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Wechat] [nvarchar](50) NULL,
 CONSTRAINT [PK_FAProfile] PRIMARY KEY CLUSTERED 
(
	[ProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[FAProfile]  WITH CHECK ADD  CONSTRAINT [FK_FAProfile_FAUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[FAUser] ([UserID])
GO

ALTER TABLE [dbo].[FAProfile] CHECK CONSTRAINT [FK_FAProfile_FAUser]
GO

USE [FC]
GO

ALTER TABLE [dbo].[FAProfile] DROP CONSTRAINT [FK_FAProfile_FAUser]
GO

/****** Object:  Table [dbo].[FAProfile]    Script Date: 11/13/2015 2:33:10 PM ******/
DROP TABLE [dbo].[FAProfile]
GO

/****** Object:  Table [dbo].[FAProfile]    Script Date: 11/13/2015 2:33:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FAProfile](
	[ProfileID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Cell] [nvarchar](15) NULL,
	[Tel] [nvarchar](15) NULL,
	[Bio] [nvarchar](500) NULL,
	[CreationDate] [datetime] NULL,
	[Zip] [nvarchar](10) NULL,
	[GraduationYear] [int] NULL,
	[HighSchool] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[FristName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Wechat] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_FAProfile] PRIMARY KEY CLUSTERED 
(
	[ProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[FAProfile]  WITH CHECK ADD  CONSTRAINT [FK_FAProfile_FAUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[FAUser] ([UserID])
GO

ALTER TABLE [dbo].[FAProfile] CHECK CONSTRAINT [FK_FAProfile_FAUser]
GO

--------------------------


add LastAccessDateTime IsLocked AttemptCount to user

 USE [fc]
GO

/****** Object:  Table [dbo].[FAParentSurvey]    Script Date: 11/14/2015 18:58:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FAParentSurvey](
	[ParentSurveyID] [int] IDENTITY(1,1) NOT NULL,
	[HomeAddress] [nvarchar](100) NULL,
	[ContactPhone] [nchar](10) NULL,
	[Email] [nvarchar](50) NULL,
	[FatherAlmaMater] [nvarchar](50) NULL,
	[FatherJob] [nvarchar](50) NULL,
	[MotherAlmaMater] [nvarchar](50) NULL,
	[MotherJob] [nvarchar](50) NULL,
	[EarilyAccomplish] [nvarchar](50) NULL,
	[ChildPassionate] [nvarchar](50) NULL,
	[ThreeInterest] [nvarchar](50) NULL,
	[SignificantAchievement] [nvarchar](50) NULL,
	[BeyondAchievement] [nvarchar](500) NULL,
	[BookToRead] [nvarchar](500) NULL,
	[TeacherDescription] [nvarchar](500) NULL,
	[TimeManagementSkill] [nvarchar](500) NULL,
	[StrengthWekness] [nvarchar](500) NULL,
	[WhatGiveMotivation] [nvarchar](500) NULL,
	[WhyTopCollege] [nvarchar](500) NULL,
	[InvitationID] [int] NULL,
	[CreationDatetime] [datetime] NULL,
	[SurveyStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_FAParentSurvey] PRIMARY KEY CLUSTERED 
(
	[ParentSurveyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[FAParentSurvey]  WITH CHECK ADD  CONSTRAINT [FK_FAParentSurvey_FASurveyInvitation] FOREIGN KEY([ParentSurveyID])
REFERENCES [dbo].[FASurveyInvitation] ([FASurveyInvitationID])
GO

ALTER TABLE [dbo].[FAParentSurvey] CHECK CONSTRAINT [FK_FAParentSurvey_FASurveyInvitation]
GO


 
USE [fc]
GO

/****** Object:  Table [dbo].[FAStudentSurvey]    Script Date: 11/14/2015 18:58:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FAStudentSurvey](
	[StudentSurveyID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[SchoolName] [nvarchar](50) NULL,
	[Grade] [int] NULL,
	[MainEA] [nvarchar](500) NULL,
	[SubjectScore] [nvarchar](500) NULL,
	[Ranking] [nvarchar](50) NULL,
	[GPA] [nvarchar](50) NULL,
	[ThreePassion] [nvarchar](500) NULL,
	[CoolIdeas] [nvarchar](500) NULL,
	[Competitor] [nvarchar](500) NULL,
	[HelpAssignment] [nvarchar](500) NULL,
	[FiveBook] [nvarchar](500) NULL,
	[SaturdayAfternoon] [nvarchar](500) NULL,
	[ThreeAdult] [nvarchar](500) NULL,
	[Legacy] [nvarchar](200) NULL,
	[KeepOneEA] [nvarchar](500) NULL,
	[FavoriteSubject] [nvarchar](500) NULL,
	[DreamSchool] [nvarchar](200) NULL,
	[CollegeMajor] [nvarchar](200) NULL,
	[PastSummer] [nvarchar](500) NULL,
	[ResearchProject] [nvarchar](500) NULL,
	[TestScore] [nvarchar](200) NULL,
	[Award] [nvarchar](500) NULL,
	[Wish] [nvarchar](500) NULL,
	[FriendWord] [nvarchar](500) NULL,
	[SampleEssay] [nvarchar](1000) NULL,
	[TeachRec] [nvarchar](1000) NULL,
	[InvitationID] [int] NULL,
	[Complete] [bit] NULL,
	[CreationDatetime] [datetime] NULL,
	[SurveyStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_FAStudentSurvey] PRIMARY KEY CLUSTERED 
(
	[StudentSurveyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [fc]
GO

/****** Object:  Table [dbo].[FASurveyInvitation]    Script Date: 11/14/2015 18:59:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FASurveyInvitation](
	[FASurveyInvitationID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[InvitationCode] [nchar](10) NULL,
	[CreationDatetime] [datetime] NULL,
	[UserID] [int] NULL,
	[LastAccessDatetime] [datetime] NULL,
	[IsLocked] [bit] NULL,
	[AttemptCount] [int] NULL,
 CONSTRAINT [PK_FASurveyInvitation] PRIMARY KEY CLUSTERED 
(
	[FASurveyInvitationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[FASurveyInvitation]  WITH CHECK ADD  CONSTRAINT [FK_FASurveyInvitation_FAUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[FAUser] ([UserID])
GO

ALTER TABLE [dbo].[FASurveyInvitation] CHECK CONSTRAINT [FK_FASurveyInvitation_FAUser]
GO




 alter table [dbo].[FAStudentSurvey] add [Grant] nvarchar (500) null

 alter table  [dbo].[FAParentSurvey] alter column [EarilyAccomplish] nvarchar (500) null
  alter table  [dbo].[FAParentSurvey] alter column  [ChildPassionate] nvarchar (500) null
   alter table  [dbo].[FAParentSurvey] alter column  [ThreeInterest] nvarchar (500) null
    alter table  [dbo].[FAParentSurvey] alter column [SignificantAchievement] nvarchar (500) null

	---------------------
alter table farecletter alter column meetingTime datetime null
alter table farecletter alter column agenda nvarchar(2000) null

alter table FAProject add ProjectName nvarchar(100) not null


---------------------------
USE [FC]
GO
USE [FC]
GO

/****** Object:  Table [dbo].[FAUpdate]    Script Date: 12/8/2015 3:45:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FAUpdate](
	[FAUpdateID] [int] IDENTITY(1,1) NOT NULL,
	[UpdateRowID] [int] NULL,
	[UpdateDateTime] [datetime] NOT NULL CONSTRAINT [DF_FAUpdate_UpdateDateTime]  DEFAULT (getdate()),
	[UpdateByUserID] [int] NOT NULL,
	[Priority] [int] NOT NULL CONSTRAINT [DF_FAUpdate_Priority]  DEFAULT ((0)),
	[Viewed] [bit] NOT NULL CONSTRAINT [DF_FAUpdate_Viewed]  DEFAULT ((0)),
	[UpdateType] [nvarchar](100) NOT NULL,
	[TargetUserID] [int] NOT NULL CONSTRAINT [DF_FAUpdate_TargetUserID]  DEFAULT ((0)),
 CONSTRAINT [PK_FAUpdate] PRIMARY KEY CLUSTERED 
(
	[FAUpdateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[FAUpdate]  WITH CHECK ADD  CONSTRAINT [FK_FAUpdate_FAUser] FOREIGN KEY([UpdateByUserID])
REFERENCES [dbo].[FAUser] ([UserID])
GO

ALTER TABLE [dbo].[FAUpdate] CHECK CONSTRAINT [FK_FAUpdate_FAUser]
GO

ALTER TABLE [dbo].[FAUpdate]  WITH CHECK ADD  CONSTRAINT [FK_FAUpdate_TargetUser] FOREIGN KEY([TargetUserID])
REFERENCES [dbo].[FAUser] ([UserID])
GO

ALTER TABLE [dbo].[FAUpdate] CHECK CONSTRAINT [FK_FAUpdate_TargetUser]
GO

------------------------------
insert into FAReporttype (typedesc) values ('Monthly Report')

insert into FAReporttype (typedesc) values ('Annually Report')

insert into FAReporttype (typedesc) values ('Planning Report')

alter table FAReport add Viewed bit null
alter table FAReport add [Status] int null

 USE [FC]
GO

ALTER TABLE [dbo].[FAReport] DROP CONSTRAINT [FK_FAReport_Target_User]
GO

ALTER TABLE [dbo].[FAReport] DROP CONSTRAINT [FK_FAReport_FAReportType]
GO

ALTER TABLE [dbo].[FAReport] DROP CONSTRAINT [FK_FAReport_Author]
GO

/****** Object:  Table [dbo].[FAReport]    Script Date: 12/9/2015 4:44:37 PM ******/
DROP TABLE [dbo].[FAReport]
GO

/****** Object:  Table [dbo].[FAReport]    Script Date: 12/9/2015 4:44:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FAReport](
	[FAReportID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ReportYear] [int] NULL,
	[CreationDateTime] [datetime] NULL,
	[ReportTypeID] [int] NULL,
	[ReportContent] [nvarchar](2000) NULL,
	[ReportAuthorID] [int] NOT NULL,
	[Viewed] [bit] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_FAReport] PRIMARY KEY CLUSTERED 
(
	[FAReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[FAReport]  WITH CHECK ADD  CONSTRAINT [FK_FAReport_Author] FOREIGN KEY([ReportAuthorID])
REFERENCES [dbo].[FAUser] ([UserID])
GO

ALTER TABLE [dbo].[FAReport] CHECK CONSTRAINT [FK_FAReport_Author]
GO

ALTER TABLE [dbo].[FAReport]  WITH CHECK ADD  CONSTRAINT [FK_FAReport_FAReportType] FOREIGN KEY([ReportTypeID])
REFERENCES [dbo].[FAReportType] ([ReportTypeID])
GO

ALTER TABLE [dbo].[FAReport] CHECK CONSTRAINT [FK_FAReport_FAReportType]
GO

ALTER TABLE [dbo].[FAReport]  WITH CHECK ADD  CONSTRAINT [FK_FAReport_Target_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[FAUser] ([UserID])
GO

ALTER TABLE [dbo].[FAReport] CHECK CONSTRAINT [FK_FAReport_Target_User]
GO


---------------------------

USE [FC]
GO

/****** Object:  Table [dbo].[FASummerProgram]    Script Date: 12/10/2015 11:09:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FASummerProgram](
	[FASummerProgramID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Name] [nvarchar](100) NULL,
	[Rank] [int] NULL,
	[IsActive] [bit] NULL,
	[Country] [nvarchar](50) NULL,
	[SpecialRequirement] [nvarchar](200) NULL,
	[WhenToAppy] [datetime] NULL,
	[Deadline] [datetime] NULL,
	[RequiredEssay] [bit] NULL,
	[RequiredInterview] [bit] NULL,
	[LengthInDay] [int] NULL,
	[Location] [nvarchar](50) NULL,
	[InternationalScope] [bit] NULL,
	[CreateDateTime] [datetime] NULL,
 CONSTRAINT [PK_FASummerProgram] PRIMARY KEY CLUSTERED 
(
	[FASummerProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [FC]
GO

/****** Object:  Table [dbo].[FASummerProgramWatch]    Script Date: 12/10/2015 11:10:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FASummerProgramWatch](
	[SummerProgramWatchID] [int] IDENTITY(1,1) NOT NULL,
	[SummerProgramID] [int] NULL,
	[UserID] [int] NULL,
	[IsActive] [bit] NULL,
	[CreationDatetime] [datetime] NULL,
 CONSTRAINT [PK_FASummerProgramWatch] PRIMARY KEY CLUSTERED 
(
	[SummerProgramWatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[FASummerProgramWatch]  WITH CHECK ADD  CONSTRAINT [FK_FASummerProgramWatch_FASummerProgram] FOREIGN KEY([SummerProgramID])
REFERENCES [dbo].[FASummerProgram] ([FASummerProgramID])
GO

ALTER TABLE [dbo].[FASummerProgramWatch] CHECK CONSTRAINT [FK_FASummerProgramWatch_FASummerProgram]
GO

ALTER TABLE [dbo].[FASummerProgramWatch]  WITH CHECK ADD  CONSTRAINT [FK_FASummerProgramWatch_FAUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[FAUser] ([UserID])
GO

ALTER TABLE [dbo].[FASummerProgramWatch] CHECK CONSTRAINT [FK_FASummerProgramWatch_FAUser]
GO

alter table dbo.FASummerProgram add AcceptRate int null
alter table dbo.FASummerProgram add Fee int null
alter table dbo.FASummerProgram add FocusField nvarchar(200) null
alter table dbo.FASummerProgram add FromGrade int null


----------------------

alter table dbo.FAReport alter column reportcontent nvarchar(max)
alter table dbo.FARecLetter  alter column  Agenda nvarchar(max)

alter table dbo.FAPrideNote  alter column  Note  nvarchar(max)
alter table dbo.FAPrideNote  alter column  Comment  nvarchar(max)

alter table  dbo.FAProjectUpdate  alter column  UpdateContent    nvarchar(max)
alter table   dbo.FATask  alter column  Remark     nvarchar(max)
alter table  dbo.FATask   alter column   TaskDescription    nvarchar(max)



alter table dbo.FAEA add  VolunteerHour int