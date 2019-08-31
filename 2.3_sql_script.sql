--2.3 SQL script to populate database with data for testing


--Venue 
INSERT INTO Venue (venue_name, number_of_seats)
VALUES ('Red Hall', 70);

INSERT INTO Venue (venue_name, number_of_seats)
VALUES ('Blue Hall', 3500);

--Performer

INSERT INTO Performer (performer_name, phone, email, rider_list)
VALUES ('Sia', '+366701384501', 'sia@gmail.com', 'White roses  and orange guice in the dressing room');

INSERT INTO Performer (performer_name, phone, email, rider_list)
VALUES ('Saara Alto', '+358407323000', 'saara.alto@gmail.com', 'No nuts in the food. Still water only');

INSERT INTO Performer (performer_name, phone, email, rider_list)
VALUES ('ZZ Top', '+11189365758', 'zz.top@hotmail.com', 'Kukko beer after concert');

INSERT INTO Performer (performer_name, phone, email, rider_list)
VALUES ('Jorma Uotinen', '+358123456789', 'jorma.uo@gmail.com', 'No milk products');

INSERT INTO Performer (performer_name, phone, email, rider_list)
VALUES  ('Beyonce', '+172878637637', 'beyonce.babe@mail.com', 'Fazer chocolate and no achocol');

INSERT INTO Performer (performer_name, phone, email, rider_list)
VALUES ('Madonna', '+6377891212', 'madonna@gmail.com', 'Vegan food only');

INSERT INTO Performer (performer_name, phone, email, rider_list)
VALUES ('Britney Spears', '+701465709329', 'britney@hotmail.com', 'Cheeseburger from Burger King and cola zero');

--EVENT
INSERT INTO Event (venue_id, event_date_and_time, event_name, event_status, price)
VALUES (1, '2018-12-11 14:00:00', 'Snow show', 'planned', 45);

INSERT INTO Event (venue_id, event_date_and_time, event_name, event_status, price)
VALUES (1, '2018-12-25 22:00:00', 'Christmas party', 'planned', 90);

INSERT INTO Event (venue_id, event_date_and_time, event_name, event_status, price)
VALUES (2, '2019-06-12 15:00:00', 'Finnish summer', 'planned', 55);

INSERT INTO Event (venue_id, event_date_and_time, event_name, event_status, price)
VALUES (2, '2019-06-04 20:00:00', 'ZZ Top Helsinki', 'planned', 119);

INSERT INTO Event (venue_id, event_date_and_time, event_name, event_status, price)
Values (2, '2018-11-12 19:30:00', 'Autumn heat', 'planned', 120);

-- Event Performance
SET IDENTITY_INSERT EventPerformance ON
INSERT INTO EventPerformance (event_id, performer_id, type)
Values (2, 12790, 'other');

INSERT INTO EventPerformance (event_id, performer_id, type)
Values (3, 12794, 'other');

INSERT INTO EventPerformance (event_id, performer_id, type)
VALUES (4, 12791, 'concert');

INSERT INTO EventPerformance (event_id, performer_id, type)
VALUES (4, 12793, 'concert');

INSERT INTO EventPerformance (event_id, performer_id, type)
VALUES (5, 12792, 'concert');

INSERT INTO EventPerformance (event_id, performer_id, type)
VALUES (6, 12794, 'concert');

INSERT INTO EventPerformance (event_id, performer_id, type)
VALUES (6, 12795, 'concert');

INSERT INTO EventPerformance (event_id, performer_id, type)
Values (6, 12796, 'concert');
SELECT * FROM Event

--Booking
INSERT INTO Booking (booking_status, ticket_number, event_id, booking_date_and_time, memo)
VALUES ('sold', 4, 2, '2018-09-12 10:03:01', '+4567880943');

INSERT INTO Booking (booking_status, ticket_number, event_id, booking_date_and_time)
VALUES ('sold', 1, 2, '2018-10-04 22:03:11');

INSERT INTO Booking (booking_status, ticket_number, event_id, booking_date_and_time, memo)
VALUES ('booked', 2, 3, '2018-12-08 01:40:14', 'rhion.gic@gmail.com');

INSERT INTO Booking (booking_status, ticket_number, event_id, booking_date_and_time, memo)
VALUES ('sold', 1, 4, '2018-11-12 19:38:38', '+27389239880');

INSERT INTO Booking (booking_status, ticket_number, event_id, booking_date_and_time)
VALUES ('sold', 3, 6, '2018-12-08 10:01:00');

INSERT INTO Booking (booking_status, ticket_number, event_id, booking_date_and_time)
VALUES ('sold', 1, 5, '2018-09-09 09:09:01');

INSERT INTO Booking (booking_status, ticket_number, event_id, booking_date_and_time)
VALUES ('sold', 5, 6, '2018-12-01 14:00:18');

