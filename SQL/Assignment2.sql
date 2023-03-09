-- Find the ID and name of each person who works for IBM
-- and whose salary is lower than another person who works for IBM as well as has Programming skill

--a). Formulate this query in SQL without using subqueries and set predicates. 
-- You are allowed to use the SQL operators INTERSECT, UNION, and EXCEPT.
Select wor.pid,p.name
From personskill ps, worksfor wor,person p
where ps.skill = 'Programming' and wor.cname = 'IBM' and ps.pid = wor.pid and wor.pid = p.pid
except 
Select distinct ws.pid,p.name
From worksfor ws, person p, worksfor ws2
Where ws.cname = 'IBM' and p.pid = ws.pid and ws2.salary < ws.salary;
--b). Formulate this query in SQL by only using the IN or NOT IN set predicates

Select ws.pid,p.name
From worksfor ws, person p, personskill ps
Where ws.cname = 'IBM' and ws.pid = ps.pid and p.pid = ws.pid
and ps.skill = 'Programming' and ws.salary not in 
(Select distinct wor.salary
From personskill ps, worksfor wor,person p, worksfor wor2
where ps.skill = 'Programming' and wor.cname = 'IBM' and ps.pid = wor.pid
and  wor.salary > wor2.salary );

--c). Formulate this query in SQL by only using the SOME or ALL set predicates
Select distinct ws.pid,p.name
From worksfor ws, person p, worksfor ws2
Where ws.cname = 'IBM' and p.pid = ws.pid and ws.salary < some
(Select wor.salary
From personskill ps, worksfor wor,person p, worksfor wor2
where ps.skill = 'Programming' and wor.cname = 'IBM' and ps.pid = wor.pid);

--d). Formulate this query in SQL by only using the EXISTS or NOT EXISTS set predicates
Select distinct p.pid, p.name
From person p, worksfor ws, worksfor ws2
where p.pid = ws.pid and ws.cname = 'IBM' and ws2.cname = 'IBM' and ws.salary < ws2.salary
and exists(
Select ws2.salary
from person p1, personskill ps
where p1.pid = ws.pid
and ps.skill = 'Programming' and ws2.pid = ps.pid and ws.salary < ws2.salary);

-- 2. Find the ID and name of each person who knows another person who works for 'Hulu',
-- but who does not know a person who works at 'Intel' and has the 'Networks' skill

--a). Formulate this query in SQL without using subqueries and set predicates. 
-- You are allowed to use the SQL operators INTERSECT, UNION, and EXCEPT.
Select distinct p.pid,p.name
From person p, worksfor ws, knows k
where p.pid = k.pid1 and ws.cname = 'Hulu' and ws.pid = k.pid2
except
select distinct p.pid,p.name
From person p, worksfor ws, knows k, personskill ps
where p.pid = k.pid1 and ws.cname = 'Intel' and ws.pid = k.pid2
and ps.pid = k.pid2 and ps.skill = 'Networks';

-- b). Formulate this query in SQL by only using the IN or NOT IN set predicates
Select distinct p.pid,p.name
From person p, worksfor ws, knows k
Where p.pid = k.pid1 and ws.cname = 'Hulu' and ws.pid = k.pid2 and p.pid
not In (select distinct p.pid
From person p, worksfor ws, knows k, personskill ps
where p.pid = k.pid1 and ws.cname = 'Intel' and ws.pid = k.pid2
and ps.pid = k.pid2 and ps.skill = 'Networks'
);


--c). Formulate this query in SQL by only using the SOME or ALL set predicates
Select distinct p.pid,p.name
From person p, worksfor ws, knows k
where p.pid = k.pid1 and ws.cname = 'Hulu' and ws.pid = k.pid2 and p.pid <>
some
(select distinct p.pid
From person p, worksfor ws, knows k, personskill ps
where p.pid = k.pid1 and ws.cname = 'Intel' and ws.pid = k.pid2
and ps.pid = k.pid2 and ps.skill = 'Networks');

--d). Formulate this query in SQL by only using the EXISTS or NOT EXISTS set predicates
Select distinct p.pid,p.name
From person p, worksfor ws, knows k
where p.pid = k.pid1 and ws.cname = 'Hulu' and ws.pid = k.pid2
and exists(
select distinct ws.pid
From person p, worksfor ws, knows k, personskill ps
where p.pid = k.pid1 and ws.cname = 'Intel' and ws.pid = k.pid2
and ps.pid = k.pid2 and ps.skill = 'Networks');

-- 3). Find the name of each company located in Bloomington, but not in Indianapolis
-- along with ID, name, and salary of each person who works for that company and who 
-- has the next to highest salary (the second highest salary) at that company

--a). Formulate this query in SQL without using subqueries and set predicates. 
-- You are allowed to use the SQL operators INTERSECT, UNION, and EXCEPT.
Select distinct ws.pid,p.name,ws.salary,c.cname
From worksfor ws, person p, worksfor ws2, company c
Where ws.pid = p.pid and c.city = 'Bloomington' and ws.cname = c.cname and c.city = p.city
and ws.salary < ws2.salary
intersect(
Select distinct ws.pid,p.name,ws.salary,c.cname
From worksfor ws, person p, worksfor ws2, company c
Where ws.pid = p.pid and c.city != 'Indianapolis' and ws.cname = c.cname and c.city = p.city
and ws.salary > ws2.salary);

--b).
Select distinct ws.pid,p.name,ws.salary,c.cname
From worksfor ws, person p, worksfor ws2, company c
Where ws.pid = p.pid and c.city = 'Bloomington' and ws.cname = c.cname and c.city = p.city
and ws.salary < ws2.salary and ws.pid
in (
Select distinct ws.pid
From worksfor ws, person p, worksfor ws2, company c
Where ws.pid = p.pid and c.city != 'Indianapolis' and ws.cname = c.cname and c.city = p.city
and ws.salary > ws2.salary);

--c). 
Select distinct ws.pid,p.name,ws.salary,c.cname
From worksfor ws, person p, worksfor ws2, company c
Where ws.pid = p.pid and c.city = 'Bloomington' and ws.cname = c.cname and c.city = p.city
and ws.salary < ws2.salary and ws.pid < some
(
Select distinct ws.pid
From worksfor ws, person p, worksfor ws2, company c
Where ws.pid = p.pid and c.city != 'Indianapolis' and ws.cname = c.cname and c.city = p.city
and ws.salary > ws2.salary);

--d).
Select distinct ws.pid,p.name,ws.salary,c.cname
From worksfor ws, person p, worksfor ws2, company c
Where ws.pid = p.pid and c.city = 'Bloomington' and ws.cname = c.cname and c.city = p.city
and ws.salary < ws2.salary and exists
(
Select distinct ws.pid
From worksfor ws, person p, worksfor ws2, company c
Where ws.pid = p.pid and c.city != 'Indianapolis' and ws.cname = c.cname and c.city = p.city
and ws.salary > ws2.salary);

-- Part 2
Create View SalaryAbove50000 AS
Select p.pid,p.name,p.city,p.birthyear
From person p,worksfor ws
Where p.pid = ws.pid and ws.salary > 50000;

Select * from SalaryAbove50000;

--2b). 
-- Drop view programmer
Create View Programmer AS
Select p.pid
From person p,personskill ps
Where ps.skill = 'Programming' and ps.pid = p.pid;

Select * from Programmer;

--3c).
Select distinct p.pid,p.name
From person p, SalaryAbove50000 Sa, worksfor ws,knows k, programmer pr
Where ws.cname = 'Netflix' and p.pid = ws.pid and ws.pid = Sa.pid
and k.pid2 != pr.pid;

--2a).
--Drop function SalaryAbove
Create Function SalaryAbove(amount integer)
	Returns Table(pid Integer,name TEXT, city TEXT, birthyear Integer) AS
	$$
		Select p.pid,p.name,p.city,p.birthyear
		From person p, worksfor ws
		Where ws.pid = p.pid and ws.salary > amount;
	$$ LANGUAGE SQL;

Select p.pid,p.name,p.city,p.birthyear
From SalaryAbove(30000) p;

Select p.pid,p.name,p.city,p.birthyear
From SalaryAbove(50000) p;

Select p.pid,p.name,p.city,p.birthyear
From SalaryAbove(55000) p;

--2b).
--Drop Function KnowsEmployeeAtCompany
Create Function KnowsEmployeeAtCompany(cname TEXT)
	Returns Table(pid Text) AS
	$$
		Select wf.pid
		From worksfor wf
		Where wf.cname = cname;
	$$ LANGUAGE SQL;

Select ke.pid
From KnowsEmployeeAtCompany('Yahoo') ke;

Select ke.pid
From KnowsEmployeeAtCompany('Google') ke;

Select ke.pid
From KnowsEmployeeAtCompany('Amazon') ke;
3. 
Create Table A (x integer, cube_root_x numeric,
			  x_to_the_power_x numeric, 
			   ten_to_the_x numeric,
			   x_factorial numeric,
			   log_base_2 numeric);
insert into A values (4),(8),(12),(16),(20);
Select x AS x,
cbrt(x) AS cube_root_x,
power(x,x) AS x_to_the_power_x,
power(10,x) AS ten_to_the_x,
x ! AS x_factorial,
log(2,x) AS log_base_2
From A;
