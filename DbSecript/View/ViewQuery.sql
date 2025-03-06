use Recorded_Courses_System

--1-) Active Courses View:
--Create a view to display all active courses, including category, instructor name, and total enrollments.

CREATE VIEW all_active_courses AS
select Course.CourseId,Course.category,[User].UserType,count (Enrollment.EnrollmentID)as countnumber
from Course
join [User] on [user].UserID=Course.UserId
Full join Enrollment on Enrollment.CourseId=Course.CourseId
where Course.isActive=1
GROUP BY Course.CourseId, Course.category, [User].UserType;

select * from all_active_courses

--2-) Learner Progress View:
-- Implement a view to show progress for all learners, including course details and completion percentages.

CREATE VIEW progress_learners AS
select [User].UserID, Course.CourseId,Course.Title,Course.category,
count(Lesson_Progress.IsCompleted) as completed
from Course
join Lessons on Lessons.CourseId=Course.CourseId
join Lesson_Progress on Lesson_Progress.LessonsID=Lessons.LessonsID
join [User] on [User].UserID=Lesson_Progress.UserID
GROUP BY [User].UserID ,Course.CourseId,Course.Title,Course.category;


select * from progress_learners



--3-) Revenue Summary View:
--Create a view summarizing revenue generated by each course, instructor, and overall platform.

create view summarizing_revenue as
select Course.CourseId,Course.Title,[User].UserId,[User].UserType,
COUNT(Enrollment.EnrollmentID) * (Course.price - COALESCE(Course.discount, 0)) AS TotalRevenue
from Course 
JOIN [User]  ON Course.UserId = [User].UserID
LEFT JOIN Enrollment ON Course.CourseId = Enrollment.CourseId
WHERE Course.isActive = 1
GROUP BY Course.CourseId, Course.Title, [User].UserID, [User].UserType,Course.price, Course.discount;


select * from summarizing_revenue


