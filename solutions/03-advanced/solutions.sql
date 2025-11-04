-- Advanced SQL Exercise Solutions
-- Note: These solutions are written for PostgreSQL.
-- Some functions (DATE_TRUNC, AGE, PERCENTILE_CONT) may need adjustments for other databases.
-- See documentation for MySQL/SQLite alternatives.

-- Exercise 1: ROW_NUMBER
SELECT 
    first_name, 
    last_name, 
    salary,
    department_id,
    ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
FROM employees
ORDER BY department_id, salary_rank;

-- Exercise 2: RANK and DENSE_RANK
SELECT 
    first_name, 
    last_name, 
    salary,
    RANK() OVER (ORDER BY salary DESC) AS rank,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank
FROM employees
ORDER BY salary DESC;

-- Exercise 3: Window Function with Aggregates
SELECT 
    first_name, 
    last_name, 
    salary,
    department_id,
    SUM(salary) OVER (PARTITION BY department_id ORDER BY employee_id) AS running_total
FROM employees
ORDER BY department_id, employee_id;

-- Exercise 4: LAG and LEAD
SELECT 
    order_id,
    order_date,
    order_date - LAG(order_date) OVER (ORDER BY order_date) AS days_since_previous
FROM orders
ORDER BY order_date;

-- Exercise 5: CTE - Basic
WITH dept_avg AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
),
company_avg AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT d.department_name, da.avg_salary
FROM dept_avg da
INNER JOIN departments d ON da.department_id = d.department_id
CROSS JOIN company_avg ca
WHERE da.avg_salary > ca.avg_salary
ORDER BY da.avg_salary DESC;

-- Exercise 6: Multiple CTEs
WITH high_value_customers AS (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING SUM(total_amount) > 1000
),
frequent_customers AS (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) > 3
)
SELECT c.contact_name, c.company_name
FROM customers c
INNER JOIN high_value_customers hv ON c.customer_id = hv.customer_id
INNER JOIN frequent_customers fc ON c.customer_id = fc.customer_id;

-- Exercise 7: Recursive CTE
-- This query builds a hierarchical path from top-level managers down through all subordinates.
-- It starts with employees who have no manager (base case), then recursively adds their reports.
WITH RECURSIVE employee_hierarchy AS (
    -- Base case: employees without managers (top of hierarchy)
    SELECT 
        employee_id,
        first_name,
        last_name,
        manager_id,
        1 AS level,
        first_name || ' ' || last_name AS hierarchy_path
    FROM employees
    WHERE manager_id IS NULL
    
    UNION ALL
    
    -- Recursive case: employees with managers (subordinates at each level)
    SELECT 
        e.employee_id,
        e.first_name,
        e.last_name,
        e.manager_id,
        eh.level + 1,
        eh.hierarchy_path || ' -> ' || e.first_name || ' ' || e.last_name
    FROM employees e
    INNER JOIN employee_hierarchy eh ON e.manager_id = eh.employee_id
)
SELECT 
    employee_id,
    first_name,
    last_name,
    level,
    hierarchy_path
FROM employee_hierarchy
ORDER BY level, last_name;

-- Exercise 8: PARTITION BY
SELECT 
    e.first_name,
    e.last_name,
    e.salary,
    d.department_name,
    ROUND(100.0 * e.salary / SUM(e.salary) OVER (PARTITION BY e.department_id), 2) AS pct_of_dept_salary
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
ORDER BY d.department_name, pct_of_dept_salary DESC;

-- Exercise 9: Moving Average
SELECT 
    customer_id,
    order_id,
    order_date,
    total_amount,
    ROUND(AVG(total_amount) OVER (
        PARTITION BY customer_id 
        ORDER BY order_date 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 2) AS moving_avg_3_orders
FROM orders
ORDER BY customer_id, order_date;

-- Exercise 10: Complex Window Function
WITH product_sales AS (
    SELECT 
        p.product_id,
        p.product_name,
        p.category_id,
        SUM(oi.quantity) AS total_quantity
    FROM products p
    INNER JOIN order_items oi ON p.product_id = oi.product_id
    GROUP BY p.product_id, p.product_name, p.category_id
),
ranked_products AS (
    SELECT 
        ps.*,
        cat.category_name,
        ROW_NUMBER() OVER (PARTITION BY ps.category_id ORDER BY ps.total_quantity DESC) AS rank_in_category
    FROM product_sales ps
    INNER JOIN categories cat ON ps.category_id = cat.category_id
)
SELECT 
    category_name,
    product_name,
    total_quantity,
    rank_in_category
FROM ranked_products
WHERE rank_in_category <= 3
ORDER BY category_name, rank_in_category;

-- Exercise 11: Pivot-like Query
SELECT 
    c.contact_name,
    COUNT(CASE WHEN o.status = 'Pending' THEN 1 END) AS pending,
    COUNT(CASE WHEN o.status = 'Processing' THEN 1 END) AS processing,
    COUNT(CASE WHEN o.status = 'Shipped' THEN 1 END) AS shipped,
    COUNT(CASE WHEN o.status = 'Delivered' THEN 1 END) AS delivered
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.contact_name
ORDER BY c.contact_name;

-- Exercise 12: Advanced Date Analysis
WITH monthly_totals AS (
    SELECT 
        EXTRACT(YEAR FROM order_date) AS year,
        EXTRACT(MONTH FROM order_date) AS month,
        SUM(total_amount) AS monthly_total
    FROM orders
    WHERE EXTRACT(YEAR FROM order_date) = 2023
    GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
)
SELECT 
    year,
    month,
    monthly_total,
    LAG(monthly_total) OVER (ORDER BY year, month) AS previous_month,
    ROUND(
        100.0 * (monthly_total - LAG(monthly_total) OVER (ORDER BY year, month)) / 
        NULLIF(LAG(monthly_total) OVER (ORDER BY year, month), 0), 
        2
    ) AS growth_rate_pct
FROM monthly_totals
ORDER BY year, month;

-- Exercise 13: Gap and Island Problem
WITH order_sequence AS (
    SELECT order_id, ROW_NUMBER() OVER (ORDER BY order_id) AS seq
    FROM orders
)
SELECT os.order_id + 1 AS missing_order_id
FROM order_sequence os
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.order_id = os.order_id + 1
)
AND os.order_id < (SELECT MAX(order_id) FROM orders);

-- Exercise 14: Median Calculation
WITH ranked_salaries AS (
    SELECT 
        department_id,
        salary,
        ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary) AS row_num,
        COUNT(*) OVER (PARTITION BY department_id) AS total_count
    FROM employees
)
SELECT 
    d.department_name,
    AVG(rs.salary) AS median_salary
FROM ranked_salaries rs
INNER JOIN departments d ON rs.department_id = d.department_id
WHERE rs.row_num IN (
    FLOOR((rs.total_count + 1) / 2.0),
    CEIL((rs.total_count + 1) / 2.0)
)
GROUP BY d.department_id, d.department_name
ORDER BY median_salary DESC;

-- Exercise 15: Complex Self-Join
SELECT DISTINCT
    e1.first_name || ' ' || e1.last_name AS employee1,
    e2.first_name || ' ' || e2.last_name AS employee2,
    p.project_name
FROM project_assignments pa1
INNER JOIN project_assignments pa2 ON pa1.project_id = pa2.project_id AND pa1.employee_id < pa2.employee_id
INNER JOIN employees e1 ON pa1.employee_id = e1.employee_id
INNER JOIN employees e2 ON pa2.employee_id = e2.employee_id
INNER JOIN projects p ON pa1.project_id = p.project_id
ORDER BY p.project_name, employee1;

-- Exercise 16: Advanced Subquery
WITH product_category_avg AS (
    SELECT 
        p.category_id,
        AVG(oi.quantity * oi.unit_price) AS category_avg
    FROM products p
    INNER JOIN order_items oi ON p.product_id = oi.product_id
    GROUP BY p.category_id
),
overall_avg AS (
    SELECT AVG(oi.quantity * oi.unit_price) AS overall_avg
    FROM order_items oi
),
product_avg AS (
    SELECT 
        p.product_id,
        p.product_name,
        p.category_id,
        AVG(oi.quantity * oi.unit_price) AS product_avg
    FROM products p
    INNER JOIN order_items oi ON p.product_id = oi.product_id
    GROUP BY p.product_id, p.product_name, p.category_id
)
SELECT pa.product_name, pa.product_avg
FROM product_avg pa
INNER JOIN product_category_avg pca ON pa.category_id = pca.category_id
CROSS JOIN overall_avg oa
WHERE pa.product_avg > pca.category_avg AND pa.product_avg < oa.overall_avg;

-- Exercise 17: Window Function Filtering
WITH ranked_orders AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS rn
    FROM orders
)
SELECT 
    customer_id,
    order_id,
    order_date,
    total_amount,
    status
FROM ranked_orders
WHERE rn = 1
ORDER BY customer_id;

-- Exercise 18: Cohort Analysis
WITH customer_cohorts AS (
    SELECT 
        customer_id,
        DATE_TRUNC('month', registration_date) AS cohort_month
    FROM customers
),
customer_orders AS (
    SELECT 
        o.customer_id,
        DATE_TRUNC('month', o.order_date) AS order_month
    FROM orders o
)
SELECT 
    TO_CHAR(cc.cohort_month, 'YYYY-MM') AS cohort,
    COUNT(DISTINCT cc.customer_id) AS total_customers,
    COUNT(DISTINCT CASE WHEN co.order_month >= cc.cohort_month + INTERVAL '1 month' 
                        THEN co.customer_id END) AS retained_month_1,
    COUNT(DISTINCT CASE WHEN co.order_month >= cc.cohort_month + INTERVAL '2 months' 
                        THEN co.customer_id END) AS retained_month_2
FROM customer_cohorts cc
LEFT JOIN customer_orders co ON cc.customer_id = co.customer_id
GROUP BY cc.cohort_month
ORDER BY cc.cohort_month;

-- Exercise 19: Running Totals with Reset
SELECT 
    customer_id,
    order_date,
    total_amount,
    EXTRACT(YEAR FROM order_date) AS year,
    SUM(total_amount) OVER (
        PARTITION BY customer_id, EXTRACT(YEAR FROM order_date)
        ORDER BY order_date
    ) AS yearly_running_total
FROM orders
ORDER BY customer_id, order_date;

-- Exercise 20: Complex CTE with Aggregation
WITH job_avg_hours AS (
    SELECT 
        e.job_title,
        AVG(pa.hours_allocated) AS avg_hours
    FROM employees e
    INNER JOIN project_assignments pa ON e.employee_id = pa.employee_id
    GROUP BY e.job_title
),
employee_total_hours AS (
    SELECT 
        e.employee_id,
        e.first_name,
        e.last_name,
        e.job_title,
        SUM(pa.hours_allocated) AS total_hours
    FROM employees e
    INNER JOIN project_assignments pa ON e.employee_id = pa.employee_id
    GROUP BY e.employee_id, e.first_name, e.last_name, e.job_title
)
SELECT 
    eth.first_name,
    eth.last_name,
    eth.job_title,
    eth.total_hours,
    ROUND(jah.avg_hours, 2) AS job_avg_hours
FROM employee_total_hours eth
INNER JOIN job_avg_hours jah ON eth.job_title = jah.job_title
WHERE eth.total_hours > jah.avg_hours
ORDER BY eth.total_hours DESC;

-- Exercise 21: Percentile Calculation
SELECT 
    d.department_name,
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY e.salary) AS percentile_25,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY e.salary) AS percentile_50,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY e.salary) AS percentile_75
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
ORDER BY d.department_name;

-- Exercise 22: First and Last Value
SELECT DISTINCT
    d.department_name,
    FIRST_VALUE(e.first_name || ' ' || e.last_name) OVER (
        PARTITION BY d.department_id ORDER BY e.hire_date
    ) AS first_hired,
    FIRST_VALUE(e.hire_date) OVER (
        PARTITION BY d.department_id ORDER BY e.hire_date
    ) AS first_hire_date,
    LAST_VALUE(e.first_name || ' ' || e.last_name) OVER (
        PARTITION BY d.department_id ORDER BY e.hire_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS last_hired,
    LAST_VALUE(e.hire_date) OVER (
        PARTITION BY d.department_id ORDER BY e.hire_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS last_hire_date
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
ORDER BY d.department_name;

-- Exercise 23: Conditional Aggregation
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_quantity,
    SUM(oi.quantity * oi.unit_price) AS total_sales,
    SUM(CASE WHEN o.total_amount > 500 THEN oi.quantity * oi.unit_price ELSE 0 END) AS high_value_sales,
    SUM(CASE WHEN o.total_amount <= 500 THEN oi.quantity * oi.unit_price ELSE 0 END) AS low_value_sales
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
INNER JOIN orders o ON oi.order_id = o.order_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sales DESC;

-- Exercise 24: Advanced Ranking
WITH project_ranks AS (
    SELECT 
        project_id,
        project_name,
        budget,
        ROW_NUMBER() OVER (ORDER BY budget DESC) AS rank
    FROM projects
)
SELECT 
    pr1.project_name,
    pr1.budget,
    pr1.rank,
    pr2.project_name AS next_higher_project,
    pr2.budget AS next_higher_budget,
    pr3.project_name AS next_lower_project,
    pr3.budget AS next_lower_budget
FROM project_ranks pr1
LEFT JOIN project_ranks pr2 ON pr2.rank = pr1.rank - 1
LEFT JOIN project_ranks pr3 ON pr3.rank = pr1.rank + 1
ORDER BY pr1.rank;

-- Exercise 25: Complex Business Query
SELECT 
    p.project_name,
    p.status,
    p.start_date,
    COUNT(pa.employee_id) AS assigned_employees,
    CASE 
        WHEN COUNT(pa.employee_id) < 2 THEN 'At Risk: Low staffing'
        WHEN p.start_date < CURRENT_DATE - INTERVAL '90 days' 
             AND p.status = 'Active' THEN 'At Risk: No recent activity'
        ELSE 'Healthy'
    END AS risk_status
FROM projects p
LEFT JOIN project_assignments pa ON p.project_id = pa.project_id
WHERE p.status = 'Active'
GROUP BY p.project_id, p.project_name, p.status, p.start_date
HAVING COUNT(pa.employee_id) < 2 
    OR p.start_date < CURRENT_DATE - INTERVAL '90 days'
ORDER BY risk_status, p.project_name;
