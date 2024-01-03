-- create table if it not exist
create table Item(
	  Item_Id int ,
    Item_Name varchar(30),
    Item_Price int
);

-- show the newly created tables
show tables;

-- see the table structure
describe Item;
	
-- delete an existing table 
drop table Item;

-- delete the data inside a table
Truncate table Item; 

-- Alter the Table 
-- Add new column 
Alter table Item 
Add Item_Rating int ;

-- Drop Existing column 
Alter table Item
Drop column Item_Rating;

-- Modify Existing Column (To change the data type of a column in a table)
 Alter table Item 
 Modify column Item_Rating char;
