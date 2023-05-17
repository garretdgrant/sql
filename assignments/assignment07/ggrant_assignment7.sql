/*  Assignment7.sql 
    Garret Grant
    CS 31A, Spring 2023 */
--
-- Current Database: `megastore`
--

USE megastore;

/* Query 1*/
SELECT prod_id, prod_desc, prod_list_price
FROM products
WHERE prod_list_price IN (
    SELECT MIN(prod_list_price)
    FROM products
);

/* Query 2 */
SELECT cust_id, first_name, last_name
FROM customers
WHERE cust_id IN (
    SELECT cust_id
    FROM orders
    WHERE ord_date = '2013-10-01'
);

/* Query 3 */
SELECT cust_id, first_name, last_name
FROM customers
WHERE EXISTS (
    SELECT cust_id
    FROM orders
    WHERE orders.cust_id = customers.cust_id AND ord_date = '2013-10-01'
);

/* Query 4 */
SELECT ord_id, ord_date
FROM orders
WHERE cust_id IN
(
    SELECT cust_id
    FROM customers
    WHERE first_name = 'William' AND last_name = 'Morris'
);

/* Query 5 */
SELECT prod_id, prod_desc, catg_id, prod_list_price
FROM products
WHERE prod_list_price > ALL
(
    SELECT prod_list_price
    FROM products
    WHERE catg_id = 'PET'
);

/* Query 6 */
SELECT emp_id, last_name, first_name, manager_id as emp_mng,
    dept_id, hire_date, salary, job_id
FROM employees
WHERE salary > ANY
(
    SELECT salary
    FROM employees
    WHERE last_name = 'Davies'
) AND dept_id IN (
    SELECT dept_id
    FROM employees
    WHERE last_name = 'Bell'
);

/* Query 7 */
SELECT dept_id, MIN(salary) as 'Min minimum'
FROM employees
GROUP BY dept_id
HAVING MIN(salary) > 
(
    SELECT MIN(salary)
    FROM employees
    WHERE dept_id != 50
);

/* Query 8 */
SELECT last_name
FROM employees
WHERE salary IN 
(
    SELECT MIN(salary)
    FROM employees
    GROUP BY dept_id
);

/* Query 9 */
SELECT last_name, first_name, dept_id, manager_id as emp_mng
FROM employees
WHERE (dept_id, manager_id) IN
(
    SELECT dept_id, manager_id
    FROM employees
    WHERE emp_id = 107
) AND emp_id != 107;

/*  
    Query 10
    Assuming employee 107 Should not be in results since
    example output from assignment only returns 3 rows
 */
SELECT last_name, first_name, dept_id, manager_id as emp_mng
FROM employees
WHERE dept_id IN
(
    SELECT dept_id
    FROM employees
    WHERE emp_id = 107
) AND manager_id IN (
    SELECT manager_id
    FROM employees
    WHERE emp_id = 107
) AND emp_id != 107;

/* Query 11 */
SELECT last_name, dept_id, salary
FROM employees
WHERE salary IN
(
    SELECT MAX(salary)
    FROM employees
    GROUP BY dept_id
);

/*  Query 12 */
SELECT cust_id, last_name
FROM customers
WHERE cust_id IN
(
    SELECT o.cust_id
    FROM orders o
    JOIN order_details d
    ON o.ord_id = d.ord_id
    WHERE d.prod_id IN (1050,1060)
);


/*  Query 13 */
SELECT catg_id as catg, prod_id, prod_desc as product, prod_list_price as price
FROM products
WHERE prod_id NOT IN
(
    SELECT prod_id
    FROM order_details
);

