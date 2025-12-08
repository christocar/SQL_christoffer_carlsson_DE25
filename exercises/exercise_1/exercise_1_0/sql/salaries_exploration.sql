-- Task A
SELECT COUNT(*) AS data_engineer_jobs
FROM cleaned_salaries
WHERE job_title = 'Data Engineer';

-- Task B Number of unique job titles
SELECT COUNT(DISTINCT job_title) AS unique_job_titles
FROM cleaned_salaries;

-- Task C Jobs per salary level
SELECT salary_level, COUNT(*) AS n_jobs
FROM cleaned_salaries
GROUP BY salary_level
ORDER BY n_jobs DESC;

-- Task D Median and mean salary by seniority level
SELECT experience_level,
       MEDIAN(salary_monthly_sek) AS median_salary,
       AVG(salary_monthly_sek) AS mean_salary
FROM cleaned_salaries
GROUP BY experience_level
ORDER BY median_salary DESC;

-- Task E Top earning job titles by median salary
SELECT job_title,
       MEDIAN(salary_monthly_sek) AS median_salary
FROM cleaned_salaries
GROUP BY job_title
ORDER BY median_salary DESC
LIMIT 10;

-- Task F Percentage of remot, hybrid, and onsite jobs
SELECT
    100.0 * COUNT(*) FILTER (WHERE remote_ratio = 100) / COUNT(*) AS fully_remote,
    100.0 * COUNT(*) FILTER (WHERE remote_ratio = 50) / COUNT(*) AS hybrid,
    100.0 * COUNT(*) FILTER (WHERE remote_ratio = 0) / COUNT(*) AS onsite
FROM cleaned_salaries;

-- Task G Salary by company size for a selected job title
-- Example job title: Data Engineer
SELECT company_size,
       MEDIAN(salary_monthly_sek) AS median_salary
FROM cleaned_salaries
WHERE job_title = 'Data Engineer'
GROUP BY company_size
ORDER BY median_salary DESC;

-- Task H Free exploration
-- Compare salary levels between remote-friendly and non-remote-friendly jobs
SELECT remote_friendly,
       MEDIAN(salary_monthly_sek) AS median_salary,
       AVG(salary_monthly_sek) AS mean_salary
FROM cleaned_salaries
GROUP BY remote_friendly;
