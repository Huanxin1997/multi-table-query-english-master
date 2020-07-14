# 1.Query the existence of 1 course
SELECT COUNT(*) FROM course WHERE id = 1;

# 2.Query the presence of both 1 and 2 courses
SELECT COUNT(*) FROM course WHERE id in (1,2);

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
SELECT
    s1.id,
    s1.`name`,
    AVG(s2.score) 
FROM
    student s1 
LEFT JOIN
    student_course s2 
        ON s1.id= s2.studentId 
WHERE score >= 60 
GROUP by id;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
SELECT * FROM student WHERE student.id NOT IN (SELECT studentId FROM student_course);

# 5.Query all SQL with grades
SELECT * FROM student WHERE student.id IN (SELECT studentId FROM student_course);

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
SELECT
    id,
    name,
    age,
    sex 
FROM
    student s1 
JOIN
    student_course s2 
        on s1.id = s2.studentId 
WHERE
    s2.studentId = 1 
    AND s2.courseId = 2;

# 7.Retrieve 1 student score with less than 60 scores in descending order
SELECT 
    * 
FROM 
    student, 
    student_course 
WHERE
    student.id = student_course.studentId 
    AND student_course.courseId = 1 
    AND score < 60 
ORDER BY score DESC;

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
SELECT
	courseId,
	avg( score ) 
FROM
	student_course 
GROUP BY
	student_course.courseId 
ORDER BY
	avg( score ) DESC,
	courseId;

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
SELECT
	s.name,
	sc.score 
FROM
	student s,
	student_course sc,
	course c 
WHERE
	sc.courseId = c.id 
	AND c.name = 'Math'
	AND score < 60
	AND s.id = sc.studentId ;
