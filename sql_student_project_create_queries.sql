use devcamp_sql_school_schema;

## Create tables ##
# Create students table
CREATE TABLE `devcamp_sql_school_schema`.`students` (
  `students_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`students_id`),
  UNIQUE KEY `students_id_UNIQUE` (`students_id` ASC) VISIBLE);

# Create teachers table
CREATE TABLE `devcamp_sql_school_schema`.`teachers` (
  `teachers_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`teachers_id`),
  UNIQUE KEY `teachers_id_UNIQUE` (`teachers_id` ASC) VISIBLE);

# create courses table
CREATE TABLE `devcamp_sql_school_schema`.`courses` (
  `courses_id` int NOT NULL AUTO_INCREMENT,
  `courses_teachers_id` int NOT NULL,
  `courses_name` varchar(45) NOT NULL,
  UNIQUE KEY `courses_id_UNIQUE` (`courses_id` ASC) VISIBLE,
  KEY `courses_teachers_id_idx` (`courses_teachers_id`),
  CONSTRAINT `courses_teachers_id` FOREIGN KEY (`courses_teachers_id`) REFERENCES `teachers` (`teachers_id`) ON DELETE CASCADE);

# create grades table
CREATE TABLE `grades` (
  `grades_id` int NOT NULL AUTO_INCREMENT,
  `grades_value` int NOT NULL,
  `grades_students_id` int NOT NULL,
  `grades_courses_id` int NOT NULL,
  PRIMARY KEY (`grades_id`),
  UNIQUE KEY `grades_id_UNIQUE` (`grades_id` ASC) VISIBLE,
  KEY `grades_students_id_idx` (`grades_students_id`),
  KEY `grades_courses_id_idx` (`grades_courses_id`),
  CONSTRAINT `grades_courses_id` FOREIGN KEY (`grades_courses_id`) REFERENCES `courses` (`courses_id`) ON DELETE CASCADE,
  CONSTRAINT `grades_students_id` FOREIGN KEY (`grades_students_id`) REFERENCES `students` (`students_id`) ON DELETE CASCADE);

## Add items ##
# Add Students
INSERT INTO students VALUES (null), (null), (null), (null), (null);

# Add Teachers
INSERT INTO teachers VALUES (null), (null), (null), (null), (null);

# Add courses
INSERT INTO courses (courses_teachers_id, courses_name) 
VALUES 
	(1,'English'), (1,'Math'),
    (2,'Science'), (2,'Gym'),
    (3,'Music'), (3,'English'), 
	(4,'Math'), (4,'Science'),
    (5,'Gym'), (5,'Music');

# Add grades
INSERT INTO grades(grades_value, grades_students_id, grades_courses_id)
VALUES
	(RAND()*100,5,8),(RAND()*100,5,4),(RAND()*100,5,6),(RAND()*100,5,7),(RAND()*100,5,10),
	(RAND()*100,4,3),(RAND()*100,4,10),(RAND()*100,4,9),(RAND()*100,4,2),(RAND()*100,4,1),
	(RAND()*100,3,10),(RAND()*100,3,1),(RAND()*100,3,8),(RAND()*100,3,9),(RAND()*100,3,2),
	(RAND()*100,2,10),(RAND()*100,2,7),(RAND()*100,2,6),(RAND()*100,2,9),(RAND()*100,2,3),
	(RAND()*100,1,5),(RAND()*100,1,7),(RAND()*100,1,1),(RAND()*100,1,9),(RAND()*100,1,3);


select * from students;
select * from teachers;
select * from courses;
select * from grades;

