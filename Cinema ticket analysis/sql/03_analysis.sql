/* After defining our database schema and inserting values,
we get into data anlaysis through QUERYING THE DATA using SELECT statements */
USE cinema_analysis;
-- 1. Return the title, genre, and release year of every movie --
SELECT title, genre, release_year
FROM movies;

-- 2. Return the title, genre, and rating score of every movie with a rating score greater than 7 --
SELECT title, genre, rating_score
FROM movies
WHERE rating_score > 7;

-- 3. Return the title, genre, and rating score of every movie that was released after 2023 and have a rating score of at least 7 --
SELECT title, genre, rating_score
FROM movies
WHERE release_year > 2023 AND rating_score >= 7;

-- 4. Return all movies, sorted by rating_score from highest to lowest --
SELECT *
FROM movies
ORDER BY rating_score DESC;

-- 5. Return all movies, sorted by release_year from newest to oldest. If two movies have the same release year, sort those alphabetically by title. --
SELECT *
FROM movies
ORDER BY release_year DESC, title ASC;

-- 6. Find the total number of movies in the movies table. --
SELECT COUNT(*) as total_movie_nos
FROM movies;

-- 7. Find the average rating_score of the movies.--
SELECT AVG(rating_score) as average_rating_score
FROM movies;

-- 8. Find the lowest and highest rating score --
SELECT MAX(rating_score) as max_rating_score, MIN(rating_score) as min_rating_score
FROM movies;

-- 9. Find the total revenue generated from all tickets.--
SELECT SUM(ticket_price) as total_revenue
FROM tickets;

-- 10. Find the average ticket price.--
SELECT AVG(ticket_price) as average_ticket_price
FROM tickets;

-- 11. Find the number of tickets sold for each movie_id.--
SELECT movie_id, COUNT(movie_id) as no_of_tickets
FROM tickets
GROUP BY movie_id;

-- 12. Find the total ticket revenue for each movie_id.--
select movie_id, SUM(ticket_price) as total_revenue_for_each_movie_id
FROM tickets
GROUP BY movie_id;

-- 13. Find the average ticket price for each movie_id.--
select movie_id, AVG(ticket_price) as avg_ticket_price
FROM tickets
GROUP BY movie_id;

-- 14. Find the movie_ids whose total ticket revenue is greater than 2,000. --
SELECT movie_id, SUM(ticket_price) total_revenue_for_each_movie_id
FROM tickets
GROUP BY movie_id
HAVING SUM(ticket_price) > 2000;

-- 15. Find all tickets sold during March and April 2026, return ticket_id, ticket_date, ticket_price --
SELECT ticket_id, ticket_date, ticket_price
FROM tickets
WHERE ticket_date BETWEEN '2026-03-01' AND '2026-04-30';

-- 16. Find all tickets for shows starting at 6:00 PM or later.--
SELECT *
FROM tickets
WHERE show_time >= '18:00';

-- 17. Find movies where either genre or rating_score is missing.--
SELECT *
FROM movies
WHERE genre is NULL OR rating_score is NULL;

-- 18. Find movie ids that have at least 2 tickets and generate more than 2000 in total revenue --
SELECT movie_id, COUNT(movie_id) AS no_of_tickets, SUM(ticket_price) AS total_ticket_revenue
FROM tickets
GROUP BY movie_id
HAVING COUNT(movie_id) >= 2 AND SUM(ticket_price) > 2000;

-- 19. Find the average age of customers whose age is available.--
SELECT AVG(age) AS average_age
FROM customers
WHERE age is not NULL;

-- 20. Using only the tickets table, determine which movie_id generated the highest total ticket revenue --
SELECT movie_id, COUNT(movie_id) AS no_of_tickets, SUM(ticket_price) AS total_ticket_revenue
FROM tickets
GROUP BY movie_id
ORDER BY total_ticket_revenue DESC;


-- JOIN Analysis --
-- Return movie title, ticket date, ticket price for every ticket that has a matchong movie:

SELECT movies.title, tickets.ticket_date, tickets.ticket_price
FROM movies
INNER JOIN tickets
ON movies.movie_id = tickets.movie_id

-- Return customer's first name, customer's last name, ticket date, ticket price for every ticket with a matching customer:
SELECT customers.first_name, customers.last_name, tickets.ticket_date, tickets.ticket_price
FROM customers
INNER JOIN tickets
ON customers.customer_id = tickets.customer_id;

-- Return movie title, customer's first name, ticket date, ticket price:
SELECT movies.title, customers.first_name AS CustomersFirstName, tickets.ticket_date,  tickets.ticket_price
FROM tickets
INNER JOIN customers
ON tickets.customer_id = customers.customer_id
INNER JOIN movies
ON tickets.movie_id = movies.movie_id;

-- Return every movie and the number of tickets sold for it:
SELECT movies.movie_id, title, COUNT(tickets.ticket_id) AS tickets_sold
FROM movies
LEFT JOIN tickets
ON movies.movie_id = tickets.movie_id
GROUP BY movies.movie_id, title;

-- Return every customer and the tickets they purchased:
SELECT customers.customer_id, first_name, last_name, COUNT(ticket_id) AS tickets_purchased
FROM customers
LEFT JOIN tickets
ON customers.customer_id = tickets.customer_id
GROUP BY customers.customer_id, first_name, last_name;

-- Using right join, return every ticket and its corresponding movie title:
SELECT *
FROM movies
RIGHT JOIN tickets
ON tickets.movie_id = movies.movie_id;

-- Return all movies and all tickets, showing their matching relationships where they exist:
SELECT *
FROM movies
FULL JOIN tickets
ON movies.movie_id = tickets.movie_id;

-- Find movies that have never had a ticket sold:
SELECT *
FROM movies
LEFT JOIN tickets
ON movies.movie_id = tickets.movie_id
WHERE ticket_id IS NULL;

-- Find customers who have never purchased a ticket:###
SELECT *
FROM customers
LEFT JOIN tickets
ON customers.customer_id = tickets.customer_id
WHERE ticket_id IS NULL;

-- Find records that don't have a match between movies and tickets:
SELECT *
FROM movies
FULL JOIN tickets
ON movies.movie_id = tickets.movie_id
WHERE movies.movie_id IS NULL or tickets.ticket_id IS NULL;

-- Generate every possible combinatioj of movie title and customer first name:
SELECT movies.title, customers.first_name
FROM movies
CROSS JOIN customers;

-- Produce a cinema sales report containing movie title, genre, customer first name, customer last name, ticket date, show time, ticket price:
SELECT customers.first_name, customers.last_name, movies.title, movies.genre, tickets.ticket_date, tickets.ticket_price, tickets.show_time
FROM tickets
LEFT JOIN customers
ON tickets.customer_id = customers.customer_id
LEFT JOIN movies
ON tickets.movie_id = movies.movie_id;

-- Find the total revenue generated by each movie:
SELECT movies.movie_id, title, SUM(ticket_price) AS total_revenue
FROM movies
LEFT JOIN tickets
ON movies.movie_id = tickets.movie_id
GROUP BY movies.movie_id, title;

-- Find the number of tickets purchased by each customer:
SELECT customers.customer_id, first_name, last_name, COUNT(ticket_id) AS tickets_purchased
FROM customers
LEFT JOIN tickets
ON customers.customer_id = tickets.customer_id
GROUP BY customers.customer_id, first_name, last_name;

-- Find movies whose total ticket revenue is greater than 2000:
SELECT movies.movie_id, title, SUM(ticket_price) AS total_revenue
FROM movies
LEFT JOIN tickets
ON movies.movie_id = tickets.movie_id
GROUP BY movies.movie_id, title
HAVING SUM(ticket_price) > 2000;

-- Find all tickets for movies in the Sci-Fi genre:
SELECT title, ticket_date, ticket_price
FROM tickets
LEFT JOIN movies
ON tickets.movie_id = movies.movie_id
WHERE movies.genre = 'Sci-Fi';

-- Find tickets purchased by customers from Nairobi:
SELECT first_name, last_name,title, ticket_date, ticket_price
FROM tickets
LEFT JOIN customers
ON tickets.customer_id = customers.customer_id
LEFT JOIN movies
ON tickets.movie_id = movies.movie_id
WHERE city = 'Nairobi';

-- Find the average ticket price for each movie, sort from highest average price to lowest:
SELECT title, AVG(ticket_price) AS average_ticket_price
FROM movies
LEFT JOIN tickets
ON movies.movie_id = tickets.movie_id
GROUP BY title
ORDER BY average_ticket_price DESC;

-- Find the total amount spent by each customer:
SELECT customers.customer_id, first_name, last_name, SUM(ticket_price) AS total_spent
FROM customers
LEFT JOIN tickets
ON customers.customer_id = tickets.customer_id
GROUP BY customers.customer_id, first_name, last_name;

-- Create a report showing: movie title, genre, number of tickets sold, total revenue, average ticket price:
SELECT title, genre,COUNT(ticket_id) AS number_of_tickets_sold, SUM(ticket_price) AS total_revenue, AVG(ticket_price) AS average_ticket_price 
FROM movies
LEFT JOIN tickets
ON movies.movie_id = tickets.movie_id
GROUP BY title, genre
ORDER BY total_revenue DESC;