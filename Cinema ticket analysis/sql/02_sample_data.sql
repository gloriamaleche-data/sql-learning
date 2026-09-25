-- We now insert data into our empty tables --

-- THIS IS KNOWN AS THE DATA MANIPULATION LANGUAGE (DML) where we now add/inssert data INTO the tables --

-- Insert 5 movies into table MOVIES using the manual 'insert' method: --

INSERT INTO movies (movie_id, title, genre, release_year, duration_minutes, rating)
VALUES ( 1, 'Project Hail Mary', 'Sci-Fi', 2026, NULL, 8),
		(2, 'Send Help', NULL, 2024, 113, 7), 
		(3, 'The Rip', 'Crime/Drama', 2025, 113, 7),
		(4, 'The Odyssey', 'Action', 2020, 172, 8),
		(5, '28 Years Later', 'Horror', 2022, 109, NULL);

-- ************************************************************************************ --
/* We want to change the column name 'rating' to 'rating_score'
and change its datatype to 'DECIMAL(3,1) */

/* This code says, 'Execute the built-in rename function on the rating column in
table movies, rename it to rating_score, where the item is a column */

EXEC sp_rename 'movies.rating', 'rating_score', 'COLUMN';

/* Then we alter the column datatype as such: */

ALTER TABLE movies
ALTER COLUMN rating_score DECIMAL(3,1); 

-- Insert 8 customers to table customers --

INSERT INTO customers (customer_id, first_name, last_name, age, city)
VALUES (1, 'Laurence', 'Mwaura', 23, 'Nairobi'),
		(2, 'Peter', 'Wanga', 45, NULL),
		(3, 'Daniel', 'Kwanti', 34, 'Voi'),
		(4, 'Jane', 'Wanja', 19, 'Kisumu'),
		(5, 'Mary', 'Nasieku', NULL, NULL),
		(6, 'Gloria', 'Njeru', 38, 'Rongai'),
		(7, 'Tim', 'Waura', NULL, 'Kiserian'),
		(8, 'Mark', 'Zabba', 52, NULL);

-- Insert 15 tickets into table tickets --

INSERT INTO tickets (ticket_id, movie_id, customer_id, ticket_date, show_time, ticket_price)
VALUES (1, 2, 5, '2026-01-10', '10:30', 588.30),
		(2, 4, 4, '2026-01-18', '14:00', 1200.00),
		(3, 3, 6, '2026-02-05', '19:30', 300.98),
		(4, 5, 1, '2026-02-14', '16:00', 364.83),
		(5, 4, 5, '2026-02-22', '20:00', 1200.00),
		(6, 1, 8, '2026-03-03', '11:00', 1200.99),
		(7, 3, 4, '2026-03-15', '18:30', 1300.00),
		(8, 2, 1, '2026-04-02', '13:30', 384.84),
		(9, 3, 2, '2026-04-18', '20:30', 1500.00),
		(10, 4, 7, '2026-05-01', '15:00', 1200.00),
		(11, 1, 8, '2026-05-16', '19:00', 1800.00),
		(12, 2, 3, '2026-06-07', '12:00', 540.30),
		(13, 5, 6, '2026-06-21', '17:30', 390.00),
		(14, 2, 5, '2026-07-11', '14:30', 500.00),
		(15, 1, 4, '2026-07-25', '21:00', 478.99);

-- Adding a row into table movies --
SELECT * FROM movies;

INSERT INTO movies
VALUES (6, 'Avengers', 'Action', 2026, 180, 8.2);
