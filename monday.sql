-- Week 5 - Monday Questions

-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT(*)
FROM actor
WHERE last_name = 'Wahlberg';
-- (Two actors)


-- 2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(*)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
-- (5,607 Payments)


-- 3. What film does the store have the most of? (search in inventory)
SELECT film_id, COUNT(*) AS copies
FROM inventory
GROUP BY film_id
HAVING COUNT(*) = 8
ORDER BY COUNT(*) DESC;
-- (72 films have 8 Copies each)


-- 4. How many customers have the last name ‘William’?
SELECT COUNT(*)
FROM customer
WHERE last_name = 'William';
-- (No customers exist with that last name)


-- 5. What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(*)
FROM rental
GROUP BY staff_id
ORDER BY COUNT(*) DESC
LIMIT 1;
-- (Staff ID: 1 sold the most rentals: 8,040 rentals.)


-- 6. How many different district names are there?
SELECT COUNT(DISTINCT district)
FROM address;
-- (378 District names)


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(*) AS cast_size
FROM film_actor
GROUP BY film_id
ORDER BY cast_size DESC
LIMIT 1;
-- (Film ID: 508 has the largest cast size of 15 actors)


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT store_id, COUNT(last_name)
FROM customer
WHERE last_name LIKE '%es'
GROUP BY store_id
LIMIT 1;
-- (Store ID 1 has 13 customers with a last name ending in 'es')


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT amount, COUNT(amount) AS rental_count
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250
ORDER BY rental_count DESC;
-- (3 payment amounts: '2.99', '4.99', and '0.99' had a total number of rentals above 250 for customers with ids between 380 and 430)


-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT COUNT(DISTINCT rating)
FROM film
-- (There are 5 Rating categories)

SELECT rating, COUNT(rating) AS rating_film_count
FROM film
GROUP BY rating
ORDER BY rating_film_count DESC;
-- (The rating 'PG-13' has the most movies in total: 223 movies)