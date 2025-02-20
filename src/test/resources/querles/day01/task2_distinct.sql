/*
    DISTINCT Keyword
        Removes duplicates from your query request.
 */


SELECT * FROM EMPloyees;


-- Display street address and postal code from locations
SELECT STREET_ADDRESS, POSTAL_CODE from LOCATIONS;
SELECT DISTINCT STREET_ADDRESS, POSTAL_CODE from LOCATIONS;


-- Get me first names from employees
SELECT FIRST_NAME FROM EMPLOYEES;
SELECT DISTINCT FIRST_NAME FROM EMPLOYEES;


-- get me unique job_ids from employees
SELECT JOB_ID FROM EMPLOYEES;
SELECT DISTINCT JOB_ID FROM EMPLOYEES;



-- The below sample shows that DISTINCT will remove the duplicate for BOTH columns
-- show all Job id, salary from employees
SELECT JOB_ID, SALARY FROm EMPLOYEES;
SELECT DISTINCT JOB_ID, SALARY FROm EMPLOYEES; -- return all the unique combinations if we have more than one combination match



-- get me unique country ids from locations
SELECT COUNTRY_ID FROM LOCATIONS;
SELECT DISTINCT COUNTRY_ID FROM LOCATIONS;


-- get me unique job_ids from jobs
SELECT JOB_ID FROM JOBS;
SELECT DISTINCT JOB_ID FROM JOBS;
