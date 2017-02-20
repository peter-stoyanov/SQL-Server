

create table Countries(
    Id int primary key identity(1,1),
    Name nvarchar(50) unique
)


create table Customers(
    Id int primary key identity(1,1),
    FirstName nvarchar(25),
    LastName nvarchar(25),
    Gender nvarchar(1),
    CHECK (Len(Gender) = 1),
    Age int,
    PhoneNumber nvarchar(10),
    CHECK (Len(PhoneNumber) = 10),
    CountryId int,
    CONSTRAINT FK_Customers_Countries 
    FOREIGN KEY(CountryId) 
    REFERENCES Countries(Id),
)



create table Products(
    Id int primary key identity(1,1),
    Name nvarchar(25) unique,
    Description nvarchar(250),
    Recipe nvarchar(max),
    Price decimal(10,2),
    check(Price >= 0)
)

create table Feedbacks(
    Id int primary key identity(1,1),
    Description nvarchar(255),
    Rate decimal(4,2),
    check(Rate>=0 and Rate <=10),
    ProductId int,
    CONSTRAINT fk_Feedbacks_Products
    FOREIGN KEY(ProductId) 
    REFERENCES Products(Id),
    CustomerId int,
    CONSTRAINT FK_Feedbacks_Customers 
    FOREIGN KEY(CustomerId) 
    REFERENCES Customers(Id)
)

create table Distributors(
        Id int primary key identity(1,1),
        Name nvarchar(25) unique,
        AddressText nvarchar(30),
        Summary nvarchar(200),
        CountryId int,
        CONSTRAINT FK_Distributors 
    FOREIGN KEY(CountryId) 
    REFERENCES Countries(Id)

)

create table Ingredients(
    Id int primary key identity(1,1),
    Name nvarchar(30),
    Description nvarchar(200),
    OriginCountryId int,
    CONSTRAINT FK_Ingredients_Countries 
    FOREIGN KEY(OriginCountryId) 
    REFERENCES Countries(Id),
    DistributorId int,
    CONSTRAINT FK_Ingredients_Distributors 
    FOREIGN KEY(DistributorId) 
    REFERENCES Distributors(Id),
)

create table ProductsIngredients(
    ProductId int,
    IngredientId int,
    CONSTRAINT PK_ProductsIngred PRIMARY KEY(ProductId,IngredientId),
    CONSTRAINT FKProductIngred_Products 
    FOREIGN KEY(ProductId) 
    REFERENCES Products(Id),
    CONSTRAINT PK_ProductIngred_Ingred 
    FOREIGN KEY(IngredientId) 
    REFERENCES Ingredients(Id)
)