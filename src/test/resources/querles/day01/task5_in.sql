/*
    IN
        returns the result with the ANY MATCHING from the given options
        it works like OR condition
 */

SELECT * from Jobs;

-- get me all info from employees, whose job_id is IT_PROG or SA_REP
SELECT * FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG' OR JOB_ID = 'SA_REP';

-- use IN clouse
SELECT * FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'SA_REP');


-- from location, Display city of where country id IT,US,UK
SELECT * FROM LOCATIONS
WHERE COUNTRY_ID = 'IT' OR COUNTRY_ID = 'US' OR COUNTRY_ID = 'UK';


SELECT  * FROM LOCATIONS
WHERE COUNTRY_ID IN ('IT', 'US', 'UK');


-- From employees, Display all information where employee_id 134,123,145,146
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID = 134 OR EMPLOYEE_ID = 123 OR EMPLOYEE_ID = 145 OR EMPLOYEE_ID = 146;

SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (134, 123, 145, 146);

-- from employees, Display all information for employees whose department id is Null
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;

-- Display all information for employees whose department id is NOT Null
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL;

