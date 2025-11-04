# Quick Start Guide

Get started with SQL practice in just a few minutes!

## Step 1: Install a Database System

Choose one of the following database systems:

### PostgreSQL (Recommended)
- **Mac**: `brew install postgresql`
- **Ubuntu/Debian**: `sudo apt-get install postgresql postgresql-contrib`
- **Windows**: Download from [postgresql.org](https://www.postgresql.org/download/)

### MySQL
- **Mac**: `brew install mysql`
- **Ubuntu/Debian**: `sudo apt-get install mysql-server`
- **Windows**: Download from [mysql.com](https://dev.mysql.com/downloads/)

### SQLite (Easiest)
- Usually pre-installed on Mac/Linux
- **Windows**: Download from [sqlite.org](https://www.sqlite.org/download.html)

## Step 2: Create the Practice Database

### For PostgreSQL:
```bash
# Start PostgreSQL (if not already running)
pg_ctl -D /usr/local/var/postgres start  # Mac
sudo service postgresql start            # Linux

# Create database
createdb sql_practice

# Or using psql
psql -U postgres
CREATE DATABASE sql_practice;
\q
```

### For MySQL:
```bash
# Start MySQL
sudo service mysql start  # Linux
mysql.server start        # Mac

# Create database
mysql -u root -p
CREATE DATABASE sql_practice;
exit;
```

### For SQLite:
```bash
# SQLite creates the database automatically when you connect
sqlite3 sql_practice.db
```

## Step 3: Load the Schema and Data

### For PostgreSQL:
```bash
cd sql-activity
psql -d sql_practice -f setup/schema.sql
psql -d sql_practice -f setup/sample_data.sql
```

### For MySQL:
```bash
cd sql-activity
mysql -u root -p sql_practice < setup/schema.sql
mysql -u root -p sql_practice < setup/sample_data.sql
```

### For SQLite:
```bash
cd sql-activity
sqlite3 sql_practice.db < setup/schema.sql
sqlite3 sql_practice.db < setup/sample_data.sql
```

## Step 4: Connect and Start Practicing

### PostgreSQL:
```bash
psql -d sql_practice
```

### MySQL:
```bash
mysql -u root -p sql_practice
```

### SQLite:
```bash
sqlite3 sql_practice.db
```

## Step 5: Try Your First Query

Once connected, try this simple query:

```sql
SELECT * FROM employees LIMIT 5;
```

You should see 5 employee records!

## Step 6: Start with Exercises

1. Navigate to `exercises/01-beginner/README.md`
2. Read through the exercises
3. Try solving them in your database client
4. Check your answers against `solutions/01-beginner/solutions.sql`

## Useful Commands

### View all tables:
- **PostgreSQL**: `\dt`
- **MySQL**: `SHOW TABLES;`
- **SQLite**: `.tables`

### Describe a table structure:
- **PostgreSQL**: `\d table_name`
- **MySQL**: `DESCRIBE table_name;`
- **SQLite**: `.schema table_name`

### Exit the database client:
- **PostgreSQL**: `\q`
- **MySQL**: `exit;` or `quit;`
- **SQLite**: `.quit` or `.exit`

## Tips for Effective Practice

1. **Type queries manually**: Don't copy-paste; typing helps you learn
2. **Experiment**: Modify queries to see different results
3. **Use EXPLAIN**: Learn how your queries execute
4. **Make mistakes**: Errors are learning opportunities
5. **Progress gradually**: Master beginner before moving to intermediate

## Troubleshooting

### "Database does not exist"
- Make sure you created the database (Step 2)
- Check spelling of database name

### "Table does not exist"
- Make sure you ran the schema.sql file (Step 3)
- Verify you're connected to the correct database

### "Permission denied"
- Check your database user has proper permissions
- Try using `sudo` or root user for setup

### "Syntax error"
- Different databases have slight syntax variations
- Check if you're using the right SQL dialect for your database

## Need Help?

- Check the main [README.md](README.md) for more details
- Review the [database schema](setup/schema.sql) to understand table structures
- Start with simpler queries and build up complexity

---

Happy practicing! 🎉 Remember, the best way to learn SQL is by doing!
