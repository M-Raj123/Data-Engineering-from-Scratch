
/*

-- Q.1
Question: Identify the top 3 posts with the highest engagement 
(likes + comments) for each user on a Facebook page. Display 
the user ID, post ID, engagement count, and rank for each post.

-- Q.2

Determine the users who have posted more than 2 times 
in the past week and calculate the total number of likes
they have received. Return user_id and number of post and no of likes

*/



--Q1
WITH cte as (
SELECT 
  post_id,
  user_id,
  SUM( comments + likes ) as engagement_count,
  ROW_NUMBER() OVER ( PARTITION BY user_id ORDER BY SUM( comments + likes) DESC) as rn,
  DENSE_RANK() OVER ( PARTITION BY user_id ORDER BY SUM( comments + likes) DESC) as ranks
FROM fb_posts
GROUP BY user_id, post_id
ORDER BY user_id, engagement_count DESC
)
SELECT 
	user_id,
	post_id,
	engagement_count,
	ranks
FROM rank_posts
WHERE rn <=3




--Q2
SELECT 
  user_id,
  count(user_id) total_post,
  SUM(likes) as no_of_likes
FROM posts
WHERE post_date >= CURRENT_DATE - 7 AND post_data < CURRENT_DATE
GROUP BY user_id
HAVING count(user_id) > 2 ;

