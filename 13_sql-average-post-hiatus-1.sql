SELECT 
  user_id,
  ROUND(EXTRACT(EPOCH FROM(last_post - first_post))/86400, 0) AS days_between
FROM 
(
  SELECT 
    p1.user_id, 
    MIN(p1.post_date) AS first_post, 
    MAX(p2.post_date) AS last_post
  FROM posts AS p1
  INNER JOIN posts AS p2
  ON p1.user_id = p2.user_id
  WHERE EXTRACT(YEAR FROM(p2.post_date)) = 2021
  GROUP BY p1.user_id
) QUERY1
WHERE ROUND(EXTRACT( EPOCH FROM(last_post - first_post))/86400, 0) > 0;