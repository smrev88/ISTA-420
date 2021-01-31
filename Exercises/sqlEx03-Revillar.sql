.echo on
.headers on
.mode csv

-- Name: Scott Revillar
--File Name: sqlEx03-revillar.sql
--Date Jan 26 2021

--1. 

select o.customerid, c.contactname, o.employeeid, e.firstname || ' ' || e.lastname as emp_name, o.orderid, 
count(o.orderid) as num_orders, printf("%.2f",sum(od.quantity*od.unitprice)) as orders_total from orders o 
join order_details od on o.orderid = od.orderid join customers c on c.customerid = o.customerid 
join employees e on o.employeeid = e.employeeid  
group by c.customerid, e.employeeid, o.orderid 
having count(o.orderid) >= 5
order by orders_total desc; 


--2. Second, I want the least productive pairs with the same columns. The total of orders should be less than three, the dollar amount of the order is less than $50.00, and the orders are ranked by increasingdollar amounts, starting with the least order. 

select o.customerid, c.contactname, o.employeeid, e.firstname || ' ' || e.lastname as emp_name, o.orderid, 
count(o.orderid) as num_orders, printf("%.2f",sum(od.quantity*od.unitprice)) as orders_total from orders o 
join order_details od on o.orderid = od.orderid join customers c on c.customerid = o.customerid 
join employees e on o.employeeid = e.employeeid  
group by c.customerid, e.employeeid, o.orderid 
having count(o.orderid) < 3 and sum(od.quantity*od.unitprice) < 50
order by orders_total ;

--3. Third, I need the most productive pairs as in the first report above, omitting the order ID but ranked by the average amount from highest to lowest of all orders by the customer/employee pair. Include only pairs where the amount of the average exceeds $2,500.00.

select o.customerid, c.contactname, o.employeeid, e.firstname || ' ' || e.lastname as emp_name, o.orderid, 
count(o.orderid) as num_orders, printf("%.2f",avg(od.quantity*od.unitprice)) as orders_avg from orders o 
join order_details od on o.orderid = od.orderid join customers c on c.customerid = o.customerid 
join employees e on o.employeeid = e.employeeid  
group by c.customerid, e.employeeid, o.orderid 
having avg(od.quantity*od.unitprice) > 2500.00
order by orders_avg desc; 

 --4. Finally, I need the least productive pairs as ranked by average order amount, from lowest to highest, formatted as above. Omit the order ID. Include only pairs where the average order amount is less than $50.00.  
 
 select o.customerid, c.contactname, o.employeeid, e.firstname || ' ' || e.lastname as emp_name, o.orderid, 
count(o.orderid) as num_orders, printf("%.2f",avg(od.quantity*od.unitprice)) as orders_avg from orders o 
join order_details od on o.orderid = od.orderid join customers c on c.customerid = o.customerid 
join employees e on o.employeeid = e.employeeid  
group by c.customerid, e.employeeid, o.orderid 
having avg(od.quantity*od.unitprice) < 50
order by orders_avg ; 

--5. Please create a report with the order ID, the customer ID, the customer name, the customer country, and the dollar amount of the order, sorted alphabetically by country and numerically from highest to lowest by the dollar amount of the order, where the order total exceeds $5,000.00. 

select o.orderid, o.customerid, c.companyname, o.shipcountry, printf("%.2f",sum(od.quantity*od.unitprice)) as total_order
from orders o join order_details od on o.orderid = od.orderid join customers c on c.customerid = o.customerid
group by c.customerid, o.orderid 
having sum(od.quantity*od.unitprice) > 5000
order by o.shipcountry, total_order desc;

.mode columns

--6. 

--(a) where we have both customers and employees by city,region, postalcode


select distinct e.city, c.city , e.region, c.region, e.postalcode, c.postalcode
from employees e join customers c on e.city = c.city  and e.region = c.region and e.postalcode = c.postalcode
group by e.city;

--(b) where we have customers but no employees AND both customers and employees

select distinct e.city as EmployeeCity, c.city as CustomerCity , e.region as EmpRegion, c.region CustRegion, e.postalcode as EmpPC, c.postalcode
as CustPC from customers c  left join employees e on c.city = e.city  and  c.region = e.region and c.postalcode = e.postalcode;



--(c) where we have employees but no customers AND both customers and employees.

select distinct e.city as EmployeeCity, c.city as CustomerCity , e.region as EmpRegion, c.region CustRegion, e.postalcode as EmpPC, c.postalcode
as CustPC from employees e left join customers c  on c.city = e.city  and  c.region = e.region and c.postalcode = e.postalcode;

