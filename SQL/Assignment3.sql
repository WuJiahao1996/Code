-- 1. 
-- 1).
create or replace function multiplicationPandQ()
		returns table(coeffiecient bigint, degree integer) as 
$$
	Select sum(p1.coefficient * q1.coefficient), p1.degree+q1.degree
	From p p1,q q1
	Group by p1.degree + q1.degree
	Order by p1.degree + q1.degree desc
$$ language sql;
Select mul.coeffiecient as p_times_q_coefficient, mul.degree as p_times_q_degree
From multiplicationPandQ() mul;

--2).
create or replace function dotProductXandY() 
		returns bigint as
$$
	Select sum(x1.value * y1.value)
	From x x1,y y1
	Where x1.index = y1.index;
$$ language sql;
Select dotProductXandY();

--2
--3). Find the pid and name of each person who lives in 'Chicago'
-- and who knows at least one person who has at least 3 job skills
Create View atleast3jobskills as 
Select ps.pid 
From PersonSkill ps 
group by ps.pid 
having count(*) > 2;

Select distinct p.pid,p.name
From person p, knows w, jobskill js, atleast3jobskills al
Where p.city = 'Chicago' and p.pid = w.pid1 and w.pid2 = al.pid
order by p.pid;

--4). Find the pid and name of each person who has all but four job skills
-- such a person lacks precisely four job skills from the possible jobs
-- skills that are stored in the relation jobskill and lives in 'Indianapolis'
Create view jobskillscount as
Select ps.pid,count(*) As Nums
From personskill ps
Group by ps.pid;

Select p.pid, p.name
From person p, jobskillscount jbs
Where p.pid = jbs.pid and jbs.Nums = 1 and p.city = 'Indianapolis';


-- 3
--5). Find the pid and name of each person who knows all the person who
-- a). work at Apple, b) make at most 60000, and c) are born before 2000
Create view conditionsthree as
Select p.pid
From person p, worksfor ws
Where ws.cname = 'Apple' and ws.salary <= 60000 and p.birthyear < 2000 and p.pid = ws.pid;

Select distinct p.pid,p.name
From person p
Where not exists( 
	Select cs.pid
	From conditionsthree cs
	where cs.pid not in
	(Select ws.pid2
	 from knows ws
	 where ws.pid1 = p.pid
	)
);

-- 6). Find the cname of each company who only employs persons who make less than 50000
-- Drop view lessthan

Create view lessthan as
Select ws.cname,ws.pid
From person p, worksfor ws
Where p.pid = ws.pid and ws.salary < 50000;

Select distinct wor.cname
From worksfor wor
Where wor.cname not in
(Select distinct wk.cname
From worksfor wk
Where not exists(
	Select ws.cname
	From worksfor ws
	Where ws.pid = wk.pid
	intersect
	Select ls.cname
	From lessthan ls
	Where ls.pid = wk.pid
));

-- 4
-- 7). Find the cname of each company that employs and even number 
-- of persons whose salary is at most 60000

Create or replace Function numberofEmployee(s Text) Returns bigint
AS $$
	Select Count(*)
	From worksfor ws
	Where ws.cname = s
$$ Language SQL;

Select distinct ws.cname
From worksfor ws
Where numberofEmployee(ws.cname) % 2 = 0;

-- 8). Find the pid and name of each person who knows at most
-- 3 people who each have at least 2 job skills
Create view twoormore as
Select ps.pid
From PersonSkill ps 
group by ps.pid
having count(*) > 1
order by ps.pid;

Create or replace Function numberofknows(s Integer) Returns bigint
AS $$
	Select Count(*)
	From knows w
	Where w.pid1 = s
	group by w.pid1
$$ Language SQL;

Select p.pid,p.name
From person p
where p.pid in (Select distinct w.pid1
From knows w
Where numberofknows(w.pid1) <= 3 and w.pid2 in( 
Select tw.pid
From twoormore tw));


--9). Find the pairs(p1,p2) of different person pid such that the person with pid
-- p1 and the person with pid p2 knows the same number of persons
Create view countpid1 AS
Select distinct k.pid1,count(*) as num
From knows k
Group by k.pid1
Order by k.pid1;

(Select distinct c1.pid1,c2.pid1
From countpid1 c1,countpid1 c2
Where c1.num = c2.num
Order by c1.pid1
);
