create table dbo.SKU (
	ID int identity(1, 1) primary key,
	Code as 's' + cast(ID as varchar(10)) unique,
	Name varchar(30));

create table dbo.Family(
	ID int identity(1,1) primary key,
	SurName varchar (50),
	BudgetValue int);

create table dbo.Basket(
	ID int identity(1, 1) primary key,
	ID_SKU int,
	foreign key (ID_SKU) references dbo.SKU(ID),
	ID_Family int,
	foreign key (ID_Family) references dbo.Family(ID),
	Quantity int check (Quantity >= 0),
	Value int check (Value >= 0),
	PurchaseDate datetime2 DEFAULT SYSDATETIME(),
	DiscontValue int);