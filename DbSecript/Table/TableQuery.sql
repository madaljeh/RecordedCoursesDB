use Recorded_Courses_System

CREATE TABLE [Admin](

AdminID int identity(1,1) primary key,
username varchar(255) not null,
Email varchar(255) unique not null,
[Password] varchar(255) not null,
CreatedBy varchar(max),
UpdatedBy varchar(max),
CreationDate datetime default GetDate(),
UpdationDate datetime,
isActive bit default 1

)

CREATE TABLE [User](

UserID int identity(1,1) primary key,
Email varchar(255) unique,
[Password] varchar(255) not null,
Profile_Image varchar(255) null,
Bio varchar(max),
UserType varchar(255)check (UserType = 'instructors' or UserType='learners'),
CreatedBy varchar(max),
UpdatedBy varchar(max),
CreationDate datetime default GetDate(),
UpdationDate datetime,
isActive bit default 1
)

CREATE TABLE Course(

CourseId int identity(1,1) primary key,
Title varchar(255) unique,
[description]  varchar(max) not null,
category varchar(255)not null,
[level] int check ([level] >=1 and [level]<=10),
price DECIMAL(10,2) not null,
discount DECIMAL(5,2)null,
total_duration int,
CreatedBy varchar(max),
UpdatedBy varchar(max),
CreationDate datetime default GetDate(),
UpdationDate datetime,
isActive bit default 1,
UserId int

)

CREATE TABLE Lessons(

LessonsID int identity(1,1) primary key,
Title varchar(255) unique,
video_file varchar(255) null ,
duration int not null,
CreatedBy varchar(max),
UpdatedBy varchar(max),
CreationDate datetime default GetDate(),
UpdationDate datetime,
isActive bit default 1,
CourseId int
)

CREATE TABLE Lesson_Progress(
Lesson_ProgressID int identity(1,1) primary key,
IsCompleted  bit,
CreatedBy varchar(max),
UpdatedBy varchar(max),
CreationDate datetime default GetDate(),
UpdationDate datetime,
isActive bit default 1 ,
UserID int ,
LessonsID int
)

CREATE TABLE Review(
ReviewID int identity(1,1) primary key,
Rating  int check (Rating >=1 and Rating<=10),
Massage varchar(max) not null,
ReviewDate date default GetDate() ,
CreatedBy varchar(max),
UpdatedBy varchar(max),
CreationDate datetime default GetDate(),
UpdationDate datetime,
isActive bit default 1,
UserID int,
CourseId int
)

CREATE TABLE Enrollment(
EnrollmentID int identity(1,1) primary key,
EnrollmentDate date default GetDate(),
CreatedBy varchar(max),
UpdatedBy varchar(max),
CreationDate datetime default GetDate(),
UpdationDate datetime,
isActive bit default 1 ,
UserID int,
CourseId int
)

CREATE TABLE BookMark(
BookMarkID int identity(1,1) primary key,
CreatedBy varchar(max),
UpdatedBy varchar(max),
CreationDate datetime default GetDate(),
UpdationDate datetime,
isActive bit default 1,
UserID int,
CourseId int
)

CREATE TABLE Course_Bundles (
Course_BundlesID int identity(1,1) primary key,
Title varchar(255) unique,
[description]  varchar(max) not null,
price DECIMAL(10,2) not null,
discount DECIMAL(5,2)null,
CreatedBy varchar(max),
UpdatedBy varchar(max),
CreationDate datetime default GetDate(),
UpdationDate datetime,
isActive bit default 1 
)

CREATE TABLE Course_Bundles_Course(
Course_Bundles_Course_Id int identity(1,1) primary key,
CreatedBy varchar(max),
UpdatedBy varchar(max),
CreationDate datetime default GetDate(),
UpdationDate datetime,
isActive bit default 1,
Course_BundlesID int,
CourseId int

)

CREATE TABLE Course_Bundles_subscription(
subscriptionID int identity(1,1) primary key,
price DECIMAL(10,2) not null,
discount DECIMAL(5,2)null,
CreatedBy varchar(max),
UpdatedBy varchar(max),
CreationDate datetime default GetDate(),
UpdationDate datetime,
isActive bit default 1,
Course_BundlesID int,
UserId int

)

CREATE TABLE Subscription_Plan(
PlanID int identity(1,1) primary key,
[Name] varchar(255) not null,
price DECIMAL(10,2) not null,
Duration int,
CreatedBy varchar(max),
UpdatedBy varchar(max),
CreationDate datetime default GetDate(),
UpdationDate datetime,
isActive bit default 1,
UserId int

)