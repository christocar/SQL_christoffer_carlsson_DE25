-- Clean and use data from AI Squaddata
-- Task 1 - create schema and table
CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.squad AS (
    SELECT * FROM read_csv_auto('data/validation.csv')
);

-- Task 2 - find rows that do not have column title name in the context column value
SELECT *
FROM staging.squad
WHERE context NOT LIKE concat('%', title, '%');

-- Task 3 - find rows that start with the title in the context column value
SELECT *
FROM staging.squad
WHERE context LIKE CONCAT(title, '%')

-- Task 4 -- add a column with the first answer from AI in the answers column.
ALTER TABLE staging.squad
ADD COLUMN first_answer VARCHAR;
UPDATE staging.squad
SET first_answer = SUBSTRING_INDEX(answers, ';', 1);