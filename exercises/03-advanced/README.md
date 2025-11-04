# Advanced SQL Exercises

These exercises test your mastery of complex SQL concepts and optimization techniques.

## Topics Covered
- Window Functions (ROW_NUMBER, RANK, DENSE_RANK)
- Common Table Expressions (CTEs)
- Recursive CTEs
- Analytic Functions (LEAD, LAG, PARTITION BY)
- Complex subqueries
- Query optimization
- Advanced aggregations

## Exercises

### Exercise 1: ROW_NUMBER
**Question:** Assign a row number to employees ordered by salary (highest first) within each department.

### Exercise 2: RANK and DENSE_RANK
**Question:** Rank employees by salary across the entire company, showing both RANK and DENSE_RANK.

### Exercise 3: Window Function with Aggregates
**Question:** For each employee, show their salary and the running total of salaries in their department.

### Exercise 4: LAG and LEAD
**Question:** For each order, show the order date and the number of days since the previous order.

### Exercise 5: CTE - Basic
**Question:** Use a CTE to find departments where the average salary is above company average.

### Exercise 6: Multiple CTEs
**Question:** Create CTEs for high-value customers (>$1000 in orders) and frequent customers (>3 orders), then find customers in both categories.

### Exercise 7: Recursive CTE
**Question:** Create a recursive query to show the employee hierarchy (employee → manager → manager's manager, etc.).

### Exercise 8: PARTITION BY
**Question:** Calculate what percentage of the total department salary each employee represents.

### Exercise 9: Moving Average
**Question:** Calculate a 3-order moving average of order amounts by customer.

### Exercise 10: Complex Window Function
**Question:** Find the top 3 best-selling products in each category based on total quantity sold.

### Exercise 11: Pivot-like Query
**Question:** Show a summary of order status counts by customer (columns: customer, pending, processing, shipped, delivered).

### Exercise 12: Advanced Date Analysis
**Question:** Calculate month-over-month growth rate of order values for 2023.

### Exercise 13: Gap and Island Problem
**Question:** Find gaps in order IDs (missing order numbers in the sequence).

### Exercise 14: Median Calculation
**Question:** Calculate the median salary for each department.

### Exercise 15: Complex Self-Join
**Question:** Find pairs of employees who work on the same project.

### Exercise 16: Advanced Subquery
**Question:** Find products that have higher-than-average sales in their category but lower-than-average overall.

### Exercise 17: Window Function Filtering
**Question:** Select only the most recent order for each customer using window functions.

### Exercise 18: Cohort Analysis
**Question:** Create a cohort analysis showing customer retention by registration month.

### Exercise 19: Running Totals with Reset
**Question:** Calculate running total of order amounts by customer, resetting for each year.

### Exercise 20: Complex CTE with Aggregation
**Question:** Find employees whose total project hours exceed the average for their job title.

### Exercise 21: Percentile Calculation
**Question:** Calculate salary percentiles (25th, 50th, 75th) for each department.

### Exercise 22: First and Last Value
**Question:** For each department, show the first and last employee hired (by hire date).

### Exercise 23: Conditional Aggregation
**Question:** Create a product performance report showing total sales, with separate columns for online vs. in-store (simulate with order amounts above/below $500).

### Exercise 24: Advanced Ranking
**Question:** Rank projects by budget and show each project's rank along with the next higher and lower budgeted projects.

### Exercise 25: Complex Business Query
**Question:** Identify "at-risk" projects: active projects with fewer than 2 assigned employees or with no activity in the past 90 days (simulate with project dates).

## Tips for Success
- Window functions are powerful - understand PARTITION BY and ORDER BY within them
- CTEs make complex queries more readable - use them liberally
- Recursive CTEs need a base case and recursive case - think like recursion in programming
- Test performance on larger datasets - understanding query optimization is key
- Draw diagrams for complex hierarchical or sequential data problems

## Challenge Yourself
- Try to solve each problem multiple ways
- Compare query performance of different approaches
- Consider how queries would scale with millions of records
- Think about indexing strategies for optimization

## Expert Level
Once you master these exercises, you're ready to tackle real-world database challenges!
Consider exploring:
- Query optimization and execution plans
- Database design and normalization
- Stored procedures and functions
- Transactions and concurrency
- Database security and permissions
