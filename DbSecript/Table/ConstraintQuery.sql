use Recorded_Courses_System

ALTER TABLE Course ADD CONSTRAINT FK_Course_User FOREIGN KEY (UserId) REFERENCES [User](UserID); 

ALTER TABLE Review ADD CONSTRAINT FK_Review_User FOREIGN KEY (UserId) REFERENCES [User](UserID); 
ALTER TABLE Review ADD CONSTRAINT FK_Review_Course FOREIGN KEY (CourseId) REFERENCES Course (CourseId);

ALTER TABLE Enrollment ADD CONSTRAINT FK_Enrollment_User FOREIGN KEY (UserId) REFERENCES [User](UserID); 
ALTER TABLE Enrollment ADD CONSTRAINT FK_Enrollment_Course FOREIGN KEY (CourseId) REFERENCES Course (CourseId); 

ALTER TABLE BookMark ADD CONSTRAINT FK_BookMark_User FOREIGN KEY (UserId) REFERENCES [User](UserID); 
ALTER TABLE BookMark ADD CONSTRAINT FK_BookMark_Course FOREIGN KEY (CourseId) REFERENCES Course (CourseId); 

ALTER TABLE Lessons ADD CONSTRAINT FK_Lessons_Course FOREIGN KEY (CourseId) REFERENCES Course (CourseId);

ALTER TABLE Lesson_Progress ADD CONSTRAINT FK_Lesson_Progress_User FOREIGN KEY (UserId) REFERENCES [User](UserID); 
ALTER TABLE Lesson_Progress ADD CONSTRAINT FK_Lesson_Progress_Lessons FOREIGN KEY (LessonsID) REFERENCES Lessons (LessonsID); 

ALTER TABLE Course_Bundles_Course ADD CONSTRAINT FK_Course_Bundles_Course FOREIGN KEY (CourseId) REFERENCES Course (CourseId); 
ALTER TABLE Course_Bundles_Course ADD CONSTRAINT FK_Course_Bundles_Course_BundlesId FOREIGN KEY (Course_BundlesID) REFERENCES Course_Bundles (Course_BundlesID); 

ALTER TABLE Course_Bundles_subscription ADD CONSTRAINT FK_Course_Bundles_subscription_User FOREIGN KEY (UserId) REFERENCES [User](UserID); 
ALTER TABLE Course_Bundles_subscription ADD CONSTRAINT FK_Course_Bundles_subscription_BundlesId FOREIGN KEY (Course_BundlesID) REFERENCES Course_Bundles (Course_BundlesID); 

ALTER TABLE Subscription_Plan ADD CONSTRAINT FK_Subscription_Plan_User FOREIGN KEY (UserId) REFERENCES [User](UserID); 
