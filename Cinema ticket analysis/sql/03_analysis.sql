/* After defining our database schema and inserting values,
we get into data anlaysis through QUERYING THE DATA using SELECT statements */

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

SELECT *
FROM tickets;