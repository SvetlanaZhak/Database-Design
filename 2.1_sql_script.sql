--2.1 SQL script to create the database structure in SQL Server
--Venue
CREATE TABLE Venue (
venue_id INTEGER NOT NULL IDENTITY,
venue_name VARCHAR(50) NOT NULL,
number_of_seats INTEGER NOT NULL,
CONSTRAINT PK_Venue PRIMARY KEY (venue_id),
CONSTRAINT UQ_Venue_venue_name UNIQUE (venue_name)
);
--Performer
CREATE TABLE Performer (
performer_id INTEGER NOT NULL IDENTITY,
performer_name VARCHAR(70) NOT NULL,
phone VARCHAR(15) NOT NULL,
email VARCHAR(30) NOT NULL,
rider_list VARCHAR(100),
CONSTRAINT PK_Performer PRIMARY KEY(performer_id), 
CONSTRAINT CHK_Performer_emailCheck CHECK(email LIKE '%_@_%._%')

);
--Event
CREATE TABLE Event (
event_id INTEGER NOT NULL IDENTITY,
venue_id INTEGER NOT NULL,
event_date_and_time DATETIME NOT NULL,
event_name VARCHAR (50) NOT NULL,
event_status VARCHAR(10) NOT NULL,
price INTEGER NOT NULL,
CONSTRAINT PK_Event PRIMARY KEY (event_id),
CONSTRAINT FK_Event_Venue FOREIGN KEY (venue_id) 
REFERENCES Venue (venue_id),
CONSTRAINT CHK_Event_statusCheck CHECK (event_status IN ('planned', 'cancelled'))
); 
-- Event Performance
CREATE TABLE EventPerformance (
event_id INTEGER NOT NULL IDENTITY,
performer_id INTEGER NOT NULL,
type VARCHAR(25) NOT NULL,
CONSTRAINT PK_EventPerformance PRIMARY KEY (event_id, performer_id),
CONSTRAINT FK_EventPerformance_Event FOREIGN KEY (event_id)
REFERENCES Event (event_id),
CONSTRAINT FK_EventPerfornamce_Performer FOREIGN KEY (performer_id)
REFERENCES Performer (performer_id),
CONSTRAINT CHK_EventPerformance_type CHECK (type IN ('concert', 'circus', 'standup', 'music', 'dance', 'other')
));
--Booking
CREATE TABLE Booking ( 
booking_number INTEGER NOT NULL IDENTITY,
booking_status VARCHAR(10) NOT NULL,
ticket_number INTEGER NOT NULL,
event_id INTEGER NOT NULL,
booking_date_and_time DATETIME NOT NULL,
memo VARCHAR(50),
CONSTRAINT PK_Booking PRIMARY KEY (booking_number),
CONSTRAINT FK_Booking_Event FOREIGN KEY (event_id) 
REFERENCES Event (event_id),
CONSTRAINT CHK_Booking_amountCheck CHECK (ticket_number > 0),
CONSTRAINT CHK_Booking_statusCheck CHECK (booking_status IN ('booked', 'sold', 'refunded', 'canceled'))
);
--- Create functions statement
GO
CREATE FUNCTION VenueSeats()
RETURNS INTEGER
AS 
BEGIN
DECLARE @seats INTEGER
SELECT @seats = number_of_seats FROM Venue
RETURN @seats
END;
GO
CREATE FUNCTION TotalBooked()
RETURNS INTEGER
AS  BEGIN DECLARE @booked INTEGER
SELECT @booked = sum(ticket_number) FROM Booking GROUP BY event_id
RETURN @booked
END;
GO

ALTER TABLE Booking 
ADD CONSTRAINT seatsCheck CHECK(BIT_SWD03_35.VenueSeats() >= BIT_SWD03_35.TotalBooked());





