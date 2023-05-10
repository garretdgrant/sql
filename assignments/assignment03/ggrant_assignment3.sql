/*  Assignment3.sql 
    Garret Grant
    CS 31A, Spring 2023 */
--
-- Current Database: `megastore`
--

USE megastore;

/* Query 1*/
SELECT 
    prod_id "product id", warehouse_id "warehouse id",
    quantity_on_hand "quantity on hand"
FROM 
    inventory
WHERE
    quantity_on_hand BETWEEN 50 AND 100;

/* Query 2 */
SELECT 
    prod_id "product id", warehouse_id "warehouse id",
    quantity_on_hand "quantity on hand"
FROM 
    inventory
WHERE
    quantity_on_hand IN (50,100,150,200,250);

/* Query 3 */
SELECT
    prod_id "item id", prod_name "item name"
FROM
    products
WHERE
    prod_name LIKE "C%";

/* Query 4 */
SELECT
    prod_id "item id", prod_name "item name"
FROM
    products
WHERE
    prod_name LIKE BINARY "%o%";

/* Query 5 */
SELECT 
    customer_id "customer ID", address_line_1 "street address",
    zip_code "postal code"
FROM    
    cust_address
WHERE
    city = "San Mateo" and address_line_2 = "WY";

/* Query 6 */
SELECT 
    customer_id "customer ID", address_line_1 "street address",
    zip_code "postal code"
FROM    
    cust_address
WHERE NOT
    city = "Oakland";

/* Query 7 */
SELECT
    prod_id, prod_desc, catg_id
FROM
    products
WHERE
    catg_id IN ("PET", "HD");

/* Query 8 */
SELECT
    cust_id, first_name, last_name
FROM
    customers
WHERE
    last_name IN ("Morise", "Morris", "Morse");

/* Query 9 */
SELECT
    cust_id, first_name, last_name
FROM
    customers
WHERE
    last_name LIKE "%s";

/*  Query 10 */
SELECT
    prod_id, prod_desc, catg_id
FROM
    products
WHERE
    catg_id IN ("MUS", "SPG") and prod_desc LIKE "%ball%";

/* Query 11 */
SELECT
    first_name, last_name, salary
FROM
    employees
WHERE
    salary NOT IN (3400,3000,6000) and first_name LIKE "s%"; 

/*  Query 12 */
SELECT
    prod_id, prod_name, prod_desc
FROM
    products
WHERE
    prod_name LIKE "_at%"
ORDER BY
    prod_id DESC;

/*  Query 13 */
SELECT
    prod_id, prod_desc, catg_id
FROM
    products
WHERE
    catg_id NOT IN ("HW", "PET");
    