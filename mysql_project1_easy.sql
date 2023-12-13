-- Question Set 1 - Easy
-- Q1: Who is the senior most employee based on job title?
select * from employee order by levels desc LIMIT 1;

-- Q2: Which countries have the most invoices?
select count(*) as c, billing_country
from invoice GROUP BY billing_country
ORDER BY c DESC;

-- Q3: What are top 3 values of total invoice?
select billing_country,billing_city,total from invoice 
order by total desc LIMIT 3;

-- Q4: Which city has the best customers? we would like to trow a promotional Music Festival in the city we made the most moneey. 
-- Write a query that returns one city that has the highest sum of invoice totals. 
-- Return both the city name and sum of all invoice totals.

select billing_city,SUM(total) as invoice_total   
from invoice
group by billing_city
order by invoice_total DESC LIMIT 1 ;

-- Q5: Who is the best custome? The customer who has spent the most money will be declared the best customer.
-- write a query that returns the person who has spent the most money.

SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) AS total_money_spent
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY 1,2,3
ORDER BY total_money_spent DESC LIMIT 1;