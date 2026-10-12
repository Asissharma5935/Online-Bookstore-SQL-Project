# Online Bookstore SQL Project

![MySQL](https://img.shields.io/badge/SQL-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white) ![Database](https://img.shields.io/badge/Database-Relational-4479A1?style=for-the-badge)

## Overview
A MySQL portfolio project for exploring an online bookstore's catalog, customers, orders, revenue, and inventory. It uses MySQL Workbench and three CSV datasets.

## Project Files
- `online_bookstore.sql` — creates the database tables and contains analysis queries.
- `Books.csv` — 500 book records.
- `Customers.csv` — 500 customer records.
- `Orders.csv` — 500 order records.
- `PROJECT_REPORT.md` — detailed project report.

## Database Tables
- **`book`** — `Book_ID`, `Title`, `Author`, `Genre`, `Published_Year`, `Price`, `Stock`.
- **`customer`** — `Customer_ID`, `Name`, `Email`, `Phone`, `City`, `Country`.
- **`orders`** — `Order_ID`, `Customer_ID`, `Book_ID`, `Order_Date`, `Quantity`, `Total_Amount`.

The orders table references the customer and book tables through foreign keys.

## SQL Analysis Included
- Filter books by genre and publication year.
- Find customers by country and orders by date or amount.
- Calculate total stock and order revenue.
- Identify highest-priced and lowest-stock books.
- Count books by genre.
- Summarize quantities sold by genre and author.
- Find repeat customers and high-spending customers.
- Calculate remaining stock after accounting for ordered quantities.

## SQL Skills Demonstrated
Database and table creation, primary and foreign keys, filtering, subqueries, aggregate functions (`SUM`, `AVG`, `MIN`, `MAX`, `COUNT`), `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING`, `ORDER BY`, `LIMIT`, and `COALESCE`.

## Dataset Checks and Initial Findings
A structural check of the CSV files found:
- 500 book records, 500 customer records, and 500 order records.
- All order rows reference a `Book_ID` and `Customer_ID` present in the corresponding CSV file.
- Total listed stock across the book catalog: **25,056 copies**.
- Total quantity in order records: **2,697 copies**.
- Sum of `Total_Amount` in the orders file: **75,628.66** (currency unit is not specified in the source data).
- Mystery has the highest ordered quantity among genres in this dataset: **504 copies**.

These are calculations from the repository CSV files, not a claim that the script has been executed on every user's local MySQL instance. After importing the CSVs, run the verification queries below to confirm your local results. The `Total_Amount` field is used as supplied; this project does not assume it equals `Price × Quantity`.

## How to Run in MySQL Workbench
1. Connect to your MySQL server.
2. Open and execute `online_bookstore.sql` to create the database and tables.
3. Import `Books.csv` into `book` and `Customers.csv` into `customer`.
4. Import `Orders.csv` into `orders` after the book and customer records are loaded.
5. Confirm the import column mapping matches the table schema.
6. Run the analysis queries in `online_bookstore.sql`.

### Verification Queries
```sql
USE online_bookstore;

SELECT COUNT(*) AS book_count FROM book;
SELECT COUNT(*) AS customer_count FROM customer;
SELECT COUNT(*) AS order_count FROM orders;

SELECT SUM(Stock) AS total_stock
FROM book;

SELECT SUM(Quantity) AS total_units_ordered,
       SUM(Total_Amount) AS total_order_amount
FROM orders;

SELECT b.Genre, SUM(o.Quantity) AS units_ordered
FROM book AS b
JOIN orders AS o ON o.Book_ID = b.Book_ID
GROUP BY b.Genre
ORDER BY units_ordered DESC;
```

## Inventory Calculation
The inventory query uses a `LEFT JOIN` so books with no matching orders remain in the output:

`Stock Remaining = Original Stock - Total Ordered Quantity`

This calculation treats `Stock` as starting stock and assumes all order quantities should be deducted. If the result is negative, it indicates ordered quantities exceed the listed stock and may require investigation.

## Author
Asish Kumar Sharma
