-- TASK 1
CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE
    IF NOT EXISTS staging.order_items AS (
        SELECT
            *
        FROM
            read_csv_auto ('sql/week4_join_bikedata/data/order_items.csv')
    );

CREATE TABLE
    IF NOT EXISTS staging.products AS (
        SELECT
            *
        FROM
            read_csv_auto ('sql/week4_join_bikedata/data/products.csv')
    );