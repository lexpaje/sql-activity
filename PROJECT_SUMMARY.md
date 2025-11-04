# SQL Practice Repository - Project Summary

## Overview
This repository has been transformed into a comprehensive SQL practice environment designed to help developers improve their SQL skills through hands-on exercises.

## What's Included

### 📚 Documentation
- **README.md**: Complete project overview with learning objectives and repository structure
- **QUICKSTART.md**: Step-by-step guide to get started in minutes
- **TIPS.md**: Best practices, common mistakes, and learning strategies
- **CONTRIBUTING.md**: Guidelines for contributing to the project

### 🗄️ Database Setup
- **schema.sql**: Complete database schema with 9 tables
  - Employees and Departments
  - Projects and Project Assignments
  - Customers and Orders
  - Products, Categories, and Order Items
- **sample_data.sql**: Realistic sample data for all tables
  - 15 employees across 6 departments
  - 6 projects with assignments
  - 10 customers with 13 orders
  - 20 products in 6 categories
  - Comprehensive order items data

### 📝 Practice Exercises

#### Beginner Level (20 exercises)
Topics covered:
- Simple SELECT statements
- WHERE clause and filtering
- ORDER BY and LIMIT
- Basic aggregate functions
- DISTINCT and NULL handling
- String matching with LIKE
- Date filtering

#### Intermediate Level (25 exercises)
Topics covered:
- INNER JOIN, LEFT JOIN, RIGHT JOIN
- Multiple table joins
- GROUP BY with HAVING
- Subqueries (in WHERE, SELECT, FROM)
- CASE statements
- String and date functions
- Self-joins and EXISTS
- Complex filtering

#### Advanced Level (25 exercises)
Topics covered:
- Window functions (ROW_NUMBER, RANK, DENSE_RANK)
- Common Table Expressions (CTEs)
- Recursive CTEs
- Analytic functions (LEAD, LAG, PARTITION BY)
- Running totals and moving averages
- Cohort analysis
- Percentile calculations
- Complex business queries

### ✅ Complete Solutions
- Beginner solutions: 20 queries
- Intermediate solutions: 25 queries
- Advanced solutions: 25 queries
- All solutions tested and include comments
- Multiple approaches shown where applicable

## Database Schema

### Table Relationships
```
departments (1) ─→ (many) employees
employees (1) ─→ (many) employees (manager relationship)
projects (1) ─→ (many) project_assignments (many) ─→ (1) employees
customers (1) ─→ (many) orders
orders (1) ─→ (many) order_items (many) ─→ (1) products
categories (1) ─→ (many) products
```

### Key Features
- Foreign key constraints for referential integrity
- Self-referencing relationship for employee hierarchy
- Many-to-many relationship via project_assignments
- Check constraints for data validation
- Indexes on commonly queried columns

## Learning Path

1. **Setup** (10 minutes)
   - Install database system
   - Create database
   - Run setup scripts

2. **Beginner** (2-4 hours)
   - Master basic SELECT queries
   - Learn filtering and sorting
   - Practice aggregate functions

3. **Intermediate** (4-8 hours)
   - Master JOINs
   - Work with subqueries
   - Use functions effectively

4. **Advanced** (8-16 hours)
   - Master window functions
   - Work with CTEs
   - Optimize complex queries

## File Structure
```
sql-activity/
├── README.md                           # Main documentation
├── QUICKSTART.md                       # Quick start guide
├── TIPS.md                            # Best practices
├── CONTRIBUTING.md                     # Contribution guidelines
├── PROJECT_SUMMARY.md                  # This file
├── .gitignore                         # Git ignore rules
├── setup/
│   ├── schema.sql                     # Database schema (127 lines)
│   └── sample_data.sql                # Sample data (145 lines)
├── exercises/
│   ├── 01-beginner/
│   │   └── README.md                  # 20 exercises
│   ├── 02-intermediate/
│   │   └── README.md                  # 25 exercises
│   └── 03-advanced/
│       └── README.md                  # 25 exercises
└── solutions/
    ├── 01-beginner/
    │   └── solutions.sql              # 20 solutions (92 lines)
    ├── 02-intermediate/
    │   └── solutions.sql              # 25 solutions (216 lines)
    └── 03-advanced/
        └── solutions.sql              # 25 solutions (444 lines)
```

## Total Content
- **70 SQL exercises** across 3 difficulty levels
- **70 complete solutions** with explanations
- **9 tables** with realistic relationships
- **272 lines** of schema and data SQL
- **752 lines** of solution SQL
- **Comprehensive documentation** spanning multiple guides

## Supported Databases
Primary support:
- PostgreSQL (recommended)

Compatible with minor modifications:
- MySQL
- SQLite
- SQL Server

## Use Cases
- Self-paced SQL learning
- Interview preparation
- Teaching SQL concepts
- Practicing before certification exams
- Refreshing SQL skills
- Learning query optimization

## Next Steps for Users
1. Follow QUICKSTART.md to set up
2. Start with beginner exercises
3. Progress through intermediate level
4. Challenge yourself with advanced exercises
5. Experiment with different solutions
6. Contribute back with improvements

---

**Ready to start?** Jump to [QUICKSTART.md](QUICKSTART.md) and begin your SQL journey! 🚀
