use Recorded_Courses_System


-- Insert into Admin
INSERT INTO [Admin] (username, Email, [Password], CreatedBy)
VALUES 
('admin1', 'admin1@example.com', 'password123', 'System'),
('admin2', 'admin2@example.com', 'password123', 'System'),
('admin3', 'admin3@example.com', 'password123', 'System');

-- Insert into User
INSERT INTO [User] (Email, [Password], Profile_Image, Bio, UserType, CreatedBy)
VALUES 
('instructor1@example.com', 'password123', 'image1.jpg', 'Expert in coding', 'instructors', 'admin1'),
('instructor2@example.com', 'password123', 'image2.jpg', 'Loves teaching', 'instructors', 'admin1'),
('learner1@example.com', 'password123', 'image3.jpg', 'Excited to learn', 'learners', 'admin2'),
('learner2@example.com', 'password123', NULL, 'Aspiring developer', 'learners', 'admin2');

-- Insert into Course (assuming UserID for instructors is 1 and 2)
INSERT INTO Course (Title, [description], category, [level], price, discount, total_duration, CreatedBy, UserId)
VALUES 
('C# Basics', 'Learn the basics of C#', 'Programming', 3, 100.00, 10.00, 20, 'instructor1', 1),
('ASP.NET Core', 'Master ASP.NET Core', 'Web Development', 5, 150.00, 15.00, 30, 'instructor2', 2),
('Database Fundamentals', 'Understand databases', 'Database', 4, 120.00, 5.00, 25, 'instructor1', 1);

-- Insert into Lessons (assuming CourseId 1, 2, 3 exist)
INSERT INTO Lessons (Title, video_file, duration, CreatedBy, CourseId)
VALUES 
('Intro to C#', 'video1.mp4', 10, 'instructor1', 1),
('OOP in C#', 'video2.mp4', 15, 'instructor1', 1),
('Getting started with ASP.NET', 'video3.mp4', 12, 'instructor2', 2),
('Entity Framework Basics', 'video4.mp4', 20, 'instructor2', 2);

-- Insert into Lesson_Progress (assuming UserID 3, 4 and LessonsID 1, 2)
INSERT INTO Lesson_Progress (IsCompleted, CreatedBy, UserID, LessonsID)
VALUES 
(1, 'learner1', 3, 1),
(0, 'learner1', 3, 2),
(1, 'learner2', 4, 1);

-- Insert into Review (assuming UserID 3, 4 and CourseId 1, 2)
INSERT INTO Review (Rating, Massage, CreatedBy, UserID, CourseId)
VALUES 
(9, 'Great course!', 'learner1', 3, 1),
(8, 'Very informative.', 'learner2', 4, 2),
(10, 'Loved it!', 'learner1', 3, 2);

-- Insert into Enrollment (assuming UserID 3, 4 and CourseId 1, 2)
INSERT INTO Enrollment (CreatedBy, UserID, CourseId)
VALUES 
('learner1', 3, 1),
('learner1', 3, 2),
('learner2', 4, 1);

-- Insert into BookMark (assuming UserID 3, 4 and CourseId 1, 2)
INSERT INTO BookMark (CreatedBy, UserID, CourseId)
VALUES 
('learner1', 3, 1),
('learner1', 3, 2),
('learner2', 4, 1);

-- Insert into Course_Bundles
INSERT INTO Course_Bundles (Title, [description], price, discount, CreatedBy)
VALUES 
('Beginner Bundle', 'Includes basic programming courses', 200.00, 20.00, 'admin1'),
('Advanced Bundle', 'For experienced developers', 300.00, 25.00, 'admin2');

-- Insert into Course_Bundles_Course (assuming Course_BundlesID 1, 2 and CourseId 1, 2)
INSERT INTO Course_Bundles_Course (CreatedBy, Course_BundlesID, CourseId)
VALUES 
('admin1', 1, 1),
('admin1', 1, 2),
('admin2', 2, 3);

-- Insert into Course_Bundles_subscription (assuming UserID 3, 4 and Course_BundlesID 1, 2)
INSERT INTO Course_Bundles_subscription (price, discount, CreatedBy, Course_BundlesID, UserId)
VALUES 
(200.00, 20.00, 'learner1', 1, 3),
(300.00, 25.00, 'learner2', 2, 4);

-- Insert into Subscription_Plan (assuming UserID 3, 4)
INSERT INTO Subscription_Plan ([Name], price, Duration, CreatedBy, UserId)
VALUES 
('Monthly Plan', 50.00, 30, 'admin1', 3),
('Yearly Plan', 500.00, 365, 'admin2', 4);

