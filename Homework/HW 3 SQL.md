## TSQL HW CH 3
### Scott Revillar

1. In general, why would you even want to join two (or more) tables together? This is a good time to
think about the nature of relational algebra.
comparing information

2. Describe in your own words the output from an inner join.
Applies cartesian product between the two input tables and then it filters rows based on what you specify
as long as theres a match between columns, 

3. Describe in your own words the output from an outer join.
Cartesian Product and the ON filter), plus a third phase called Adding Outer Rows that do not match
SELECT C.custid, C.companyname, O.orderid
FROM Sales.Customers AS C  
LEFT OUTER JOIN Sales.Orders AS O    
ON C.custid = O.custid;



4. Describe in your own words the output from an cross join.
Simplest type of join that implements one query processing phase-cartesian product.
product between two input tables

5. A convenient mnemonic for remembering the various joins is \Ohio." Why is this true?
inner join O 
left and right outer joins- Hi
full outer join- o


6. Give an example of a composite join.
A composite join is simply a join where you need to match multiple attributes from each side
need such a join when a primary key–foreign key relationship is based on more than one attribute.
matches from each side
FROM dbo.Table1 AS T1  
INNER JOIN dbo.Table2 AS T2    
ON T1.col1 = T2.col1    
AND T1.col2 = T2.col2


7. What is the difference between the following two queries? The business problem is \How many orders
do we have from each customer?"
The first query will count everything in that table.
The second query will count only orderid from orders.
first will count customers who havent placed orders and have 
second one will only count customers who placed orders

================first query===============
SELECT C.custid, COUNT(*) AS numorders
FROM Sales.Customers AS C
LEFT OUTER JOIN Sales.Orders AS O
ON C.custid = O.custid
GROUP BY C.custid;
================second query===============
SELECT C.custid, COUNT(O.orderid) AS numorders
FROM Sales.Customers AS C
LEFT OUTER JOIN Sales.Orders AS O
ON C.custid = O.custid
GROUP BY C.custid;


8. What might be one reason the following query does not return the column custID in this query?
the orders tables is not being preserved so and that is the table being called in the join.
and the where clause

SELECT C.custid, C.companyname, O.orderid, O.orderdate
FROM Sales.Customers AS C
LEFT OUTER JOIN Sales.Orders AS O
ON C.custid = O.custid        ---- works on cartesian product and discards anything that doesnt match
WHERE O.orderdate >= '20160101';   ---- discards all the records where this evaluates to false -- operates globally