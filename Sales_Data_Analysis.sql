
CREATE DATABASE IF NOT EXISTS sales_analysis;

USE sales_analysis;

CREATE TABLE IF NOT EXISTS sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    region VARCHAR(50)
);
DESCRIBE sales;

INSERT INTO sales
(sale_id, sale_date, product_name, category, quantity, price, region)
VALUES
(1, '2026-01-05', 'Wireless Mouse', 'Electronics', 2, 599.00, 'South');
INSERT INTO sales
(sale_id, sale_date, product_name, category, quantity, price, region)
VALUES
(2, '2026-01-06', 'Laptop', 'Electronics', 1, 45000.00, 'North'),
(3, '2026-01-07', 'Office Chair', 'Furniture', 2, 3500.00, 'South'),
(4, '2026-01-08', 'Notebook', 'Stationery', 10, 50.00, 'East'),
(5, '2026-01-09', 'Headphones', 'Electronics', 3, 1200.00, 'West'),
(6, '2026-01-10', 'Desk', 'Furniture', 1, 7000.00, 'North'),
(7, '2026-01-11', 'Pen Set', 'Stationery', 5, 150.00, 'South'),
(8, '2026-01-12', 'Keyboard', 'Electronics', 2, 900.00, 'East'),
(9, '2026-01-13', 'Bookshelf', 'Furniture', 1, 5500.00, 'West'),
(10, '2026-01-14', 'Printer', 'Electronics', 1, 8500.00, 'South'),
(11, '2026-02-01', 'Markers', 'Stationery', 8, 80.00, 'North'),
(12, '2026-02-03', 'Monitor', 'Electronics', 2, 11000.00, 'West'),
(13, '2026-02-05', 'Dining Table', 'Furniture', 1, 15000.00, 'East'),
(14, '2026-02-07', 'File Folder', 'Stationery', 12, 40.00, 'South'),
(15, '2026-02-10', 'Webcam', 'Electronics', 2, 2500.00, 'North'),
(16, '2026-02-12', 'Study Table', 'Furniture', 1, 6000.00, 'West');
SELECT COUNT(*) AS total_records
FROM sales;
SELECT * FROM sales;
SELECT
    SUM(quantity * price) AS total_revenue
FROM sales;
SELECT COUNT(*) AS total_orders
FROM sales;
SELECT
    AVG(quantity * price) AS average_order_value
FROM sales;
SELECT
    category,
    SUM(quantity * price) AS category_revenue
FROM sales
GROUP BY category
ORDER BY category_revenue DESC;
SELECT
    region,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;
SELECT
    MONTH(sale_date) AS sales_month,
    SUM(quantity * price) AS monthly_revenue
FROM sales
GROUP BY MONTH(sale_date)
ORDER BY sales_month;
SELECT
    product_name,
    SUM(quantity) AS total_quantity,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY product_name
ORDER BY total_revenue DESC;
SELECT
    COUNT(*) AS total_orders,
    SUM(quantity * price) AS total_revenue,
    AVG(quantity * price) AS average_order_value,
    SUM(quantity) AS total_items_sold
FROM sales;