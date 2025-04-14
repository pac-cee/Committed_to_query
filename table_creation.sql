-- Create the employees table
CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    department VARCHAR2(50),
    salary NUMBER,
    join_date DATE
);

-- Create the allowances table (if needed for other parts)
CREATE TABLE allowances (
    allowance_id NUMBER PRIMARY KEY,
    role_id NUMBER,
    allowance_amount NUMBER,
    is_applicable CHAR(1)
);