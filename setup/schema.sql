-- SQL Practice Database Schema
-- This schema creates a realistic business database for practicing SQL queries

-- Drop existing tables if they exist
DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS project_assignments CASCADE;
DROP TABLE IF EXISTS projects CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS departments CASCADE;

-- Create Departments table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    budget DECIMAL(12, 2)
);

-- Create Employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    hire_date DATE NOT NULL,
    job_title VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INTEGER,
    manager_id INTEGER,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

-- Create Projects table
CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(200) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(12, 2),
    status VARCHAR(50) CHECK (status IN ('Planning', 'Active', 'Completed', 'On Hold', 'Cancelled'))
);

-- Create Project Assignments table (many-to-many relationship)
CREATE TABLE project_assignments (
    assignment_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    project_id INTEGER NOT NULL,
    assigned_date DATE,
    role VARCHAR(100),
    hours_allocated INTEGER,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- Create Customers table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    company_name VARCHAR(200),
    contact_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(200),
    city VARCHAR(100),
    country VARCHAR(100),
    registration_date DATE DEFAULT CURRENT_DATE
);

-- Create Categories table
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Create Products table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(200) NOT NULL,
    category_id INTEGER,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INTEGER DEFAULT 0,
    discontinued BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Create Orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE DEFAULT CURRENT_DATE,
    shipped_date DATE,
    status VARCHAR(50) CHECK (status IN ('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled')),
    total_amount DECIMAL(12, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create Order Items table
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    discount DECIMAL(5, 2) DEFAULT 0.00,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Create indexes for better query performance
CREATE INDEX idx_employees_department ON employees(department_id);
CREATE INDEX idx_employees_manager ON employees(manager_id);
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_date ON orders(order_date);
CREATE INDEX idx_order_items_order ON order_items(order_id);
CREATE INDEX idx_order_items_product ON order_items(product_id);
CREATE INDEX idx_project_assignments_employee ON project_assignments(employee_id);
CREATE INDEX idx_project_assignments_project ON project_assignments(project_id);

-- Display success message
SELECT 'Database schema created successfully!' AS message;
