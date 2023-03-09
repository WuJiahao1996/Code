-- 1. Find the max of Two values

Create or Replace Function findMaximum(n1 integer, n2 integer) Returns integer AS
$$
Begin
	IF n1 > n2 Then Return n1;
	ELSE
	IF n1 < n2 Then REturn n2;
	END IF;
	END IF;
END;
$$ language plpgsql;

Select findMaximum(1,10);
Select findMaximum(30,15);

-- 2. Create table and updated table outcomes by increasing 500 on salary
Drop Table Customers;
Create Table Customers (ID int primary key,Name varchar(40),AGE int,ADDRESS varchar(40), SALARY decimal);
Insert INTO Customers Values (1,'Bhargav',32,'Ahmedabad',2000.00);
Insert INTO Customers Values (2,'Tarika',25,'Delhi',1500.00);
Insert INTO Customers Values (3,'John',23,'Kota',2000.00);
Insert INTO Customers Values (4,'Michael',25,'Mumbai',6500.00);
Insert INTO Customers Values (5,'Harish',27,'Bhopal',8500.00);
Insert INTO Customers Values (6,'Suraj',22,'MP',4500.00);
Select * from Customers;

Create or replace function salaryIncrease(n1 integer) Returns void AS
$$
	UPDATE Customers
	Set salary = salary + n1
$$ Language sql;
Select salaryIncrease(500);
Select * from Customers;

-- 3. Reverse a number

Create or replace function reverseNum(n1 integer) Returns integer AS
$$
Declare res integer;
Begin
	res := 0;
	While n1 > 0 Loop
	res := (res*10) + mod(n1,10);
	n1 := floor(n1/10);
	END loop;
	Return res;
END;
$$ language plpgsql;

Select reverseNum(123);
Select reverseNum(87652);

--4. Triangle
Drop function Triangle(integer);
Create or replace Function Triangle(n1 integer) Returns Text AS
$$
	Declare i integer;j integer;
	Begin
		For i IN 1..n1
		Loop
			For j In 1..i
			Loop
				raise notice '*';
			END Loop;
				raise notice '';
		END Loop;
	END;
$$ Language plpgsql;

Select Triangle(3);
Select Triangle(5);

--5. Hightest Common Factors

Create or Replace Function HCF(n1 integer,n2 integer) returns integer as
$$
	Begin
		if (n2 = 0) then return n1;
		else return HCF(n2,mod(n1,n2));
	end if;
	End;
$$ language plpgsql;

Select HCF(8,48);
Select HCF(98,56);













