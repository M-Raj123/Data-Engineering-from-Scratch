/*

1.  https://datalemur.com/questions/sql-histogram-tweets

*/

SELECT 
  per_usr as tweet_bucket,
  COUNT(per_usr) as users_num
FROM (
SELECT 
  user_id,
  COUNT(user_id) as per_usr
FROM tweets
WHERE EXTRACT( YEAR FROM tweet_date) = '2022'
GROUP BY user_id
) as x1 
GROUP BY per_usr;
