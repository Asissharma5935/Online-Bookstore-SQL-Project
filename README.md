# Online Bookstore SQL Project

## Overview
A MySQL database project for an online bookstore. The SQL script creates the database schema and provides queries for book discovery, customer orders, revenue, sales analysis, and inventory tracking.

## Database Tables
- **`book`** — book title, author, genre, publication year, price, and stock.
- **`customer`** — customer name, contact details, city, and country.
- **`orders`** — customer purchases, order dates, quantities, and total order amounts.

## Analysis Included
- Filter books by genre and publication year
- Retrieve customers by country
- Find orders in a date range and above a specified amount
- Calculate total stock and total revenue
- Identify the highest-priced and lowest-stock books
- Summarize books sold by genre and author
- Find customers with at least two orders and the highest-spending customer
- Calculate remaining stock after accounting for order quantities

## SQL Skills Demonstrated
Database and table creation, primary and foreign keys, filtering, aggregate functions, joins, grouping with `GROUP BY` and `HAVING`, sorting, subqueries, `LIMIT`, `LEFT JOIN`, and `COALESCE`.

## Files
- **`online_bookstore.sql`** — schema and analysis queries.

## How to Run
1. Open `online_bookstore.sql` in MySQL Workbench.
2. Connect to your MySQL server.
3. Execute the script to create the database and tables.
4. Import or insert your books, customers, and orders data.
5. Run the analysis queries after loading data.

## Data Note
The uploaded script defines the schema and queries but does not include sample `INSERT` statements or a data file. The analysis queries will return empty results until data is imported. The SQL script also aligns the order foreign keys with the `book` and `customer` tables and uses matching key types.

## Author
Asish Kumar Sharma
