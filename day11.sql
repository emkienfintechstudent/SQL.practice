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


