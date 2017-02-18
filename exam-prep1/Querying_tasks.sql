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


select distinct c.CustomerID,FirstName + ' ' + LastName as FullName, t.TownName as HomeTown
from Customers c
inner join Towns t
on c.HomeTownID = t.TownID
inner join Tickets tc
on tc.CustomerID = c.CustomerID
inner join Flights f
on tc.FlightID = f.FlightID
inner join Airports ar
on ar.TownID = t.TownID
where c.HomeTownID = f.OriginAirportID
order by CustomerID asc

select * from Flights

