.echo on
.headers on
.mode columns

--Scott Revillar
--file lab2C-revillar.sql
-- 25 JAN 2021

--1. List the employee IDs with the number of sales by each employee from most sales to least. I want to
--recognize the employees with the most sales.
 select employeeid, count(orderid) from orders group by employeeid order by count(orderid) desc;


--2. I want to look at the average discounts taken by all customers for products that cost more than $50.00.
--Specifically, I want to know the average discount of all orders for each product from the highest price
--to the lowest price.


--3. I am doing an analysis of which shippers ship to each country, and I need a report showing the number
--of orders each shipper delivered to each country and the nuber of orders. I don’t need the data where
--the number of orders is ten or less, but I need the report listed by country and the number of orders
--shipped to that country.



--4. For each order, what was the time lag between the order date and the ship date?


--5. Continuing with the previous query, I need the average time lag for each shipper.


--6. I am doing inventory, and I need to know the total price of each product on hand, that is, the price of
--each product line, sorted alphabetically by product name.


--7. What is the dollar total we have tied up in inventory?


--8. We have discovered that some customers favor certain employees. I need to know this information. I
--need a report of the most common employee/customer pairs, the nuber of times the employee took
o--rders from the customer, and the number of orders. Alphabetize this by customer id. Omit customer/employee pairs whre the number of orders is less than five.



--9. How many days were in the service (if you are a veteran), or how many days will you serve (assuming
--you know your ETS date)?
--10. Answer these questions using the built in time and date function.
--• What is today’s date?
--• What was the first day of the month?
--• What will be the first day of the next month?
--• What is the last day of this month?