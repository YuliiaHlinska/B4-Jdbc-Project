/*
    Between
        - returns the result between the given range
 */

SELECT * FROM JObs;


-- from employees, get me firstname,salary who is making salary more than 7000 and department id is 80
-- this example is to explain that some cases, we canNOT use between especially, when it is not the range
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID from EMPLOYEES
WHERE SALARY > 7000 AND DEPARTMENT_ID = 80;


-- from employees, get me firstname,lastname who is making salary more then 3000 and less than 6000
-- create it without using BETWEEN -- > 3000 and 6000 is not INCLUDED
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY > 3000 AND SALARY < 6000;


SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY >= 3000 AND SALARY <= 6000; -- 3000 and 6000 is INCLUDED


-- write the same query with Between clause
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY BETWEEN 3000 AND 6000; -- 3000 and 6000 is INCLUDED


-- from employees, get me all information who is working as 'IT_PROG' or 'SA_REP'
SELECT * FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG' OR JOB_ID = 'SA_REP';
