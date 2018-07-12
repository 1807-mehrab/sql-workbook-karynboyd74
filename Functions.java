/* SQL FUNCTIONS */

/* ************************* 3.1 SYSTEM DEFINED FUNCTIONS *********************** */
/* Task – Create a function that returns the current time. */
ALTER SESSION SET TIME_ZONE = '-1:00';

SELECT CURRENT_TIMESTAMP
FROM dual;


/* Task – create a function that returns the length of a mediatype from the mediatype table */
SELECT NAME, LENGTH2(NAME)
FROM MEDIATYPE;


/* ************************* 3.2 System Defined Aggregate Functions *********************** */
/* Task – Create a function that returns the average total of all invoices */
SELECT AVG(TOTAL)
FROM INVOICE;

/* Task – Create a function that returns the most expensive track */
SELECT MAX(UNITPRICE)
FROM INVOICELINE;

/* ************************* 3.3 User Defined Scalar Functions *********************** */
/* Task – Create a function that returns the average price of invoiceline items in the invoiceline table */


/* ************************* 3.4 User Defined Table Valued Functions *********************** */
/* Task – Create a function that returns all employees who are born after 1968. */