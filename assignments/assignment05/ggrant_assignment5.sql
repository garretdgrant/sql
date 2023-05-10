/*  Assignment5.sql 
    Garret Grant
    CS 31A, Spring 2023 */
--
-- Current Database: `megastore`
--

USE megastore;

/* Query 1*/
SELECT o.ord_id, o.ord_date, o.cust_id, c.first_name, c.last_name
FROM orders AS o 
INNER JOIN customers AS c
ON o.cust_id = c.cust_id;

/* Query 2 */
SELECT o.ord_id, o.cust_id, c.first_name, c.last_name, o.ord_date
FROM orders AS o 
INNER JOIN customers AS c
ON o.cust_id = c.cust_id
WHERE o.ord_date = '2014-04-04';

/* Query 3 */
SELECT  o.cust_id, c.first_name, c.last_name
FROM orders AS o 
INNER JOIN customers AS c
ON o.cust_id = c.cust_id
WHERE o.ord_date != '2014-04-04';

/* Query 4 */
SELECT o.ord_id, o.ord_date, p.prod_id, p.prod_desc, p.catg_id
FROM orders o 
INNER JOIN order_details od ON o.ord_id = od.ord_id
INNER JOIN products p ON od.prod_id = p.prod_id
ORDER BY p.catg_id, o.ord_id;

/* Query 5 */
SELECT o.ord_id, o.ord_date, c.first_name, c.last_name
FROM orders o 
INNER JOIN order_details od ON o.ord_id = od.ord_id
INNER JOIN products p ON od.prod_id = p.prod_id
INNER JOIN customers c ON o.cust_id = c.cust_id
WHERE c.first_name = 'Samuel' 
    AND c.last_name = 'Morse' 
    AND p.prod_desc != 'Electric Pancake griddle';

/* Query 6 */
SELECT c.cust_id, c.last_name , o.ord_id, p.prod_id, p.prod_name
FROM orders o 
INNER JOIN order_details od ON o.ord_id = od.ord_id
INNER JOIN products p ON od.prod_id = p.prod_id
INNER JOIN customers c ON o.cust_id = c.cust_id
LIMIT 10;

/* Query 7 */
SELECT c.cust_id, c.last_name as Customer, o.ord_id, p.prod_id, p.prod_name
FROM orders o 
INNER JOIN order_details od ON o.ord_id = od.ord_id
INNER JOIN products p ON od.prod_id = p.prod_id
INNER JOIN customers c ON o.cust_id = c.cust_id
WHERE p.catg_id = 'MUS';

/* Query 8 */
SELECT c.cust_id, c.credit_limit, cr.rating
FROM customers c
JOIN credit_ratings cr
WHERE c.credit_limit >= cr.low_limit 
    AND c.credit_limit <= cr.high_limit;

/* Query 9 */
SELECT p.prod_id, p.prod_desc, p.catg_id, od.ord_id
FROM products p
LEFT JOIN order_details od
ON p.prod_id = od.prod_id
WHERE p.catg_id = 'MUS';

/*  Query 10 */
SELECT c.cust_id, c.last_name, o.ord_id
FROM customers c
LEFT JOIN orders o 
ON c.cust_id = o.cust_id;

/* Query 11 */
SELECT p.prod_id, p.prod_name, c.catg_desc
FROM products p
JOIN categories c
ON p.catg_id = c.catg_id
ORDER BY p.catg_id, p.prod_id;

/*  Query 12 */
SELECT e.first_name, e.last_name, m.first_name AS mgr_first_name, 
    m.last_name AS mgr_last
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;
