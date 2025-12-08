-------------------------------------------------------
-- CREATE TABLE FROM CSV
-------------------------------------------------------

CREATE TABLE IF NOT EXISTS bike_joined AS
SELECT *
FROM read_csv_auto('data/bike_joined_table.csv');

-------------------------------------------------------
-- Preview
-------------------------------------------------------
SELECT * FROM bike_joined LIMIT 10;
DESCRIBE bike_joined;

-------------------------------------------------------
-- Task B: Number of unique orders
-------------------------------------------------------
SELECT COUNT(DISTINCT order_id) AS n_unique_orders
FROM bike_joined;

-------------------------------------------------------
-- Task C: Number of unique products
-------------------------------------------------------
SELECT COUNT(DISTINCT product_id) AS n_unique_products
FROM bike_joined;

-------------------------------------------------------
-- Task D:
-- Customers + total sales for 
-- 'Surly Straggler - 2016'
--
-- sales = quantity * list_price * (1 - discount)
-------------------------------------------------------
SELECT
    customer_id,
    SUM(quantity * list_price * (1 - discount)) AS total_sales
FROM bike_joined
WHERE product_name = 'Surly Straggler - 2016'
GROUP BY customer_id;

-------------------------------------------------------
-- Task E:
-- Customers from cities:
-- San Angelo, Orchard Park, Merrick
-------------------------------------------------------
SELECT
    COUNT(DISTINCT customer_id) AS n_customers,
    SUM(quantity * list_price * (1 - discount)) AS total_sales
FROM bike_joined
WHERE customer_city IN ('San Angelo', 'Orchard Park', 'Merrick');

-------------------------------------------------------
-- Task F: Add manager_name column
-------------------------------------------------------
ALTER TABLE bike_joined
ADD COLUMN manager_name TEXT;

UPDATE bike_joined
SET manager_name = 
    CASE manager_id
        WHEN 1 THEN 'Amy Andersson'
        WHEN 2 THEN 'Bill Berg'
        WHEN 5 THEN 'Cathy Larsson'
        WHEN 7 THEN 'Davis Lam'
        ELSE 'Unknown'
    END;

-------------------------------------------------------
-- Check managers
-------------------------------------------------------
SELECT manager_id, manager_name
FROM bike_joined
GROUP BY manager_id, manager_name
ORDER BY manager_id;
