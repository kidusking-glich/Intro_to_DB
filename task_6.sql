-- SQL script to insert multiple rows into the 'customer' table of the 'alx_book_store' database.

-- 1. Select the target database
USE alx_book_store;

-- 2. Insert the specified customer data using a single multi-row INSERT statement
INSERT INTO customer (customer_id, customer_name, email, address) VALUES
(2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness  Ave.'),
(3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness  Ave.'),
(4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness  Ave.');