-- SQL script to print the full description of the 'books' table 
-- from the 'alx_book_store' database using the INFORMATION_SCHEMA.

-- 1. Select the target database (optional, but good practice)
USE alx_book_store;

-- 2. Print the description of the 'books' table by querying the metadata schema
SELECT 
    COLUMN_NAME, 
    COLUMN_TYPE, 
    IS_NULLABLE, 
    COLUMN_KEY 
FROM 
    INFORMATION_SCHEMA.COLUMNS 
WHERE 
    TABLE_SCHEMA = 'alx_book_store' 
    AND TABLE_NAME = 'Books';