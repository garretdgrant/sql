/*  Assignment5.sql 
    Garret Grant
    CS 31A, Spring 2023 */
--
-- Current Database: `megastore`
--

USE megastore;

/* Query 1*/
SELECT AVG(salary) AS Average
FROM employees
WHERE manager_id = 100;

/* Query 2 */
SELECT MIN(SALARY) as lowest_salary, MAX(hire_date) AS recent_hire, 
    MIN(last_name) as f_last_name, MAX(last_name) as l_last_name
FROM employees
WHERE dept_id = 30 OR dept_id = 60;

/* Query 3 */
SELECT CONCAT(first_name, ' ', last_name) as 'employee name', salary as Salary
FROM employees
WHERE last_name like '%ar%';

/* Query 4 */
SELECT MIN(last_name) as 'first last name', MAX(last_name) as 'last last name'
FROM employees;

/* Query 5 */
SELECT emp_id, CONCAT('$', ROUND(salary/52, 2)) as 'weekly salary'
from employees;

/* Query 6 */
SELECT prod_id, UPPER(prod_desc) as Prod_description
FROM products;

/* Query 7 */
SELECT cust_id, first_name, last_name, ROUND(credit_limit) as balance
from customers;

/* Query 8 */
SELECT o.ord_id, o.cust_id, c.first_name, c.last_name, o.ord_date, 
    DATE_ADD(o.ord_date, INTERVAL 20 DAY) as promotion_date
FROM orders as o
JOIN customers as c 
ON o.cust_id = c.cust_id;

/* Query 9 */
SELECT prod_id, COUNT(prod_id) AS numorders
FROM order_details
GROUP BY prod_id
ORDER BY numorders DESC;

/*  Query 10 */
SELECT c.cust_id, COUNT(o.ord_id) as number_of_items
FROM customers as c
JOIN orders as o
ON c.cust_id = o.cust_id
GROUP BY c.cust_id;

/* Query 11 */
SELECT catg_id, COUNT(*) as number_of_products, 
    AVG(prod_list_price) as 'Average price of the products'
FROM products
GROUP BY catg_id
HAVING COUNT(*) > 5;

/*  Query 12 */
SELECT AVG(prod_list_price) as avgPrice, catg_id
FROM products
GROUP BY catg_id;

/*  Query 13 */
SELECT od.ord_id, od.prod_id, p.catg_id, p.prod_name
FROM order_details as od
JOIN products as p
ON od.prod_id = p.prod_id
WHERE catg_id = 'SPG'
UNION ALL
SELECT od.ord_id, od.prod_id, p.catg_id, p.prod_name
FROM order_details as od
JOIN products as p
ON od.prod_id = p.prod_id
WHERE catg_id = 'PET';

/*  Query 14 */
SELECT p.prod_id, p.catg_id, p.prod_name
FROM products as p
LEFT JOIN order_details as d
ON p.prod_id = d.prod_id
LEFT JOIN orders as o
ON o.ord_id = d.ord_id
WHERE catg_id = 'HW' and d.ord_id IS NOT NULL and MONTH(o.ord_date) = 11
GROUP BY p.prod_id
UNION 
SELECT p.prod_id, p.catg_id, p.prod_name
FROM products as p
LEFT JOIN order_details as d
ON p.prod_id = d.prod_id
LEFT JOIN orders as o
ON o.ord_id = d.ord_id
WHERE catg_id = 'HW' and d.ord_id IS NOT NULL and MONTH(o.ord_date) = 12
GROUP BY p.prod_id;