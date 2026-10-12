# Online Bookstore SQL Project

## Overview
This project uses MySQL to build and query a simple online bookstore database. It includes tables for books, customers, and orders, along with queries for book discovery, customer orders, revenue, sales by genre and author, and remaining inventory.

## Database Tables
- **book** — book title, author, genre, publication year, price, and stock.
- **customer** — customer contact and location details.
- **orders** — customer purchases, order dates, quantities, and order amounts.

## SQL Topics Demonstrated
- Database and table creation
- Filtering with `WHERE`, `LIKE`, `IN`, and `BETWEEN`
- Aggregation with `SUM`, `AVG`, `MIN`, `MAX`, and `COUNT`
- Joins and grouping with `GROUP BY` and `HAVING`
- Sorting and limiting results
- Inventory analysis using `LEFT JOIN` and `COALESCE`

## How to Run
1. Open the SQL script in MySQL Workbench.
2. Connect to your MySQL server.
3. Review the script, then execute the database/table setup and queries.
4. Ensure the referenced table and column names match your schema before running.

## Note
The source script uses a table named `book` but the Orders foreign key refers to `Books(Book_ID)`. In MySQL, table names may be case-sensitive depending on the system. Review this reference so it matches the actual table name (`book`). Also ensure `Book_ID` and `Customer_ID` types match their referenced key types.

## Author
Asish Kumar Sharma
