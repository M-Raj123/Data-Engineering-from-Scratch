-- Question 
-- https://datalemur.com/questions/laptop-mobile-viewership

WITH CTE AS(
SELECT
  CASE
      WHEN device_type = 'laptop' THEN 1
  END as laptop_reviews,
  CASE
      WHEN device_type = 'phone'  THEN 1
      WHEN device_type = 'tablet'  THEN 1
  END as mobile_views
FROM viewership )
SELECT count(laptop_reviews) as laptop_reviews, count(mobile_views) as mobile_views
FROM CTE;
