/* ****************************************************************************/
/*	                                                				          */
/*														                      */
/*	    The university Database                     			              */
/*																		      */
/*	                                            			                  */
/* ****************************************************************************/

/*  Insert data into the tables */

USE university;

INSERT INTO     ACADEMIC_SESSION VALUES (100, 'spring session');
INSERT INTO     ACADEMIC_SESSION VALUES (200, 'fall session');
INSERT INTO     ACADEMIC_SESSION VALUES (300, 'summer session');

INSERT INTO     DEPARTMENT VALUES(10, 'accounting', 'mark smith');
INSERT INTO     DEPARTMENT VALUES(20, 'biology', 'dave gold');
INSERT INTO     DEPARTMENT VALUES(30, 'computer science', 'linda brown');
INSERT INTO     DEPARTMENT VALUES(40, 'literature', 'anita taylor');



INSERT INTO     PARENT_INFO VALUES(600,'neil', 'smith','doris', 'smith');
INSERT INTO     PARENT_INFO VALUES(610,'william', 'ben','nita', 'ben');
INSERT INTO     PARENT_INFO VALUES(620,'sean', 'taylor','rhea', 'taylor');
INSERT INTO     PARENT_INFO VALUES(630,'dave', 'carmen','cathy', 'carmen');
INSERT INTO     PARENT_INFO VALUES(640,'john', 'audry','jane', 'audry');




INSERT INTO STUDENT VALUES(720, 'jack','smith', '2012-01-12','jsmith@school.edu', 600);
INSERT INTO STUDENT VALUES(730, 'noah', 'audry', '2012-01-01','naudry@school.edu', 640);
INSERT INTO STUDENT VALUES(740, 'rhonda','taylor', '2012-09-01','rtaylor@school.edu', 620);
INSERT INTO STUDENT VALUES(750, 'robert','ben', '2012-03-01','rben@school.edu', 610);
INSERT INTO STUDENT VALUES(760, 'jeanne','ben', '2012-03-01','jben@school.edu', 610);
INSERT INTO STUDENT VALUES(770, 'mills','carmen', '2013-04-01','mcarmen@school.edu', 630);

INSERT INTO     COURSE VALUES (190, 'principles of accounting', 100, 10,NULL,NULL,'building a','101','mwf 12-1');
INSERT INTO     COURSE VALUES (191, 'introduction to business law', 100, 10,NULL,NULL,'building b','201','thur 2-4');
INSERT INTO     COURSE VALUES (192, 'cost accounting', 100, 10,NULL,NULL,'building c','301','tues 5-7');
INSERT INTO     COURSE VALUES (193, 'strategic tax planning for business', 100, 10,'tax123','password',NULL,NULL,NULL);
INSERT INTO     COURSE VALUES (194, 'general biology', 200, 20,'bio123','password',NULL,NULL,NULL);
INSERT INTO     COURSE VALUES (195, 'cell biology', 200, 20,NULL,NULL,'building d','401','mwf 9-10');

INSERT INTO     FACULTY VALUES (800, 'jill', 'miller','jmill@school.edu',10000,'health',NULL,20);
INSERT INTO     FACULTY VALUES (810, 'james', 'borg','jborg@school.edu',30000,'health,dental',NULL,10);
INSERT INTO     FACULTY VALUES (820, 'lynn', 'brown','lbrown@school.edu',NULL,NULL,50,30);
INSERT INTO     FACULTY VALUES (830, 'arthur', 'smith','asmith@school.edu',NULL,NULL,40,10);
INSERT INTO     FACULTY VALUES (840, 'sally', 'jones','sjones@school.edu',50000,'health,dental,vision',NULL,40);

INSERT INTO     EXAM_TYPE VALUES('mce','multiple choice exams','choose more than one answer');
INSERT INTO     EXAM_TYPE VALUES('tf','true and false exams','choose either true or false');
INSERT INTO     EXAM_TYPE VALUES('fib','fill in the blanks exams','type in the correct answer');
INSERT INTO     EXAM_TYPE VALUES('ess','essay exams','write paragraphs');
INSERT INTO     EXAM_TYPE VALUES('sa','short answer exams','write short answers');

INSERT INTO     EXAM VALUES(500, '2013-09-12','mce',190);
INSERT INTO     EXAM VALUES(510, '2013-09-15','sa', 191);
INSERT INTO     EXAM VALUES(520, '2013-09-18','fib', 192);
INSERT INTO     EXAM VALUES(530, '2014-03-21','ess', 193);
INSERT INTO     EXAM VALUES(540, '2014-04-02','tf', 194);

INSERT INTO     EXAM_RESULT VALUES(720,190,500,91);
INSERT INTO     EXAM_RESULT VALUES(720,193,530,97);
INSERT INTO     EXAM_RESULT VALUES(730,194,540,87);
INSERT INTO     EXAM_RESULT VALUES(730,193,530,85);
INSERT INTO     EXAM_RESULT VALUES(740,190,500,60);
INSERT INTO     EXAM_RESULT VALUES(750,191,510,97);
INSERT INTO     EXAM_RESULT VALUES(750,192,520,78);
INSERT INTO     EXAM_RESULT VALUES(760,192,520,75);
INSERT INTO     EXAM_RESULT VALUES(760,191,510,60);
INSERT INTO     EXAM_RESULT VALUES(770,192,520,70);


INSERT INTO     STUDENT_ATT VALUES( 720,100, 180, 21,'y');
INSERT INTO     STUDENT_ATT VALUES( 730,200, 180, 11,'y');
INSERT INTO     STUDENT_ATT VALUES( 740,300, 180, 12,'y');
INSERT INTO     STUDENT_ATT VALUES( 750,100, 180, 14,'y');
INSERT INTO     STUDENT_ATT VALUES( 760,200, 180, 15,'y');
INSERT INTO     STUDENT_ATT VALUES( 770,300, 180, 13,'y');

INSERT INTO STUDENT_COURSE VALUES(720,190,'a');
INSERT INTO STUDENT_COURSE VALUES(720,193,'a');
INSERT INTO STUDENT_COURSE VALUES(730,194,'b');
INSERT INTO STUDENT_COURSE VALUES(730,193,'b');
INSERT INTO STUDENT_COURSE VALUES(740,190,'f');
INSERT INTO STUDENT_COURSE VALUES(750,191,'a');
INSERT INTO STUDENT_COURSE  VALUES(750,192,'c');
INSERT INTO STUDENT_COURSE VALUES(760,191,'c');
INSERT INTO STUDENT_COURSE  VALUES(760,192,'f');
INSERT INTO STUDENT_COURSE  VALUES(770,192,'c');

INSERT INTO     FACULTY_COURSE VALUES (800, 192,3);
INSERT INTO     FACULTY_COURSE VALUES (800, 193,4);
INSERT INTO     FACULTY_COURSE VALUES (800, 190,5);
INSERT INTO     FACULTY_COURSE VALUES (800, 191,3);
INSERT INTO     FACULTY_COURSE VALUES (810, 194,4);
INSERT INTO     FACULTY_COURSE VALUES (810, 195,5);

INSERT INTO     FACULTY_LOGIN VALUES(800,DEFAULT);
INSERT INTO     FACULTY_LOGIN VALUES(810, DEFAULT);
INSERT INTO     FACULTY_LOGIN VALUES(840, DEFAULT);
INSERT INTO     FACULTY_LOGIN VALUES(820, DEFAULT);
INSERT INTO     FACULTY_LOGIN VALUES(830, DEFAULT);

