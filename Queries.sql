/* SQL QUERIES */

/* ************************* 2.1 SELECT *********************** */
SELECT * FROM EMPLOYEE;

SELECT * FROM EMPLOYEE WHERE LastName=‘King’;

SELECT * FROM EMPLOYEE WHERE FirstName=‘Andrew’ AND ReportsTo IS NULL;

/************************** 2.2 ORDER BY ************************/
SELECT * FROM ALBUM ORDER BY Title DESC;

SELECT FirstName, City FROM CUSTOMER ORDER BY City ASC;

/* ************************* 2.3 INSERT INTO *********************** */
INSERT INTO Genre (GenreId, Name) VALUES (26, 'K-Pop');
INSERT INTO Genre (GenreId, Name) VALUES (27, 'Urban Country');

INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email) VALUES (9, 'Dresden', 'Harry', 'Wizard', TO_DATE('1974-10-31 00:00:00','yyyy-mm-dd hh24:mi:ss'), TO_DATE('2002-8-14 00:00:00','yyyy-mm-dd hh24:mi:ss'), '3894 Gandalf Way', 'Chicago', 'IL', 'USA', '60007', '+1 (773) 349-8920', NULL, NULL);
INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email) VALUES (10, 'Murphy', 'Karrin', 'Lieutenant', TO_DATE('1976-4-13 00:00:00','yyyy-mm-dd hh24:mi:ss'), TO_DATE('2002-9-22 00:00:00','yyyy-mm-dd hh24:mi:ss'), '4581 Carrillon Lane', 'Chicago', 'IL', 'USA', '60007', '+1 (773) 980-3490', '+1 (773) 981-0231, murphyk@chicagopd.com);
INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email) VALUES (11, 'Butters', 'Waldo', 'Coroner', TO_DATE('1978-9-06 00:00:00','yyyy-mm-dd hh24:mi:ss'), TO_DATE('2004-1-21 00:00:00','yyyy-mm-dd hh24:mi:ss'), '8943 Muerte Drive', 'Chicago', 'IL', 'USA', '60007', '+1 (773) 453-2200', '+1 (773) 981-0231, murphyk@chicagopd.com);


INSERT INTO CUSTOMER (CustomerId, FirstName, LastName, Company, Address, City, 
State, Country, PostalCode, Phone, Fax, Email, SupportRepId) VALUES (60, 
'Susan', 'Rodriguez', 'Embraer - Empresa Brasileira de Aeronáutica S.A.', 'Av. 
Brigadeiro Faria Lima, 2170', 'São José dos Campos', 'SP', 'Brazil', '12227-
000', '+55 (12) 3923-5555', '+55 (12) 3923-5566', 'susanr@embraer.com.br', 3);
INSERT INTO CUSTOMER (CustomerId, FirstName, LastName, Company, Address, City, 
State, Country, PostalCode, Phone, Fax, Email, SupportRepId) VALUES (61, 'Thomas', 'Raith', 'Raith Family Imports', '4839 Amore Lane', 'Chicago', 
'IL', 'USA', '60007', '+1 (773) 392-5555', '+1 (773) 392-5566', 'thomas.raith@raithimports.com', 6);

/* ************************* 2.4 UPDATE *********************** */
SELECT * FROM CUSTOMER
WHERE LastName='Mitchell' AND FirstName='Aaron';
UPDATE Customer
SET LastName = 'Walker', FirstName = 'Robert',
WHERE CustomerID = 32;
/* The directions said only to change the name but if you wanted to change the email and the name the line would be: SET LastName = 'Walker', FirstName = 'Robert', Email='robertwalker@yahoo.ca' */

SELECT * FROM ARTIST
WHERE Name='Creedence Clearwater Revival';
UPDATE ARTIST
SET Name='CCR'
WHERE Name='Creedence Clearwater Revival';

/* ************************* 2.5 LIKE*********************** */
SELECT * FROM INVOICE
WHERE BillingAddress LIKE 'T%';

/* ************************* 2.6 BETWEEN *********************** */
SELECT * FROM INVOICE
WHERE TOTAL BETWEEN 15 AND 50;

SELECT * FROM EMPLOYEE
WHERE HireDate BETWEEN to_date('01-JUN-03') AND to_date('01-MAR-04');

/* ************************* 2.7 DELETE *********************** */
/* Verify that the record exists */
SELECT * FROM CUSTOMER
WHERE CUSTOMERID = 32;
/* Delete customer gets an error that points to INVOICEID constraint */
DELETE FROM CUSTOMER
WHERE CUSTOMERID = 32;
/* See what invoices are connected to CUSTOMERID = 32 */
SELECT * FROM INVOICE
WHERE CUSTOMERID = 32;
/* Delete INVOICE gets an error that points to INVOICELINE INVOICEID constraint */
DELETE FROM INVOICE
WHERE CUSTOMERID = 32;
/* See where INVOICELINE connects to INVOICE */
SELECT * FROM INVOICELINE
WHERE INVOICEID = 245 OR INVOICEID = 268 OR INVOICEID = 290 OR INVOICEID = 342 OR INVOICEID = 50 OR INVOICEID = 61 OR INVOICEID = 116;
/* Delete invoices from last child INVOICELINE */
DELETE FROM INVOICELINE
WHERE INVOICEID = 245 OR INVOICEID = 268 OR INVOICEID = 290 OR INVOICEID = 342 OR INVOICEID = 50 OR INVOICEID = 61 OR INVOICEID = 116;
/* Delete from invoices */
DELETE FROM INVOICE
WHERE CUSTOMERID = 32;
/* Delete from Customer/parent */
DELETE FROM CUSTOMER
WHERE CUSTOMERID = 32;
/* Verify Delete */
SELECT * FROM CUSTOMER
WHERE CUSTOMERID = 32;

