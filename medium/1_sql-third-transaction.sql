SELECT 
  user_id,
  spend,
  transaction_date
FROM
(
  SELECT
  *,
  RANK() OVER(PARTITION BY user_id ORDER BY transaction_date) AS rank1
  FROM transactions
  ORDER BY user_id, rank1
) query1
WHERE rank1 = 3;