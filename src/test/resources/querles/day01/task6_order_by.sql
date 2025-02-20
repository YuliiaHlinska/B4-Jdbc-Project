/*
    ORDER BY
        - sorts the result in either ASC or DESC order
 */
SELECT * FROM DEPARTMENTS;


-- from employees, Display all information based on who is making more salary to low salary (from highest to lowest)
SELECT * FROM EMPLOYEES
ORDER BY SALARY DESC;

-- from employees, Display all information based on who is making low salary to high salary (from lowest to highest)
SELECT * FROM EMPLOYEES
ORDER BY SALARY; -- by default ->  it sorts it in ASC

-- or this one
SELECT * FROM EMPLOYEES
ORDER BY SALARY ASC; -- by default ->  it sorts it in ASC


SELECT * FROM EMPLOYEES
ORDER BY 8 DESC; -- 8 -->  is the index of the Salary column


-- Display all information from employees where employee id < 150 based on first name in alphabetical order
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID < 150
ORDER BY FIRST_NAME;


-- IQ: Display all information from employees based on first name ascending and last name descending
SELECT * FROM EMPLOYEES
ORDER BY FIRST_NAME ASC, LAST_NAME DESC;


SELECT * FROM EMPLOYEES
ORDER BY FIRST_NAME, LAST_NAME DESC;

