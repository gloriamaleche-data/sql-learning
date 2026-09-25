/* We define our database schema. A schema defines the structure of our database. 
A blueprint that defines: What tables exists, what columns each table has, what datatypes 
those columns use, how tables are related, and what rules or constraints apply. */

-- THIS IS KNOWN AS THE DATA DEFINITION LANGUAGE (DDL) where we CREATE our table structures/skeleton --

-- We begin by creating the database and shifting to using it --
CREATE DATABASE cinema_analysis;
USE cinema_analysis;

-- Create the movies table with its column datatypes and constraints --
CREATE TABLE movies (
	movie_id INT NOT NULL,
	title VARCHAR(255) NOT NULL,
	genre VARCHAR(80),
	release_year INT,
	duration_minutes INT,
	rating VARCHAR(10),
	CONSTRAINT pk_movies PRIMARY KEY(movie_id)
)

-- Create the customers table with its column datatypes and constraints --

CREATE TABLE customers (
	customer_id INT PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	age INT,
	city VARCHAR(255)
)

-- Create the tickets table with its column datatypes and constraints --

CREATE TABLE tickets (
	ticket_id INT PRIMARY KEY,
	movie_id INT,
	customer_id INT,
	ticket_date DATE,
	show_time TIME,
	ticket_price DECIMAL(8,2)
)
