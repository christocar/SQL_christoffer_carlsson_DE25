/*  ============
    DDL - Create
    ============  */

-- TASK 1

-- Create schema
CREATE SCHEMA IF NOT EXISTS staging;

-- create sequence to generate value for primary key employee_id
CREATE SEQUENCE IF NOT EXISTS id_sequence START 1;

-- create employees table
CREATE TABLE IF NOT EXISTS staging.employees (
    employee_id INTEGER DEFAULT NEXTVAL('id_sequence') PRIMARY KEY,
    department VARCHAR,
    employement_year INTEGER
);


/*  ============
    DML - CREATE
    ============  */
-- TASK 2
-- Insert three rows manually into staging.employees table
INSERT INTO
    staging.employees (department, employement_year)
VALUES
    ('Sales', 2001),
    ('Logistics', 2002),
    ('IT', 2002);

-- insert with read_csv() function
-- ref: 
INSERT INTO staging.employees (department, employement_year)
    SELECT * FROM read_csv('data/employees.csv');

/*  ============
    DML - READ
    ============  */
SELECT * FROM staging.employees;
-- LIMIT 10;
-- OFFSET 10;

/*  ============
    DML - UPDATE
    ============  */
-- Modify existing data
UPDATE staging.employees
SET employment_year = 2023;
WHERE employee_id IN (98, 99)

/*  ============
    DDL - Create
    ============  */
ALTER TABLE staging.employees
ADD COLUMN pension_plan VARCHAR DEFAULT 'plan 1';

/*  ============
    CRUD - Update
    ============  */
UPDATE staging.employees
SET pension_plan = 'plan 2'
WHERE employment_year > 2015;