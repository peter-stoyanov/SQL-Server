--prepare db and run queries

-- 5 

select Name,Price,Description
from Products
order by Price desc, Name asc

-- 6  no Countries object

select i.Name,i.Description,i.OriginCountryId
from Ingredients i
join Countries c
on i.OriginCountryId = c.Id
where c.Id in(1,10,20)
order by i.Id asc

--7 

select top 15 i.Name,i.Description,c.Name
from Ingredients i
join Countries c
on i.OriginCountryId = c.Id
where c.Name in('Bulgaria','Greece')
order by i.Name asc,c.Name asc

--8 

select top 10 p.Name,p.Description,avg(f.Rate) as AverageRate,count(f.Id) as FeedbacksAmount
from Products p
join Feedbacks f
on f.ProductId = P.Id
group by p.Name,p.Description
order by AverageRate desc, FeedbacksAmount desc

--9 

select f.ProductId,f.Rate,f.Description,c.Id,c.Age,c.Gender
from Feedbacks f
join Customers c
on f.CustomerId = c.Id
where f.Rate < 5
order by f.ProductId desc, f.Rate asc

--10  50%

select c.FirstName+' '+c.LastName as CustomerName,c.PhoneNumber,c.Gender
from Customers c
where c.Id not in(
    select f.CustomerId
    from Feedbacks f
)
order by c.Id asc


--11

select f.ProductId,c.FirstName+' '+c.LastName as CustomerName,f.Description
from Feedbacks f
join Customers c
on f.CustomerId = c.Id
where c.Id in(
    select f.CustomerId--,count(f.CustomerId) as FeedbackAmount
    from Feedbacks f
    group by f.CustomerId
    having count(f.CustomerId) >= 3
    
)
order by f.ProductId asc, CustomerName asc, f.Id

--12

select c.FirstName,c.Age,c.PhoneNumber
from Customers c
join Countries ct
on c.CountryId = ct.Id
where (c.Age >= 21 and c.FirstName like '%an%')
    or (c.PhoneNumber like '%38' and ct.Name not in('Greece'))
order by c.FirstName asc, c.Age desc

-- 13

select distinct d.Name as DistributorName,i.Name as IngredientName,
p.Name as ProductName,avg(f.Rate) as AverageRate
from Ingredients i
join ProductsIngredients pi
on pi.IngredientId = i.Id
join Distributors d
on i.DistributorId = d.Id
join Products p
on pi.ProductId = p.Id
join Feedbacks f
on f.ProductId = p.Id
group by d.Name,i.Name,p.Name
having avg(f.Rate) between 5 and 8
order by DistributorName asc,IngredientName asc,ProductName asc

--14

select top 1 with ties c.Name as CountryName, avg(f.Rate) as FeedbackRate
from Countries c
join Customers cs
on cs.CountryId = c.Id
join Feedbacks f
on f.CustomerId = cs.Id
group by c.Name
order by FeedbackRate desc

--15  2 ways of grouping missing

select top 1 with ties c.Name as CountryName, d.Name as DistributorName,avg(i.DistributorId)
from Distributors d
join Countries c
on d.CountryId = c.Id
join Ingredients i
on i.DistributorId = d.Id
group by c.Name,d.Name
order by avg(i.DistributorId) desc

