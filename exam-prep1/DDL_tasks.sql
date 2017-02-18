
CREATE TABLE Flights
(
    FlightID INT NOT NULL PRIMARY KEY, -- primary key column
    DepartureTime DATE NOT NULL,
    ArrivalTime DATE NOT NULL,
    Status VARCHAR(9) NOT NULL,
    OriginAirportID INT NOT NULL,
    DestinationAirportID INT NOT NULL,
    AirlineID INT NOT NULL,
    CHECK (Status = 'Departing' OR Status = 'Delayed'
    OR Status = 'Arrived' OR Status = 'Cancelled'),
    FOREIGN KEY (OriginAirportID)
    REFERENCES Airports(AirportID),
    FOREIGN KEY (DestinationAirportID)
    REFERENCES Airports(AirportID),
    FOREIGN KEY (AirlineID)
    REFERENCES Airlines(AirlineID)
   
);

CREATE TABLE Tickets
(
    TicketID INT NOT NULL PRIMARY KEY,
    Price DECIMAL(10,2) NOT NULL,
    Class VARCHAR(6) NOT NULL,
    Seat VARCHAR(5) NOT NULL,
    CustomerID INT NOT NULL,
    FlightID INT NOT NULL,
    CHECK (Class = 'First' OR Class = 'Second'
    OR Class = 'Third'),
    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID),
    FOREIGN KEY (FlightID)
    REFERENCES Flights(FlightID)
    
)


TRUNCATE TABLE Flights
TRUNCATE TABLE Tickets
DROP TABLE Flights
DROP TABLE Tickets

