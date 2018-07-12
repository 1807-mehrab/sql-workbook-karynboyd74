/* SQL JOINS */

/* ************************* 7.1 INNER *********************** */
/* Inner Join CUSTOMERS & INVOICE - cols = custname & invoiceid */
SELECT CUSTOMER.FIRSTNAME || CUSTOMER.LASTNAME AS Name, INVOICE.INVOICEID
FROM CUSTOMER
INNER JOIN INVOICE ON CUSTOMER.CUSTOMERID = INVOICE.INVOICEID;

/* ************************* 7.2 OUTER *********************** */
/* Outer Join on CUSTOMERS and INVOICE - cols customerid, firstname, lastname, invoiceid, total */
SELECT  CUSTOMER.CUSTOMERID as ID,
        CUSTOMER.FIRSTNAME || CUSTOMER.LASTNAME as Name,
        INVOICE.INVOICEID as Invoice,
        INVOICE.TOTAL as Total
FROM CUSTOMER
LEFT OUTER JOIN INVOICE on CUSTOMER.CUSTOMERID = INVOICE.CUSTOMERID;

/* ************************* 7.3 RIGHT *********************** */
/* Right join ALBUM and ARTIST - cols artistname & title */
SELECT ALBUM.TITLE, ARTIST.NAME
FROM ARTIST
RIGHT OUTER JOIN ALBUM
ON ALBUM.ARTISTID = ARTIST.ARTISTID;

/* ************************* 7.4. CROSS *********************** */
/* Cross Join ALBUM and ARTIST - sort by artist name ASC */
SELECT *
FROM ALBUM
    CROSS JOIN ARTIST
ORDER BY ARTIST.NAME;

/* ************************* 7.5 SELF-JOIN *********************** */
/* SELF JOIN self-join on the employee table, joining on the reportsto column. */
SELECT FIRST.EMPLOYEEID, FIRST.LASTNAME || FIRST.FIRSTNAME AS Name, SECOND.REPORTSTO
FROM EMPLOYEE FIRST, EMPLOYEE SECOND
WHERE FIRST.EMPLOYEEID = SECOND.REPORTSTO; 