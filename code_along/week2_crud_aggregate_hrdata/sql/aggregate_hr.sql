/*  ============
    Aggregation
    ============  */

-- Create table
CREATE TABLE IF NOT EXISTS staging.more_employees AS (
    SELECT * FROM read_csv_auto('data/more_employees.csv')
);

-- COUNT distinct departments
SELECT COUNT(DISTINCT department)
FROM staging.more_employees;

-- Analyze salary
SELECT
    department,
    ROUND(AVG(monthly_salary_sek)) AS avg_monthly_salary_sek,
    ROUND(MEDIAN(monthly_salary_sek)) AS median_monthly_salary_sek,
    ROUND(MIN(monthly_salary_sek)) AS min_monthly_salary_sek,
    ROUND(MAX(monthly_salary_sek)) AS max_monthly_salary_sek
FROM staging.more_employees
GROUP BY department;