/*  Author: Garret Grant
*   CS31A - Intro to Database Management Systems, Spring 2023
*   Script Description -   This script creates a 'University Management System'
*   database. It includes tables for Departments, Courses, Faculty, Students,
*   Parents, Attendance, Exams and Results, and Faculty Log Times. Each table 
*   stores specific data related to university operations. Departments and 
*   Courses are linked by faculty, and Students are connected to their 
*   respective courses, departments, and parents. Attendance is tracked per 
*   course, and exam results are stored and linked to respective courses and 
*   students. Faculty login and logout times are also recorded for reporting 
*   purposes. This script provides a comprehensive system for managing a 
*   university's academic and administrative needs.
*   
*   Running the script - Run the following command in mysql
*   source path_to_file/ggrant_final_project_part1.sql
*/



/* Drop the database if it already exists*/
DROP DATABASE IF EXISTS university;
CREATE DATABASE university;
use university;



/*Remove any previous versions of tables if they exist*/
DROP TABLE IF EXISTS FACULTY;
DROP TABLE IF EXISTS EXAM_TYPE;
DROP TABLE IF EXISTS EXAM_RESULT;
DROP TABLE IF EXISTS STUDENT_ATT;
DROP TABLE IF EXISTS STUDENT_COURSE;
DROP TABLE IF EXISTS FACULTY_COURSE;
DROP TABLE IF EXISTS FACULTY_LOGIN;

/*ACADEMIC_SESSION Table*/
CREATE TABLE ACADEMIC_SESSION(
    session_id      INT NOT NULL, 
    session_name    VARCHAR(25) NOT NULL, 
    CONSTRAINT session_id_pk  PRIMARY KEY (session_id),
    CONSTRAINT session_name_un      UNIQUE(session_name)
) ENGINE = INNODB;


/*DEPARTMENT Table*/
CREATE TABLE DEPARTMENT(
    dept_id         INT NOT NULL,
    dept_name       VARCHAR(25) NOT NULL,
    head            VARCHAR(25),
    CONSTRAINT dept_id_pk   PRIMARY KEY(dept_id),
    CONSTRAINT dept_name_un UNIQUE(dept_name)
)ENGINE = INNODB;


/*PARENT_INFO Table - student must have 1 parent minimum*/
CREATE TABLE PARENT_INFO(
    parent_id           INT NOT NULL,
    parent1_fn          VARCHAR(25) NOT NULL,
    parent1_ln          VARCHAR(25) NOT NULL,
    parent2_fn          VARCHAR(25),
    parent2_ln          VARCHAR(25),
    CONSTRAINT parent_id_pk PRIMARY KEY(parent_id)
)ENGINE = INNODB;


/*STUDENT Table*/
CREATE TABLE STUDENT(
    student_id          INT NOT NULL,
    first_name          VARCHAR(25) NOT NULL,
    last_name           VARCHAR(25) NOT NULL,
    reg_year            YEAR NOT NULL,
    email               VARCHAR(25) NOT NULL, 
    parent_id           INT NOT NULL,
    CONSTRAINT  student_id_pk       PRIMARY KEY(student_id),
    CONSTRAINT  email_un            UNIQUE(email),
    CONSTRAINT  parent_id_fk        FOREIGN KEY(parent_id)
        REFERENCES PARENT_INFO(parent_id)         
)ENGINE = INNODB;



/*COURSE Table*/
CREATE TABLE COURSE(
    course_id           INT NOT NULL,
    course_name         VARCHAR(25) NOT NULL,
    session_id          INT NOT NULL,
    dept_id             INT NOT NULL,
    logon_id            VARCHAR(25),
    password            VARCHAR(25),
    building            VARCHAR(25), 
    room                VARCHAR(25),
    date_time           VARCHAR(25),
    CONSTRAINT course_id_pk         PRIMARY KEY(course_id),
    CONSTRAINT course_name_un       UNIQUE(course_name),
    CONSTRAINT session_id_fk        FOREIGN KEY(session_id)
        REFERENCES ACADEMIC_SESSION(session_id),
    CONSTRAINT dept_id_fk           FOREIGN KEY(dept_id)
        REFERENCES DEPARTMENT(dept_id)
)ENGINE = INNODB;


/*EXAM_TYPE Table*/
CREATE TABLE EXAM_TYPE(
    exam_type           VARCHAR(3) NOT NULL,
    name                VARCHAR(25) NOT NULL,
    description         VARCHAR(25) NOT NULL,
    CONSTRAINT exam_type_pk     PRIMARY KEY(exam_type)
)ENGINE = INNODB;


/*EXAM Table*/
CREATE TABLE EXAM(
    exam_id             INT NOT NULL,
    session_id          INT NOT NULL,
    exam_type           VARCHAR(3) NOT NULL,
    course_id           INT NOT NULL,
    CONSTRAINT exam_id_pk       PRIMARY KEY(exam_id),
    CONSTRAINT session_id_fk2    FOREIGN KEY(session_id)
        REFERENCES ACADEMIC_SESSION(session_id),
    CONSTRAINT course_id_fk     FOREIGN KEY(course_id)
        REFERENCES  COURSE(course_id),
    CONSTRAINT exam_type_fk     FOREIGN KEY(exam_type)
        REFERENCES EXAM_TYPE(exam_type)
)ENGINE = INNODB;


/*FACULTY Table*/
CREATE TABLE FACULTY(
    faculty_id          INT NOT NULL,
    first_name          VARCHAR(25) NOT NULL,
    last_name           VARCHAR(25) NOT NULL,
    email               VARCHAR(25) NOT NULL,
    salary              INT,
    insurance           VARCHAR(25), 
    hourly_rate         INT, 
    dept_id             INT NOT NULL,
    CONSTRAINT fac_id_pk        PRIMARY KEY(faculty_id),
    CONSTRAINT fac_em_un        UNIQUE(email),
    CONSTRAINT fac_dep          FOREIGN KEY(dept_id)
        REFERENCES DEPARTMENT(dept_id)
)ENGINE = INNODB;



/*EXAM_RESULT Table*/
CREATE TABLE EXAM_RESULT(
    student_id          INT NOT NULL,
    course_id           INT NOT NULL,
    exam_id             INT NOT NULL,
    exam_grade          INT NOT NULL,
    CONSTRAINT er_st_co_ex_id_pk     PRIMARY KEY(student_id, course_id, exam_id),
    CONSTRAINT er_student_id_fk     FOREIGN KEY(student_id)
        REFERENCES STUDENT(student_id),
    CONSTRAINT er_course_id_fk      FOREIGN KEY(course_id)
        REFERENCES COURSE(course_id),
    CONSTRAINT er_exam_id_fk        FOREIGN KEY(exam_id)
        REFERENCES EXAM(exam_id)
)ENGINE = INNODB;

/*STUDENT_ATT Table*/
CREATE TABLE STUDENT_ATT(
    student_id          INT NOT NULL,
    session_id          INT NOT NULL,
    num_work_days       INT NOT NULL, 
    num_days_off        INT NOT NULL, 
    exam_eligibiliy     CHAR(1) NOT NULL,
    CONSTRAINT stud_att_pk          PRIMARY KEY(student_id, session_id),
    CONSTRAINT stud_sess_fk         FOREIGN KEY(session_id)
        REFERENCES ACADEMIC_SESSION(session_id),
    CONSTRAINT ex_range     CHECK (exam_eligibiliy IN ('Y', 'N'))
)ENGINE = INNODB;



/*STUDENT_COURSE Table*/
CREATE TABLE STUDENT_COURSE(
    student_id          INT NOT NULL,
    course_id           INT NOT NULL,
    grade               CHAR(1) NOT NULL,
    CONSTRAINT stud_cource_cpk PRIMARY KEY(student_id, course_id),
    CONSTRAINT stud_cou_fk          FOREIGN KEY(student_id)
        REFERENCES STUDENT(student_id),
    CONSTRAINT scour_cour_fk        FOREIGN KEY(course_id)
        REFERENCES  COURSE(course_id),
    CONSTRAINT sc_grade_check       CHECK(grade IN ('A','B','C','D','F'))
)ENGINE = INNODB;

-- /*FACULTY_COURSE Table*/
CREATE TABLE FACULTY_COURSE(
    faculty_id          INT NOT NULL,
    course_id           INT NOT NULL,
    contact_hrs         INT NOT NULL,
    CONSTRAINT fc_cpk           PRIMARY KEY(faculty_id, course_id),
    CONSTRAINT fc_fac_id_fk     FOREIGN KEY(faculty_id)
        REFERENCES  FACULTY(faculty_id),
    CONSTRAINT fc_cou_id_fk     FOREIGN KEY(course_id)
        REFERENCES COURSE(course_id) 
)ENGINE = INNODB;

-- /*FACULTY_LOGIN Table*/
CREATE TABLE FACULTY_LOGIN(
    faculty_id          INT NOT NULL,
    login_date_time     DATETIME,
    CONSTRAINT fac_log_cpk      PRIMARY KEY(faculty_id, login_date_time),
    CONSTRAINT fac_log_fac_fk   FOREIGN KEY(faculty_id)
        REFERENCES FACULTY(faculty_id)
)ENGINE = INNODB;


