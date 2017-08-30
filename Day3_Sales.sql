CREATE Table Customer (
	Id int not null primary key identity (1,1),
	Name nvarchar (50) not null,
	SalesYTD money not null default 0,
) --speaks for itself...

	SELECT *, 'A' as 'ABC' From Customer
	where SalesYTD > 1000000000--highest paying customers
union--joins 
	SELECT *, 'B' as 'ABC' From Customer
	where SalesYTD <= 1000000000 and SalesYTD > 50000--medium customers
union--joins
	SELECT *, 'C' as 'ABC' From Customer
	where SalesYTD <= 50000--lowest paying customers
	order by ABC, SalesYTD desc /* orders highest paying customers to lowest
	paying customers */

	INSERT into Sales
	SELECT Name, SalesYTD, 'A' as 'ABC' From Customer
	where SalesYTD > 1000000000
union
	SELECT Name, SalesYTD, 'B' as 'ABC' From Customer
	where SalesYTD <= 1000000000 and SalesYTD > 50000
union
	SELECT Name, SalesYTD, 'C' as 'ABC' From Customer
	where SalesYTD <= 50000
	order by ABC, SalesYTD desc

	SELECT ABC, sum(SalesYTD), avg(SalesYTD)
		FROM Sales
		group by ABC
		having avg(SalesYTD) > 1000000000 /* like "having" a where clause applied to groups,
		in this particular instance, it only shows groups with an average SalesYTD > 
		1000000000/*