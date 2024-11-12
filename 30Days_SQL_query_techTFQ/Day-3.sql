DROP TABLE IF EXISTS FOOTER;
CREATE TABLE FOOTER 
(
	id 		INT PRIMARY KEY,
	car 		VARCHAR(20), 
	length 		INT, 
	width 		INT, 
	height 		INT
);

INSERT INTO FOOTER VALUES (1, 'Hyundai Tucson', 15, 6, NULL);
INSERT INTO FOOTER VALUES (2, NULL, NULL, NULL, 20);
INSERT INTO FOOTER VALUES (3, NULL, 12, 8, 15);
INSERT INTO FOOTER VALUES (4, 'Toyota Rav4', NULL, 15, NULL);
INSERT INTO FOOTER VALUES (5, 'Kia Sportage', NULL, NULL, 18); 

SELECT * FROM FOOTER;


-- SOLUTION 1 
SELECT 
	* 
FROM 
	(SELECT car FROM footer WHERE car is not null ORDER BY id desc LIMIT 1)
cross join
	(SELECT length FROM footer WHERE length is not null ORDER BY id desc LIMIT 1) 
cross join
	(SELECT width FROM footer WHERE width is not null ORDER BY id desc LIMIT 1 ) 
cross join
	(SELECT height FROM footer WHERE height is not null ORDER BY id desc LIMIT 1);
