-- Wu Jiahao (wu231)
-- C461 Assignment 1
SELECT * FROM company;
SELECT * FROM employeedetails;
SELECT * FROM jobskill;
SELECT * FROM manages;

-- 1. Find the id, name, company name and salary of each employee who lives
-- in Indianapolis and whose salary is in the range [45000; 60000].
Select d.empid, d.compname, d.empsalary
From employeedetails d
Where d.empcity = 'Indianapolis' AND d.empsalary >= 45000 AND d.empsalary <= 60000; 

-- 2. Find the id and name of each employee whose employee city is
-- Indianapolis, whose job domain is OperatingSystems and a salary greater
-- than 40000.
Select distinct d.empid, d.empname
From employeedetails d, jobskill j
Where d.empid = j.empid AND d.empcity = 'Indianapolis' 
And j.domain = 'OperatingSystems' And d.empsalary >= 40000;


-- 3. Find the id and name of each employee who lives in the same city as at
-- least one of his or her managers.

Select e1.empid,e1.empname
From employeedetails e1, employeedetails e2, manages ma
Where e1.empid = ma.eid AND e2.empid = ma.mid AND e1.empcity = e2.empcity;

-- 4. Find the names of Employees who doesn’t stay in the same city as that of
-- their company locations.
Select Distinct d.empname
From employeedetails d, company cp
Where d.compname = cp.compname AND d.empcity != cp.complocation;

-- 5. Find the id, name, and salary of each manager who manages an employee
-- who manages at least one other employee whose job domain is
-- OperatingSystems.  
Select Distinct e.empid,e.empname,e.empsalary
From employeedetails e, manages ma, jobskill s
Where e.empid in
(Select m.mid from manages m where m.eid in
(Select m.mid from manages m where m.eid in
(Select js.empid from jobskill js where js.domain = 'OperatingSystems')));

-- 6. Find the common manager for the pairs (id1, id2) of different employees.
Select distinct ma.mid
From Manages ma
Where ma.mid in 
(Select m.mid
From Manages m
where m.mid != m.eid
group by m.mid having count(m.eid)>=2);

-- 7. Find the name, location of each company that does not have employees
-- who live in Chicago or Bloomington.
Select c.compname,c.complocation
From Company c
Where c.complocation In(
Select e.empcity
From employeedetails e
where e.empcity != 'Chicago' AND e.empcity != 'Bloomington');

-- 8. For each company, list the company name, the ids of its employees 
-- along with the employee city who have the lowest salary
Select ca.compname,d.empid
From company ca, employeedetails d
Where ca.compname = d.compname AND d.empsalary <= ALL (
Select e.empsalary
From employeedetails e
);

-- 9.  Find id and name of each employee who does not have a manager with a
-- salary higher than that of the employee.

Select distinct e2.empid,e2.empname
From employeedetails e, manages ma, employeedetails e2
Where e.empid = ma.mid AND e2.empid = ma.eid AND e.empsalary <=  e2.empsalary;

-- 10. Find the id and name of employee who works for Facebook
-- whose job domain is Programming and whose manager stays at a different
-- city
Select Distinct e.empid,e.empname,e.empcity
From employeedetails e, jobskill j
Where j.domain = 'Programming' AND e.compname = 'Facebook' AND j.empid = e.empid AND e.empcity NOT IN
(Select e.empcity
From manages ma
Where e.empid = ma.mid);
