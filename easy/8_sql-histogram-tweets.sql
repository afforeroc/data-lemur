SELECT num_tweets AS tweet_bucket, COUNT(user_id) AS users_num
FROM ( 
  SELECT user_id, COUNT(tweet_id) AS num_tweets
  FROM tweets 
  WHERE tweet_date 
  BETWEEN '2022-01-01' AND '2022-12-31'
  GROUP BY user_id) Query1 GROUP BY num_tweets;