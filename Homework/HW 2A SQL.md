### TSQL Homework 02A
#### Scott Revillar/17 JAN 2021

1. (1)
    1. From 2. Where 3. Group By 4. Having 5. Select 6. Order by
	
1. (2) 
	 FROM clause is the very first query clause that is logically processed. You specify the name of the tables
	 you want to query and table operators that operator on those tables.
	 Put simply: where you specify the name of the table you want to query.
	 
1. (3) 
	Where clause- you specify a logical expression to filter the rows returned by the FROM phase. "Row filter"
	WHERE custID = 71

1. (4)
	 GROUP BY phase to arrange the rows returned by the previous logical query processing phase in groups. 
	 The groups are determined by the elements you specify in the GROUP BY clause. 
	 
	 FROM Sales.Orders
	WHERE custid = 71
	GROUP BY empid, YEAR(orderdate)
	
1. (5) 
	HAVING clause is a group filter. Only groups for which the HAVING predicate evaluates to TRUE are returned
	 HAVING clause is processed after the rows have been grouped, you can refer to aggregate functions in the 
	 logical expression. For example, in the query from Listing 2-1, the HAVING clause has the logical expression
	 COUNT(*) > 1, meaning that the HAVING phase filters only groups (employee and order year) with more than one
	 row
	 FROM Sales.Orders
	WHERE custid = 71
	GROUP BY empid, YEAR(orderdate)
	HAVING COUNT(*) > 1
	
1. (6)SELECT clause is where you specify the attributes (columns) you want to return in the result table of the query
	SELECT empid, YEAR(orderdate) AS orderyear, COUNT(*) AS numorders
FROM Sales.Orders
WHERE custid = 71
GROUP BY empid, YEAR(orderdate)
HAVING COUNT(*) > 1;

1. (7) 
	DISTINCT clause is specified, you are restricted in the ORDER BY list only to elements that appear in the SELECT list. 
	The reasoning behind this restriction is that when DISTINCT is specified, a single result row might represent
	multiple source rows; therefore, it might not be clear which of the values in the multiple rows should be used. Consider the following invalid query:
	SELECT DISTINCT country
	FROM HR.Employees
	ORDER BY empid;
	
1. (8)
	ORDER BY clause to sort the rows in the output for presentation purposes. In terms of logical query processing, ORDER BY is the very last clause to be 
	processed.
	
1. (9)
	The LIMIT clause is used to set an upper limit on the number of tuples returned by SQL.
It is important to note that this clause is not supported by all SQL versions.
The LIMIT clause can also be specified using the SQL 2008 OFFSET/FETCH FIRST clauses.
The limit/offset expressions must be a non-negative integer.
SELECT *
FROM Student
LIMIT 5;

1. (10)
	The TOP filter is a proprietary T-SQL feature you can use to limit the number or percentage of rows your query returns. It relies on two elements as part
	of its specification: one is the number or percent of rows to return, and the other is the ordering. 
	
1. (11)
	OFFSET-FETCH filter is considered an extension to the ORDER BY clause. With the OFFSET clause you indicate how many rows to skip, and with the FETCH clause 
	you indicate how many rows to filter after the skipped rows. 