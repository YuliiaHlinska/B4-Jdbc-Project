/*
    WHERE
        - adds conditions on the SELECT statement view
 */

select * from employees;


-- get me firstname,lastname,salary from employees where firstname is David
SELECT FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES
WHERE FIRST_NAME = 'David'; --Data is case-sensitive
-- if (firstname.equals("David"));


-- get me all info from employees where firstname is David
SELECT * from EMPLOYEES
WHERE FIRST_NAME = 'David';


-- get me firstname,lastname,salary where firstname from employees is David and lastname is Lee
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE FIRST_NAME = 'David' AND LAST_NAME = 'Lee';
-- if (firstname.equals("David") && lastname.equals("Lee"));


-- get me all information who is making salary more than 6000 in employees
SELECT * FROM EMPLOYEES
WHERE SALARY > 6000;


-- get me all information from employees who is making salary less than and equal 6000
SELECT * FROM EMPLOYEES
WHERE SALARY <= 6000;


-- get me first_name, last_name and email from employees who is making salary equal 6000
SELECT FIRST_NAME, LAST_NAME, EMAIL, SALARY from EMPLOYEES
WHERE SALARY = 6000;
