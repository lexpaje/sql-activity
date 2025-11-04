# SQL Practice Repository

Welcome to the SQL Practice Repository! This repository is designed to help you improve your SQL skills through hands-on practice with real-world scenarios.

## 🎯 Learning Objectives

By working through these exercises, you will master:
- Basic SQL queries (SELECT, WHERE, ORDER BY)
- Data filtering and sorting
- JOIN operations (INNER, LEFT, RIGHT, FULL)
- Aggregate functions (COUNT, SUM, AVG, MIN, MAX)
- GROUP BY and HAVING clauses
- Subqueries and nested queries
- Window functions
- Common Table Expressions (CTEs)
- Data manipulation (INSERT, UPDATE, DELETE)
- Database design and normalization

## 📁 Repository Structure

```
sql-activity/
├── README.md                   # This file
├── setup/                      # Database setup scripts
│   ├── schema.sql             # Database schema definitions
│   └── sample_data.sql        # Sample data for practice
├── exercises/                  # Practice exercises
│   ├── 01-beginner/           # Beginner level exercises
│   ├── 02-intermediate/       # Intermediate level exercises
│   └── 03-advanced/           # Advanced level exercises
└── solutions/                  # Solutions to exercises
    ├── 01-beginner/
    ├── 02-intermediate/
    └── 03-advanced/
```

## 🚀 Getting Started

### Prerequisites
- A SQL database system installed (PostgreSQL, MySQL, SQLite, or SQL Server)
- Basic understanding of databases and SQL syntax

### Setup Instructions

1. **Clone this repository**
   ```bash
   git clone https://github.com/lexpaje/sql-activity.git
   cd sql-activity
   ```

2. **Create the database**
   ```sql
   -- For PostgreSQL
   CREATE DATABASE sql_practice;
   
   -- For MySQL
   CREATE DATABASE sql_practice;
   ```

3. **Run the setup scripts**
   ```bash
   # Execute schema.sql to create tables
   psql -d sql_practice -f setup/schema.sql
   
   # Load sample data
   psql -d sql_practice -f setup/sample_data.sql
   ```

## 📚 Practice Exercises

### Beginner Level
Start here if you're new to SQL or need a refresher on basics.
- Simple SELECT statements
- Filtering with WHERE
- Sorting with ORDER BY
- Basic aggregate functions

### Intermediate Level
Progress to these exercises once you're comfortable with basics.
- Multiple JOIN operations
- GROUP BY with aggregations
- Subqueries
- String and date functions

### Advanced Level
Challenge yourself with complex queries.
- Window functions
- Common Table Expressions (CTEs)
- Recursive queries
- Query optimization

## 💡 How to Use This Repository

1. **Start with the setup**: Run the database setup scripts to create your practice environment
2. **Choose your level**: Begin with exercises matching your skill level
3. **Attempt the exercises**: Try to solve problems on your own first
4. **Check solutions**: Compare your answers with provided solutions
5. **Experiment**: Modify queries and explore different approaches
6. **Track progress**: Mark completed exercises in your own notes

## 📖 Sample Database Schema

The practice database includes the following tables:
- **employees**: Employee information
- **departments**: Department details
- **projects**: Project information
- **customers**: Customer data
- **orders**: Order records
- **products**: Product catalog

See `setup/schema.sql` for complete schema details.

## 🤝 Contributing

Feel free to contribute by:
- Adding new exercises
- Improving existing problems
- Fixing errors
- Enhancing documentation

## 📝 License

This repository is open source and available for educational purposes.

## 🎓 Additional Resources

- [SQL Tutorial - W3Schools](https://www.w3schools.com/sql/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [SQLite Tutorial](https://www.sqlitetutorial.net/)

---

Happy practicing! 🚀 Keep querying and improving your SQL skills!
