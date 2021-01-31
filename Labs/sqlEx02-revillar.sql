.echo on
.headers on
.mode columns

-- Name: Scott Revillar
--File Name: sqlEx02-revillar.sql
--Date Jan 23 2021


--1. List the company name, the contact name and the country of all customers in Poland.
select CompanyName, ContactName, Country from customers where Country in('Poland');

--2. List the order Id, the order date, and the destination city of all orders shipped to Berlin.
select orderid, orderdate, shipcity from orders where shipcity in('Berlin');

--3. How many boxes of Filo Mix do we have in stock?
select productid, productname, unitsinstock from products where productname like '%Filo%';

--4. List the telephone numbers of all of our shippers.
select companyname, phone from shippers;

--5. Who is our oldest employee? Who is our youngest employee?
 select firstname, lastname, birthdate from employees order by birthdate limit 1;
 
 select firstname, lastname, birthdate from employees order by birthdate desc limit 1;

--6. List the suppliers where the owner of the supplier is also the sales contact.
select contacttitle, contactname, companyname from suppliers where contacttitle like '%owner';

--7. Mailing Labels
select substr(ContactName, 0, instr(contactname, ' ')) || ' ' || substr(trim(substr(ContactName, instr(contactname, ' '), length(contactname))), instr(trim(substr(ContactName, instr(contactname, ' '), length(contactname))) ,' '), length(contactname)) || ' 
' || companyname  || '
' || address || '
' || city || ' ' || region || ' ' || postalcode || ' ' || country || '
' || '      ' || '
' || '      ' from customers;

--8. Telephone Book
select substr(trim(substr(ContactName, instr(contactname, ' '), length(contactname))), instr(trim(substr(ContactName, instr(contactname, ' '), length(contactname))) ,' '), length(contactname))
|| ',' || ' ' || substr(ContactName, 0, instr(contactname, ' ')) || ' ' || substr(trim(substr(ContactName, instr(contactname, ' '), length(contactname))), 0, instr(trim(substr(ContactName, instr(contactname, ' '), length(contactname))), ' '))
|| '	' || companyname || '	' || phone from customers;




