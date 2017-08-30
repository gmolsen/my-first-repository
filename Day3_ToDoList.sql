

CREATE Table ToDo (
	ID int not null primary key identity (1,1),
	Description nvarchar (255) not null,
	ABC char (1) not null default 'B',
	Priority int not null default 2,
	DueDate datetime not null default getdate(),
	Complete bit not null default 0
	)

CREATE TABLE Category (
	 Code int primary key IDENTITY(1,1) NOT NULL, --
	 Description nvarchar(25) NOT NULL,
)

Select --displays...

	Category.Description as 'Category', --Category of ToDo list item

	 ToDo.Description as 'ToDo', --specific description of ToDo list item
	
	concat(ABC, Priority) as 'Priority', --concatenates ABC & Priority columns
	
	convert(Date, getDate()) as 'Due',  --removes hours from DueDate

	Complete from ToDo --complete column
	
	Join Category
	On ToDo.Category = Category.Code /* specifies that Category.Description
	is joined on the condition that ToDo.Category = Category.Code */
	
	
	where Complete != 1 --displays only incomplete list items
	
	Order By ABC, Priority; --prioritizes ABC column, then Priority column



Select convert(Date, getDate()) as 'Due', 
	Category.Description as 'Category', ToDo.Description as 'ToDo', 
	concat(ABC, Priority) as 'Priority', Complete from ToDo
	Join Category
	On ToDo.Category = Category.Code
	where Complete != 1
	Order by DueDate, ABC, Priority; --same statement, just prioritizes the due date
	
Alter Table ToDo
	ADD foreign key (Category) references Category(Code); /* makes
	ToDo.Category into a foreign key that references Category.Code */

Select * from Category