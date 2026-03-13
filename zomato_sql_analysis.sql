create database zomato;
use zomato;
select * from session limit 5;
describe session;

-- null value
select count(*) from session 
where session_id is null; 

-- count of data
select count(*) from session;

-- user count
select count(distinct user_id) as total_users 
from session;

-- restaurant count
select count(distinct restaurant_id) as total_restaurant from session;



-- count of order placed
select count(*) from session 
where restaurant_online_order='Yes';

-- count of order unplaced
select count(*) from session 
where restaurant_online_order='No';

-- top 5 restaurants
select restaurant_name,round(max(restaurant_rating),2) as highest_rating
from session
group by restaurant_name
order by highest_rating desc limit 5;

-- lowest 5 restaurants
select restaurant_name,round(min(restaurant_rating),2) as rating from session 
where restaurant_online_order='Yes'
group by restaurant_name
order by rating limit 5;

-- top 5 restaurants where order placed
select restaurant_name,round(avg(restaurant_rating),2) as rating from session 
where restaurant_online_order='Yes'
group by restaurant_name
order by rating desc limit 5;

-- 5 lowest rating restaurants where order placed 
select restaurant_name,round(avg(restaurant_rating),2) as rating from session 
where restaurant_online_order='Yes'
group by restaurant_name
order by rating limit 5;

-- top 5 restaurant type where order placed
select restaurant_type,count(*) as type_count
from session
where restaurant_online_order='Yes'
group by restaurant_type
order by type_count desc limit 5;

-- lowest 5 restaurant type where order placed
select restaurant_type,count(*) as type_count
from session
where restaurant_online_order='Yes'
group by restaurant_type
order by type_count limit 5;

-- top 10 restaurants in city with lowest avg dlvry time
select restaurant_name, restaurant_city,round(min(restaurant_delivery_time_avg),2) as delivery_timing
from session 
group by restaurant_name, restaurant_city
order by delivery_timing limit 10;

-- highest order placed restaurant and city
select restaurant_name, restaurant_city,count(*) as city_count
from session 
where restaurant_online_order='Yes'
group by restaurant_name, restaurant_city
order by city_count desc limit 1;

-- lowest order placed restaurant and city 
select restaurant_name, restaurant_city,count(*) as city_count
from session 
where restaurant_online_order='Yes'
group by restaurant_name, restaurant_city
order by city_count limit 1;

-- max orders count
select restaurant_name,restaurant_city,sum(restaurant_avg_orders_per_day) as max_orders
from session 
group by restaurant_name,restaurant_city
order by max_orders desc limit 5;

-- highest order placed city count
select restaurant_city,count(*) as city_count
from session 
where restaurant_online_order='Yes'
group by restaurant_city
order by city_count desc limit 1;

-- lowest order placed city count
select restaurant_city,count(*) as city_count
from session 
where restaurant_online_order='Yes'
group by restaurant_city
order by city_count limit 1;

-- order placed weather condition
select weather_condition,count(*) as weather_count
from session 
where restaurant_online_order='Yes'
group by weather_condition;

-- add on based weather
select user_preferred_addon_category,weather_condition,count(*) as orders 
from session 
where  restaurant_online_order='Yes'
group by user_preferred_addon_category,weather_condition
order by orders desc limit 5;

-- highest delivery in which meal time
select meal_time,count(*) as order_time
from session
where  restaurant_online_order='Yes'
group by meal_time
order by order_time desc;

-- order according to offer
select has_offer,count(*) from session
where  restaurant_online_order='Yes'
group by  has_offer;

-- fast delivery city
select restaurant_city,
round(avg(restaurant_delivery_time_avg),2) as avg_delivery
from session
group by restaurant_city
order by avg_delivery;

-- offer wise order %
select has_offer,
count(*) as orders,
round(count(*)*100.0/sum(count(*)) over(),2) as percentage
from session
where restaurant_online_order='Yes'
group by has_offer;

-- rank restaurants by order
select restaurant_name,count(*) as total_orders,
rank() over(order by count(*) desc) as restaurant_rank
from session
where restaurant_online_order='Yes'
group by restaurant_name;

-- rank restaurants in each city by rating
select restaurant_name,restaurant_city,round(avg(restaurant_rating),2) as avg_rating,
rank() over(partition by restaurant_city order by avg(restaurant_rating) desc) as ranks
from session
group by restaurant_name,restaurant_city;

-- top 3 restaurants in each city
select *
from (select restaurant_name,restaurant_city,round(avg(restaurant_rating),2) as avg_rating,
	rank() over(partition by restaurant_city order by avg(restaurant_rating) desc) as ranks
	from session
	group by restaurant_name,restaurant_city
)t
where ranks <=3;

-- classification of restaurants based on rating
select
case
when restaurant_rating>=4.5 then "Excellent"
when restaurant_rating>=3 then "Medium"
else "Low"
end rating_level,
count(*) AS total_restaurants
FROM session
GROUP BY rating_level;

-- detailed classification of restaurants based on rating
select restaurant_name,restaurant_city,
case
when restaurant_rating>=4.5 then "Excellent"
when restaurant_rating>=3 then "Medium"
else "Low"
end rating_level
FROM session;

-- order placed weather condition ranking
select weather_condition,count(*) as order_count,
rank() over(order by count(*) desc) as ranks 
from session 
where restaurant_online_order='Yes'
group by weather_condition;

-- add_on preference 
select user_preferred_addon_category,count(*) as add_on,
rank() over(order by count(*) desc) as ranks
from session
where restaurant_online_order='Yes'
group by user_preferred_addon_category;

-- user segment count
select user_segment,count(*) as segment_count,
rank() over (order by count(*) desc) as ranks
from session
group by  user_segment;


-- base cart items
with item_categories as (
select base_cart_item_names,count(*) as total_items
from session
where restaurant_online_order='Yes'
group by base_cart_item_names
order by total_items desc)

select *
from item_categories;
