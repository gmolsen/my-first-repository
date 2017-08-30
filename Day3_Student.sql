Select FirstName, LastName, Sat, Gpa from Student 
	where GPA > (select AVG(gpa) from student where GPA > 3.5) 
	/* sub-select statement is used to calculate the average GPA of
	students with a GPA higher than 3.5, WHERE clause is used
	to display only students with a GPA higher than that average */

Select FirstName, LastName, Sat, gpa from student
	 where sat = (select MAX(sat) from student) /* sub-select statement 
	 is used to calculate highest SAT score out of all students,
	 WHERE clause is used to specify that only the student with the highest score
	 shall be displayed */

ALTER Table Student
	alter column MajorID int; --allows MajorID to be null

Select concat(student.FirstName, ' ', student.LastName) as 'Name', major.Description
	from student
	join major
		on student.MajorID = major.id--(inner join) does not display students with MajorID set to null

Select concat(student.FirstName, ' ', student.LastName) as 'Name', major.Description
	from student
	left join major
		on student.MajorID = major.id--(outer join) displays students with MajorID set to null

declare @CanBeNull varchar(10)
set @CanBeNull = null --i forget

select isNull(@CanBeNull, 'Undeclared') as 'Can Be Null'--i forget