-- CREATE CLEANED SALARIES TABLE
CREATE TABLE IF NOT EXISTS cleaned_salaries AS
SELECT

-- Task F need experience_level
    experience_level,

-- Task A Transform employment_type codes to full descriptions
    CASE employment_type
        WHEN 'CT' THEN 'Contract'
        WHEN 'FT' THEN 'Full Time'
        WHEN 'PT' THEN 'Part Time'
        WHEN 'FL' THEN 'Freelance'
        ELSE employment_type
    END AS employment_type,

    job_title,


-- Task b Transform company size
-- S = Small, M = Medium, L = Large
    CASE company_size
        WHEN 'S' THEN 'Small'
        WHEN 'M' THEN 'Medium'
        WHEN 'L' THEN 'Large'
        ELSE company_size
    END AS company_size,

    -- Task C Annual salary in SEK (assuming 1 USD = 11 SEK)
    salary_in_usd * 11 AS salary_annual_sek,

    -- Task D Monthly salary in SEK
    (salary_in_usd * 11) / 12 AS salary_monthly_sek,

    -- Task E Salary level categories based on monthly salary
    CASE
        WHEN (salary_in_usd * 11) / 12 < 30000 THEN 'Low'
        WHEN (salary_in_usd * 11) / 12 < 60000 THEN 'Medium'
        WHEN (salary_in_usd * 11) / 12 < 100000 THEN 'High'
        ELSE 'insanely_high'
    END AS salary_level,

    remote_ratio,

    -- Task G Extra transformation
    -- Is job remote-friendly
    (remote_ratio >= 50) AS remote_friendly

    FROM salaries;