-- Intermediate SQL Exercise Solutions

-- Exercise 1: INNER JOIN
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

-- Exercise 2: JOIN with WHERE
SELECT e.first_name, e.last_name, e.job_title
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Engineering';

-- Exercise 3: Multiple JOINs
SELECT c.contact_name, p.product_name, oi.quantity
FROM order_items oi
INNER JOIN orders o ON oi.order_id = o.order_id
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN products p ON oi.product_id = p.product_id;

-- Exercise 4: LEFT JOIN
SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY employee_count DESC;

-- Exercise 5: Aggregate with JOIN
SELECT c.contact_name, COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.contact_name
ORDER BY total_spent DESC;

-- Exercise 6: GROUP BY with HAVING
SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM departments d
INNER JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING AVG(e.salary) > 70000;

-- Exercise 7: Subquery in WHERE
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;

-- Exercise 8: Subquery in SELECT
SELECT 
    first_name, 
    last_name, 
    salary,
    ROUND(salary - (SELECT AVG(salary) FROM employees), 2) AS difference_from_avg
FROM employees
ORDER BY difference_from_avg DESC;

-- Exercise 9: Correlated Subquery
SELECT e1.first_name, e1.last_name, e1.salary, d.department_name
FROM employees e1
INNER JOIN departments d ON e1.department_id = d.department_id
WHERE e1.salary > (
    SELECT AVG(e2.salary) 
    FROM employees e2 
    WHERE e2.department_id = e1.department_id
)
ORDER BY d.department_name, e1.salary DESC;

-- Exercise 10: EXISTS
SELECT c.contact_name, c.company_name
FROM customers c
WHERE EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id
);

-- Exercise 11: CASE Statement
SELECT 
    first_name, 
    last_name, 
    salary,
    CASE 
        WHEN salary < 60000 THEN 'Low'
        WHEN salary BETWEEN 60000 AND 80000 THEN 'Medium'
        ELSE 'High'
    END AS salary_category
FROM employees
ORDER BY salary;

-- Exercise 12: Date Functions
SELECT 
    first_name, 
    last_name, 
    hire_date,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, hire_date)) AS years_with_company
FROM employees
ORDER BY years_with_company DESC;

-- Exercise 13: String Functions
SELECT 
    last_name || ', ' || first_name || ' <' || email || '>' AS email_display
FROM employees
ORDER BY last_name;

-- Exercise 14: Self JOIN
SELECT 
    e.first_name || ' ' || e.last_name AS employee_name,
    COALESCE(m.first_name || ' ' || m.last_name, 'No Manager') AS manager_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id
ORDER BY employee_name;

-- Exercise 15: Complex GROUP BY
SELECT 
    cat.category_name,
    SUM(oi.quantity * oi.unit_price * (1 - oi.discount/100)) AS total_sales
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id
INNER JOIN categories cat ON p.category_id = cat.category_id
GROUP BY cat.category_id, cat.category_name
ORDER BY total_sales DESC;

-- Exercise 16: Multiple Aggregates
SELECT 
    d.department_name,
    COUNT(e.employee_id) AS employee_count,
    ROUND(AVG(e.salary), 2) AS avg_salary,
    SUM(e.salary) AS total_salary_cost
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY total_salary_cost DESC;

-- Exercise 17: JOIN with Aggregates
SELECT 
    p.project_name,
    COUNT(pa.employee_id) AS employee_count
FROM projects p
LEFT JOIN project_assignments pa ON p.project_id = pa.project_id
GROUP BY p.project_id, p.project_name
ORDER BY employee_count DESC;

-- Exercise 18: Date Range Query
SELECT *
FROM orders
WHERE order_date >= (SELECT MAX(order_date) - INTERVAL '6 months' FROM orders)
ORDER BY order_date DESC;

-- Exercise 19: Subquery in FROM
SELECT department_name, avg_salary
FROM (
    SELECT 
        d.department_name,
        AVG(e.salary) AS avg_salary
    FROM departments d
    INNER JOIN employees e ON d.department_id = e.department_id
    GROUP BY d.department_id, d.department_name
) AS dept_avg
ORDER BY avg_salary DESC
LIMIT 1;

-- Exercise 20: Complex Filtering
SELECT p.product_name, p.price
FROM products p
WHERE NOT EXISTS (
    SELECT 1 FROM order_items oi WHERE oi.product_id = p.product_id
)
ORDER BY p.product_name;

-- Exercise 21: UNION
SELECT first_name || ' ' || last_name AS name, email, 'Employee' AS type
FROM employees
UNION
SELECT contact_name, email, 'Customer' AS type
FROM customers
ORDER BY name;

-- Exercise 22: Advanced HAVING
SELECT c.contact_name, SUM(o.total_amount) AS total_spent
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.contact_name
HAVING SUM(o.total_amount) > 1000
ORDER BY total_spent DESC;

-- Exercise 23: Multiple JOINs with Aggregates
SELECT 
    c.contact_name,
    cat.category_name,
    SUM(oi.quantity * oi.unit_price * (1 - oi.discount/100)) AS category_spending
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
INNER JOIN categories cat ON p.category_id = cat.category_id
GROUP BY c.customer_id, c.contact_name, cat.category_id, cat.category_name
ORDER BY c.contact_name, category_spending DESC;

-- Exercise 24: Date Extraction
SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    TO_CHAR(order_date, 'Month') AS month_name,
    COUNT(*) AS order_count
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2023
GROUP BY EXTRACT(MONTH FROM order_date), TO_CHAR(order_date, 'Month')
ORDER BY month;

-- Exercise 25: Nested Subqueries
SELECT e.first_name, e.last_name, e.salary, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
)
ORDER BY d.department_name;
