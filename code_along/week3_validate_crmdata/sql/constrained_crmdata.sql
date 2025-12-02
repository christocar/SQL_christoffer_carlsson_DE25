CREATE SCHEMA IF NOT EXISTS constrained;

CREATE TABLE IF NOT EXISTS constrained.crm_new (
  customer_id INT,
  email VARCHAR(255) CHECK (email LIKE '%@%.%'),
  region VARCHAR(10) CHECK (region IN ( 'EU', 'US')),
  status VARCHAR(10) CHECK (status IN ( 'active', 'inactive'))
);

CREATE TABLE IF NOT EXISTS constrained.crm_old (
  customer_id INT,
  email VARCHAR(255) CHECK (email LIKE '%@%.%'),
  region VARCHAR(10) CHECK (region IN ( 'EU', 'US')),
  status VARCHAR(10) CHECK (status IN ( 'active', 'inactive'))
);

INSERT INTO constrained.crm_new
SELECT customer_id, email, region, status
FROM staging.crm_new
WHERE 
    email LIKE '%@%.%' AND
    region IN ('EU', 'US') AND
    status IN ('active', 'inactive');


INSERT INTO constrained.crm_old
SELECT customer_id, email, region, status
FROM staging.crm_old
WHERE 
    email LIKE '%@%.%' AND
    region IN ('EU', 'US') AND
    status IN ('active', 'inactive');