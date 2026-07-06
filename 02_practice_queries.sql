-- ============================================
-- SQL PRACTICE QUERIES - SALES DATA ANALYSIS
-- ============================================

-- 1. BASIC: List all customers from Hyderabad
SELECT * FROM customers
WHERE city = 'Hyderabad';

-- 2. BASIC: List all products in Electronics category, sorted by price (high to low)
SELECT * FROM products
WHERE category = 'Electronics'
ORDER BY price DESC;

-- 3. BASIC: Find orders placed in February 2025
SELECT * FROM orders
WHERE order_date BETWEEN '2025-02-01' AND '2025-02-28';

-- 4. AGGREGATE: Total number of orders placed by each customer
SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC;

-- 5. AGGREGATE: Average price of products in each category
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category;

-- 6. AGGREGATE: Total revenue generated (quantity * price) per product
SELECT p.product_name, SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- 7. JOIN: Show customer name with the product they ordered
SELECT c.customer_name, p.product_name, o.order_date, o.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
ORDER BY o.order_date;

-- 8. JOIN: Find customers who never placed an order (LEFT JOIN)
SELECT c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 9. GROUP BY + HAVING: Customers who placed more than 1 order
SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

-- 10. GROUP BY: Total revenue by city
SELECT c.city, SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.city
ORDER BY total_revenue DESC;

-- 11. SUBQUERY: Find the most expensive product ordered
SELECT product_name FROM products
WHERE price = (SELECT MAX(price) FROM products);

-- 12. SUBQUERY: Customers who ordered products priced above average
SELECT DISTINCT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
WHERE p.price > (SELECT AVG(price) FROM products);

-- 13. WINDOW-STYLE (using RANK, if supported): Rank products by revenue
SELECT p.product_name,
       SUM(o.quantity * p.price) AS total_revenue,
       RANK() OVER (ORDER BY SUM(o.quantity * p.price) DESC) AS revenue_rank
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name;

-- 14. DATE FUNCTION: Monthly order count
SELECT strftime('%Y-%m', order_date) AS month, COUNT(order_id) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;
-- Note: For MySQL, replace strftime('%Y-%m', order_date) with DATE_FORMAT(order_date, '%Y-%m')

-- 15. BUSINESS INSIGHT: Top 3 customers by total spend
SELECT c.customer_name, SUM(o.quantity * p.price) AS total_spend
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_spend DESC
LIMIT 3;
