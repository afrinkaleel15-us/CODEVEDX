CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    payment_method VARCHAR(50),
    region VARCHAR(50)
);
INSERT INTO orders VALUES
(1,'2026-01-05','Arun','Laptop','Electronics',1,55000,'UPI','South'),
(2,'2026-01-08','Priya','Mobile','Electronics',2,18000,'Card','North'),
(3,'2026-01-12','Karthik','Shoes','Fashion',2,2500,'UPI','South'),
(4,'2026-01-15','Divya','Watch','Accessories',1,3500,'Cash','West'),
(5,'2026-01-20','Rahul','Laptop','Electronics',1,55000,'Card','East'),
(6,'2026-02-02','Meena','Dress','Fashion',3,1800,'UPI','South'),
(7,'2026-02-06','Vijay','Mobile','Electronics',1,18000,'Cash','North'),
(8,'2026-02-10','Anitha','Bag','Accessories',2,2200,'Card','West'),
(9,'2026-02-14','Suresh','Shoes','Fashion',1,2500,'UPI','East'),
(10,'2026-02-18','Nisha','Laptop','Electronics',1,55000,'Card','South'),
(11,'2026-03-03','Manoj','Watch','Accessories',2,3500,'UPI','North'),
(12,'2026-03-07','Keerthi','Dress','Fashion',2,1800,'Cash','West'),
(13,'2026-03-12','Ajay','Mobile','Electronics',2,18000,'UPI','East'),
(14,'2026-03-16','Sneha','Bag','Accessories',1,2200,'Card','South'),
(15,'2026-03-20','Ramesh','Shoes','Fashion',3,2500,'UPI','North'),
(16,'2026-03-25','Pooja','Laptop','Electronics',1,55000,'Cash','West');
SELECT * FROM orders;
SELECT SUM(quantity * price) AS total_revenue
FROM orders;
SELECT COUNT(*) AS total_orders
FROM orders;
SELECT product_name,
       SUM(quantity) AS total_sold
FROM orders
GROUP BY product_name
ORDER BY total_sold DESC;
SELECT category,
       SUM(quantity * price) AS category_revenue
FROM orders
GROUP BY category
ORDER BY category_revenue DESC;
SELECT
    MONTH(order_date) AS sales_month,
    SUM(quantity * price) AS monthly_revenue
FROM orders
GROUP BY MONTH(order_date)
ORDER BY sales_month;
SELECT customer_name,
       SUM(quantity * price) AS total_spent
FROM orders
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;
SELECT payment_method,
       COUNT(*) AS total_orders,
       SUM(quantity * price) AS total_revenue
FROM orders
GROUP BY payment_method
ORDER BY total_revenue DESC;
SELECT region,
       SUM(quantity * price) AS total_revenue
FROM orders
GROUP BY region
ORDER BY total_revenue DESC;
