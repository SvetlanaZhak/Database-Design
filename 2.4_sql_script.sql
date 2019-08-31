--2.4 SQL script to test the database

--booking ticket
INSERT INTO Booking (booking_status, ticket_number, event_id, booking_date_and_time, memo)
VALUES ('booked', 2, 4, '2018-12-07 12:30:45', '+123456780');

--cancelling booking
DELETE FROM Booking
WHERE booking_number = 8;

--change number of tickets
UPDATE Booking
SET ticket_number = 7
WHERE booking_number = 7;
SELECT * FROM BOOKING

--change the status of booking
UPDATE Booking
SET booking_status = 'sold'
WHERE booking_number = 3;

--remove unpurchased booking from the datebase
DELETE FROM Booking
WHERE booking_status = 'booked' AND DATEDIFF (DAY, booking_date_and_time, GETDATE()) > 3;

--cancell an event
UPDATE Event
SET event_status = 'cancelled'
WHERE event_id = 2; 

--remove unpurchased booking of the past events
DELETE Booking FROM Booking
INNER JOIN Event ON (Booking.event_id = Event.event_id)
WHERE Booking.booking_status = 'booked' and  CAST(Event.event_date_and_time AS DATE) < GETDATE();

--refunding in case of cancelling event
UPDATE Booking
SET booking_status = 'refunded'
where booking_number = 2;

--TEST
--1
SELECT email FROM Performer
Where performer_name = 'Sia';

--2
SELECT event_name AS 'Concerts this month' FROM Event
WHERE DATENAME(MONTH, event_date_and_time) = 'December';

--3
SELECT DISTINCT event_name FROM Event
JOIN EventPerformance ON (Event.event_id = EventPerformance.event_id)
WHERE EventPerformance.type = 'concert' and  DATENAME(MONTH, event_date_and_time) = 'June';


--4
SELECT rider_list FROM Performer
WHERE performer_name = 'Saara Alto'; 

--5
SELECT SUM(Booking.ticket_number) AS 'Number of sold tickets'
FROM Booking
JOIN Event ON (Booking.event_id = Event.event_id)
WHERE Event.event_name = 'Finnish summer' AND CAST(Event.event_date_and_time AS DATE) = '2019-06-12';

--6
SELECT Venue.number_of_seats - SUM(Booking.ticket_number) AS 'Number of left tickets'
FROM Venue
JOIN Event ON (Event.venue_id = Venue.venue_id)
JOIN Booking ON (Event.event_id = Booking.event_id)
WHERE Booking.booking_status = 'sold' AND Event.event_name = 'ZZ Top Helsinki' AND CAST(Event.event_date_and_time AS DATE) = '2019-06-04'
GROUP BY Venue.number_of_seats;

--7
SELECT SUM(Booking.ticket_number * price) AS 'Total income from sold tickets' FROM Booking
JOIN Event ON (Event.event_id = Booking.event_id)
WHERE booking_status = 'sold' AND DATENAME(YEAR, booking_date_and_time) = 2018
GROUP BY Booking.booking_status, Event.price;