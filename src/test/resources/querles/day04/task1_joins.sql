SELECT * FROM EMPLOYEES;

-- Create Address Table
CREATE TABLE ADDRESS (
                         ADDRESS_ID INTEGER PRIMARY KEY,
                         ADDRESS VARCHAR(30) NOT NULL,
                         PHONE NUMBER NOT NULL
);

SELECT * FROM ADDRESS;

INSERT INTO ADDRESS (ADDRESS_ID, ADDRESS, PHONE) VALUES (5, '1913 Hanoi Way', 5005551234);
INSERT INTO ADDRESS (ADDRESS_ID, ADDRESS, PHONE) VALUES (7, '692 Joliet Street', 5005551235);
INSERT INTO ADDRESS (ADDRESS_ID, ADDRESS, PHONE) VALUES (8, '1566 Inegl Manor', 5005551236);
INSERT INTO ADDRESS (ADDRESS_ID, ADDRESS, PHONE) VALUES (19, '1795 Santiago', 5005551237);
INSERT INTO ADDRESS (ADDRESS_ID, ADDRESS, PHONE) VALUES (11, '900 Santiago', 5005551238);


-- Create Customer Table
CREATE TABLE CUSTOMER (
                          CUSTOMER_ID INTEGER PRIMARY KEY,
                          FIRST_NAME varchar(30) NOT NULL,
                          LAST_NAME varchar(50) NOT NULL,
                          ADDRESS_ID NUMBER REFERENCES ADDRESS(ADDRESS_ID)
);

INSERT INTO CUSTOMER VALUES (1, 'Mary', 'Smith', 5);
INSERT INTO CUSTOMER VALUES (2, 'Patricia', 'Johson', NULL);
INSERT INTO CUSTOMER VALUES (3, 'Linda', 'Jones', 7);
INSERT INTO CUSTOMER VALUES (4, 'Barbara', 'Jones', 8);
INSERT INTO CUSTOMER VALUES (5, 'Elizabeth', 'Brown', NULL);

SELECT * FROM CUSTOMER;


/*
    INNER JOINS
        Get the info only matching portion of the tables
        Inner join removes if there is NO MATCHING
        If you do not write "Inner Join", and just write "join" by default it acts like "Inner Join"
 */

-- Just the COLUMN name which exists in both table will give an issue because the QUERY is not sure from which table it should take it.
--SELECT  ADDRESS, PHONE, ADDRESS_ID, ADDRESS_ID, CUSTOMER_ID, FIRST_NAME, LAST_NAME
--FROM ADDRESS INNER JOIN CUSTOMER
--ON ADDRESS.ADDRESS_ID = CUSTOMER.ADDRESS_ID;


-- T0 specify from which table we are getting the column which exists in both tables, we can use the TABLE_NAME as reference  --> ADDRESS.ADDRESS_ID,  CUSTOMER.ADDRESS_ID
SELECT  ADDRESS, PHONE, ADDRESS.ADDRESS_ID,  CUSTOMER.ADDRESS_ID, CUSTOMER_ID, FIRST_NAME, LAST_NAME
FROM ADDRESS INNER JOIN CUSTOMER
                        ON ADDRESS.ADDRESS_ID = CUSTOMER.ADDRESS_ID;


SELECT  FIRST_NAME, LAST_NAME, ADDRESS, PHONE
FROM ADDRESS INNER JOIN CUSTOMER
                        ON ADDRESS.ADDRESS_ID = CUSTOMER.ADDRESS_ID;


SELECT *
FROM ADDRESS INNER JOIN CUSTOMER
                        ON ADDRESS.ADDRESS_ID = CUSTOMER.ADDRESS_ID;


SELECT  FIRST_NAME, PHONE
FROM ADDRESS INNER JOIN CUSTOMER
                        ON ADDRESS.ADDRESS_ID = CUSTOMER.ADDRESS_ID;


/*
    LEFT OUTER JOIN
        ALL from LEFT TABLE + matching ones from RIGHT TABLE
        If you do not write "Left Outer Join", and just write "left join" by default it acts like "Left Outer Join"

 */

SELECT *
FROM CUSTOMER LEFT OUTER JOIN ADDRESS
                              ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;



SELECT *
FROM ADDRESS LEFT JOIN CUSTOMER
                       ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;


SELECT  ADDRESS, PHONE, FIRST_NAME, LAST_NAME
FROM ADDRESS LEFT JOIN CUSTOMER
                       ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;



/*
    LEFT OUTER JOIN with WHERE (with CONDITION)
        This query will help to find with data from LEFT table and has NO value in right table with the WHERE condition
        ONLY UNIQUE TO LEFT TABLE
 */
-- FIND ME THE PEOPLE WHO MISSING INFORMATION IN ADDRESS TABLE
SELECT  *
FROM CUSTOMER LEFT OUTER JOIN ADDRESS
                              ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
WHERE ADDRESS.ADDRESS_ID IS NUll;

SELECT  *
FROM CUSTOMER LEFT OUTER JOIN ADDRESS
                              ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
WHERE CUSTOMER.ADDRESS_ID IS NUll;

-- FIND me all the CUSTOMER who had their ADDRESS
-- THIS WILL BE like "Inner JOIN"
SELECT  *
FROM CUSTOMER LEFT OUTER JOIN ADDRESS
                              ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
WHERE ADDRESS.ADDRESS_ID IS NOT NULL;

-- FIND ME THE ADDRESS which is MISSING CUSTOMER INFORMATION
SELECT  *
FROM ADDRESS LEFT OUTER JOIN CUSTOMER
                             ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
WHERE CUSTOMER.ADDRESS_ID IS NUll;


-- FIND ME ALL THE CUSTOMER with ADDRESS existing and with LAST_NAME being starting with J
SELECT  *
FROM CUSTOMER LEFT OUTER JOIN ADDRESS
                              ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
WHERE LAST_NAME LIKE 'J%' AND ADDRESS.ADDRESS IS NOT NULL;


/*
    RIGHT OUTER JOIN
        ALL from RIGHT TABLE + matching ones from LEFT TABLE
        If you do not write "Right Outer Join", and just write "right join" by default it acts like "Right Outer Join"

 */

SELECT  *
FROM CUSTOMER RIGHT OUTER JOIN ADDRESS
                               ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;


-- This will do the same thing as above
SELECT  *
FROM ADDRESS LEFT OUTER JOIN CUSTOMER
                             ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;


SELECT  FIRST_NAME, LAST_NAME, ADDRESS, PHONE
FROM ADDRESS RIGHT OUTER JOIN CUSTOMER
                              ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;




/*
    RIGHT OUTER JOIN with WHERE (with CONDITION)
        This query will help to find with data from RIGHT table and has NO value in left table with the WHERE condition
        ONLY UNIQUE TO LEFT TABLE
 */


-- Find me the customers who has address information
SELECT  FIRST_NAME, LAST_NAME, ADDRESS, PHONE
FROM ADDRESS RIGHT OUTER JOIN CUSTOMER
                              ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
WHERE ADDRESS.ADDRESS_ID iS NOT NULL;



-- Find me the customers who is missing address information
SELECT  FIRST_NAME, LAST_NAME, ADDRESS, PHONE
FROM ADDRESS RIGHT OUTER JOIN CUSTOMER
                              ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
WHERE ADDRESS.ADDRESS_ID iS NULL;






/*
    FULL OUTER JOIN
        ALL from RIGHT TABLE + LEFT TABLE
 */

SELECT *
FROM CUSTOMER FULL OUTER JOIN ADDRESS
                              ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;


SELECT CUSTOMER_ID, FIRST_NAME, LAST_NAME, ADDRESS, PHONE
FROM CUSTOMER FULL OUTER JOIN ADDRESS
                              ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;


/*
    FULL OUTER JOIN with WHERE
        ALL from RIGHT TABLE + LEFT TABLE
        Minus/Exclude the common/matching ones
 */

-- Find me all information from customer table and address table which is missing data from other tables
-- Customer table missing info in Address table OR Address table missing info in Customer table
SELECT *
FROM CUSTOMER FULL OUTER JOIN ADDRESS
                              ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
WHERE CUSTOMER.ADDRESS_ID IS NULL OR ADDRESS.ADDRESS_ID is NULL;



SELECT *
-- as --- aliasis --- > C and A acts AS ALIASIS
FROM CUSTOMER C FULL OUTER JOIN ADDRESS A
                                ON C.ADDRESS_ID = A.ADDRESS_ID
WHERE C.ADDRESS_ID IS NULL OR A.ADDRESS_ID is NULL;

-- SAME AS ABOVE
SELECT *
FROM CUSTOMER FULL OUTER JOIN ADDRESS
                              ON CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID
WHERE CUSTOMER.ADDRESS_ID IS NULL OR ADDRESS.ADDRESS_ID is NULL;