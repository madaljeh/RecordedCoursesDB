use Recorded_Courses_System
-- 1-) Enroll Learner in Course:
--Write a stored procedure to handle learner enrollments, ensuring the course exists and the learner has an active account.

CREATE PROCEDURE EnrollLearnerInCourse
    @UserId INT,
    @CourseId INT
AS

IF EXISTS (SELECT 1 FROM [User] WHERE UserID = @UserId AND isActive = 1) 
   AND EXISTS (SELECT 1 FROM Course WHERE CourseId = @CourseId AND isActive = 1)

INSERT INTO Enrollment (UserID, CourseId, CreatedBy, CreationDate, isActive)
VALUES (@UserId, @CourseId, 'Admiin', GETDATE(), 1);

EXEC EnrollLearnerInCourse @UserId = 3, @CourseId = 3;

select * from Enrollment

-- 2-) Add a New Course:
--Implement a stored procedure for instructors to add courses, including lessons and metadata.



-- 3-) Generate Revenue Report:
-- Create a stored procedure to generate a report of total revenue per course and instructor within a specific timeframe.create proc Report_Total_Revenue @StartDate DATE,@EndDate DATE
as
select Course.CourseId,Course.Title,[User].UserID,[User].UserType,
count (Enrollment.EnrollmentID)as EnrollmentNumber,
SUM(Course.Price - COALESCE(Course.Discount, 0)) AS TotalRevenue
from Course
JOIN [User]  ON Course.UserId = [User].UserID
left JOIN Enrollment ON Course.CourseId = Enrollment.CourseId
where Enrollment.EnrollmentDate between @StartDate and @EndDate
group by Course.CourseId,Course.Title,[User].UserID,[User].UserType;

exec Report_Total_Revenue @StartDate = '2025-01-01', @EndDate = '2025-12-31';-- 4-) Manage Discounts:
--Write a stored procedure to apply or update discounts on courses based on promotional campaigns.

create proc update_discounts @CourseId int,@Discount DECIMAL(5,2)
as
 UPDATE Course SET Discount = @Discount
 WHERE CourseId = @CourseId;


EXEC update_discounts @CourseId = 2, @Discount = 15.50;
EXEC update_discounts @CourseId = 1, @Discount = 5.0;
EXEC update_discounts @CourseId = 3, @Discount = 2.0;

select discount from Course