use devcamp_sql_school_schema;

select * from grades, courses;
select * from teachers;
select * from courses;
select * from grades;

# The average grade given by each professor    
SELECT courses_teachers_id 'Teacher ID', avg(grades_value) 'Averages' 
FROM grades LEFT JOIN courses
	ON grades.grades_courses_id = courses.courses_id
    group by courses_teachers_id;

    
# Top grades for each student
SELECT grades_students_id 'Student', MAX(grades_value) 'Best Grade' 
from grades left join courses
	ON grades.grades_courses_id = courses.courses_id
    group by grades_students_id;
    
# Group students by the courses they are enrolled in.
SELECT grades_courses_id 'Course ID', COUNT(grades_courses_id) 'Student Count'
FROM grades
GROUP BY grades_courses_id;

# Course difficulty summary report - High to Low
SELECT grades_courses_id 'Course ID', avg(grades_value) AS Averages FROM grades 
group by grades_courses_id
ORDER BY Averages ASC;

# Students and Teachers that share the most classes in decending order
SELECT
	grades_students_id as student_id,
    courses_teachers_id as teacher_id, 
    count(courses_teachers_id) as num_of_shared_classes
    FROM grades LEFT JOIN courses
	ON grades.grades_courses_id = courses.courses_id
    group by
		grades_students_id, courses_teachers_id
	having
		(count(grades_students_id) > 1) AND
        (count(courses_teachers_id) > 1)
	ORDER BY num_of_shared_classes DESC;
        