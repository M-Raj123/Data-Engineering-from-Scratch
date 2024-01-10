-- DML Command

-- insert data into table (Two ways to insert)
insert into Item ( Item_Id, Item_Name, Item_Price ) values (1,"Hammam",41);
insert into Item(Item_Id, Item_Name) values (3,"Curd");
insert into Item values (4,"Mixture",20);

-- update column into table
update Item set Item_Price=10 where Item_Id=3;

-- delete row from the table
delete from Item where Item_Id=3;
