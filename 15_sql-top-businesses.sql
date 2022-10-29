SELECT 
  business_count, 
  ROUND(business_count * 100 / total_business_count) AS top_rated_pct  
FROM
(
  SELECT COUNT(business_id) AS business_count FROM reviews
  WHERE review_stars >= 4
) QUERY1
CROSS JOIN
(
  SELECT COUNT(business_id) AS total_business_count FROM reviews
) QUERY2;