/* Learning SQL  by Alan Beaulieu */

SHOW DATABASES;
USE sakila;
SHOW TABLES;

/* Exercises Ch 3*/
/* Ex 3-1 */
select actor_id, first_name, last_name from actor order by last_name, first_name;

/* Ex 3-2 */
select actor_id, first_name, last_name from actor_info where last_name in ('WILLIAMS','DAVIS');

/* Ex 3-3 */
select distinct customer_id from rental where date(rental_date)='2005-07-05';

/* Ex 3-4 */
select c.email, r.return_date
	from customer as c
		inner join rental as r
		on c.customer_id = r.customer_id
    where date(r.rental_date) = '2005-06-14'
    order by return_date desc;
    
/* Exercises Ch 4*/    
/* Ex 4-3 */    
select * from payment where amount in (1.98, 7.98, 9.98);

/* Ex 4-4 */
select first_name, last_name from customer where last_name like '_A%W%';

/* Exercises Ch 5*/ 
/* Ex 5-2 */
select f.title from film as f
	inner join film_actor as fa
    on f.film_id = fa.film_id
    inner join actor as a
    on fa.actor_id = a.actor_id
    where a.first_name = 'JOHN';
    
/* Ex 5-3 */
select a1.address as address1, a2.address as address2, a1.city_id as city_id 
from address as a1
	inner join address as a2
    on a1.city_id = a2.city_id
	where a1.address_id <> a2.address_id;    