
ALTER DATABASE [InternSWDemo] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InternSWDemo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InternSWDemo] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [InternSWDemo] SET ANSI_NULLS OFF
GO
ALTER DATABASE [InternSWDemo] SET ANSI_PADDING OFF
GO
ALTER DATABASE [InternSWDemo] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [InternSWDemo] SET ARITHABORT OFF
GO
ALTER DATABASE [InternSWDemo] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [InternSWDemo] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [InternSWDemo] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [InternSWDemo] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [InternSWDemo] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [InternSWDemo] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [InternSWDemo] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [InternSWDemo] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [InternSWDemo] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [InternSWDemo] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [InternSWDemo] SET  DISABLE_BROKER
GO
ALTER DATABASE [InternSWDemo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [InternSWDemo] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [InternSWDemo] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [InternSWDemo] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [InternSWDemo] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [InternSWDemo] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [InternSWDemo] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [InternSWDemo] SET  READ_WRITE
GO
ALTER DATABASE [InternSWDemo] SET RECOVERY SIMPLE
GO
ALTER DATABASE [InternSWDemo] SET  MULTI_USER
GO
ALTER DATABASE [InternSWDemo] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [InternSWDemo] SET DB_CHAINING OFF
GO
USE [InternSWDemo]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 08/20/2019 15:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdminUser](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
	[GroupID] [varchar](20) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AdminUser] ON
INSERT [dbo].[AdminUser] ([ID], [UserName], [Password], [Name], [Email], [Address], [Phone], [Status], [GroupID]) VALUES (1, N'admin', N'123', N'Trần Đắc Tính', N'trandactinh16@yahoo.com', N'Hue', N'0973822918', 1, N'ADMIN')
INSERT [dbo].[AdminUser] ([ID], [UserName], [Password], [Name], [Email], [Address], [Phone], [Status], [GroupID]) VALUES (3, N'admin1', N'123', N'Ngô Hồng Hùng', N'abcdef@gmail.com', N'Phú Bài Hương Thủy Thừa Thiên Huế', N'0973822918', 1, N'MOD')
INSERT [dbo].[AdminUser] ([ID], [UserName], [Password], [Name], [Email], [Address], [Phone], [Status], [GroupID]) VALUES (13, N'admin2', N'123', N'Nguyễn Quang Tính', N'alsfk@gmail.com', N'Hà Nội', N'0981827412', 1, N'MEMBER')
SET IDENTITY_INSERT [dbo].[AdminUser] OFF
/****** Object:  Table [dbo].[UserGroup]    Script Date: 08/20/2019 15:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'ADMIN', N'Quản trị')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MEMBER', N'Thành viên')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MOD', N'Quản lý')
/****** Object:  Table [dbo].[User]    Script Date: 08/20/2019 15:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[GroupID] [varchar](20) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON
INSERT [dbo].[User] ([UserId], [Name], [Phone], [Email], [GroupID]) VALUES (1, N'Trần Đắc Tính', N'0973822918', N'trandactinh16@yahoo.com', N'MEMBER')
INSERT [dbo].[User] ([UserId], [Name], [Phone], [Email], [GroupID]) VALUES (15, N'admin', NULL, NULL, N'MEMBER')
INSERT [dbo].[User] ([UserId], [Name], [Phone], [Email], [GroupID]) VALUES (16, N'Đặng Ngọc Anh', N'0973822918', N'trandactinh16@yahoo.com', NULL)
INSERT [dbo].[User] ([UserId], [Name], [Phone], [Email], [GroupID]) VALUES (17, N'Phước Hưng', N'124124124142', N'abcd@gmail.com', NULL)
INSERT [dbo].[User] ([UserId], [Name], [Phone], [Email], [GroupID]) VALUES (20, N'ĐắcTính  Trần', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Table [dbo].[Topic]    Script Date: 08/20/2019 15:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[TopicId] [int] IDENTITY(1,1) NOT NULL,
	[TopicName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[TopicId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Topic] ON
INSERT [dbo].[Topic] ([TopicId], [TopicName]) VALUES (1, N'ASP.NET')
INSERT [dbo].[Topic] ([TopicId], [TopicName]) VALUES (5, N'JAVA')
SET IDENTITY_INSERT [dbo].[Topic] OFF
/****** Object:  Table [dbo].[Credential]    Script Date: 08/20/2019 15:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupID] [varchar](20) NOT NULL,
	[RoleID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'MOD', N'LOOKUP_RES')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'MOD', N'VIEW_USER')
/****** Object:  Table [dbo].[Role]    Script Date: 08/20/2019 15:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (N'ADD_ANS', N'Thêm đáp án')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (N'ADD_QUES', N'Thêm câu hỏi')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (N'ADD_TOPIC', N'Thêm đề tài')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (N'ADD_USER', N'Thêm mới user')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (N'DELETE_ANS', N'Xóa đáp án')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (N'DELETE_QUES', N'Xóa câu hỏi')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (N'DELETE_TOPIC', N'Xóa đề tài')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (N'DELETE_USER', N'Xóa user')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (N'EDIT_ANS', N'Sửa đáp án')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (N'EDIT_QUES', N'Sửa câu hỏi')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (N'EDIT_USER', N'Sửa user')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (N'LOOKUP_RES', N'Tra cứu kết quả')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (N'VIEW_ANS', N'Xem đáp án')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (N'VIEW_QUES', N'Xem danh sách câu hỏi')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (N'VIEW_TOPIC', N'Xem đề tài')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (N'VIEW_USER', N'Xem danh sách user')
/****** Object:  Table [dbo].[Score]    Script Date: 08/20/2019 15:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Score](
	[ScoreId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Score] [int] NULL,
	[TestDate] [datetime] NOT NULL,
	[Detail] [nvarchar](500) NULL,
	[TopicId] [int] NULL,
 CONSTRAINT [PK_Score] PRIMARY KEY CLUSTERED 
(
	[ScoreId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Score] ON
INSERT [dbo].[Score] ([ScoreId], [UserId], [Score], [TestDate], [Detail], [TopicId]) VALUES (31, 16, 30, CAST(0x0000AA8D0185F01E AS DateTime), N'Không đạt', 1)
INSERT [dbo].[Score] ([ScoreId], [UserId], [Score], [TestDate], [Detail], [TopicId]) VALUES (33, 16, 70, CAST(0x0000AA8D01865BFC AS DateTime), N'Đạt', 1)
INSERT [dbo].[Score] ([ScoreId], [UserId], [Score], [TestDate], [Detail], [TopicId]) VALUES (34, 1, 100, CAST(0x0000A41300000000 AS DateTime), N'Đạt', 5)
INSERT [dbo].[Score] ([ScoreId], [UserId], [Score], [TestDate], [Detail], [TopicId]) VALUES (35, 17, 20, CAST(0x0000AA8E0091A02A AS DateTime), N'Không đạt', 5)
INSERT [dbo].[Score] ([ScoreId], [UserId], [Score], [TestDate], [Detail], [TopicId]) VALUES (37, 1, 70, CAST(0x0000AA8E009E9AE7 AS DateTime), N'Đạt', 1)
INSERT [dbo].[Score] ([ScoreId], [UserId], [Score], [TestDate], [Detail], [TopicId]) VALUES (39, 1, 30, CAST(0x0000AA8E00A5FF59 AS DateTime), N'Không đạt', 1)
INSERT [dbo].[Score] ([ScoreId], [UserId], [Score], [TestDate], [Detail], [TopicId]) VALUES (40, 1, 10, CAST(0x0000AA8E00A64D13 AS DateTime), N'Không đạt', 1)
INSERT [dbo].[Score] ([ScoreId], [UserId], [Score], [TestDate], [Detail], [TopicId]) VALUES (42, 16, 10, CAST(0x0000AAA3010A5BD9 AS DateTime), N'Không đạt', 1)
INSERT [dbo].[Score] ([ScoreId], [UserId], [Score], [TestDate], [Detail], [TopicId]) VALUES (43, 16, 40, CAST(0x0000AAA3010A81EF AS DateTime), N'Không đạt', 1)
INSERT [dbo].[Score] ([ScoreId], [UserId], [Score], [TestDate], [Detail], [TopicId]) VALUES (44, 17, 50, CAST(0x0000AAA3010AB315 AS DateTime), N'Đạt', 1)
INSERT [dbo].[Score] ([ScoreId], [UserId], [Score], [TestDate], [Detail], [TopicId]) VALUES (45, 17, 80, CAST(0x0000AAA3010AC480 AS DateTime), N'Đạt', 5)
SET IDENTITY_INSERT [dbo].[Score] OFF
/****** Object:  StoredProcedure [dbo].[Sp_User_Login]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_User_Login]
		@UserName varchar(50),
		@Password varchar(50)
as
begin
	declare @count int
	declare @res bit
	select @count = COUNT(*) from [User] where UserName = @UserName and [Password] = @Password
	if @count > 0
		set @res = 1;
	else
		set @res = 0;
	select @res
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Topic_ListAll]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_Topic_ListAll]
as
begin
	select * from Topic
end
GO
/****** Object:  Table [dbo].[Question]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionName] [nvarchar](500) NULL,
	[TopicId] [int] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Question] ON
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (2, N'Phát biểu nào sau đây đúng?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (3, N'Địa chỉ URL của ứng dụng web được xác định bởi?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (4, N'Ngôn ngữ nào dưới đây có thể được dùng để viết các kịch bản phía Server trong ASP.NET?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (5, N'Để chạy trang ASP .NET bạn cần có tối thiểu?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (6, N'Khi một trang .aspx được yêu cầu, kết quả xuất ra trên trình duyệt có dạng sau:', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (7, N'Khi biên dịch một ứng dụng ASP.Net, kết quả tạo ra có dạng nào?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (8, N'Để viết ASP.Net code trên cùng trang với HTML bạn đặt khối lệnh trong thẻ nào?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (9, N'Sự kiện nào dưới đây phát sinh đầu tiên trong vòng đời một trang aspx?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (10, N'PostBack có cho Form nào dưới đây?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (11, N'Đối tượng Transaction được tạo bởi phương thức nào?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (12, N'Điều nào sau đây không phải là ưu điểm của Server control so với HTML control?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (13, N'Ứng dụng Web không sử dụng control nào?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (14, N'Lệnh SQL nào dùng để thêm 1 dòng mới vào một bảng trong cơ sở dữ liệu?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (15, N'Chúng ta sử dụng giao dịch khi?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (16, N'Cookie là?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (17, N'Thuộc tính HTML nào xác định một văn bản sẽ dùng thay thế cho hình ảnh, nếu hình ảnh không thể được hiển thị?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (18, N'Các chú thích HTML (comment) bắt đầu bởi <!-- và kết thúc bởi -->', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (19, N'Thẻ HTML nào tạo ra một danh sách đổ xuống (drop-down list)?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (20, N'Phần tử HTML nào thực hiện xuống dòng mới?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (21, N'Thẻ HTML nào dùng để chèn hình ảnh vào trang web?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (22, N'Đoạn HTML nào là đúng để tạo một liên kết?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (23, N' Đâu là phần tử HTML tạo ra 1 danh sách đầu mục bằng số?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (24, N'Chọn phần tử HTML nào đúng nhất cho định dạng tiêu đề là lớn nhất?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (25, N' Ký tự nào dùng để kết thúc một thẻ trong HTML?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (26, N'Chọn phần tử HTML đúng nhất để diễn mức quan trọng của văn bản?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (27, N'Ai đang làm các chuẩn cho Web?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (28, N'Thẻ <input type=”Submit” …> dùng để làm gì?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (29, N'Thẻ HTML nào tạo ra một ô nhập dữ liệu?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (30, N'Chuẩn HTML là cho cái gì?', 1)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (31, N'Kích thước của 1 Char là bao nhiêu?', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (32, N'1 class không thể được khai báo ở chế độ', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (33, N'Kết quả sau khi biên dịch mã int a = 3.5', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (34, N'Kết quả khi biên dịch mã int a1 = 5; double a2 = (float)a1', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (35, N'Kết quả sau khi biên dịch mã int a = 9/0', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (36, N'Kết quả sau khi biên dịch mã: float a = 9/0', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (37, N'1 Class có thể hoạt động ở chế độ tạm thời - transient', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (38, N'Kết quả sau khi biên dịch mã: Class A{int b = 1; public static void main(String[] args) {System.out.println(“b is” + b);}}', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (39, N'Kết quả sau khi biên dịch mã class A { public static void main(String [] args) {B b = new A(); }} class B extends A {}', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (40, N'Kết quả sau khi biên dịch mã: class A { public static void main(String[] args) {A a = new B();}} class B extends A{}', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (41, N'Các cấu trúc, cú pháp được đánh dấu protected có thể được gọi trong bất kỳ subclass nào của class đó', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (42, N' 1 class abstract có thể sử dụng cú pháp non - abstract', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (43, N'Các từ khóa Java được khai báo bằng chữ thường cũng như chữ in hoa', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (44, N'Khái niệm instanceof là gì?', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (45, N'Primitive datatype được phân bổ dựa trên stack', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (46, N'Có thể so sánh giá trị boolean với integer', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (47, N'Nếu class A làm việc với phần giao diện thì có phải thực thi tất cả các cấu trúc của giao diện đó', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (48, N'Integer a = new Integer(2); Integer b = new Integer(2). Chuyện gì sẽ xảy ra nếu chúng ta áp dụng cú pháp if (a==b)?', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (49, N'Cấu trúc wait(), notify() và notifyAll() trong 1 đối tượng cần được gọi ra từ phần mã đã đồng bộ hóa?', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (50, N'Inner class có thể được khởi tạo bên trong các khối cấu trúc', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (51, N'Synchronized là từ khóa được dùng để Thread chọn một đối tượng bất kỳ đã được khóa trước khi tiếp tục thực thi lệnh', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (52, N'Cú pháp mặc định của switch luôn luôn được thực thi', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (53, N'Làm thế nào để ngăn chặn 1 biến - variable trở thành serialized - có khả năng nối tiếp', 5)
INSERT [dbo].[Question] ([QuestionId], [QuestionName], [TopicId]) VALUES (72, N'10+10=?', 1)
SET IDENTITY_INSERT [dbo].[Question] OFF
/****** Object:  StoredProcedure [dbo].[List_User]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[List_User] 
as
begin
	select *from [User]
end
GO
/****** Object:  StoredProcedure [dbo].[Sum_User_Pass]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sum_User_Pass] 
as
begin
	select count(distinct c.UserId)  
	from Score as c
	where c.Score >=50
end
GO
/****** Object:  StoredProcedure [dbo].[Sum_User]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sum_User]
as
begin
select count(distinct c.UserId)  
	from Score as c
end
GO
/****** Object:  StoredProcedure [dbo].[Count_Test_Pass_By_Date]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Count_Test_Pass_By_Date] (@DateStart datetime,
						   @DateFinish datetime)
as
begin
	select count(*)  
	from Score as c
	where @DateStart <= c.TestDate and c.TestDate <= @DateFinish and c.Score >=50
end
GO
/****** Object:  StoredProcedure [dbo].[Count_Test_By_Date]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Count_Test_By_Date] @DateStart datetime,
						   @DateFinish datetime
as
begin
	select count(*)  
	from Score as c
	where @DateStart <= c.TestDate and c.TestDate <= @DateFinish
end
GO
/****** Object:  StoredProcedure [dbo].[Count_Test]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Count_Test] @userId int
as
begin
	select COUNT(*) from Score
	where Score.UserId = @userId
end
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[Answer] [nvarchar](500) NULL,
	[IsCorrect] [bit] NULL,
	[QuestionId] [int] NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Answer] ON
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (5, N'Phần thực thi của ứng dụng web chạy dưới sự điều khiển của web server', 0, 2)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (6, N'Ứng dụng web không cần phải được cài đặt trên phía client', 0, 2)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (7, N'Dịch vụ web là một loại ứng dụng Internet', 0, 2)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (8, N'Tất cả câu trả lời đều đúng', 1, 2)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (9, N'Thư mục ảo của ứng dụng', 0, 3)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (10, N'Thư mục vật lý của ứng dụng', 1, 3)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (11, N'Tên của Project', 0, 3)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (12, N'Cả 3 câu đều sai', 0, 3)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (13, N'C#', 0, 4)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (14, N'Visual Basic', 0, 4)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (15, N'C++', 0, 4)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (16, N'Cả A và B đều đúng ', 1, 4)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (17, N'Windows explorer', 0, 5)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (18, N'Một trình duyệt Web', 0, 5)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (19, N'Common Language Runtime', 0, 5)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (20, N'Cả A và B đều đúng', 1, 5)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (21, N'HTML', 1, 6)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (22, N'XML', 0, 6)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (23, N'WML', 0, 6)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (24, N'Cả 3 câu a,b,c đều đúng', 0, 6)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (25, N'EXE', 0, 7)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (26, N'DLL', 1, 7)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (27, N'COM', 0, 7)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (28, N'Tất cả đều đúng', 0, 7)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (29, N'<Script>', 1, 8)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (30, N'<Body>', 0, 8)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (31, N'<Head>', 0, 8)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (32, N'Cả 2 câu b,c đều đúng', 0, 8)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (33, N'Page_Init()', 1, 9)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (34, N'Page_Load()', 0, 9)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (35, N'Page_click()', 0, 9)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (36, N'Page_Begin()', 0, 9)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (37, N'Winforms', 0, 10)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (38, N'HTMLForms', 0, 10)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (39, N'Webforms', 1, 10)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (40, N'Cả 3 câu a,b,c đều đúng', 0, 10)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (41, N'NewTransaction', 0, 11)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (42, N'StartTransaction', 0, 11)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (43, N'BeginTransaction', 1, 11)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (44, N'CreateTransaction', 0, 11)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (45, N'Duy trì dữ liệu trên control', 0, 12)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (46, N'Hiển thị không phụ thuộc vào trình duyệt', 0, 12)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (47, N'Có các sự kiện riêng biệt', 1, 12)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (48, N'Tốc độ hiển thị nhanh', 0, 12)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (49, N'Windows controls', 1, 13)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (50, N'Server controls', 0, 13)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (51, N'HTML controls', 0, 13)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (52, N'User controls', 0, 13)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (53, N'Custom controls', 0, 13)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (54, N'INSERT NEW ', 0, 14)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (56, N'INSERT ROW', 0, 14)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (57, N'INSERT INTO', 1, 14)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (58, N'Lập trình các ứng dụng thương mại điện tử', 0, 15)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (59, N'Lập trình các ứng dụng cơ sở dữ liệu phức tạp', 0, 15)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (60, N'Thực hiện nhiều lệnh cơ sở dữ liệu như một lệnh', 0, 15)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (61, N'Cả 3 đáp án trên đều đúng', 1, 15)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (62, N'Một chuỗi kí tự trong dòng đại chỉ Web', 0, 16)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (63, N'Một file nằm trên server', 0, 16)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (64, N'Một file nằm trên Client', 1, 16)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (65, N'Một file XML', 0, 16)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (66, N'alt', 1, 17)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (67, N'src', 0, 17)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (68, N'title ', 0, 17)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (69, N'longdesc', 0, 17)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (70, N'True', 1, 18)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (71, N'False', 0, 18)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (72, N'<select>', 1, 19)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (73, N'<list>', 0, 19)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (74, N'<input type="list">', 0, 19)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (75, N'<input type="dropdown">', 0, 19)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (76, N'<lb>', 0, 20)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (77, N'<br>', 1, 20)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (78, N'<breack>', 0, 20)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (79, N'<p>', 0, 20)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (80, N'<img>image.gif</img>', 0, 21)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (81, N'<img src="image.gif">', 1, 21)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (82, N'<image src="image.gif">', 0, 21)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (83, N'<img href="image.gif>', 0, 21)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (84, N'<a>http://www.timoday.edu.vn</a>', 0, 22)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (85, N'<a name="http://www.timoday.edu.vn">Tìm ở đây</a>', 0, 22)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (86, N'<a url="http://www.timoday.edu.vn">Tìm ở đây</a>', 0, 22)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (87, N'<a href="http://www.timoday.edu.vn">Tìm ở đây</a>', 1, 22)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (88, N'<list>', 0, 23)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (89, N'<ul>', 0, 23)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (90, N'<dl>', 0, 23)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (91, N'<ol>', 1, 23)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (92, N'<heading>', 0, 24)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (93, N' <h6>', 0, 24)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (94, N'<h1>', 1, 24)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (95, N'<head>', 0, 24)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (96, N'<', 0, 25)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (97, N'^', 0, 25)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (98, N'*', 0, 25)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (99, N'/', 1, 25)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (100, N'<strong>', 1, 26)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (101, N'<b>', 0, 26)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (102, N'<important>', 0, 26)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (103, N'<i>', 0, 26)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (104, N'Tổ chức World Wide Web Consortium(W3C)', 1, 27)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (105, N'Mozilla', 0, 27)
GO
print 'Processed 100 total records'
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (106, N'Google', 0, 27)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (107, N'Microsoft', 0, 27)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (108, N'Tạo một nút lệnh dùng để gửi tin trong form đi', 1, 28)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (109, N'Tạo một ô text để nhập dữ liệu', 0, 28)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (110, N'Tạo một nút lệnh dùng để xoá thông tin trong form', 0, 28)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (111, N'Tất cả các ý kiến trên', 0, 28)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (112, N'<input type="textfield">', 0, 29)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (113, N'<textinput type="text">', 0, 29)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (114, N'<textfield>', 0, 29)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (115, N'<input type="text">', 1, 29)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (116, N'Hyperlinks and Text Markup Language', 0, 30)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (117, N'Home Tool Markup Language', 0, 30)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (118, N'Hyper Text Markup Language', 1, 30)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (119, N'4 bit', 0, 31)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (120, N'7 bit', 0, 31)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (121, N'8 bit', 0, 31)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (122, N'16 bit', 1, 31)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (123, N'Static', 0, 32)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (124, N'Private', 1, 32)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (125, N'Default', 0, 32)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (126, N'Compilation error', 1, 33)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (127, N'Runtime error', 0, 33)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (128, N'3.5', 0, 33)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (129, N'3', 0, 33)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (130, N'Compilation error', 0, 34)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (131, N'Runtime error', 0, 34)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (132, N'No error', 1, 34)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (133, N'Compilatinon error: Phép tính chia phải nằm trong cú pháp try', 0, 35)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (134, N'Compilation error: DivideByZeroException', 0, 35)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (135, N'Runtime Exception', 1, 35)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (136, N'No Error: kết quả là NaN', 0, 35)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (137, N'Compilation error: Phép tính chia phải nằm trong cú pháp try', 0, 36)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (138, N'Compilation error: DivideByZeroException', 0, 36)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (139, N'Runtime Exception', 1, 36)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (140, N'No Error: Kết quả là NaN', 0, 36)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (141, N'Đúng', 0, 37)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (142, N'Sai', 1, 37)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (143, N'Compilation error', 1, 38)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (144, N'Runtime Error', 0, 38)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (145, N'Runtime Exception', 0, 38)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (146, N'Kết quả của b là 1', 0, 38)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (147, N'Compile error', 1, 39)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (148, N'Runtime Exception', 0, 39)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (149, N'No error', 0, 39)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (150, N'Compiler error', 0, 40)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (151, N'Compiler error', 0, 40)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (152, N'No error', 1, 40)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (153, N'Đúng', 1, 41)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (154, N'Sai', 0, 41)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (155, N'Đúng', 1, 42)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (156, N'Sai', 0, 42)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (157, N'Đúng', 0, 43)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (158, N'Sai', 1, 43)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (159, N'Là cấu trúc, cú pháp lệnh trong 1 đối tượng', 0, 44)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (160, N'Là cấu trúc toán tử và từ khóa', 1, 44)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (161, N'Đúng', 1, 45)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (162, N'Sai', 0, 45)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (163, N'Đúng', 0, 46)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (164, N'Sai', 1, 46)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (165, N'Đúng, luôn luôn như vậy', 0, 47)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (166, N'Không, trừ khi class A đó là abstract', 1, 47)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (167, N'Compiler error', 0, 48)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (168, N'Runtime Exception', 0, 48)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (169, N'Đúng', 0, 48)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (170, N'Sai', 1, 48)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (171, N'Đúng ', 1, 49)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (172, N'Sai', 0, 49)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (173, N'Đúng', 1, 50)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (174, N'Sai', 0, 50)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (175, N'Đúng', 1, 51)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (176, N'Sai', 0, 51)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (177, N'Đúng', 0, 52)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (178, N'Sai', 1, 52)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (179, N'Đánh dấu là private', 0, 53)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (180, N'Đánh dấu là volatile', 0, 53)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (181, N'Đánh dấu là transient', 1, 53)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (182, N'Không thể làm được', 0, 53)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (199, N'1', 0, 72)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (202, N'20', 1, 72)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (214, N'15', 0, 72)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (220, N'123', 0, 72)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (221, N'2141', 0, 72)
INSERT [dbo].[Answer] ([AnswerId], [Answer], [IsCorrect], [QuestionId]) VALUES (222, N'124124', 0, 72)
SET IDENTITY_INSERT [dbo].[Answer] OFF
/****** Object:  StoredProcedure [dbo].[GET_QUESTION]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GET_QUESTION](@questionId int)
as
begin
	select q.QuestionName from Question as q
	where q.QuestionId = @questionId
end
GO
/****** Object:  StoredProcedure [dbo].[Get_Id_User]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Get_Id_User] 
 as
 begin
	select distinct Score.UserId from Score join [User] 
 on Score.UserId = [User].UserId join Topic on Topic.TopicId = Score.TopicId
 end
GO
/****** Object:  StoredProcedure [dbo].[Question_ListAll]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Question_ListAll]
as
begin
	select * from Question
end
GO
/****** Object:  StoredProcedure [dbo].[LISTSCORE]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LISTSCORE] (@name nvarchar(50),
						@ngay date
 )
 as
 begin
	select Name,Phone,Email,Score,TestDate,TopicName from Score join [User] 
 on Score.UserId = [User].UserId join Topic on Topic.TopicId = Score.TopicId
 where Name = @name and TestDate = @ngay
 
 end
GO
/****** Object:  StoredProcedure [dbo].[ListAll_Score]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ListAll_Score]
as
begin
select Score.UserId,Name,Phone,Email,Score,TestDate,TopicName from Score join [User] 
 on Score.UserId = [User].UserId join Topic on Topic.TopicId = Score.TopicId
 end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Lookup]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_Lookup] (@userId int)
as
begin
select Name,Phone,Email,Score,TestDate,TopicName from Score join [User]
on Score.UserId = [USER].UserId and Score.UserId =@userId  join Topic on Topic.TopicId = Score.TopicId
 group by Name,Phone,Email,Score,TestDate,TopicName
 end
GO
/****** Object:  StoredProcedure [dbo].[Search_By_Date]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Search_By_Date] @DateStart datetime,
						   @DateFinish datetime
as
begin
	select  u.UserId,u.Name,c.Score,t.TopicName,c.TestDate, u.Email,u.Phone from Score as c join [User] as u on c.UserId = u.UserId
		join Topic as t on c.TopicId = t.TopicId
	where c.TestDate >=@DateStart and c.TestDate <= @DateFinish
end
GO
/****** Object:  StoredProcedure [dbo].[Score_By_User]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Score_By_User] @userId int
as
begin
	select s.Score from Score as s
	where s.UserId = @userId	
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Question_Display]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_Question_Display]
as
begin
	select top 10  * from Question as q join Answer as a
	on q.Id = a.QuestionId
	order by NEWID()
end
GO
/****** Object:  Table [dbo].[Ques_Score]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ques_Score](
	[Ques_Score_Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[AnswerId] [int] NULL,
 CONSTRAINT [PK_Ques_Score] PRIMARY KEY CLUSTERED 
(
	[Ques_Score_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ques_Score] ON
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (257, 1, 2, 8)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (258, 1, 4, 14)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (259, 1, 12, 45)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (268, 16, 5, 20)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (269, 16, 6, 21)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (270, 16, 7, 25)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (271, 16, 9, 33)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (272, 16, 11, 41)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (273, 16, 12, 48)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (274, 16, 16, 62)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (275, 16, 21, 81)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (276, 16, 22, 86)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (287, 17, 31, 122)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (288, 17, 34, 130)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (289, 17, 35, 133)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (290, 17, 38, 143)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (291, 17, 40, 151)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (292, 17, 43, 158)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (293, 17, 47, 165)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (294, 17, 48, 167)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (295, 17, 49, 171)
INSERT [dbo].[Ques_Score] ([Ques_Score_Id], [UserId], [QuestionId], [AnswerId]) VALUES (296, 17, 50, 173)
SET IDENTITY_INSERT [dbo].[Ques_Score] OFF
/****** Object:  StoredProcedure [dbo].[Get_Answer_By_Question]    Script Date: 08/20/2019 15:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Get_Answer_By_Question] @quentionId int
as
begin
	select a.AnswerId, a.Answer,a.IsCorrect,a.QuestionId from Answer as a
	where QuestionId = @quentionId
end
GO
/****** Object:  Default [DF_User_GroupID]    Script Date: 08/20/2019 15:32:37 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_GroupID]  DEFAULT ('MEMBER') FOR [GroupID]
GO
/****** Object:  Default [DF_Score_TestDate]    Script Date: 08/20/2019 15:32:37 ******/
ALTER TABLE [dbo].[Score] ADD  CONSTRAINT [DF_Score_TestDate]  DEFAULT (getdate()) FOR [TestDate]
GO
/****** Object:  ForeignKey [FK_Score_Topic]    Script Date: 08/20/2019 15:32:37 ******/
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Topic] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topic] ([TopicId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_Topic]
GO
/****** Object:  ForeignKey [FK_Score_User]    Script Date: 08/20/2019 15:32:37 ******/
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_User]
GO
/****** Object:  ForeignKey [FK_Question_Topic]    Script Date: 08/20/2019 15:32:50 ******/
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Topic] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topic] ([TopicId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Topic]
GO
/****** Object:  ForeignKey [FK_Answer_Question]    Script Date: 08/20/2019 15:32:50 ******/
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([QuestionId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
/****** Object:  ForeignKey [FK_Ques_Score_Answer]    Script Date: 08/20/2019 15:32:50 ******/
ALTER TABLE [dbo].[Ques_Score]  WITH CHECK ADD  CONSTRAINT [FK_Ques_Score_Answer] FOREIGN KEY([AnswerId])
REFERENCES [dbo].[Answer] ([AnswerId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ques_Score] CHECK CONSTRAINT [FK_Ques_Score_Answer]
GO
/****** Object:  ForeignKey [FK_Ques_Score_User1]    Script Date: 08/20/2019 15:32:50 ******/
ALTER TABLE [dbo].[Ques_Score]  WITH CHECK ADD  CONSTRAINT [FK_Ques_Score_User1] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ques_Score] CHECK CONSTRAINT [FK_Ques_Score_User1]
GO
