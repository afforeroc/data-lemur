SELECT
  advertiser_id,
  ROUND(CAST(total_revenue / total_spend AS numeric), 2)
FROM 
(
  SELECT
    advertiser_id,
    SUM(spend) AS total_spend,
    SUM(revenue) AS total_revenue
  FROM ad_campaigns
  GROUP BY advertiser_id
  ORDER BY advertiser_id
) QUERY1