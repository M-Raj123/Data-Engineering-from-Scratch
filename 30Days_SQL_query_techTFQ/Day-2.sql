
create table mountain_huts(
	id integer not null,
	name varchar(30) not null,
	altitude integer not null,
	unique(name),
	unique(id)
);

create table trails (
 hut1 integer not null,
 hut2 integer not null
 );

insert into mountain_huts values (1, 'Dakonat', 1900);
insert into mountain_huts values (2, 'Natisa', 2100);
insert into mountain_huts values (3, 'Gajantut', 1600);
insert into mountain_huts values (4, 'Rifat', 782);
insert into mountain_huts values (5, 'Tupur', 1370);
insert into trails values (1, 3);
insert into trails values (3, 2);
insert into trails values (3, 5);
insert into trails values (4, 5);
insert into trails values (1, 5);

SELECT * FROM mountain_huts;
SELECT * FROM trails;

WITH cte_trails1 as 
	(SELECT t1.hut1 as start_hut, h1.name as start_hut_name, h1.altitude as start_hut_altitude, t1.hut2 as end_hut
	FROM mountain_huts h1
	JOIN trails t1
	ON h1.id = t1.hut1),
cte_trails2 as  
	(SELECT t2.*, h2.name as  end_hut_name , h2.altitude as end_hut_altitude,
	CASE WHEN start_hut_altitude > h2.altitude THEN 1 ELSE 0 END as FLAG
  -- set flag for  strictly decrease
	FROM cte_trails1 t2
	JOIN mountain_huts h2
	ON t2.end_hut = h2.id),
cte_final as 
	(SELECT CASE WHEN FLAG = 1 THEN start_hut ELSE end_hut END as start_hut,
	CASE WHEN FLAG = 1 THEN start_hut_name ELSE end_hut_name END as start_hut_name,
	CASE WHEN FLAG = 1 THEN end_hut ELSE start_hut END as end_hut,
	CASE WHEN FLAG = 1 THEN end_hut_name ELSE start_hut_name END as end_hut_name
  -- swap the huts based on flag
	FROM cte_trails2 as t3)
SELECT c1.start_hut_name, c1.end_hut_name , c2.end_hut_name
FROM cte_final c1 
JOIN cte_final c2 
-- using self join to get the 3rd hut
ON c1.end_hut = c2.start_hut;
