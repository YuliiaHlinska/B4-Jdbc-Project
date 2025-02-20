/*
    GROUP BY
        - this divides the rows from the SELECT statement into group base don the row we provide
        - mostly GROUP BY is used with the aggregate functions
 */


SELECT * FROm EMPLOYEES;

SELECT JOB_ID from EMPLOYEES; -- all job_ids with duplicates
SELECT DISTINCT JOB_ID from EMPLOYEES; -- all unique job_id


-- how many people work as IT_PROG
SELECT * from EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

SELECT COUNT(*) from EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

-- what is the average salary for people who work as IT_PROG
SELECT AVG (SALARY) FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG'; -- 5760



-- how many people work as SA_REP
SELECT * from EMPLOYEES
WHERE JOB_ID = 'SA_REP';

SELECT COUNT(*) from EMPLOYEES
WHERE JOB_ID = 'SA_REP';

-- what is the average salary for people who work as SA_REP
SELECT SALARY FROM EMPLOYEES
WHERE JOB_ID = 'SA_REP';

SELECT AVG (SALARY) FROM EMPLOYEES
WHERE JOB_ID = 'SA_REP'; -- 8350


-- from employees table which the average SALARY for "EACH" JOB_ID
SELECT JOB_ID from EMPLOYEES; -- all job_ids with duplicates
SELECT DISTINCT JOB_ID from EMPLOYEES; -- all unique job_id


SELECT JOB_ID, SALARY FROM EMPLOYEES;

SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID;


-- from employees table find the min SALARY for "EACH" JOB_ID

SELECT JOB_ID, SALARY FROM EMPLOYEES;


SELECT JOB_ID, MAX(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID;




SELECT JOB_ID, SALARY FROM EMPLOYEES;

SELECT JOB_ID, MAX(SALARY),  MIN(SALARY), AVG(SALARY), SUM(SALARY), COUNT(*)  FROM EMPLOYEES
GROUP BY JOB_ID;

