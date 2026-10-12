-- Online Bookstore Database Project
-- DBMS: MySQL
-- Note: This script defines the schema and analysis queries.
-- Import your books, customers, and orders data before running the analysis queries.

CREATE DATABASE IF NOT EXISTS online_bookstore;
USE online_bookstore;

CREATE TABLE IF NOT EXISTS book (
    Book_ID BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price DECIMAL(10,2),
    Stock INT,
    PRIMARY KEY (Book_ID)
);

CREATE TABLE IF NOT EXISTS customer (
    Customer_ID BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(100),
    PRIMARY KEY (Customer_ID)
);

CREATE TABLE IF NOT EXISTS orders (
    Order_ID BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    Customer_ID BIGINT UNSIGNED,
    Book_ID BIGINT UNSIGNED,
    Order_Date DATE,
    Quantity INT,
    Total_Amount DECIMAL(10,2),
    PRIMARY KEY (Order_ID),
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (Customer_ID) REFERENCES customer(Customer_ID),
    CONSTRAINT fk_orders_book
        FOREIGN KEY (Book_ID) REFERENCES book(Book_ID)
);

-- Quick table checks
SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM orders;

-- 1. Retrieve all books in the Fiction genre
SELECT * FROM book WHERE Genre = 'Fiction';

-- 2. Find books published after 1950
SELECT * FROM book WHERE Published_Year > 1950;

-- 3. List customers from Canada
SELECT * FROM customer WHERE Country = 'Canada';

-- 4. Show orders placed in November 2023
SELECT *
FROM orders
WHERE Order_Date >= '2023-11-01'
  AND Order_Date < '2023-12-01'
ORDER BY Order_Date;

-- 5. Retrieve the total stock of books available
SELECT SUM(Stock) AS Total_Stock FROM book;

-- 6. Find the most expensive book (returns ties if prices match)
SELECT *
FROM book
WHERE Price = (SELECT MAX(Price) FROM book);

-- 7. Show customers who ordered more than one copy of a book
SELECT c.Name, c.Customer_ID, o.Quantity
FROM customer AS c
JOIN orders AS o ON c.Customer_ID = o.Customer_ID
WHERE o.Quantity > 1;

-- 8. Retrieve orders where the total amount exceeds $20
SELECT * FROM orders WHERE Total_Amount > 20;

-- 9. Count books in each genre
SELECT Genre, COUNT(*) AS Book_Count
FROM book
GROUP BY Genre;

-- 10. List all distinct genres
SELECT DISTINCT Genre FROM book;

-- 11. Find the book or books with the lowest stock
SELECT *
FROM book
WHERE Stock = (SELECT MIN(Stock) FROM book);

-- 12. Calculate total revenue from all orders
SELECT SUM(Total_Amount) AS Total_Revenue FROM orders;

-- Advanced queries

-- 1. Total quantity of books sold for each genre
SELECT b.Genre, SUM(o.Quantity) AS Books_Sold
FROM book AS b
JOIN orders AS o ON b.Book_ID = o.Book_ID
GROUP BY b.Genre
ORDER BY Books_Sold DESC;

-- 2. Average price of books in the Fantasy genre
SELECT AVG(Price) AS Average_Fantasy_Price
FROM book
WHERE Genre = 'Fantasy';

-- 3. Customers who have placed at least two orders
SELECT c.Customer_ID, c.Name, COUNT(o.Order_ID) AS Total_Orders
FROM customer AS c
JOIN orders AS o ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID, c.Name
HAVING COUNT(o.Order_ID) >= 2;

-- 4. Most frequently ordered book by number of orders
SELECT b.Title, b.Book_ID, COUNT(o.Order_ID) AS Order_Count
FROM book AS b
JOIN orders AS o ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID, b.Title
ORDER BY Order_Count DESC
LIMIT 1;

-- 5. Top ten most expensive books in the Fantasy genre
SELECT Title, Genre, Price
FROM book
WHERE Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 10;

-- 6. Total quantity of books sold by each author
SELECT b.Author, SUM(o.Quantity) AS Books_Sold
FROM book AS b
JOIN orders AS o ON b.Book_ID = o.Book_ID
GROUP BY b.Author
ORDER BY Books_Sold DESC;

-- 7. Cities where customers' total order spend exceeds $30
SELECT c.City, c.Customer_ID, c.Name,
       SUM(o.Total_Amount) AS Total_Spent
FROM customer AS c
JOIN orders AS o ON c.Customer_ID = o.Customer_ID
GROUP BY c.City, c.Customer_ID, c.Name
HAVING SUM(o.Total_Amount) > 30
ORDER BY Total_Spent DESC;

-- 8. Customer who spent the most on orders
SELECT c.Customer_ID, c.Name, SUM(o.Total_Amount) AS Total_Spent
FROM customer AS c
JOIN orders AS o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Name
ORDER BY Total_Spent DESC
LIMIT 1;

-- 9. Calculate stock remaining after fulfilling all orders
SELECT
    b.Book_ID,
    b.Title,
    b.Stock AS Original_Stock,
    COALESCE(SUM(o.Quantity), 0) AS Total_Ordered,
    b.Stock - COALESCE(SUM(o.Quantity), 0) AS Stock_Remaining
FROM book AS b
LEFT JOIN orders AS o ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID, b.Title, b.Stock
ORDER BY b.Book_ID;
