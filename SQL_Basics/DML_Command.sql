-- DML Command

-- insert data into table (Two ways to insert)
insert into Item ( Item_Id, Item_Name, Item_Price ) values (1,"Hammam",41);
insert into Item(Item_Id, Item_Name) values (3,"Curd");
insert into Item values (4,"Mixture",20);

-- update column into table
update Item set Item_Price=10 where Item_Id=3;

-- delete row from the table
delete from Item where Item_Id=3;

-- Explain ( provides information about how MySQL executes statements )
SELECT @@explain_format;    -- ( Default = Traditional )
SET @@explain_format=<Any>; -- ( JSON, DEFAULT, TREE )

explain select * from Item where Item_Id=2 ;
Explain format=tree select * from Item where Item_Price=20 ;

-- FIELDS ( id, select_type, table, partitions, type, possible_keys, key, key_len, ref, rows, filtered, Extra )
