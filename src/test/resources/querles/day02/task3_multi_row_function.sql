/*
    Aggregate function - multi row function
        - Takes multiple inputs and gives the result based on our condition / one result
 */

select * From employees;

-- COUNT
--How many employees we have?
select * From employees;
select COUNT(*) From employees;

-- How many first_names we have
SELECT FIRST_NAME from EMPLOYEES;
SELECT COUNT (FIRST_NAME) from EMPLOYEES;

-- How many UNIQUE first_names we have
SELECT FIRST_NAME from EMPLOYEES;
SELECT DISTINCT FIRST_NAME from EMPLOYEES;
SELECT COUNT (DISTINCT FIRST_NAME) from EMPLOYEES;



-- How many employees work as 'IT_PROG' or 'SA_REP'
SELECT COUNT (*) FROm EMPLOYEES
WHERE JOB_ID IN ('IT_PROG','SA_REP');

-- How many employees we have department id is null
SELECT DEPARTMENT_ID from EMPLOYEES;
SELECT COUNT(DEPARTMENT_ID) from EMPLOYEES; -- it does not count 'null' as the value


SELECT COUNT(DEPARTMENT_ID) from EMPLOYEES
WHERE DEPARTMENT_ID is NUll; -- 0

SELECT DEPARTMENT_ID from EMPLOYEES
WHERE DEPARTMENT_ID is NUll;

SELECT * from EMPLOYEES
WHERE DEPARTMENT_ID is NUll;

SELECT COUNT (*) from EMPLOYEES
WHERE DEPARTMENT_ID is NUll; -- 1 (the reason this is 1 is because the row, has some none 'null' values. If all data in this row was 'null', it would have given 0)

---------------------------------------------------------------------------------------------------------

-- MIN

--get me min salary from employees
SELECT SALARY FROM EMPLOYEES;
SELECT MIN (SALARY) FROM EMPLOYEES;
SELECT MIN (FIRST_NAME) FROM EMPLOYEES; -- Alphabetic order - BUT this aggregate functions MOSTLY is used with number
SELECT SALARY FROM EMPLOYEES
ORDER BY SALARY; -- this will sort from low to high, and you can see what the first one is which is the lowest/min one


-- MAX
--get me MAX salary from employees
SELECT SALARY FROM EMPLOYEES;
SELECT MAX(SALARY) FROM EMPLOYEES;
SELECT SALARY from EMPLOYEES
ORDER BY SALARY DESC; -- this will sort from high to low, and you can see what the first one is which is the highest/max one



-- SUM
--get me TOTAL/SUM salary from employees
SELECT SALARY FROM EMPLOYEES;
SELECT SUM (SALARY) FROM EMPLOYEES;



-- AVG
--get me Average salary from employees
SELECT SALARY FROM EMPLOYEES;
SELECT AVG (SALARY) FROM EMPLOYEES; -- 6461.831775700934579439252336448598130841


SELECT SUM (SALARY) FROM EMPLOYEES; --691416
SELECT COUNT (SALARY) FROM EMPLOYEES; -- 107


-- ROUND
SELECT ROUND (AVG (SALARY)) FROM EMPLOYEES; -- 6461
SELECT ROUND (AVG (SALARY), 1) FROM EMPLOYEES; -- 6461.8
SELECT ROUND (AVG (SALARY), 2) FROM EMPLOYEES; -- 6461.83
SELECT ROUND (AVG (SALARY), 3) FROM EMPLOYEES; -- 6461.832
SELECT ROUND (AVG (SALARY), -1) FROM EMPLOYEES; -- 6460
SELECT ROUND (AVG (SALARY), -2) FROM EMPLOYEES; -- 6500



