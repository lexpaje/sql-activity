-- Beginner SQL Exercise Solutions

-- Exercise 1: Simple SELECT
SELECT * FROM employees;

-- Exercise 2: SELECT Specific Columns
SELECT first_name, last_name, email 
FROM employees;

-- Exercise 3: WHERE Clause
SELECT * FROM employees 
WHERE department_id = 1;

-- Exercise 4: Multiple Conditions
SELECT * FROM employees 
WHERE salary > 70000 AND hire_date > '2019-01-01';

-- Exercise 5: ORDER BY
SELECT * FROM employees 
ORDER BY salary DESC;

-- Exercise 6: LIMIT
SELECT * FROM employees 
ORDER BY salary DESC 
LIMIT 5;

-- Exercise 7: COUNT
SELECT COUNT(*) AS total_employees 
FROM employees;

-- Exercise 8: SUM
SELECT SUM(salary) AS total_salary_expense 
FROM employees;

-- Exercise 9: AVG
SELECT AVG(salary) AS average_salary 
FROM employees;

-- Exercise 10: DISTINCT
SELECT DISTINCT job_title 
FROM employees 
ORDER BY job_title;

-- Exercise 11: String Matching
SELECT * FROM employees 
WHERE last_name LIKE 'J%';

-- Exercise 12: BETWEEN
SELECT * FROM employees 
WHERE salary BETWEEN 60000 AND 80000;

-- Exercise 13: IN Clause
SELECT * FROM employees 
WHERE department_id IN (1, 2, 3);

-- Exercise 14: NULL Values
SELECT * FROM employees 
WHERE manager_id IS NULL;

-- Exercise 15: Date Filtering
SELECT * FROM employees 
WHERE EXTRACT(YEAR FROM hire_date) = 2020;
-- Alternative: WHERE hire_date >= '2020-01-01' AND hire_date < '2021-01-01';

-- Exercise 16: COUNT with GROUP BY
SELECT department_id, COUNT(*) AS employee_count 
FROM employees 
GROUP BY department_id 
ORDER BY department_id;

-- Exercise 17: MAX and MIN
SELECT 
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary 
FROM employees;

-- Exercise 18: Products Query
SELECT product_name, price 
FROM products 
ORDER BY price ASC;

-- Exercise 19: Customers by City
SELECT DISTINCT city 
FROM customers 
ORDER BY city;

-- Exercise 20: Basic Calculation
SELECT 
    product_name,
    price AS original_price,
    ROUND(price * 0.9, 2) AS discounted_price 
FROM products;
