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

-- IFNULL and COALESCE - returns 0 if the value is NULL:
select Item_Id , Item_Name, (IFNULL(stock,0) * Item_Price) as Amount from Item;
select Item_Id , Item_Name, (COALESCE(stock,0) * Item_Price) as Amount from Item; 
