DROP TABLE IF EXISTS brands;
create table brands
(
	brand1 varchar(20),
	brand2 varchar(20),
	year int,
	customer1 int,
	customer2 int,
	customer3 int,
	customer4 int
);

select * from brands;


insert into brands values('apple','samsung',2020,1,2,1,2);
INSERT INTO brands VALUES ('samsung', 'apple', 2020, 1, 2, 1, 2);
INSERT INTO brands VALUES ('apple', 'samsung', 2021, 1, 2, 5, 3);
INSERT INTO brands VALUES ('samsung', 'apple', 2021, 5, 3, 1, 2);
INSERT INTO brands VALUES ('google', NULL, 2020, 5, 9, NULL, NULL);
INSERT INTO brands VALUES ('oneplus', 'nothing', 2020, 5, 9, 6, 3);



WITH cte as
(
	SELECT *,
		CASE WHEN brand1 < brand2 THEN concat(brand1,brand2,year)
		 	ELSE concat(brand2,brand1,year)  
		END as pair_id	
	FROM brands
),
cte_rn as 
(
	SELECT * ,
	ROW_NUMBER() OVER (PARTITION BY pair_id ORDER BY pair_id ) as rn  
	FROM cte
)
SELECT brand1, brand2, year , rn 
FROM cte_rn
WHERE 
	rn = 1 
OR 
	( customer1 <> customer3 AND customer2 <> customer4 );
