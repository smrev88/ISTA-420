#SQL HW 2C

### Name:Scott Revillar
### 24 JAN 2021

1. List the date/time types in T-SQL.
DATETIME, DATE, TIME, DATETIME2, DATETIMEOFFSET, SMALLDATETIME

2. How do you express a date/time literal in T-SQL?
It is a best practice to use character strings to express date and time values, as shown in the following example:
SELECT orderid, custid, empid, orderdate
FROM Sales.Orders									
WHERE orderdate = '20160212';    equivalent 
'yyyymmdd'

SELECT orderid, custid, empid, orderdate
FROM Sales.Orders
WHERE orderdate = CAST('20160212' AS DATE);

converted to the column’s data type (DATETIME) because
character strings are considered lower in terms of data-type precedence with respect to date and
time data types. I


3. What is the setting DATEFORMAT used for?
determines how SQL Server interprets the literals you
enter when they are converted from a character-string type to a date and time type

4. Wriite a T-SQL snippet changing the date format to German. Read the documentation on how to do this.
SET LANGUAGE german;
SELECT CAST('20160212' AS DATE);

5. What is the difference between CAST(), CONVERT(), and PARSE()?
All three base functions convert the input value to the specified target datatype
CONVERT has a third argument with which you can specify the style of the conversion
PARSE function supports the indication of a culture—for example, ‘en-US’ for U.S. English and ‘en-GB’
for British English.
CAST is standard and CONVERT and PARSE aren’t, so unless you need to use the style
number or culture, it is recommended that you use the CAST function.

6. What function returns the current date? This is very useful in a table that maintains a log of events,
such as user logins.
SELECT CAST(SYSDATETIME() AS DATE);

7. How do you add one day to the current date? Add one week? Add one month? Add one year?
SELECT DATEADD(day, 1, sysdatetime());
SELECT DATEADD(week, 1, sysdatetime());
SELECT DATEADD(month, 1, sysdatetime());
SELECT DATEADD(year, 1, sysdatetime());

8. Write a SQL snippet to return the number of years between your birth date and today’s date.
SELECT DATEDIFF(year, '19881218', '20210125');

9. How do you check a string literal to see if it represents a valid date?
ISDATE function

10. What does EOMONTH() do? Give an example of why this might be very useful.
EOMONTH function accepts an input date and time value and returns the respective end-of-
month date as a DATE typed value. The function also supports an optional second argument indicating
how many months to add (or subtract, if negative

SELECT orderid, orderdate, custid, empid
FROM Sales.Orders
WHERE orderdate = EOMONTH(orderdate);


11. Payments are due exactly 30 days from the date of the last function. Write a select query that calculates
the date of the next payment. Pretend we want to update a column in a database that contains the
date of the next payment. We will do this when we write UPDATE queries.
SELECT DATEADD(day, 30, function()) as nextpayment;


12. Suppose your son or daughter wants to run a query every day that tells them the number of days until
their 16th birthday. Write a select query that does this.
SELECT DATEDIFF(days, sysdatetime , '20301004');