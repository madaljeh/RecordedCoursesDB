use Recorded_Courses_System

-- 1-) Retrieve Courses by Category:
-- Write a query to fetch all courses within a selected category, including title, price, and ratings.
select category,Title,price,Rating  from Course 
join Review on Course.CourseId=Review.CourseId


-- 2-) Search Courses:
-- Implement a query to search courses by keyword in the title or description.
select * from Course where Title like '%ASP%' or description like '%ASP%'

-- 3-) Track Learner Progress:
--Create a query to retrieve the progress of a learner in a specific course, including completed lessons and remaining lessons.


select Title ,IsCompleted from Lessons 
join Lesson_Progress on Lessons.LessonsID=Lesson_Progress.LessonsID

-- 4-) Top-Rated Courses:
-- Write a query to identify the top-rated courses based on average ratings and enrollment numbers.select Course.CourseId,Course.Title,avg(Review.Rating) as AvgRating ,COUNT(EnrollmentID) as TotalNumberfrom Courseleft join Review on Review.CourseId=Course.CourseIdleft join Enrollment on Enrollment.CourseId=Course.CourseIdgroup by Course.CourseId, Course.Title