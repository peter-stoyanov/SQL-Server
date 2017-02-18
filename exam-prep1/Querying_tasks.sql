select TicketID,Price,Class,Seat
from Tickets
order by TicketID asc

select CustomerID, FirstName + ' ' + LastName as FullName,Gender
from Customers
order by FullName, CustomerID asc

select FlightID,DepartureTime,ArrivalTime
from Flights
where Status = 'Delayed'
order by FlightID asc

select distinct top(5) a.AirlineID,AirlineName,Nationality,Rating
from Airlines a
join Flights f
on f.AirlineID = a.AirlineID
where not f.AirlineID is null
order by Rating desc, AirlineID asc

select TicketID, a.AirportName, c.FirstName + ' ' + c.LastName as CustomerName
from Tickets t
join Flights f
on t.FlightID = f.FlightID
join Customers c
on t.CustomerID = c.CustomerID
join Airports a
on f.DestinationAirportID = a.AirportID
where t.Price < 5000 and t.Class = 'First'
order by t.TicketID asc


--softuni solution
--Extract all Customers which are departing from their Home Town
select distinct c.CustomerID,FirstName + ' '+LastName as FullName,tw.TownName from Flights as f
join Tickets as t
on t.FlightID = f.FlightID
join Customers c
on c.CustomerID = t.CustomerID
join Towns tw
on c.HomeTownID = tw.TownID
join Airports a
on a.AirportID = f.OriginAirportID
where c.HomeTownID = a.TownID
order by CustomerID asc

select * from Flights

--Extract all Customers which will fly
select Distinct c.CustomerID,
    FirstName+' '+LastName as FullName,
    DATEDIFF(year,c.DateOfBirth,'20160101') as Age
from Customers c
join Tickets t
on t.CustomerID = c.CustomerID
join Flights f
on f.FlightID = t.FlightID
and f.Status = 'Departing'
order by Age, CustomerID


--Extract Top 3 Customers which have Delayed Flights
select top(3) c.CustomerID,
    FirstName + ' ' + LastName as FullName,
    t.Price as TicketPrice,
    a.AirportName
from Customers c
join Tickets t
on t.CustomerID = c.CustomerID
join Flights f
on t.FlightID = f.FlightID
and f.Status = 'Delayed'
join Airports a
on f.DestinationAirportID = a.AirportID
order by t.Price desc, c.CustomerID asc


--Extract the Last 5 Flights, which are departing
Select * from 
(
select top 5 f.FlightID,f.DepartureTime,f.ArrivalTime, a.AirportName as Origin,ap.AirportName as Destination
from Flights f
join Airports a
on f.OriginAirportID = a.AirportID
join Airports ap
on f.DestinationAirportID = ap.AirportID
where f.Status = 'Departing'
order by f.DepartureTime desc, f.FlightID asc
) as filter
order by DepartureTime asc, FlightID

--Extract all Customers below 21 years, which have already flew at least once
select distinct c.CustomerID,
        FirstName + ' ' + LastName as FullName,
        DATEDIFF(year,c.DateOfBirth,'20160101') as Age
from Customers c
join Tickets t
on t.CustomerID = c.CustomerID
join Flights f
on t.FlightID = f.FlightID
and f.Status = 'Arrived'
where DATEDIFF(year,c.DateOfBirth,'20160101') < 21
order by Age desc, c.CustomerID asc

--Extract all Airports and the Count of People departing from them

select a.AirportID,a.AirportName,COUNT(t.CustomerID) as Passengers
from Airports a
join Flights f
on f.OriginAirportID = a.AirportID
and f.Status = 'Departing'
join Tickets t
on t.FlightID = f.FlightID
group by a.AirportID,a.AirportName

