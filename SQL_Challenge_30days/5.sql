/*

1. https://datalemur.com/questions/sql-third-transaction
2. Question:
Find the top 5 products whose revenue has decreased in comparison to the 
previous year (both 2022 and 2023). Return the product name, 
revenue for the previous year, revenue for the current year, 
revenue decreased, and the decreased ratio (percentage).

*/

-- 1.
WITH cte AS(
  SELECT
    user_id,
    spend,
    transaction_date,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS rn
  FROM transactions
)
SELECT 
  user_id,
  spend,
  transaction_date
FROM cte 
WHERE rn = 3;

-- or 

SELECT 
  user_id,
  spend,
  transaction_date
FROM (
  SELECT
    user_id,
    spend,
    transaction_date,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS rn
  FROM transactions
) 
WHERE rn = 3;


-- 2.
WITH CTE1 AS ( -- previous year revenue
  SELECT 
    product_name,
    SUM(sales) as revenue
  FROM sales
  WHERE EXTRACT(YEAR FROM date) = '2022'
  GROUP BY 1
),
WITH CTE2 AS ( -- current year revenue
  SELECT 
    product_name,
    SUM(sales) as revenue
  FROM sales
  WHERE EXTRACT(YEAR FROM date) = '2022'
  GROUP BY 1
)
SELECT 
  CTE1.product_name,
  CTE1.revenue AS previous_yr_revenue,
  CTE2.revenue AS current_yr_revenue,
  ( CTE1.revenue - CTE1.revenue ) AS revenue_decreased,
  (( CTE1.revenue - CTE1.revenue ) / CTE1.revenue) * 100 AS revenue_decreased_ratio
FROM CTE1 
JOIN CTE2
ON CTE1.product_name = CTE2.product_name
WHERE CTE2.revenue < CTE1.revenue
LIMIT 5;
