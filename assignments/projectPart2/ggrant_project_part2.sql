/*  Author: Garret Grant - ggrant_project_part2.sql
*   CS31A - Intro to Database Management Systems, Spring 2023
*   Script Description - populates 'University Management System' database and 
*   performs various data manipulations and retrievals. After loading the 
*   provided data into each table, the script carries out update transactions 
*   and retrieval queries, including displaying the inserted data, identifying 
*   course offerings, displaying session-specific courses, and showcasing 
*   student enrolment in each course. It also displays exam grade details, 
*   including adjustments for grade discrepancies, retrieves unmatched records 
*   from the 'EXAM_RESULT' table, and determines student eligibility for exams 
*   based on attendance. This script forms the practical implementation and 
*   interaction with the university database.
*
*   Running the script - Run the following command in mysql
*   source path_to_file/ggrant_project_part2.sql
*/





/*Query 1*/
SHOW TABLES;

/*Query 2*/
SELECT * FROM COURSE;

/*Query 3*/
SELECT  c.course_name, a.session_name
FROM    COURSE c
JOIN    ACADEMIC_SESSION a
ON      c.session_id = a.session_id
WHERE   a.session_name = 'fall session';    

/*Query 4*/
SELECT  c.course_name, s.student_id, d.dept_name
FROM    STUDENT_COURSE sc
JOIN    STUDENT s ON sc.student_id = s.student_id
JOIN    COURSE c ON c.course_id = sc.course_id
JOIN    DEPARTMENT d ON d.dept_id = c.dept_id; 

/*Query 5*/
SELECT  c.course_name, s.student_id, d.dept_name
FROM    STUDENT_COURSE sc
JOIN    STUDENT s ON sc.student_id = s.student_id
JOIN    COURSE c ON c.course_id = sc.course_id
JOIN    DEPARTMENT d ON d.dept_id = c.dept_id
WHERE   d.dept_id = 20; 

/*Query 6*/
SELECT c.course_id, c.course_name,  er.exam_grade, er.exam_id
FROM COURSE c
JOIN EXAM_RESULT er on c.course_id = er.course_id
WHERE c.course_id BETWEEN 190 AND 192;

/*Query 7*/
SELECT DISTINCT  s.student_id, er.exam_grade, c.course_id, c.course_name
FROM EXAM_RESULT er
JOIN STUDENT_COURSE s ON s.student_id = er.student_id
LEFT JOIN COURSE c ON er.course_id = c.course_id;

/*Query 8*/
SELECT s.first_name, s.last_name, s.student_id, e.exam_grade
FROM STUDENT s
JOIN EXAM_RESULT e ON s.student_id = e.student_id;

/*Query 9*/
SELECT student_id, num_work_days, exam_eligibiliy 
FROM STUDENT_ATT;

/*Query 10*/
SELECT s.first_name, s.last_name, s.student_id, (e.exam_grade - 5) as 'adjusted grades'
FROM STUDENT s
JOIN EXAM_RESULT e ON s.student_id = e.student_id;
