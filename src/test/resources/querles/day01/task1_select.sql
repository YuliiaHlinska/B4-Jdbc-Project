/* - Multi line comment
    SELECT Keyword
    - SQL is NOT case-sensitive for syntax, for column name, for table names
    - * -- > refers all the columns from given table

 */

-- Single line comment

SELECT * FROM employees;

SELECT FIRST_NAME, last_name FROM EMPLOYEES;


-- get me firstname from employees;
SELECT FIRST_NAME FROM EMPLOYEES;


-- get me firstname and salary from employees
SELECT first_name, SALARY from EMploYees;
SELECT SALARY, first_name from EMploYees;


-- get me firstname,lastname and salary from employees
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES;


--Display all information from department table
SELECT * FROM DEPARTMENTS;


-- Display city names from locations
SELECT CITY FROM LOCATIONS;


-- Display country name and region id from countries
SELECT Country_name, region_id from COUNTRIES;




