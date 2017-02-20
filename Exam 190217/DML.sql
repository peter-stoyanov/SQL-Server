insert into Distributors(Name,CountryId,AddressText,Summary)
values('Deloitte & Touche',2,'6 Arch St #9757' ,'Customizable neutral traveling')

--select * from Distributors

insert into Distributors(Name,CountryId,AddressText,Summary)
values('Congress Title',13,'58 Hancock St' ,'Customer loyalty')

insert into Distributors(Name,CountryId,AddressText,Summary)
values('Kitchen People',1,'3 E 31st St #77','Triple-buffered stable delivery')

insert into Distributors(Name,CountryId,AddressText,Summary)
values('General Color Co Inc',21,'6185 Bohn St #72' ,'Focus group')

insert into Distributors(Name,CountryId,AddressText,Summary)
values('Beck Corporation',23,'21 E 64th Ave' ,'Quality-focused 4th generation hardware')
--customers
insert into Customers(FirstName,LastName,Age,Gender,PhoneNumber,CountryId)
values('Francoise','Francoise',15,'M','0195698399',5)

insert into Customers(FirstName,LastName,Age,Gender,PhoneNumber,CountryId)
values('Kendra','Kendra',22,'F','0063631526',11)

insert into Customers(FirstName,LastName,Age,Gender,PhoneNumber,CountryId)
values('Lourdes','Bauswell',50,'M','0139037043',8)

insert into Customers(FirstName,LastName,Age,Gender,PhoneNumber,CountryId)
values('Hannah','Edmison',18,'F','0043343686',1)

insert into Customers(FirstName,LastName,Age,Gender,PhoneNumber,CountryId)
values('Tom','Loeza',31,'M','0144876096',23)

insert into Customers(FirstName,LastName,Age,Gender,PhoneNumber,CountryId)
values('Queenie','Kramarczyk',30,'F','0064215793',29)

insert into Customers(FirstName,LastName,Age,Gender,PhoneNumber,CountryId)
values('Hiu','Portaro',25,'M','0068277755',16)

insert into Customers(FirstName,LastName,Age,Gender,PhoneNumber,CountryId)
values('Josefa','Opitz',43,'F','0197887645',17)


--3  update

update Ingredients
set DistributorId = 35
where Name in ('Bay Leaf','Paprika','Poppy')

update Ingredients
set OriginCountryId = 14
where OriginCountryId = 8

-- 4   delete

delete from Feedbacks
where CustomerId = 14 OR ProductId=5 

