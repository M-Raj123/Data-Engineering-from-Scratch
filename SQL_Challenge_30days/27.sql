-- Flipkart Data Analyst Interview Questions
-- Question: Write an SQL query to fetch user IDs that have only bought both 'Burger' and 'Cold Drink' items.

-- Expected Output Columns: user_id

-- Create the orders table
CREATE TABLE orders (
    user_id INT,
    item_ordered VARCHAR(512)
);

-- Insert sample data into the orders table
INSERT INTO orders VALUES 
('1', 'Pizza'),
('1', 'Burger'),
('2', 'Cold Drink'),
('2', 'Burger'),
('3', 'Burger'),
('3', 'Cold Drink'),
('4', 'Pizza'),
('4', 'Cold Drink'),
('5', 'Cold Drink'),
('6', 'Burger'),
('6', 'Cold Drink'),
('7', 'Pizza'),
('8', 'Burger');



SELECT 
  user_id 
FROM orders
GROUP BY user_id 
HAVING COUNT(DISTINCT item_ordered) = 2
AND SUM(CASE WHEN item_ordered IN ('Burger', 'Cold Drink') 
         THEN 1 ELSE 0 ) = 2
