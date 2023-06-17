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


DELIMITER ;

/*Load tables with given */
source ~/foothillCollege/databaseFHC/sql/assignments/projectPart2/Insert_data_university_database.sql
