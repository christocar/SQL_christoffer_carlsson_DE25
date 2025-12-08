-- CREATE A TABLE FROM CSV FILE

CREATE TABLE IF NOT EXISTS hemnet AS
SELECT *
FROM read_csv_auto('data/hemnet_data_clean.csv');

-- Task B Preview data
SELECT *
FROM hemnet
LIMIT 10;

-- Task C Number of rows
SELECT COUNT(*) AS n_rows
FROM hemnet;

-- Task D Describe table
DESCRIBE hemnet;

-- Task E Top 5 most expensive homes
SELECT *
FROM hemnet
ORDER BY final_price DESC
LIMIT 5;

-- Task F Top 5 cheapest homes
SELECT *
FROM hemnet
ORDER BY final_price ASC
LIMIT 5;

-- Task G Statistics for price
SELECT 
    MIN(final_price) AS min_price,
    MAX(final_price) AS max_price,
    AVG(final_price) AS avg_price,
    MEDIAN(final_price) AS median_price
FROM hemnet;

-- Task H Statistics for price per area
SELECT 
    MIN(price_per_area) AS min_price_per_area,
    MAX(price_per_area) AS max_price_per_area,
    AVG(price_per_area) AS avg_price_per_area,
    MEDIAN(price_per_area) AS median_price_per_area
FROM hemnet;

-- Task I Number of unique communes
SELECT COUNT(DISTINCT commune) AS n_unique_communes
FROM hemnet;

-- Task J Percentage over 10 million
SELECT 
    100.0 * COUNT(*) / (SELECT COUNT(*) FROM hemnet) AS pct_over_10M
FROM hemnet
WHERE final_price > 10000000;

-- Task K Example exploration
SELECT commune,
        COUNT(*) AS n_sales,
        AVG(final_price) AS avg_price
FROM hemnet
GROUP BY commune
ORDER BY avg_price DESC
LIMIT 10;
