## TSQL HW CH 5
### Scott Revillar


**1. What is a table expression? Can you give a technical definition of a table expression?**
Table expression is a named query expression that represents a valid relational table.
The outer query and the inner
query are merged into one query directly against the underlying objects.
**2. In what SQL clause are derived tables (table valued subqueries) located?**
Derived tables (also known as table subqueries) are defined in the FROM clause of an outer query.

**3. Why can you refer to column aliases in an outer query that you defined in an inner table valued subquery?**
The inner query gets executed first so the outer query can use that alias.

**4. What SQL key word defines a common table expression?**
With

WITH USACusts AS
(
SELECT custid, companyname
FROM Sales.Customers
WHERE country =N'USA'
)
SELECT * FROM USACusts;
**5. When using common table expressions, can a subsequent derived table use a table alias declared in a preceding table expression?**
Yes you just separate them by commas

**6. Can a main query refer to a previously defined common table expression by multiple aliases?**
yes

WITH YearlyCount AS
(
SELECT YEAR(orderdate) AS orderyear,
COUNT(DISTINCT custid) AS numcusts
FROM Sales.Orders
GROUP BY YEAR(orderdate)
)
SELECT Cur.orderyear,
Cur.numcusts AS curnumcusts,Prv.numcusts AS prvnumcusts,
Cur.numcusts - Prv.numcusts AS growth
FROM YearlyCount AS Cur
LEFT OUTER JOIN YearlyCount AS Prv
ON Cur.orderyear = Prv.orderyear + 1;

**7. In SQL, is a view a durable object?**
Yes because it is reusable.

**8. In a view, what does WITH CHECK OPTION do? Why is this important?**
The purpose of CHECK OPTION is to prevent modifications through the view that conflict with the
view’s filter.
If you want to prevent modifications that conflict with the view’s filter,
**9. In a view, what does SCHEMABINDING do? Why is this important?**
binds the schema of referenced objects
and columns to the schema of the referencing object.
meaning you can't drop any of the columns you reference in the select statement.
It helps avoid errors from schema changes 

**10. What is a table valued function?**
reusable table expressions that support input parameters
inline TVFs are similar to views

**11. What does the APPLY operator do?**
APPLY is used in the FROM clause of a query.
APPLY performs its work in logical-query phases
With APPLY, the left side is evaluated first, and the right side is evaluated per row from the left.
**12. What are the two forms of the APPLY operator? Give an example of each.**
APPLY: CROSS APPLY and OUTER APPLY.
CROSS APPLY implements only
one logical-query processing phase, whereas OUTER APPLY implements two.