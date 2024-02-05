--ex1
with count_table as 
(select company_id,title, description,
count(job_id) as job_count
from job_listings
group by company_id, title, description)
select count(*) from count_table
where job_count >1;

--ex2
select category, product,
sum(spend) as total_spend
from product_spend
where extract (year from transaction_date) = 2022
group by category, product
order by category, total_spend desc;

--ex3
select count(*) from (select policy_holder_id,
count(case_id) as count_case
from callers 
group by policy_holder_id
having count(case_id) >2) as count_table;

--ex4
SELECT pages.page_id
FROM pages
FULL JOIN page_likes 
on pages.page_id=page_likes.page_id
where page_likes.liked_date is null
order by pages.page_id;

--ex5
select 7 as month,
count (*) as monthly_active_users
from (select user_id,
count(distinct event_type) as action_count
from user_actions
where extract (month from event_date) in ('6','7')
group by user_id) as count_table
where action_count >2;

--ex6
mình dùng thử cả to_char và extract nhưng đều không được? không biết vì sao mong bạn giải đáp giúp mình

--ex7 
select product_id, year as first_year, quantity, price from sales
where (product_id, year) in (select product_id,
min (year) from sales group by product_id;

--ex8
select customer_id
from Customer
group by customer_id
having count(distinct product_key) = (select count(product_key) from Product);

--ex9
select employee_id
from Employees
where salary <30000 
and manager_id not in (select employee_id from employees)
order by employee_id;

--ex10
mình ấn vào link ra link bài ex1

--ex11
with cte1 as 
(select t2.name, count(distinct t3.movie_id) as count
from Users as t2
join MovieRating as t3
on t2.user_id = t3.user_id
group by t3.user_id
order by name asc
limit 1),
cte2 as (
select t1.title,
avg(t3.rating) as avg_rate
from Movies as t1
join MovieRating as t3
on t1.movie_id = t3.movie_id
where created_at like '2020-02%'
group by t3.movie_id
order by avg(t3.rating) desc, title asc
limit 1)
select name as results from cte1
union all
select title as results from cte2;

--ex12
with new_table_id as (select requester_id as id
from RequestAccepted
union all
select accepter_id as id
from RequestAccepted)
select id, count(id) as num
from new_table_id
group by id 
order by num desc
limit 1;
