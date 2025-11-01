Use Swiggy;
Select * from swiggy;

-- 1.	Which restaurant of Abohar is visited by the least number of people?
select * from swiggy
where city = 'Abohar' and rating_count =(select min(rating_count) from swiggy );

-- 2.	Which restaurant has generated maximum revenue all over India?
select avg(ra)
where rating_count*cost = (select max(rating_count*cost) from swiggy );

-- 3.	How many restaurants are having a rating more than the average rating?
select count(*) from swiggy
where rating > (select avg(rating)from swiggy);

-- 4.	Which restaurant of Delhi has generated the most revenue?
select * from swiggy
where city = 'Delhi' and rating_count * cost = 
(select max(rating_count*cost)from swiggy where city = 'Delhi');

-- 5.	Which restaurant chain has the maximum number of restaurants?
select name, count(name) as 'restaurant_chain' from swiggy
group by name 
order by restaurant_chain desc limit 1;


-- 6.	Which restaurant chain has generated maximum revenue?
select name, sum(cost*rating_count) as 'revenue' from swiggy
group by name 
order by revenue desc limit 1;

-- 7.	Which city has the maximum number of restaurants?
select city, count(*) as 'maximum_number' from swiggy
group by city
order by maximum_number desc;

-- 8.	Which city has generated maximum revenue all over India?
select city, sum(rating_count*cost) as 'maximum_revenue' from swiggy
group by city
order by maximum_revenue desc limit 10;
-- 9.	List the 10 least expensive cuisines.
select cuisine, avg(cost) as 'expensive_cuisines' from swiggy
group by cuisine
order by expensive_cuisines limit 10;

-- 10.	List the 10 most expensive cuisines.
select cuisine, avg(cost) as 'expensive_cuisines' from swiggy
group by cuisine
order by expensive_cuisines desc limit 10;

-- 11.	What is the city having Biryani as the most popular cuisine?
select city, avg(rating_count) as 'popular_cuisine' from swiggy
where cuisine = 'Biryani'
group by city
order by popular_cuisine desc
limit 10;

-- 12.	List top 10 unique restaurants with unique names only throughout the dataset as per generated maximum revenue (single restaurant with that name).
Select name, sum(cost* rating_count ) as 'Revenue' from swiggy
group by name having count(name) = 1
order by Revenue desc limit 10;

