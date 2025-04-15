-- Task 1: Compare Values with Previous or Next Records

SELECT 
    employee_id,
    salary,
    
    -- Get the salary of the previous record based on ascending salary order
    LAG(salary) OVER (ORDER BY salary) AS previous_salary,
    
    -- Compare the current salary to the previous salary
    CASE 
        WHEN salary > LAG(salary) OVER (ORDER BY salary) THEN 'HIGHER'  -- current > previous
        WHEN salary < LAG(salary) OVER (ORDER BY salary) THEN 'LOWER'   -- current < previous
        ELSE 'EQUAL'                                                    -- same as previous
    END AS comparison_with_previous,
    
    -- Get the salary of the next record based on ascending salary order
    LEAD(salary) OVER (ORDER BY salary) AS next_salary

FROM employees;
-- This query is useful for trend analysis or identifying changes in salary values relative to other records.


-- Task 2: Ranking Data within a Category

SELECT 
    employee_id,
    department,
    salary,
    
    -- Assigns a rank within each department ordered by salary (highest first),
    -- skipping ranks if there are ties (e.g., 1, 2, 2, 4)
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank,
    
    -- Similar to RANK, but without gaps in case of ties (e.g., 1, 2, 2, 3)
    DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_salary_rank

FROM employees;
-- This is useful to identify relative standing of employees within each department based on salary.


-- Task 3: Identifying Top Records (Top 3 by Salary per Department)

WITH RankedEmployees AS (
    SELECT 
        employee_id,
        department,
        salary,
        
        -- Assigns a unique row number for each employee within a department,
        -- ordered by descending salary
        ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS rn
    FROM employees
)

SELECT 
    employee_id, 
    department, 
    salary
FROM RankedEmployees
WHERE rn <= 3;
-- This query retrieves the top 3 highest-paid employees from each department.


-- Task 4: Finding the Earliest Records (First 2 joiners per department)

WITH EarliestEmployees AS (
    SELECT 
        employee_id,
        department,
        join_date,
        
        -- Assigns a row number for each employee within a department,
        -- ordered by their join date (earliest first)
        ROW_NUMBER() OVER (PARTITION BY department ORDER BY join_date ASC) AS rn
    FROM employees
)

SELECT 
    employee_id, 
    department, 
    join_date
FROM EarliestEmployees
WHERE rn <= 2;
-- This query returns the first 2 employees who joined each department (based on join_date).


-- Task 5: Aggregation with Window Functions

SELECT 
    employee_id,
    department,
    salary,
    
    -- Maximum salary within the employee's department
    MAX(salary) OVER (PARTITION BY department) AS max_dept_salary,
    
    -- Maximum salary across all departments
    MAX(salary) OVER () AS overall_max_salary

FROM employees;
-- This is useful to compare an employee’s salary to both their department’s highest salary 
-- and the company-wide highest salary.
