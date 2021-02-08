## TSQL HW CH 4
### Scott Revillar

**1. In your own words, what is a subquery?**
Query within an outer query. Outer query uses the result of inner query.

**2. In your own words, what is a self contained subquery?**
A subquery where the inner query is independent of the outer query's table.

**3. In your own words, what is a correlated subquery?**
That relies on the outer tables attributes. Dependent on the outer query. It cannot run by itself. You test it by changing a value
for the predicate in order to test it.  

**4. Give an example of a subquery that returns a single value. When would you use this kind of subquery?**
SELECT orderid
FROM Sales.Orders
WHERE orderid = (SELECT MAX(O.orderid)
FROM Sales.Orders AS O);

When the value is dynamic. You only want to return one value

**5. Give an example of a subquery that returns multiple values. When would you use this kind of subquery?**
SELECT custid, orderid, orderdate, empid
FROM Sales.Orders
WHERE custid IN
(SELECT C.custid
FROM Sales.Customers AS C
WHERE C.country = N'USA');

When you want to return multiple values.

**6. Give an example of a subquery that returns table values. When would you use this kind of subquery?**
Something that returns sclar valued subqueries in columns.

**7. What does the exists predicate do? Give an example.**
EXISTS that accepts a subquery as input and returns TRUE if the
subquery returns any rows and FALSE otherwise.

SELECT custid, companyname
FROM Sales.Customers AS C
WHERE country = N'Spain'
AND EXISTS
(SELECT * FROM Sales.Orders AS O
WHERE O.custid = C.custid);

The outer query against the Customers table filters only customers from Spain for whom the EXISTS
predicate returns TRUE. The EXISTS predicate returns TRUE if the current customer has related orders in
the Orders table.
One of the benefits of using the EXISTS predicate is that you can intuitively phrase queries that
sound like English. For example, this query can be read just as you would say it in ordinary English:
Return customers from Spain if they have any orders where the order’s customer ID is the same as the
customer’s customer ID.
**8. What happens if we use the not operator before a predicate? Give an example.**
SELECT custid, companyname
FROM Sales.Customers
WHERE custid NOT IN
(SELECT O.custid
FROM Sales.Orders AS O);

It negates the in predicate

**9. When you use exists or not exists with respect to a row in a database, does it return two or three**
**values? Explain your answer.**
It uses two valued logic. There is no situation where unknown whether a query returns any rows.


**10. How would you use a subquery to calculate aggregates? For example, you want to calculate yearly**
**sales of a product, and you also want to keep a running sum of total sales. Explain how you would use**
**a subquery to do this.**
SELECT orderyear, qty,
(SELECT SUM(O2.qty)
FROM Sales.OrderTotalsByYear AS O2
WHERE O2.orderyear <= O1.orderyear) AS runqty
FROM Sales.OrderTotalsByYear AS O1
ORDER BY orderyear;
This query returns the following output:
orderyear qty runqty
----------- ----------- -----------
2014 9581 9581
2015 25489 35070
2016 16247 51317