-- create schema staging
CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.employees (
    employee_id INTEGER PRIMARY KEY,
    department VARCHAR,
    employment_year INTEGER
)

SELECT * FROM staging.employees;
