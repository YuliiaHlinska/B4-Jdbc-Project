/*
    STRING FUNCTIONS
        - CONCAT / ||
        - UPPER
        - LOWER
        - LENGTH
        - INITCAP
        - SUBSTRING
        - AS
 */

SELECT * FROM EMPLOYEES;

-- CHANGE on ALL ROWS
SELECT FIRST_NAME, LAST_NAME from EMPLOYEES;
SELECT FIRST_NAME as "GIVEN NAME" FROM EMPLOYEES;   -- with space    -> needs " "
SELECT LAST_NAME as SURNAME FROM EMPLOYEES;         -- without space -> no need " "

-- Display annual salary for all employees -- > First Name, Last Name, Annual Salary

SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES;
SELECT FIRST_NAME, LAST_NAME, SALARY AS MONTHLY_SALARY, SALARY*12 AS ANNUAL_SALARY FROM EMPLOYEES;


-- Make a raise on annual salary for them by 10K -- Display annual salary for all employees -- > First Name, Last Name, Annual Salary
SELECT FIRST_NAME, LAST_NAME, SALARY AS MONTHLY_SALARY,
       SALARY*12 AS ANNUAL_SALARY,
       SALARY*12+10000 AS INCREASED_ANNUAL_SALARY
FROM EMPLOYEES;



-- CHANGE on SINGLE ROWS / SINGLE ROW FUNCTIONS
-- CONCAT
-- In java -- > "" + ""
-- In SQL  -- > '' || ''
-- In SQL --- > CONCAT('', '')


SELECT * FROM EMPLOYEES;
-- ||
SELECT EMAIL || '@gmail.com' FROM EMPLOYEES;
SELECT EMAIL || '@gmail.com' AS FULL_EMAIL FROM EMPLOYEES;

-- CONCAT
SELECT CONCAT(EMAIL, '@gmail.com') FROM EMPLOYEES;
SELECT CONCAT(EMAIL, '@gmail.com') AS FULL_EMAIL_ADDRESS FROM EMPLOYEES;

SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME || ' ' ||LAST_NAME FROM EMPLOYEES;
SELECT FIRST_NAME || ' ' ||LAST_NAME AS FULL_NAME FROM EMPLOYEES;


-- LOWER
SELECT EMAIL || '@gmail.com' AS FULL_EMAIL FROM EMPLOYEES;
SELECT LOWER (EMAIL || '@gmail.com') AS FULL_EMAIL FROM EMPLOYEES;

-- UPPER
SELECT EMAIL || '@gmail.com' AS FULL_EMAIL FROM EMPLOYEES;
SELECT UPPER (EMAIL || '@gmail.com') AS FULL_EMAIL FROM EMPLOYEES;
SELECT UPPER (EMAIL || '@gmail.com') AS FULL_EMAIL FROM EMPLOYEES
ORDER BY FULL_EMAIL DESC;


-- INITCAP
SELECT EMAIL FROM EMPLOYEES;
SELECT INITCAP(EMAIL) FROM EMPLOYEES;
