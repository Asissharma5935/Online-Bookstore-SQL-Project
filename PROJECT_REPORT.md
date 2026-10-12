# Online Bookstore SQL Project — Report

**Author:** Asish Kumar Sharma  
**Database:** MySQL  
**Tool:** MySQL Workbench

## 1. Project Overview

This project demonstrates how SQL can be used to organize and analyze an online bookstore's data. The database contains information about books, customers, and orders. The queries explore inventory, pricing, customer purchases, sales by genre and author, and revenue.

## 2. Objectives

- Create a relational database for an online bookstore.
- Store book, customer, and order information in separate tables.
- Query and summarize data to answer common business questions.
- Analyze inventory remaining after orders.
- Demonstrate practical SQL skills for a portfolio project.

## 3. Database Design

### `book`
Stores each book's ID, title, author, genre, publication year, price, and stock quantity.

### `customer`
Stores customer ID, name, email, phone, city, and country.

### `orders`
Stores order ID, customer ID, book ID, order date, quantity, and total amount.

The orders table relates each order to a customer and a book through foreign keys.

## 4. SQL Analysis Performed

The project includes queries to:

- Filter books by genre and publication year.
- Find customers by country.
- Retrieve orders within a date range or above a specified amount.
- Calculate total stock and total order revenue.
- Identify the most expensive books and books with the lowest stock.
- Count books by genre.
- Summarize quantities sold by genre and author.
- Identify customers with multiple orders and customers with the highest total spend.
- Calculate stock remaining by subtracting ordered quantities from original stock.

## 5. SQL Concepts Demonstrated

- Database and table creation
- Primary keys and foreign keys
- `SELECT`, `WHERE`, `ORDER BY`, and `LIMIT`
- Aggregate functions: `SUM`, `AVG`, `MIN`, `MAX`, and `COUNT`
- `GROUP BY` and `HAVING`
- Inner joins and left joins
- Subqueries
- `COALESCE` to handle books with no matching orders

## 6. Inventory Calculation

The inventory analysis uses a left join so books with no orders are retained in the results. `COALESCE(SUM(o.Quantity), 0)` treats a missing order quantity as zero.

Conceptually:

`Stock Remaining = Original Stock - Total Ordered Quantity`

This calculation assumes the stock column represents the starting stock and that each order quantity should be deducted from it.

## 7. Results and Business Value

The queries are designed to help a bookstore:

- Understand stock levels and identify books that may need replenishment.
- Compare demand across genres and authors.
- Review order revenue and customer spending.
- Identify frequently ordered books.
- Explore customer ordering patterns.

**Note:** Actual business findings depend on the data loaded into MySQL. This report describes the analysis performed and does not claim specific sales trends or revenue totals.

## 8. How to Run the Project

1. Open `online_bookstore.sql` in MySQL Workbench.
2. Connect to a MySQL server and execute the schema setup.
3. Import the CSV files (`Books.csv`, `Customers.csv`, and `Orders.csv`) into the matching tables, ensuring the column names and data types align.
4. Import books and customers before orders because orders reference both.
5. Run the analysis queries and review the result grids.

## 9. Project Files

- `online_bookstore.sql` — database schema and SQL analysis queries.
- `Books.csv` — book data.
- `Customers.csv` — customer data.
- `Orders.csv` — order data.
- `README.md` — project overview and setup instructions.
- `PROJECT_REPORT.md` — detailed project report.

## 10. Conclusion

This project demonstrates practical relational database design and SQL-based analysis for an online bookstore scenario. It brings together data modeling, joins, aggregation, subqueries, and inventory calculations in a portfolio-ready example.
