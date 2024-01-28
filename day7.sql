--ex1
select name
from students
where marks >75
order by right(name,3), ID asc;

--ex2
select user_id,
CONCAT(Upper(left(name,1)), lower(right(name,length(name)-1))) as name
from users
order by user_id;

--ex3
select manufacturer,
concat('$', round(sum(total_sales)/1000000), ' million') as sales
from pharmacy_sales
group by manufacturer
order by sum(total_sales) desc,  manufacturer asc;

-- ex4
select extract(month from submit_date) as mth,
product_id as product,
round(avg(stars),2) as avg_stars
from reviews
group by extract(month from submit_date), product_id
order by mth asc, product;

--ex5
select sender_id, 
count (message_id) as message_count
from messages
where extract (month from sent_date)= '08' and extract (year from sent_date) ='2022'
group by sender_id
order by message_count DESC
limit 2;

--ex6
select tweet_id from tweets
where length(content)>15;

--ex7
select activity_date as day,
count(distinct(user_id)) as active_users
from Activity
where activity_date between '2019-06-28' and '2019-07-27'
group by activity_date;

--ex8
select count(id) as number_employees
from employees
where extract (month from joining_date) between '01' and '07'
and extract (year from joining_date) = '2022';

--ex9
select position ('a' in first_name) as position
from worker
where first_name = 'Amitah';

--ex10
select winery as wine_title,
substring (title from (length(winery)+2) for 4) as year
from winemag_p2
where country = 'Macedonia';





