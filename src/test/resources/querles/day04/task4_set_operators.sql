SELECT * FROM EMPLOYEES;

-- Create 2 tables
CREATE TABLE DEVELOPERS (
                            ID_NUM INTEGER PRIMARY KEY,
                            NAME VARCHAR(20), -- CONSTRAINS: PK, Not Null, Unique, References
                            SALARY NUMBER
);
SELECT * FROM DEVELOPERS;


CREATE TABLE TESTERS (
                         ID_NUM INTEGER PRIMARY KEY,
                         NAME VARCHAR(30),
                         SALARY NUMBER
);
SELECT * FROM TESTERS;


INSERT INTO DEVELOPERS VALUES (1, 'Tom', 155000);
INSERT INTO DEVELOPERS VALUES (2, 'John', 140000);
INSERT INTO DEVELOPERS VALUES (3, 'Steve', 110000);
INSERT INTO DEVELOPERS VALUES (4, 'Mike', 120000);
SELECT * FROM DEVELOPERS;


INSERT INTO TESTERS VALUES (1, 'Jerry', 120000);
INSERT INTO TESTERS VALUES (2, 'James', 130000);
INSERT INTO TESTERS VALUES (3, 'Bond', 135000);
SELECT * FROM TESTERS;

-- Update Tester Name who has ID_NUM 3 to be 'Steve'
UPDATE TESTERS
SET NAME = 'Steve'
WHERE ID_NUM = 3;

SELECT * FROM TESTERS;

-- save
commit;

/*
    SET Operators
        - UNION
        - UNION ALL
        - INTERSECT
        - MINUS

        - Has to be same num of columns on each query
        - Has to have same data type columns in same order
 */



-- UNION: combines the result of two or more same queries and remove duplicates (keeps 1 copy of duplicates) and sorts
SELECT NAME FROM DEVELOPERS               -- Tom, John, Steve, Mike
UNION
SELECT NAME FROM TESTERS;           -- Jerry, James, Steve



-- UNION ALL: combines the result of two or more same queries and keeps all (including duplicates)
SELECT NAME FROM DEVELOPERS               -- Tom, John, Steve, Mike
UNION ALL
SELECT NAME FROM TESTERS;           -- Jerry, James, Steve


SELECT * FROM DEVELOPERS
UNION
SELECT * FROM TESTERS;


-- MINUS: combines the result of two or more same queries and shows only the UNIQUE one for the FIRST query
SELECT NAME FROM DEVELOPERS              -- Tom, John, Steve, Mike
MINUS
SELECT NAME FROM TESTERS;          -- Jerry, James, Steve


SELECT NAME FROM TESTERS                -- Jerry, James, Steve
MINUS
SELECT NAME FROM DEVELOPERS;      -- Tom, John, Steve, Mike


-- INTERSECT: combines the result of two or more same queries and returns only the ones that exists in BOTH queries
SELECT NAME FROM DEVELOPERS              -- Tom, John, Steve, Mike
INTERSECT
SELECT NAME FROM TESTERS;          -- Jerry, James, Steve


SELECT SALARY FROM DEVELOPERS
INTERSECT
SELECT SALARY FROM TESTERS;


