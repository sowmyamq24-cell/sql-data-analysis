# SQL Data Analysis — Sales Dataset

## About
Practicing SQL for data analysis using a sample retail/sales dataset with customers, products, and orders. Covers filtering, aggregation, joins, subqueries, and window functions to extract business insights.

## Tools Used
- SQL (MySQL / SQLite compatible)
- MySQL Workbench / DB Browser for SQLite

## Dataset
Custom sample dataset with 3 tables:
- **customers** — customer_id, name, city, state
- **products** — product_id, name, category, price
- **orders** — order_id, customer_id, product_id, order_date, quantity

## Files
- `01_schema_and_data.sql` — table creation + sample data (INSERT statements)
- `02_practice_queries.sql` — 15 practice queries across difficulty levels

## Topics Covered
- Filtering & sorting (`WHERE`, `ORDER BY`, `BETWEEN`)
- Aggregate functions (`COUNT`, `SUM`, `AVG`)
- `GROUP BY` & `HAVING`
- `JOIN` (`INNER JOIN`, `LEFT JOIN`)
- Subqueries
- Window functions (`RANK() OVER`)
- Date-based grouping

## Key Insights from the Analysis
- Identified top revenue-generating products and top 3 customers by total spend
- Found customers who never placed an order (using `LEFT JOIN`)
- Compared average product price across categories
- Tracked monthly order trends

## How to Run
1. Run `01_schema_and_data.sql` first to create tables and load sample data
2. Run `02_practice_queries.sql` to execute the analysis queries
3. Compatible with MySQL Workbench, SQLite, or any standard SQL client
   (Note: `strftime()` in Query 14 is SQLite syntax — for MySQL use `DATE_FORMAT()`)

## Status
🚧 Work in progress — adding more queries and datasets regularly.
