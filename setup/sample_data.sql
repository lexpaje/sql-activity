-- Sample Data for SQL Practice Database
-- This file populates the database with realistic test data

-- Insert Departments
INSERT INTO departments (department_name, location, budget) VALUES
('Engineering', 'New York', 500000.00),
('Sales', 'Chicago', 300000.00),
('Marketing', 'Los Angeles', 250000.00),
('Human Resources', 'New York', 150000.00),
('Finance', 'Boston', 200000.00),
('Customer Support', 'Austin', 180000.00);

-- Insert Employees
INSERT INTO employees (first_name, last_name, email, phone, hire_date, job_title, salary, department_id, manager_id) VALUES
('John', 'Smith', 'john.smith@company.com', '555-0101', '2018-01-15', 'Engineering Manager', 95000.00, 1, NULL),
('Sarah', 'Johnson', 'sarah.johnson@company.com', '555-0102', '2019-03-20', 'Senior Developer', 85000.00, 1, 1),
('Michael', 'Williams', 'michael.williams@company.com', '555-0103', '2020-06-10', 'Developer', 70000.00, 1, 1),
('Emily', 'Brown', 'emily.brown@company.com', '555-0104', '2019-09-05', 'Sales Manager', 90000.00, 2, NULL),
('David', 'Jones', 'david.jones@company.com', '555-0105', '2020-02-14', 'Sales Representative', 65000.00, 2, 4),
('Jennifer', 'Garcia', 'jennifer.garcia@company.com', '555-0106', '2021-01-08', 'Sales Representative', 62000.00, 2, 4),
('Robert', 'Miller', 'robert.miller@company.com', '555-0107', '2018-11-12', 'Marketing Manager', 88000.00, 3, NULL),
('Lisa', 'Davis', 'lisa.davis@company.com', '555-0108', '2020-04-22', 'Marketing Specialist', 60000.00, 3, 7),
('James', 'Rodriguez', 'james.rodriguez@company.com', '555-0109', '2019-07-30', 'HR Manager', 82000.00, 4, NULL),
('Maria', 'Martinez', 'maria.martinez@company.com', '555-0110', '2021-03-15', 'HR Specialist', 55000.00, 4, 9),
('William', 'Anderson', 'william.anderson@company.com', '555-0111', '2018-05-20', 'Finance Manager', 92000.00, 5, NULL),
('Patricia', 'Taylor', 'patricia.taylor@company.com', '555-0112', '2020-08-18', 'Accountant', 68000.00, 5, 11),
('Christopher', 'Thomas', 'christopher.thomas@company.com', '555-0113', '2021-05-10', 'Support Manager', 75000.00, 6, NULL),
('Jessica', 'Moore', 'jessica.moore@company.com', '555-0114', '2021-09-01', 'Support Specialist', 50000.00, 6, 13),
('Daniel', 'Jackson', 'daniel.jackson@company.com', '555-0115', '2022-01-20', 'Junior Developer', 58000.00, 1, 1);

-- Insert Projects
INSERT INTO projects (project_name, description, start_date, end_date, budget, status) VALUES
('Website Redesign', 'Complete overhaul of company website', '2023-01-15', '2023-06-30', 75000.00, 'Completed'),
('Mobile App Development', 'Develop iOS and Android mobile application', '2023-03-01', '2023-12-31', 150000.00, 'Active'),
('CRM System Integration', 'Integrate new CRM system with existing tools', '2023-05-10', '2024-02-28', 95000.00, 'Active'),
('Marketing Campaign Q3', 'Summer marketing campaign across channels', '2023-07-01', '2023-09-30', 45000.00, 'Completed'),
('Database Migration', 'Migrate to new database infrastructure', '2023-06-15', NULL, 80000.00, 'Planning'),
('Customer Portal', 'Build self-service customer portal', '2023-08-01', '2024-04-30', 120000.00, 'Active');

-- Insert Project Assignments
INSERT INTO project_assignments (employee_id, project_id, assigned_date, role, hours_allocated) VALUES
(2, 1, '2023-01-15', 'Lead Developer', 320),
(3, 1, '2023-01-20', 'Developer', 280),
(2, 2, '2023-03-01', 'Technical Lead', 400),
(3, 2, '2023-03-01', 'Developer', 400),
(15, 2, '2023-03-15', 'Junior Developer', 380),
(2, 3, '2023-05-10', 'Integration Specialist', 240),
(8, 4, '2023-07-01', 'Campaign Manager', 200),
(3, 5, '2023-06-15', 'Database Engineer', 160),
(2, 6, '2023-08-01', 'Senior Developer', 320),
(15, 6, '2023-08-01', 'Developer', 320);

-- Insert Customers
INSERT INTO customers (company_name, contact_name, email, phone, address, city, country, registration_date) VALUES
('Tech Solutions Inc', 'Alice Cooper', 'alice@techsolutions.com', '555-1001', '123 Tech Street', 'San Francisco', 'USA', '2022-01-15'),
('Global Enterprises', 'Bob Wilson', 'bob@globalent.com', '555-1002', '456 Business Ave', 'New York', 'USA', '2022-03-20'),
('Innovation Labs', 'Carol White', 'carol@innovationlabs.com', '555-1003', '789 Innovation Blvd', 'Austin', 'USA', '2022-05-10'),
('Mega Corp', 'David Black', 'david@megacorp.com', '555-1004', '321 Corporate Dr', 'Chicago', 'USA', '2022-07-22'),
('Smart Systems', 'Eva Green', 'eva@smartsystems.com', '555-1005', '654 Smart Lane', 'Seattle', 'USA', '2022-09-08'),
('Digital Dynamics', 'Frank Brown', 'frank@digitaldynamics.com', '555-1006', '987 Digital Way', 'Boston', 'USA', '2022-11-15'),
('Future Tech', 'Grace Lee', 'grace@futuretech.com', '555-1007', '147 Future Road', 'Denver', 'USA', '2023-01-10'),
('Prime Solutions', 'Henry Kim', 'henry@primesolutions.com', '555-1008', '258 Prime Street', 'Miami', 'USA', '2023-03-05'),
('Alpha Industries', 'Irene Chen', 'irene@alphaindustries.com', '555-1009', '369 Alpha Court', 'Portland', 'USA', '2023-05-20'),
('Beta Services', 'Jack Martinez', 'jack@betaservices.com', '555-1010', '741 Beta Plaza', 'Phoenix', 'USA', '2023-07-12');

-- Insert Categories
INSERT INTO categories (category_name, description) VALUES
('Electronics', 'Electronic devices and accessories'),
('Software', 'Software products and licenses'),
('Hardware', 'Computer hardware and components'),
('Office Supplies', 'General office supplies and equipment'),
('Furniture', 'Office furniture and fixtures'),
('Services', 'Professional and support services');

-- Insert Products
INSERT INTO products (product_name, category_id, price, stock_quantity, discontinued) VALUES
('Laptop Pro 15"', 1, 1299.99, 50, FALSE),
('Wireless Mouse', 1, 29.99, 200, FALSE),
('Mechanical Keyboard', 1, 89.99, 150, FALSE),
('4K Monitor 27"', 1, 399.99, 75, FALSE),
('USB-C Hub', 1, 49.99, 180, FALSE),
('Project Management Software', 2, 299.99, 1000, FALSE),
('Antivirus Suite', 2, 79.99, 1000, FALSE),
('Cloud Storage 1TB', 2, 119.99, 1000, FALSE),
('RAM 16GB DDR4', 3, 79.99, 120, FALSE),
('SSD 1TB', 3, 129.99, 90, FALSE),
('Graphics Card RTX', 3, 599.99, 30, FALSE),
('Printer Paper 500 Sheets', 4, 12.99, 500, FALSE),
('Pen Set (12 pack)', 4, 8.99, 300, FALSE),
('Desk Lamp LED', 4, 34.99, 100, FALSE),
('Office Chair Ergonomic', 5, 299.99, 45, FALSE),
('Standing Desk', 5, 499.99, 25, FALSE),
('Filing Cabinet', 5, 179.99, 40, FALSE),
('IT Consulting (per hour)', 6, 150.00, 1000, FALSE),
('Training Session', 6, 499.99, 1000, FALSE),
('Technical Support (monthly)', 6, 199.99, 1000, FALSE);

-- Insert Orders
INSERT INTO orders (customer_id, order_date, shipped_date, status, total_amount) VALUES
(1, '2023-01-20', '2023-01-22', 'Delivered', 1429.98),
(2, '2023-02-15', '2023-02-17', 'Delivered', 899.97),
(3, '2023-03-10', '2023-03-12', 'Delivered', 2099.96),
(1, '2023-04-05', '2023-04-07', 'Delivered', 379.98),
(4, '2023-05-12', '2023-05-14', 'Delivered', 1799.97),
(5, '2023-06-18', NULL, 'Shipped', 729.98),
(6, '2023-07-22', NULL, 'Processing', 999.98),
(2, '2023-08-01', NULL, 'Pending', 549.99),
(7, '2023-08-15', NULL, 'Processing', 1299.99),
(8, '2023-09-03', NULL, 'Pending', 299.99),
(9, '2023-09-20', NULL, 'Pending', 829.97),
(3, '2023-10-05', NULL, 'Pending', 1549.98),
(10, '2023-10-18', NULL, 'Pending', 679.98);

-- Insert Order Items
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES
(1, 1, 1, 1299.99, 0.00),
(1, 2, 1, 29.99, 0.00),
(1, 5, 2, 49.99, 0.00),
(2, 3, 1, 89.99, 0.00),
(2, 4, 2, 399.99, 10.00),
(3, 1, 1, 1299.99, 0.00),
(3, 4, 2, 399.99, 0.00),
(4, 6, 1, 299.99, 0.00),
(4, 7, 1, 79.99, 0.00),
(5, 1, 1, 1299.99, 0.00),
(5, 10, 1, 129.99, 0.00),
(5, 11, 1, 599.99, 50.00),
(6, 15, 2, 299.99, 0.00),
(6, 14, 3, 34.99, 5.00),
(7, 16, 2, 499.99, 0.00),
(8, 18, 3, 150.00, 10.00),
(8, 19, 1, 499.99, 50.00),
(9, 1, 1, 1299.99, 0.00),
(10, 6, 1, 299.99, 0.00),
(11, 9, 2, 79.99, 0.00),
(11, 10, 3, 129.99, 10.00),
(11, 13, 10, 8.99, 0.00),
(12, 15, 5, 299.99, 10.00),
(13, 2, 5, 29.99, 0.00),
(13, 3, 3, 89.99, 0.00),
(13, 5, 5, 49.99, 0.00);

-- Display success message
SELECT 'Sample data loaded successfully!' AS message;
SELECT 'Database is ready for SQL practice!' AS status;
