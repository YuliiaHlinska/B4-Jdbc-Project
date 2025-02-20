/*
    LIKE
        - It works with the similar logic from String in Java
            -.startsWith()
            -.endsWith()
            -.contains()
            -.equals()

        %   - > any sequence of characters
        _   - > each _ represents ONE any character
 */


SELECT * from employees;


-- From employees, Display all employees whose firstname startsWith G
SELECT  * FROM EMPLOYEES
WHERE FIRST_NAME = 'G';

SELECT  * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'G';

SELECT  * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'G%'; -- startsWith 'G' and any sequence of other characters after 'G', I do tno care


SELECT  * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%G'; -- endsWith 'G'


--Display all employees whose firstname startsWith B and has 5 characters in total
SElect * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'B____'; -- startsWith 'B' and total 5 characters long


--Display 5 letters first names where the middle char is z -> __z__
SELECT FIRST_NAME from EMPLOYEES
WHERE FIRST_NAME LIKE '__z__'; -- contains z in the middle of 5 letters string

--Display 5 letters first names where there is z in middle anywhere
SELECT FIRST_NAME from EMPLOYEES
WHERE FIRST_NAME LIKE '%z%'; -- contains Z in the middle anywhere


SELECT FIRST_NAME from EMPLOYEES
WHERE FIRST_NAME LIKE 'z'; -- first name = 'z'


--Display all records/info whose last name has 5 letters longs -> _____
SELECT * FROM EMPLOYEES
WHERE LAST_NAME LIKE '_____';


-- Display first name where 2nd char is  a --> __
SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_a%';



-- from jobs, Display any/all job information with Job_title ends with Manager
SELECT * FROM JOBS
WHERE JOB_TITLE LIKE '%Manager';