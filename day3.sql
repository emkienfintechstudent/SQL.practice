--ex1
SELECT DISTINCT CITY FROM STATION
WHERE ID%2=0;
--ex2
SELECT COUNT(CITY) - COUNT (DISTINCT CITY)
FROM STATION;
--ex3
SELECT CEILING(AVG(salary - REPLACE(salary,0,''))) FROM EMPLOYEES;
--ex4
SELECT 
ROUND(CAST(sum(item_count*order_occurrences) / sum(order_occurrences))as DECIMAL, 1) as mean 
from items_per_order;
--ex5
SELECT candidate_id
FROM candidates
where skill in ('Python', 'Tableau', 'PostgreSQL')
GROUP BY  candidate_id
HAVING count(skill) = 3;
--ex6
SELECT user_id, 
(Max(DATE(post_date))-Min(DATE(post_date))) as days_between 
FROM posts
where post_date >= '2021-01-01' and post_date < '2022-01-01'
Group by user_id
Having (Max(DATE(post_date))-Min(DATE(post_date))) != 0;
--ex7
SELECT card_name, 
(Max(issued_amount)-Min(issued_amount)) as difference
FROM monthly_cards_issued
group by card_name
order by Max(issued_amount)-Min(issued_amount) DESC;
--ex8
SELECT manufacturer, 
count(drug) as drug_count, 
ABS(sum((cogs - total_sales))) as total_loss
FROM pharmacy_sales
where cogs > total_sales
GROUP BY manufacturer
order by total_loss DESC;
--ex9
select * from Cinema
where id%2 = 1 and description != 'boring'
order by rating desc;
--ex10
select teacher_id, count(distinct subject_id) as cnt
from Teacher
group by teacher_id;
--ex11
select user_id, count(follower_id) as followers_count
from Followers
group by user_id
order by user_id;
--ex12
select class
from Courses
group by class
having count(student) >=5;
