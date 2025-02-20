SELeCT * from jobs;


--  From jobs, Display all information  where job title President ,Sales Manager, Finance Manager
SELECT * FROM JOBS
WHERE job_title = 'Sales Manager' OR JOB_TITLE = 'President' OR job_TITLE = 'Finance Manager';


Select * FROM JOBS
Where JOB_TITLE IN ('Sales Manager','President','Finance Manager');



-- Display all Departments that does NOT have manager_id in departments table
Select * FROM DEPARTMENTS
WHERE MANAGER_ID IS NULL;


Select * FROM DEPARTMENTS
WHERE MANAGER_ID IS NOT NULL;


--  Display all Locations in US or UK from Locations table
SELECT * FROM LOCATIONS
WHERE COUNTRY_ID IN ('US','UK');


--  Display all Locations NOT in US or UK from Locations table
SELECT * FROM LOCATIONS
WHERE COUNTRY_ID NOT IN ('US','UK');


--  Display all Countries in Region_ID of 10 and Country_Name NOT Belgium, from Countries table
SELECT * FROM COUNTRIES
WHERE REGION_ID = 10 AND COUNTRY_NAME != 'Belgium';

SELECT * FROM COUNTRIES
WHERE REGION_ID = 10 AND COUNTRY_NAME <> 'Belgium';

SELECT * FROM COUNTRIES
WHERE REGION_ID IN (10) AND COUNTRY_NAME NOT IN ('Belgium');


--display all employees who does NOT work in any one of these department id 90, 60, 100, 130, 120
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (90, 60, 100, 130, 120);
