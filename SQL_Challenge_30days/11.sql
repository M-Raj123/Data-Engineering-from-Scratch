-- ---------------------------------------------
-- Amazon Interview Question for enty Business Analyst!
-- ---------------------------------------------
/*




Question:: Given the reviews table, write a query to retrieve 
the average star rating for each product, grouped by month. 
The output should display the month as a numerical value, 
product ID, and average star rating rounded to two decimal places. 
Sort the output first by month and then by product ID.
*/


-- SQL 11/30 Days 

CREATE TABLE reviews (
    review_id INTEGER,
    user_id INTEGER,
    submit_date TIMESTAMP,
    product_id INTEGER,
    stars INTEGER
);

INSERT INTO reviews (review_id, user_id, submit_date, product_id, stars) VALUES
(6171, 123, '2022-06-08 00:00:00', 50001, 4),
(7802, 265, '2022-06-10 00:00:00', 69852, 4),
(5293, 362, '2022-06-18 00:00:00', 50001, 3),
(6352, 192, '2022-07-26 00:00:00', 69852, 3),
(2089, 512, '2022-09-10 00:00:00', 69852, 2),
(3078, 369, '2022-09-18 00:00:00', 50001, 5),
(4056, 785, '2022-09-25 00:00:00', 69852, 4),
(5034, 641, '2022-10-12 00:00:00', 50001, 3),
(6023, 829, '2022-10-18 00:00:00', 69852, 5),
(7012, 957, '2022-10-25 00:00:00', 50001, 2),
(8001, 413, '2022-11-05 00:00:00', 69852, 4),
(8990, 268, '2022-11-15 00:00:00', 50001, 3),
(9967, 518, '2022-11-22 00:00:00', 69852, 3),
(1086, 753, '2022-12-10 00:00:00', 50001, 5),
(1175, 642, '2022-12-18 00:00:00', 69852, 4),
(1264, 874, '2022-12-25 00:00:00', 50001, 3),
(1353, 512, '2022-12-31 00:00:00', 69852, 2),
(1442, 369, '2023-01-05 00:00:00', 50001, 4),

SELECT * FROM reviews;

SELECT 
  EXTRACT(MONTH FROM submit_date) -- (9) return a numeric value
  product_id,
  ROUND( AVG (stars), 2) as avg_rating
FROM reviews
GROUP BY 1,2
ORDER BY 1,2;

-- TO_CHAR(submit_date , 'MM') as month -> ('09') return  a string value 
