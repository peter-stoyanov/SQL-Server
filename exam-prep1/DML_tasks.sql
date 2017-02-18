INSERT INTO Flights(FlightID,DepartureTime,ArrivalTime,Status,OriginAirportID,DestinationAirportID,AirlineID) 
VALUES(1,'2016-10-13 06:00 AM','2016-10-13 10:00 AM','Delayed',1,4,1)

INSERT INTO Flights(FlightID,DepartureTime,ArrivalTime,Status,OriginAirportID,DestinationAirportID,AirlineID) 
VALUES(2,'2016-10-12 12:00 PM','2016-10-12 12:01 PM','Departing',1,3,2)

INSERT INTO Flights(FlightID,DepartureTime,ArrivalTime,Status,OriginAirportID,DestinationAirportID,AirlineID) 
VALUES(3,'2016-10-14 03:00 PM','2016-10-20 04:00 AM','Delayed',4,2,4)

INSERT INTO Flights(FlightID,DepartureTime,ArrivalTime,Status,OriginAirportID,DestinationAirportID,AirlineID) 
VALUES(4,'2016-10-12 01:24 PM','2016-10-12 4:31 PM','Departing',3,1,3)

INSERT INTO Flights(FlightID,DepartureTime,ArrivalTime,Status,OriginAirportID,DestinationAirportID,AirlineID) 
VALUES(5,'2016-10-12 08:11 AM','2016-10-12 11:22 PM','Departing',4,1,1)

INSERT INTO Flights(FlightID,DepartureTime,ArrivalTime,Status,OriginAirportID,DestinationAirportID,AirlineID) 
VALUES(6,'1995-06-21 12:30 PM','1995-06-22 08:30 PM','Arrived',2,3,5)

INSERT INTO Flights(FlightID,DepartureTime,ArrivalTime,Status,OriginAirportID,DestinationAirportID,AirlineID) 
VALUES(7,'2016-10-12 11:34 PM','2016-10-13 03:00 AM','Departing',2,4,2)

INSERT INTO Flights(FlightID,DepartureTime,ArrivalTime,Status,OriginAirportID,DestinationAirportID,AirlineID) 
VALUES(8,'2016-11-11 01:00 PM','2016-11-12 10:00 PM','Delayed',4,3,1)

INSERT INTO Flights(FlightID,DepartureTime,ArrivalTime,Status,OriginAirportID,DestinationAirportID,AirlineID) 
VALUES(9,'2015-10-01 12:00 PM','2015-12-01 01:00 AM','Arrived',1,2,1)

INSERT INTO Flights(FlightID,DepartureTime,ArrivalTime,Status,OriginAirportID,DestinationAirportID,AirlineID) 
VALUES(10,'2016-10-12 07:30 PM','2016-10-13 12:30 PM','Departing',2,1,7)


INSERT INTO Tickets(TicketID,Price,Class,Seat,CustomerID,FlightID)
Values (1,3000.00,'First','233-A',3,8)
INSERT INTO Tickets(TicketID,Price,Class,Seat,CustomerID,FlightID)
Values (2,1799.90,'Second','123-D',1,1)
INSERT INTO Tickets(TicketID,Price,Class,Seat,CustomerID,FlightID)
Values (3,1200.50,'Second','12-Z',2,5)
INSERT INTO Tickets(TicketID,Price,Class,Seat,CustomerID,FlightID)
Values (4,410.68,'Third','45-Q',2,8)
INSERT INTO Tickets(TicketID,Price,Class,Seat,CustomerID,FlightID)
Values (5,560.00,'Third','201-R',4,6)
INSERT INTO Tickets(TicketID,Price,Class,Seat,CustomerID,FlightID)
Values (6,2100.00,'Second','13-T',1,9)
INSERT INTO Tickets(TicketID,Price,Class,Seat,CustomerID,FlightID)
Values (7,5500.00,'First','98-O',2,7)

UPDATE Flights
set AirlineID = 1
Where Status = 'Arrived';

SELECT * FROM Flights

SELECT * FROM Tickets

--Find the highest-rated Airline, and increase all of its Flights’ Tickets’ prices with 50%.
SELECT top(1) Rating
From Airlines
order by Rating DESC

--judge
Update Tickets
Set Price = Price * 1.5
FROM Tickets t
join Flights f
on t.FlightID = f.FlightID
join Airlines a
on f.AirlineID = a.AirlineID
where Rating = (
SELECT top(1) Rating
From Airlines
order by Rating DESC
)

update Tickets
set Price *= 1.5
where FlightID IN
(
    select FlightID from Flights
    where AirlineID = 
        (
            select top 1 AirlineID from Airlines
            order by Rating desc
        )
)

CREATE TABLE CustomerReviews(
ReviewID INT Primary Key,
ReviewContent VARCHAR(255) not null,
ReviewGrade int,
CHECK(ReviewGrade Between 0 and 10),
AirlineID int,
CustomerID int,
FOREIGN KEY (AirlineID)
REFERENCES Airlines(AirlineID),
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)
)

create table CustomerBankAccounts(
AccountID int PRIMARY KEY,
AccountNumber VARCHAR(10) not null UNIQUE,
Balance decimal(10,2) not NULL,
CustomerID int,
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)
)

select * from CustomerBankAccounts

insert into CustomerReviews(ReviewID,ReviewContent,ReviewGrade,AirlineID,CustomerID)
values(1,'Me is very happy. Me likey this airline. Me good.',10,1,1)
insert into CustomerReviews(ReviewID,ReviewContent,ReviewGrade,AirlineID,CustomerID)
values(2,'Ja, Ja, Ja... Ja, Gut, Gut, Ja Gut! Sehr Gut!',10,1,4)
insert into CustomerReviews(ReviewID,ReviewContent,ReviewGrade,AirlineID,CustomerID)
values(3,'Meh...',5,4,3)
insert into CustomerReviews(ReviewID,ReviewContent,ReviewGrade,AirlineID,CustomerID)
values(4,'Well Ive seen better, but Ive certainly seen a lot worse...',7,3,5)

insert into CustomerBankAccounts(AccountID,AccountNumber,Balance,CustomerID)
values(1,'123456790',2569.23,1)

insert into CustomerBankAccounts(AccountID,AccountNumber,Balance,CustomerID)
values(2,'18ABC23672',14004568.23,2)

insert into CustomerBankAccounts(AccountID,AccountNumber,Balance,CustomerID)
values(3,'F0RG0100N3',19345.20,5)
