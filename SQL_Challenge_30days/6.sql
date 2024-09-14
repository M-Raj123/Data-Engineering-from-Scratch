/*

1. https://datalemur.com/questions/laptop-mobile-viewership

*/

SELECT 
  SUM(laptop_reviews) as laptop_reviews,
  SUM(mobile_reviews) as mobile_reviews
FROM (
SELECT 
  CASE WHEN device_type = 'laptop' THEN 1 END AS laptop_reviews,
  CASE WHEN device_type = 'mobile' THEN 1 
       WHEN device_type = 'phone' THEN 1 
       ELSE 0
  END AS mobile_reviews
FROM viewership 
) x1
