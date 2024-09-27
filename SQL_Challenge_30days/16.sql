-- TikTok Interview Question for data analyst

/*
-- Tik Tok Data Analyst Interview question

Q.1 Find the median within a series of numbers in SQL ;

1 8 3 4 5 odd 

1 3 4 5 8 9 even 

*/


-- Create TikTok table
CREATE TABLE tiktok (
					views INT
);


INSERT INTO tiktok (views) 
VALUES 
	(100), (800), (350), 
	(150), (600), 
	(700), (700), (950);



with CTE as (
  SELECT 
    views,
    ROW_NUMBER() OVER( ORDER BY views ASC) as rn_asc,
    ROW_NUMBER() OVER( ORDER BY views DESC) as rn_dsc
  FROM tiktok
)
SELECT 
  AVG(views) as median
FROM CTE 
where ABS(rn_asc - rn_dsc) <= 1;
  
