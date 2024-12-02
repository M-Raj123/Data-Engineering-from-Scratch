
-- https://leetcode.com/problems/delete-duplicate-emails/

Create table If Not Exists Person (Id int, Email varchar(255))
Truncate table Person
insert into Person (id, email) values ('1', 'john@example.com')
insert into Person (id, email) values ('2', 'bob@example.com')
insert into Person (id, email) values ('3', 'john@example.com')


-- Approach - 1
WITH CTE AS (
    SELECT 
    id, email,
    ROW_NUMBER() OVER (PARTITION BY email ORDER BY id asc ) as rn 
    FROM Person
)
DELETE FROM Person where id in (SELECT id FROM CTE WHERE rn > 1);

-- Approach - 2
DELETE 
FROM 
    Person
WHERE id NOT IN 
  ( SELECT id
    FROM (SELECT min(id) as id
    FROM Person
    GROUP BY email) subtable );
