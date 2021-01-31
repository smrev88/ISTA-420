## TSQL Homework 02B
## Scott Revillar/19 JAN 2021

#### 1. What is a data type? Why do we have data types?


representation of the kind of thing binary code represents
Unicode or regular.
2 bytes    1 byte
Depending on memory requirements and if you need fixed length variable length or what languages need to be supported. 
regular only does english and one more language. variable does multiple

#### 2. What is a collation? Name four elements of a collation.
Collation is a property of character data that encapsulates several aspects: 
language support, sort order, case sensitivity, accent sensitivity


#### 3. How would you strip whitespace from a string? For example, suppose you had \ Dave " but
wanted only \Dave".
select trim (both from " Dave "

#### 4. Suppose you wanted to make a list of every college and university that was called an Institute from
the college table. Write the query.
select * from college where college_name Like '%institute%';


#### 5. How would you find the number of the index of the first space in a string? For example, the index of
the first space in \Barack Hussein Obama" would be 7.
SELECT CHARINDEX(' ','Barack Hussein Obama'); for sql
 select instr('barack hussein obama',' '); for sqlite

####6. How would you select just the first name in a list of the presidents. Each record looks like the: "George
Washington", "John Adams", "Thomas Jefferson". First names can be an arbitrary length, from \Cal"
to \Benjamin." (e.g., Cal College, Benjamin Harrison)

select substr(presidents,0, instr(presidents, ' '));
substr in sqlite

#### 7. What is the order of precedence for the logical operators?
3 logical operators=not,and, or

#### 8. What is the order of precedence for the math operators?
 multiplication, division, modulo, addition, subtraction

#### 9. What is the difference between a simple and a searched CASE expression?;
CASE is an expression -returns a value used inSELECT, WHERE, HAVING, and ORDER BY clauses and in CHECK constraints.
simple- based on literal value
search- based on an expression/predicate(evaluates to true or false), evaluates to a value

#### 10. How would you turn a list of names like this: \LASTNAME, FIRSTNAME", to a list like this:
\FIRSTNAME LASTNAME"?
sqlite> select substr('lozano, phil', instr('lozano, phil', ' ')+1) || ' ' || 
substr('lozano, phil','1',instr('lozano, phil', ',')-1);



#### 11. How would you turn a list of names like this: \FIRSTNAME LASTNAME", to a list like this: \LAST-
NAME, FIRSTNAME"?
 select substr('will mace', instr('will mace', ' ')+1) || ', '|| substr('will mace',1, instr('will mace', ' '));