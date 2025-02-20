/*
    HAVING
        - adding condition on GROUP BY / applying filter on GROUP BY

        1. with WHERE
            it filters the result BEFORE putting everything into group


        2. with HAVING
            it filters the result AFTER putting everything into group
 */
SELECT * FROM EMPLOYEES;


-- Display job ids where the avg salary ---------is more than 5K
SELECT JOb_ID, SALARY FROM EMPLOYEES
WHERE SALARY > 5000;

-- NOT THE CORRECT WAY
SELECT JOb_ID, AVG(SALARY) FROM EMPLOYEES
WHERE SALARY > 5000
GROUP BY JOb_ID;

----------------------------------------------------------------------------------------------------
SELECT JOb_ID, AVG(SALARY) FROM EMPLOYEES
GROUP BY JOb_ID;

-- CORRECT WAY
SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) > 5000;




-- Display department_id where employees count bigger than 5
SELECT DEPARTMENT_ID, COUNT(*) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) > 5;



--IQ: Display duplicates first_names in employee table
SELECT FIRST_NAME from EMPLOYEES;
SELECT DISTINCT  FIRST_NAME from EMPLOYEES; -- this will remove duplicate and make unique

SELECT FIRST_NAME, COUNT(*)  from EMPLOYEES
GROUP BY FIRST_NAME
HAVING COUNT(*) >= 2;


-- 'as' can help us to Define our temporary column name

SELECT FIRST_NAME, COUNT(*) AS "COUNT OF EMPLOYEES"  from EMPLOYEES
GROUP BY FIRST_NAME
HAVING COUNT(*) >= 2;


-- get me average salary for each JOB ID - show only for two job_ids: IT_PROG, SA_REP
SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID
HAVING JOB_ID IN ('IT_PROG', 'SA_REP');




