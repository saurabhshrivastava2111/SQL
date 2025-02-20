CREATE DATABASE danny_dinner;

USE danny_dinner;

DROP TABLE sales;
DROP TABLE Members;
DROP TABLE Menu;

-- Error Code: 1822. Failed to add the foreign key constraint. Missing index for constraint 'sales_ibfk_1' in the referenced table 'Menu'

CREATE TABLE IF NOT EXISTS Menu(
product_id INT PRIMARY KEY,
product_name VARCHAR(5) NOT NULL,
price INT NOT NULL
);

-- 0 row(s) affected, 1 warning(s): 1050 Table 'Menu' already exists



CREATE TABLE IF NOT EXISTS Members(
	customer_id VARCHAR(1) PRIMARY KEY,
    join_date TIMESTAMP NOT NULL
);


CREATE TABLE IF NOT EXISTS sales(
customer_id VARCHAR(1) NOT NULL,
order_date DATE NOT NULL,
product_id INT NOT NULL,
FOREIGN KEY (product_id) REFERENCES Menu(product_id),
FOREIGN KEY (customer_id) REFERENCES Members(customer_id)
);

  INSERT INTO menu
  (product_id, product_name, price)
VALUES
  (1, 'sushi', 10),
  (2, 'curry', 15),
  (3, 'ramen', 12);
  
  INSERT INTO members
  (customer_id, join_date)
VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09'),
  ('C', '2020-01-09');



INSERT INTO sales
  (customer_id, order_date, product_id)
VALUES
  ('A', '2021-01-01', 1),
  ('A', '2021-01-01', 2),
  ('A', '2021-01-07', 2),
  ('A', '2021-01-10', 3),
  ('A', '2021-01-11', 3),
  ('A', '2021-01-11', 3),
  ('B', '2021-01-01', 2),
  ('B', '2021-01-02', 2),
  ('B', '2021-01-04', 1),
  ('B', '2021-01-11', 1),
  ('B', '2021-01-16', 3),
  ('B', '2021-02-01', 3),
  ('C', '2021-01-01', 3),
  ('C', '2021-01-01', 3),
  ('C', '2021-01-07', 3);
  
ALTER TABLE Menu MODIFY COLUMN price DECIMAL(10, 2);

SELECT * FROM Menu;


  
--   Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`danny_dinner`.`sales`, CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `menu` (`product_id`))



-- -----------Case Study Questions -----------
-- --------Each of the following case study questions can be answered using a single SQL statement: 

-- What is the total amount each customer spent at the restaurant?

-- SELECT 


-- How many days has each customer visited the restaurant?
-- What was the first item from the menu purchased by each customer?
-- What is the most purchased item on the menu and how many times was it purchased by all customers?
-- Which item was the most popular for each customer?
-- Which item was purchased first by the customer after they became a member?
-- Which item was purchased just before the customer became a member?
-- What is the total items and amount spent for each member before they became a member?
-- If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
-- In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

