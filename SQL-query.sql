
# 1. Create database

# 2. Create table called 'house_price_data'

CREATE TABLE IF NOT EXISTS house_price_data (
	id bigint(11) NOT NULL,
	date char(15),
	bedrooms int(11),
	bathrooms float(11),
	sqft_living int(11),
	sqft_lot int(11),
	floors float(11),
	waterfront int(11),
	house_view int(11),
	house_condition int(11),
	grade int(11),
	sqft_above int(11),
	sqft_basement int(11),
	yr_built int(11),
	yr_renovated int(11),
	zipcode int(11),
	house_lat float(11),
	house_long float(11),
	sqft_living15 int(11),
	sqft_lot15 int(11),
	price int(11)
);

drop table if exists house_price_data;

# 3. Import dataset

SHOW VARIABLES LIKE 'local_infile';

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE '/Users/siriamanda/Desktop/Ironhack/mid-term-project/regression_data_clean.csv'
INTO TABLE house_price_data
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

# 4. Select all data from table

select * from house_price_data;

# 5. Drop column 'date'

alter table house_price_data
drop column date;

select * from house_price_data;

# 6. Count the number of rows

select count(id) from house_price_data;

# 7. Find the unique values of bedrooms, bathrooms, floors, house_condition and grade

select distinct(bedrooms) 
from house_price_data;

select distinct(bathrooms) 
from house_price_data;

select distinct(floors) 
from house_price_data;

select distinct(house_condition) 
from house_price_data;

select distinct(grade) 
from house_price_data;

# 8. Arrange the data in a decreasing order by the price of the house, return only the ID's of the 10 most expensive houses.

select id as ID
from house_price_data
order by price DESC
LIMIT 10;

# 9. Average selling price

select avg(price) as "average_price"
from house_price_data;

# 10. Group by clauses

# Average price grouped by bedroom

select bedrooms, avg(price) as "average_price"
from house_price_data
group by bedrooms;

# Average `sqft_living` grouped by bedroom

select bedrooms, avg(sqft_living) as "avg_living_room_space"
from house_price_data
group by bedrooms;

# Average price grouped by waterfront

select waterfront, avg(price) as "average_price"
from house_price_data
group by waterfront;

# Is there correlation between the columns `condition` and `grade`?

select house_condition, sum(grade)
from house_price_data
group by house_condition
order by house_condition DESC;

# From the query we see that there is no correlation between condition and grade

# 11. Simple query that matches customer request:

select *
from house_price_data
where (bedrooms = 3 or bedrooms = 4)
and bathrooms >= 3
and floors = 1
and waterfront = 0
and house_condition >= 3
and grade >= 5
having price < 300000;

# 12. Properties whose price are twice more than the average price of all properties using subquery

select *
from house_price_data
where price > (select avg(price) * 2 from house_price_data);

# 13. Create a view with above query

create or replace view high_price_properties as
select *
from house_price_data
where price > (select avg(price) * 2 from house_price_data);

# 14. Average price for houses with 3 or 4 bedrooms

select bedrooms, avg(price) as avg_price
from house_price_data
where bedrooms in (3, 4)
group by bedrooms;

# 15. Properties are available at 70 different locations:

select distinct(zipcode)
from house_price_data;

# 16. List of properties that have been renovated:

select *
from house_price_data
where yr_renovated <> 0;

# 17. Find the 11th most expensive property using a CTE table

with cte_expensive_properties as (
select *
from house_price_data
order by price DESC
LIMIT 11
)
select * 
from cte_expensive_properties
order by price ASC
LIMIT 1;