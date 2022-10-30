SELECT COUNT(*) AS co_w_duplicate_jobs FROM (
  SELECT company_id, title, COUNT(*)
  FROM job_listings
  GROUP BY company_id, title
  HAVING COUNT(*) > 1) Q1;