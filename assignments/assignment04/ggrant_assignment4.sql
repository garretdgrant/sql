/*  Assignment4.sql 
    Garret Grant
    CS 31A, Spring 2023 */
--
-- Current Database: `megastore`
--

USE megastore;

/* Query 1*/
CREATE TABLE GLOBAL_LOCATIONS (
    id INT (4),
    loc_name VARCHAR(20), 
    address VARCHAR(20),
    city VARCHAR(20),
    zip_postal_code VARCHAR(20),
    phone VARCHAR(20),
    email VARCHAR(20),
    manager_id INT(4),
    emergency_contact VARCHAR(20),
    UNIQUE (email),
    PRIMARY KEY (id)
) ENGINE = INNODB;

DESCRIBE GLOBAL_LOCATIONS;

/* Query 2 */
/*
    Wrapping question 2 in comments as the instructions
    say not to execute
CREATE TABLE LOCATIONS (
    loc_id INT (4),
    loc_postal_code VARCHAR(12) NOT NULL, 
    loc_street_address VARCHAR(25) NOT NULL,
    loc_city VARCHAR(25) NOT NULL,
    loc_state_province VARCHAR(25) NOT NULL,
    loc_country_id CHAR(2) NOT NULL,
    loc_type VARCHAR(25),
    PRIMARY KEY (loc_id)
) ENGINE = INNODB;
*/

/* Query 3 */
ALTER TABLE GLOBAL_LOCATIONS
    ADD date_opened DATE;


DESCRIBE GLOBAL_LOCATIONS;

/* Query 4 */
SHOW COLUMNS FROM GLOBAL_LOCATIONS;

/* Query 5 */
ALTER TABLE GLOBAL_LOCATIONS
    DROP COLUMN date_opened;

/* Query 6 */
RENAME TABLE GLOBAL_LOCATIONS TO GLOBAL_LOCATIONS_BACKUP;

/* Query 7 */
CREATE TABLE EMPLOYEE_PAY(
    employee_id INT, 
    ssn CHAR(11),
    salalry NUMERIC(8,2) NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (employee_id),
    UNIQUE (SSN)
) ENGINE = INNODB;

/* Query 8 */
INSERT INTO EMPLOYEE_PAY (employee_id, ssn, salalry, hire_date)
VALUES (184167702,'744-04-9444',5500,'2011-03-15');

SELECT * FROM EMPLOYEE_PAY;

/* Query 9 */
DESCRIBE EMPLOYEE_PAY;

ALTER TABLE EMPLOYEE_PAY
ADD e_address VARCHAR(30);

DESCRIBE EMPLOYEE_PAY;

/*  Query 10 */
SHOW TABLES;

/* Query 11 */
ALTER TABLE EMPLOYEE_PAY
DROP COLUMN e_address;

/*  Query 12 */
DROP TABLE GLOBAL_LOCATIONS_BACKUP;
SHOW TABLES;
/*  Query 13 */
INSERT INTO categories (catg_id, catg_desc)
VALUES ('FU', 'feurniture');

/*  Query 14 */
UPDATE categories
SET catg_desc = 'furniture'
WHERE catg_id = 'FU';
