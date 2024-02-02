--ex1
SELECT COUNTRY.CONTINENT,  
FLOOR(AVG(CITY.POPULATION))
FROM COUNTRY
INNER JOIN CITY
ON CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY COUNTRY.CONTINENT;

--ex2 
SELECT 
round (cast(count(texts.email_id) as decimal) /count(distinct emails.email_id),2) as rate
FROM emails 
left join texts
on emails.email_id = texts.email_id
and texts.signup_action = 'Confirmed';

--ex3
SELECT age_breakdown.age_bucket,
ROUND(100.0*(sum (case when activities.activity_type ='send' then activities.time_spent else 0 end)
/(sum (case when activities.activity_type ='send' then activities.time_spent else 0 end)
+ sum (case when activities.activity_type ='open' then activities.time_spent else 0 end))),2)
as send_perc,
ROUND(100.0*(sum (case when activities.activity_type ='open' then activities.time_spent else 0 end)
/(sum (case when activities.activity_type ='send' then activities.time_spent else 0 end)
+ sum (case when activities.activity_type ='open' then activities.time_spent else 0 end))),2)
as open_perc
FROM activities 
INNER JOIN age_breakdown
on activities.user_id = age_breakdown.user_id 
group by age_breakdown.age_bucket;

--ex4
SELECT customer_id
FROM customer_contracts as a
INNER JOIN products as b
ON a.product_id = b.product_id 
group by customer_id
having count(distinct b.product_category)= '3';

--ex5
select t1.employee_id, t1.name,
count(t2.employee_id) as reports_count,
round (avg(t2.age),0) as average_age
from Employees as t1
inner join Employees as t2
on t2.reports_to = t1.employee_id;

--ex6
select products.product_name, sum(orders.unit) as unit
from products
join orders
on products.product_id = orders.product_id
where orders.order_date between '2020-02-01' and '2020-02-29'
group by products.product_id
having unit >= 100;

--ex7
SELECT pages.page_id
FROM pages
FULL JOIN page_likes 
on pages.page_id=page_likes.page_id
where page_likes.liked_date is null
order by pages.page_id;

--MID-COURSE TEST
--ex1
select distinct replacement_cost from film
order by replacement_cost asc;

--ex2
select  
sum (case when replacement_cost between 9.99 and 19.99 then 1 else 0 end) as low,
sum (case when replacement_cost between 20.00 and 24.99 then 1 else 0 end) as medium, 
sum (case when replacement_cost between 25.00 and 29.99 then 1 else 0 end) as high
from film;

--ex3
select film.title , film.length, category.name
from film
join film_category 
on film.film_id = film_category.film_id
join category
on film_category.category_id = category.category_id
where category.name in ('Drama', 'Sports')
order by film.length desc;

--ex4
select category.name,
count (film.title) as count_titles
from film
join film_category 
on film.film_id = film_category.film_id
join category
on film_category.category_id = category.category_id
group by category.name
order by count (film.title) desc;

--ex5 (bài này mình không tính ra được Susan David 54)
select 
concat (actor.first_name, ' ', actor.last_name) as full_name,
count (film_actor.film_id) as film_number
from actor
full join film_actor
on actor.actor_id = film_actor.actor_id
group by actor.actor_id 
order by film_number desc;

--ex6
select 
count (address.address_id) as count_address
from address
left join customer
on address.address_id =customer.address_id
where customer.customer_id is null;

--ex7 
select 
count (address.address_id) as count_address
from address
left join customer
on address.address_id =customer.address_id
where customer.customer_id is null;

--ex8
select 
concat (t4.city, ', ', t5.country) as city_country,
sum (t1.amount) as city_amount
from payment as t1
join customer as t2
on t1.customer_id = t2.customer_id
join address as t3
on t2.address_id = t3.address_id
join city as t4
on t3.city_id = t4.city_id
join country as t5
on t4.country_id = t5.country_id
group by city_country
order by city_amount asc;


