-- ============================================
-- SALES DATA ANALYSIS PROJECT
-- Schema + Sample Data
-- ============================================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ============================================
-- SAMPLE DATA
-- ============================================

INSERT INTO customers VALUES
(1, 'Ravi Kumar', 'Hyderabad', 'Telangana'),
(2, 'Priya Sharma', 'Bangalore', 'Karnataka'),
(3, 'Amit Patel', 'Mumbai', 'Maharashtra'),
(4, 'Sowmya Reddy', 'Hyderabad', 'Telangana'),
(5, 'Karan Singh', 'Delhi', 'Delhi'),
(6, 'Divya Nair', 'Chennai', 'Tamil Nadu'),
(7, 'Vikram Rao', 'Bangalore', 'Karnataka'),
(8, 'Anjali Gupta', 'Pune', 'Maharashtra');

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 55000.00),
(102, 'Smartphone', 'Electronics', 22000.00),
(103, 'Office Chair', 'Furniture', 4500.00),
(104, 'Desk', 'Furniture', 6000.00),
(105, 'Headphones', 'Electronics', 1800.00),
(106, 'Bookshelf', 'Furniture', 3200.00),
(107, 'Monitor', 'Electronics', 9500.00),
(108, 'Keyboard', 'Electronics', 1200.00);

INSERT INTO orders VALUES
(1, 1, 101, '2025-01-15', 1),
(2, 2, 102, '2025-01-18', 2),
(3, 3, 103, '2025-01-20', 1),
(4, 4, 101, '2025-02-02', 1),
(5, 5, 105, '2025-02-05', 3),
(6, 6, 104, '2025-02-10', 1),
(7, 1, 107, '2025-02-14', 1),
(8, 7, 102, '2025-02-20', 1),
(9, 8, 106, '2025-03-01', 2),
(10, 2, 108, '2025-03-05', 2),
(11, 4, 105, '2025-03-08', 1),
(12, 3, 101, '2025-03-15', 1),
(13, 5, 107, '2025-03-20', 1),
(14, 6, 102, '2025-03-25', 1),
(15, 1, 108, '2025-04-01', 1);
