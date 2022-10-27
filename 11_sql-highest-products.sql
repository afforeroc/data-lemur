SELECT user_id, product_num FROM 
(
  SELECT user_id, SUM(spend) as spent, COUNT(product_id) as product_num
  FROM user_transactions
  GROUP BY user_id
  ORDER BY product_num DESC, SUM(spend) DESC
) QUERY1 
WHERE spent >= 1000
LIMIT 3;