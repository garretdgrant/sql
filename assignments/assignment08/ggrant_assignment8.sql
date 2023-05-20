/*  Assignment7.sql 
    Garret Grant
    CS 31A, Spring 2023 */
--
-- Current Database: `megastore`
--

USE megastore;

/* Query 1*/
SELECT e.last_name,  e.salary, e.dept_id,  m_sals.m_sal
FROM employees e
JOIN
(SELECT dept_id, MAX(salary) as m_sal
FROM employees
GROUP BY dept_id) as m_sals
WHERE e.dept_id = m_sals.dept_id;

/* Query 2
    From the provided example output, I believe the instructions
    should be for credit_limit >= 1000 not 100
 */
CREATE OR REPLACE VIEW MAJOR_CUSTOMER AS
SELECT cust_id, first_name, last_name, credit_limit
FROM customers
WHERE credit_limit >= 1000;
SELECT * FROM MAJOR_CUSTOMER;

/* Query 3 */
CREATE OR REPLACE VIEW ITEM_ORDERED AS
SELECT  p.prod_id, p.prod_desc, p.prod_list_price, o.ord_id, o.ord_date, 
        d.quantity_ordered, d.quoted_price
FROM products p
JOIN order_details d
ON p.prod_id = d.prod_id
JOIN orders o
ON o.ord_id = d.ord_id
ORDER BY o.ord_id, p.prod_desc;

/*  Query 4 
    Again from sample output, I am assuming the desired
    order be greater than 100, i.e. quantity_ordered * price > 100;
    instructions for this assignment are a bit confusing when looking
    at the desired output.

*/
SELECT  prod_id, prod_desc, prod_list_price, ord_id, ord_date,
        quantity_ordered, quoted_price
FROM ITEM_ORDERED
WHERE quantity_ordered * quoted_price > 100;

/* Query 5 */
CREATE OR REPLACE VIEW MY_DEPARTMENTS AS
SELECT * FROM departments;
SELECT * FROM MY_DEPARTMENTS;

/* Query 6 */
CREATE OR REPLACE VIEW V_SALARIES AS
SELECT MAX(e.salary) Highestsal, MIN(e.salary) Lowestsal, AVG(e.salary) Avgsal, d.department_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY e.dept_id;

/* Query 7 */
CREATE OR REPLACE VIEW PROD_HW_APL AS
SELECT prod_id, prod_name, prod_list_price
FROM products
WHERE catg_id IN ('APL', 'HW');

/* Query 8 */
CREATE OR REPLACE VIEW CUST_ORDERS AS
SELECT o.ord_id, o.ord_date, o.cust_id, p.catg_id, p.prod_id
FROM order_details d
JOIN orders o ON o.ord_id = d.ord_id
JOIN products p ON p.prod_id = d.prod_id
ORDER BY ord_id, prod_id DESC;

/* Query 9 */
CREATE OR REPLACE VIEW ORD_TOTAL AS
SELECT ord_id, SUM(quoted_price * quantity_ordered) 'total due'
FROM order_details
GROUP BY ord_id
ORDER BY ord_id;

