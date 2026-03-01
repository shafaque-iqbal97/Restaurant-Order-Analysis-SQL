--Restaurant-Order-Analysis-Project
--Objective 1 - Item table

DROP TABLE IF EXISTS items;

CREATE TABLE items(
	item_id SERIAL PRIMARY KEY,
	item_name VARCHAR(50) NOT NULL,
	category VARCHAR(20),
	price NUMERIC(10,2)
);

SELECT * FROM items;

CREATE TABLE orders(
	order_details SERIAL PRIMARY KEY,
	order_id INT,
	order_date DATE,
	order_time TIME,
	item_id INT
);

SELECT * FROM orders;

--Find numbers of items:

SELECT COUNT(item_name) AS total_items
FROM items;

--Find least and most expensive items:

SELECT MIN(price) AS least_expensive_item,
       MAX(price) AS most_expensive_item
FROM items;

--How many italian dishes on the menu? What are the least and most expensive italian dishes on the menu?

SELECT  MIN(price) AS least_expensive_item,
       MAX(price) AS most_expensive_item
FROM items
GROUP BY category
HAVING category = 'Italian';

--How many dishes are in each category? 

SELECT category, COUNT(menu_item_id) AS num_of_dishes
FROM items
GROUP BY category;

--What is the average dish price within each category?

SELECT category, AVG(price) AS avg_price
FROM items
GROUP BY category;


--Objective 2 -Orders table

SELECT * FROM orders;

--What is the date range of the table?

SELECT MIN(order_date) AS First_date, MAX(order_date) AS last_date
FROM orders;

--How many orders were made within this date range? 

SELECT COUNT(DISTINCT order_id) AS order_details 
FROM orders;

--How many items were ordered within this date range?

SELECT COUNT(*) AS total_items  
FROM orders;

--Which orders had the most number of items?

SELECT order_id, COUNT(item_id) AS num_items
FROM orders
GROUP BY order_id
ORDER BY num_items DESC;

--How many orders had more than 12 items?

SELECT COUNT(*) FROM
(SELECT order_id, COUNT(item_id) AS num_items
FROM orders                                          --Used subquery
GROUP BY order_id
HAVING COUNT(item_id) > 12) AS num_orders;

--Objective 3 -- Analyze customer behavior

--Combine the menu_items and order_details tables into a single table.

SELECT * FROM items i
LEFT JOIN
orders o
USING(item_id);

--What were the least and most ordered items? What categories were they in?

SELECT item_name,category, COUNT(order_details) AS num_purchased
FROM items i
LEFT JOIN
orders o                            --Most ordered items
USING(item_id)
GROUP BY item_name, category
ORDER BY COUNT(order_details) DESC
LIMIT 1;

SELECT item_name,category, COUNT(order_details) AS num_purchased
FROM items i
LEFT JOIN
orders o                                    --Least orderd items
USING(item_id)
GROUP BY item_name, category
ORDER BY COUNT(order_details) ASC
LIMIT 1;

--What were the top 5 orders that spent the most money?

SELECT order_id, SUM(price) AS total_spend
FROM items i
LEFT JOIN
orders o
USING(item_id)
GROUP BY order_id
ORDER BY SUM(price) DESC
LIMIT 5;

--View the details of the highest spend order. Which specific items were purchased?

SELECT order_id, category, item_name, COUNT(item_id) AS num_items
FROM items i
LEFT JOIN
orders o
USING(item_id)
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category, item_name
ORDER BY COUNT(item_id) DESC;


--View the details of the top 5 highest spend orders

SELECT * FROM items i
LEFT JOIN
orders o
USING(item_id)
WHERE order_id IN (440, 2075, 1957, 330, 2675)
ORDER BY item_id DESC
LIMIT 5;






    




