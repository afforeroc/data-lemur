WITH QUERY1 AS 
(
  SELECT
    a.user_id,
    a.time_spent,
    a.activity_type,
    a_b.age_bucket
  FROM activities AS a
  INNER JOIN age_breakdown AS a_b
  ON a.user_id = a_b.user_id
  WHERE activity_type != 'chat'
),
QUERY2 AS
(
  SELECT 
    age_bucket,
    activity_type,
    SUM(time_spent) AS time_spent 
  FROM QUERY1
  GROUP BY age_bucket, activity_type
),
QUERY3 AS 
(
  SELECT
    age_bucket,
    SUM(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END) AS open_time,
    SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END) AS send_time
  FROM QUERY1
  GROUP BY age_bucket
)

SELECT
  age_bucket,
  ROUND(send_time * 100.0 / (send_time + open_time), 2) AS send_perc,
  ROUND(open_time * 100.0 / (send_time + open_time), 2) AS open_perc
FROM QUERY3;