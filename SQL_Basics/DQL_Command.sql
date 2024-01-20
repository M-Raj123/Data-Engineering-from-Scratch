-- to retrieve all the data in the table 
Select * from orders;

-- LIMIT - used to specify the number of records to return 
Select * from Orders limit 5;

-- OFFSET - number of rows to skip from the beginning of the returned data before presenting the results
Select * from Orders limit 5 offset 3;

-- where ( used to extract only those records that fulfill a specified condition )
select * from Item where Item_Id = 2 ;

-- if stock is null the result can be also return null value
select Item_Id , Item_Name, (stock*Item_Price) as Amount from Item;

-- IFNULL and COALESCE - returns 0 if the value is NULL
select Item_Id , Item_Name, (IFNULL(stock,0) * Item_Price) as Amount from Item;
select Item_Id , Item_Name, (COALESCE(stock,0) * Item_Price) as Amount from Item; 

-- Case Statement 
select Item_Id , Item_Name, Item_Price , Stock, 
case
	when Stock is Null then "NO"
	else "YES"
    end as "IsStockPresent" 
from Item;

-- Order by used to sort the results in ascending or descending 
Select * from Item order by Item_Name asc | desc;

-- MiN() and MAX()
SELECT MIN(Item_Price) AS MaxItem FROM Item;
SELECT MAX(Item_Price) AS MinItem FROM Item;

-- AND , OR , NOT OPERATORS
select * from Item where not stock=10;
select * from Item where Item_Price=10 and stock=10;
select * from Item where Item_Price=10 or stock=10;

-- NULL values
select * from Item where stock IS NULL;
select * from Item where stock IS NOT NULL;

-- LIKE 
select * from Item where Item_Name like "____";
select * from Item where Item_Name like "_o%";
select * from Item where Item_Name like "H%";
