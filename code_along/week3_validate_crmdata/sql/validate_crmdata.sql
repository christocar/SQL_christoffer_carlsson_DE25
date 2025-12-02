SELECT email FROM(
  SELECT email FROM staging.crm_old
  UNION
  SELECT email FROM staging.crm_new
) AS all_emails
WHERE email NOT LIKE '%@%.%'
;


SELECT region FROM(
  SELECT region FROM staging.crm_old
  UNION
  SELECT region FROM staging.crm_new
) AS all_regions
WHERE region NOT LIKE '%EU%'
  AND region NOT LIKE '%US%'
;


SELECT status FROM(
  SELECT status FROM staging.crm_old
  UNION
  SELECT status FROM staging.crm_new
) AS all_statuses
WHERE status NOT LIKE '%active%'
  AND status NOT LIKE '%inactive%'
;

