/* Solved two questions from datalemur.com
1. https://datalemur.com/questions/sql-page-with-no-likes
2. https://datalemur.com/questions/click-through-rate
*/

-- 1.https://datalemur.com/questions/sql-page-with-no-likes

SELECT 
  p.page_id 
FROM pages AS p   
LEFT JOIN page_likes AS pl 
ON p.page_id = pl.page_id
GROUP BY p.page_id
HAVING count(pl.user_id) = 0
ORDER BY p.page_id ASC;

-- (or)

SELECT page_id 
FROM pages 
WHERE page_id 
NOT In (SELECT page_id FROM page_likes)
ORDER BY 1;

-- 2.https://datalemur.com/questions/click-through-rate

WITH CTE as
(
  SELECT 
    app_id,
    SUM(CASE WHEN event_type='click' THEN 1 ELSE 0 END) as clk,
    SUM(CASE WHEN event_type='impression' THEN 1 ELSE 0 END) as imp
  FROM events
  WHERE EXTRACT( YEAR FROM timestamp) = '2022'
  GROUP BY app_id
)
SELECT 
  app_id ,
  ROUND(100.0 * clk / imp , 2 )
FROM CTE;
