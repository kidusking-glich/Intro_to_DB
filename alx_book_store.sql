--
-- File: alx_book_store.sql
-- Description: SQL script to create the database schema for the ALX Bookstore.
--

-- 1. CREATE DATABASE
-- Check if the database exists and drop it (optional, for clean setup)
-- DROP DATABASE IF EXISTS ALX_BOOK_STORE;
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- 2. CREATE AUTHORS TABLE
-- Stores information about authors.
CREATE TABLE AUTHORS (
    author_id INT PRIMARY KEY,
    author_name  VARCHAR(215) NOT NULL
);

-- 3. CREATE BOOKS TABLE
-- Stores information about books, with a Foreign Key to the AUTHORS table.
CREATE TABLE BOOKS (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    
    FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
);

-- 4. CREATE CUSTOMERS TABLE
-- Stores information about customers.
CREATE TABLE CUSTOMERS (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
);

-- 5. CREATE ORDERS TABLE
-- Stores information about customer orders, with a Foreign Key to the CUSTOMERS table.
CREATE TABLE ORDERS (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);

-- 6. CREATE ORDER_DETAILS TABLE
-- Stores the line items for each order, with Foreign Keys to both ORDERS and BOOKS.
CREATE TABLE ORDER_DETAILS (
    orderdetailid INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
);
