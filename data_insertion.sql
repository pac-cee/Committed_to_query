-- Insert sample data into the employees table
INSERT INTO employees (employee_id, first_name, last_name, department, salary, join_date)
 VALUES (101, 'John', 'Doe', 'Sales', 45000, TO_DATE('2021-01-15', 'YYYY-MM-DD'));
INSERT INTO employees (employee_id, first_name, last_name, department, salary, join_date) 
VALUES (102, 'Jane', 'Smith', 'Sales', 55000, TO_DATE('2020-06-10', 'YYYY-MM-DD'));
INSERT INTO employees (employee_id, first_name, last_name, department, salary, join_date) 
VALUES (103, 'Alice', 'Brown', 'HR', 48000, TO_DATE('2019-03-20', 'YYYY-MM-DD'));
INSERT INTO employees (employee_id, first_name, last_name, department, salary, join_date)
 VALUES (104, 'Bob', 'White', 'HR', 60000, TO_DATE('2022-07-05', 'YYYY-MM-DD'));
INSERT INTO employees (employee_id, first_name, last_name, department, salary, join_date) 
VALUES (105, 'Charlie', 'Black', 'IT', 70000, TO_DATE('2018-11-01', 'YYYY-MM-DD'));
COMMIT;

-- Insert sample data into the allowances table (if needed)
INSERT INTO allowances (allowance_id, role_id, allowance_amount, is_applicable) 
VALUES (1, 101, 1500, 'Y');
INSERT INTO allowances (allowance_id, role_id, allowance_amount, is_applicable)
 VALUES (2, 101, 2000, 'Y');
INSERT INTO allowances (allowance_id, role_id, allowance_amount, is_applicable)
 VALUES (3, 102, 1800, 'N');
COMMIT;