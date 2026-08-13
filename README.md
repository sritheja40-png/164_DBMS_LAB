# DBMS — MySQL Experiments 

A structured and professional collection of **Database Management Systems (DBMS) laboratory experiments** implemented using **MySQL 8.0+**.

This repository contains SQL programs covering fundamental database operations, queries, joins, views, indexes, cursors, stored procedures, and stored functions.

The scripts are designed to be:

- Easy to execute
- Easy to understand
- Suitable for DBMS laboratory records
- Compatible with MySQL 8.0+
- Reusable in MySQL Workbench and Ubuntu MySQL CLI
- Organized for academic submission and GitHub portfolio use

---

## Table of Contents

- [Repository Overview](#repository-overview)
- [Experiments](#experiments)
- [Repository Structure](#repository-structure)
- [Technology Stack](#technology-stack)
- [Database Concepts Covered](#database-concepts-covered)
- [Experiment 1](#experiment-1--simple-nested-queries-and-subqueries)
- [Experiment 2](#experiment-2--join-queries)
- [Experiment 3](#experiment-3--views-and-indexes)
- [Experiment 4](#experiment-4--implicit-and-explicit-cursors)
- [Experiment 5](#experiment-5--procedures-and-functions)
- [How to Run](#how-to-run)
- [Running on Ubuntu MySQL](#running-on-ubuntu-mysql)
- [Running with MySQL Workbench](#running-with-mysql-workbench)
- [Verifying the Results](#verifying-the-results)
- [Git Workflow](#git-workflow)
- [Expected Repository Workflow](#expected-repository-workflow)
- [Learning Outcomes](#learning-outcomes)
- [Notes](#notes)
- [Author](#author)

---

# Repository Overview

This repository contains implementations of DBMS laboratory experiments using SQL and MySQL.

Each experiment is maintained as an independent `.sql` file. The scripts contain database creation, table creation, sample data, SQL operations, stored-program constructs, and verification queries.

The repository follows a simple structure:

```text
DBMS_161/
│
├── README.md
│
├── DBMS_Experiment_1_Simple_Nested_Subqueries.sql
│
├── DBMS_Experiment_2_JOIN_Queries.sql
│
├── DBMS_Experiment_3_View_and_Index.sql
│
├── DBMS_Experiment_4_Cursors.sql
│
└── DBMS_Experiment_5_Procedures_and_Functions.sql
```

---

# Experiments

| No. | Experiment | Main Concepts |
|---:|---|---|
| 1 | Simple, Nested Queries & Subqueries | SELECT, WHERE, IN, AVG, COUNT, GROUP BY, HAVING, Subqueries |
| 2 | JOIN Queries | INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN equivalent |
| 3 | Views & Indexes | CREATE VIEW, INSERT, UPDATE, DELETE, CREATE INDEX |
| 4 | Cursors | Implicit Cursor, Explicit Cursor, DECLARE CURSOR, FETCH, LOOP |
| 5 | Procedures & Functions | Stored Procedure, Stored Function, Parameters, RETURN, DELIMITER |

---

# Technology Stack

## Database

**MySQL 8.0+**

## Language

**SQL**

## Recommended Tools

- MySQL Server 8.0+
- MySQL Workbench
- Ubuntu Terminal / MySQL CLI
- Git
- GitHub

---

# Database Concepts Covered

This repository demonstrates the following DBMS concepts:

### Database Fundamentals

- Database creation
- Table creation
- Primary keys
- Foreign keys
- Composite primary keys
- Referential integrity
- Data insertion
- Data retrieval
- Data modification
- Data deletion

### SQL Queries

- `SELECT`
- `WHERE`
- `IN`
- Aggregate functions
- `AVG()`
- `COUNT()`
- `GROUP BY`
- `HAVING`
- Nested queries
- Subqueries

### Joins

- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- Full outer join equivalent using `UNION`

### Database Objects

- Views
- Indexes
- Stored procedures
- Stored functions

### Cursor Operations

- Cursor declaration
- Cursor opening
- Fetching records
- Loop processing
- Cursor termination
- Cursor closing
- `NOT FOUND` handler

---

# Experiment 1 — Simple, Nested Queries and Subqueries

### File

```text
DBMS_Experiment_1_Simple_Nested_Subqueries.sql
```

### Objective

To implement and execute simple queries, nested queries, and subqueries using relational database tables.

### Tables

The experiment uses:

```text
Students
Courses
Enrollments
```

### Concepts Demonstrated

- `CREATE DATABASE`
- `CREATE TABLE`
- Primary Key
- Foreign Key
- Composite Primary Key
- `INSERT`
- `SELECT`
- `WHERE`
- `IN`
- Nested queries
- Subqueries
- `AVG()`
- `COUNT()`
- `GROUP BY`
- `HAVING`

### Example Operations

Retrieve all students:

```sql
SELECT * FROM Students;
```

Retrieve students older than 20:

```sql
SELECT Name, Age
FROM Students
WHERE Age > 20;
```

Find students enrolled in a particular course using nested queries:

```sql
SELECT Name
FROM Students
WHERE StudentID IN (
    SELECT StudentID
    FROM Enrollments
    WHERE CourseID = (
        SELECT CourseID
        FROM Courses
        WHERE CourseName = 'Database Management'
    )
);
```

Find students whose age is greater than the average age:

```sql
SELECT Name, Age
FROM Students
WHERE Age > (
    SELECT AVG(Age)
    FROM Students
);
```

---

# Experiment 2 — JOIN Queries

### File

```text
DBMS_Experiment_2_JOIN_Queries.sql
```

### Objective

To implement SQL queries using different types of joins.

### Tables

```text
Students
Courses
Enrollments
```

### Joins Implemented

#### INNER JOIN

Retrieves matching records from the related tables.

```sql
SELECT
    s.StudentID,
    s.Name,
    s.Age,
    c.CourseID,
    c.CourseName,
    e.Grade
FROM Students AS s
INNER JOIN Enrollments AS e
    ON s.StudentID = e.StudentID
INNER JOIN Courses AS c
    ON e.CourseID = c.CourseID;
```

#### LEFT JOIN

Retrieves all students and their corresponding enrollment information.

```sql
SELECT
    s.StudentID,
    s.Name,
    s.Age,
    c.CourseID,
    c.CourseName,
    e.Grade
FROM Students AS s
LEFT JOIN Enrollments AS e
    ON s.StudentID = e.StudentID
LEFT JOIN Courses AS c
    ON e.CourseID = c.CourseID;
```

#### RIGHT JOIN

Retrieves all courses together with their enrollment information.

```sql
SELECT
    s.StudentID,
    s.Name,
    s.Age,
    c.CourseID,
    c.CourseName,
    e.Grade
FROM Students AS s
RIGHT JOIN Enrollments AS e
    ON s.StudentID = e.StudentID
RIGHT JOIN Courses AS c
    ON e.CourseID = c.CourseID;
```

#### FULL OUTER JOIN Equivalent

MySQL does not provide `FULL OUTER JOIN` directly. The experiment demonstrates the equivalent approach using `LEFT JOIN`, `RIGHT JOIN`, and `UNION`.

---

# Experiment 3 — Views and Indexes

### File

```text
DBMS_Experiment_3_View_and_Index.sql
```

### Objective

To create and verify database views and indexes.

### Main Concepts

- Table creation
- View creation
- View verification
- Insert operation
- Update operation
- Delete operation
- Index creation
- Index verification

### Create View

```sql
CREATE OR REPLACE VIEW student_view AS
SELECT
    student_id,
    student_name,
    student_email
FROM students;
```

The view provides a reusable query-based representation of the underlying student table.

### Insert Data

```sql
INSERT INTO students
    (student_name, student_email)
VALUES
    ('Diana Prince', 'diana@example.com');
```

### Update Data

```sql
UPDATE students
SET student_email = 'new_bob@example.com'
WHERE student_name = 'Bob Smith';
```

### Delete Data

```sql
DELETE FROM students
WHERE student_name = 'Charlie Brown';
```

### Create Index

```sql
CREATE INDEX idx_student_email
ON students (student_email);
```

### Verify Index

```sql
SHOW INDEX FROM students;
```

---

# Experiment 4 — Implicit and Explicit Cursors

### File

```text
DBMS_Experiment_4_Cursors.sql
```

### Objective

To implement and demonstrate implicit and explicit cursors.

The experiment uses a `customers` table containing:

```text
id
name
address
salary
```

### Sample Data

```text
1   John    New York      5000.00
2   Alice   Los Angeles   6000.00
3   Bob     Chicago       4500.00
4   David   Houston       7000.00
5   Emma    Boston        5500.00
```

### Implicit Cursor

The experiment demonstrates an implicit cursor through an `UPDATE` statement.

```sql
UPDATE customers
SET salary = salary + 500;
```

The number of affected rows can be obtained using:

```sql
SELECT ROW_COUNT() AS Rows_Updated;
```

Expected result:

```text
Rows_Updated
5
```

### Explicit Cursor

The experiment creates a stored procedure containing an explicitly declared cursor.

The cursor performs the following operations:

```text
DECLARE CURSOR
       ↓
OPEN CURSOR
       ↓
FETCH RECORD
       ↓
CHECK HANDLER
       ↓
PROCESS RECORD
       ↓
LOOP
       ↓
CLOSE CURSOR
```

Important constructs include:

```sql
DECLARE cur CURSOR FOR
    SELECT id, name, salary
    FROM customers;
```

A `NOT FOUND` handler is used to detect the end of the cursor:

```sql
DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET done = TRUE;
```

Records are retrieved using:

```sql
FETCH cur INTO c_id, c_name, c_salary;
```

The cursor is closed after processing:

```sql
CLOSE cur;
```

The experiment therefore demonstrates both implicit and explicit cursor processing.

---

# Experiment 5 — Procedures and Functions

### File

```text
DBMS_Experiment_5_Procedures_and_Functions.sql
```

### Objective

To implement and execute stored procedures and stored functions in MySQL.

The experiment uses an `employee` table with:

```text
id
name
salary
```

### Sample Data

```text
1   John    5000.00
2   Alice   6000.00
3   Bob     4500.00
```

### Stored Procedure

The procedure is named:

```text
SumProcedure
```

It accepts two integer input parameters:

```sql
IN a INT
IN b INT
```

The procedure calculates their sum and displays the result.

```sql
CREATE PROCEDURE SumProcedure(IN a INT, IN b INT)
BEGIN
    DECLARE c INT;

    SET c = a + b;

    SELECT CONCAT('Sum of two numbers = ', c) AS Result;
END;
```

### Execute Procedure

```sql
CALL SumProcedure(10, 20);
```

Expected result:

```text
Sum of two numbers = 30
```

### Stored Function

The function is named:

```text
SumFunction
```

It returns an integer value.

```sql
CREATE FUNCTION SumFunction(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE c INT;

    SET c = a + b;

    RETURN c;
END;
```

### Execute Function

```sql
SELECT SumFunction(5, 5) AS Result;
```

Expected result:

```text
10
```

The experiment demonstrates creation and execution of both a stored procedure and a stored function.

---

# How to Run

There are two recommended ways to execute the SQL programs.

## Method 1 — MySQL CLI

Open a terminal and verify that MySQL is installed:

```bash
mysql --version
```

If your Ubuntu setup uses root authentication through `sudo`, enter MySQL using:

```bash
sudo mysql
```

You should see:

```text
mysql>
```

---

## Execute a SQL File

Inside MySQL:

```sql
SOURCE /full/path/to/DBMS_Experiment_1_Simple_Nested_Subqueries.sql;
```

For example:

```sql
SOURCE /home/username/DBMS_Experiment_5_Procedures_and_Functions.sql;
```

After execution, the SQL statements containing `SELECT` will display their results in the terminal.

---

# Running Directly from Ubuntu Terminal

You can also execute a file directly:

```bash
sudo mysql < DBMS_Experiment_5_Procedures_and_Functions.sql
```

For interactive output and easier laboratory verification, the `SOURCE` approach from inside MySQL is recommended.

Example:

```bash
sudo mysql
```

Then:

```sql
SOURCE /home/username/DBMS_Experiment_5_Procedures_and_Functions.sql;
```

---

# Running with MySQL Workbench

1. Open MySQL Workbench.
2. Connect to your MySQL server.
3. Open the required `.sql` file.
4. Review the script.
5. Execute the script using the **Run** button.
6. Check the output panel.
7. Verify the created database and tables.

Each experiment creates its own database, so the experiments remain logically separated.

---

# Verifying the Results

After executing an experiment, verify the database:

```sql
SHOW DATABASES;
```

For Experiment 5:

```sql
USE dbms_experiment_5;
```

Check the tables:

```sql
SHOW TABLES;
```

Expected:

```text
employee
```

Check employee records:

```sql
SELECT * FROM employee;
```

Test the procedure:

```sql
CALL SumProcedure(10, 20);
```

Test the function:

```sql
SELECT SumFunction(5, 5) AS Result;
```

---

# Important MySQL Notes

## DELIMITER

Stored procedures and functions contain multiple SQL statements. Therefore, the scripts use:

```sql
DELIMITER //
```

before creating the stored program and restore the normal delimiter afterward:

```sql
DELIMITER ;
```

This is required so MySQL can correctly identify the end of the procedure or function definition.

---

## Re-running the Scripts

The experiment scripts use:

```sql
DROP DATABASE IF EXISTS ...
```

before creating their databases.

This allows the complete experiment to be executed again from a clean database state.

For stored programs, the scripts also use:

```sql
DROP PROCEDURE IF EXISTS ...
```

and:

```sql
DROP FUNCTION IF EXISTS ...
```

where required.

**Important:** Dropping the database removes the existing data in that experiment database. These scripts are intended for laboratory/demo environments.

---

# Git Workflow

After adding or modifying an experiment:

```bash
git status
```

Review the changes.

Then:

```bash
git add .
```

Create a meaningful commit:

```bash
git commit -m "Add DBMS cursor, procedure and function experiments"
```

Push the changes:

```bash
git push
```

For future updates, the basic workflow is:

```bash
git add .
git commit -m "Describe the change"
git push
```

---

# Suggested Commit Messages

### Experiment 1

```bash
git commit -m "Add simple nested queries and subqueries"
```

### Experiment 2

```bash
git commit -m "Add SQL join queries experiment"
```

### Experiment 3

```bash
git commit -m "Add view and index implementation"
```

### Experiment 4

```bash
git commit -m "Add implicit and explicit cursor implementation"
```

### Experiment 5

```bash
git commit -m "Add procedures and functions implementation"
```

### Multiple Experiments

```bash
git commit -m "Add DBMS cursor, procedure and function experiments"
```

---

# Expected Repository Structure

```text
DBMS_161/
│
├── README.md
│
├── DBMS_Experiment_1_Simple_Nested_Subqueries.sql
│
├── DBMS_Experiment_2_JOIN_Queries.sql
│
├── DBMS_Experiment_3_View_and_Index.sql
│
├── DBMS_Experiment_4_Cursors.sql
│
└── DBMS_Experiment_5_Procedures_and_Functions.sql
```

---

# Learning Outcomes

After completing these experiments, the following DBMS concepts are demonstrated:

- Creating and managing databases
- Creating relational tables
- Defining primary keys
- Defining foreign keys
- Maintaining relationships between tables
- Writing simple SQL queries
- Writing nested queries
- Writing subqueries
- Using aggregate functions
- Grouping and filtering grouped data
- Combining data using joins
- Creating database views
- Understanding indexed columns
- Executing insert, update and delete operations
- Understanding implicit cursor behavior
- Declaring and processing explicit cursors
- Using cursor loops
- Handling cursor termination
- Creating stored procedures
- Passing input parameters to procedures
- Creating stored functions
- Returning values from functions
- Using MySQL delimiters

---

# Academic Scope

This repository is intended for:

- DBMS laboratory practice
- SQL practice
- MySQL experimentation
- Academic laboratory submissions
- Practical examination preparation
- Database programming demonstrations
- GitHub-based academic portfolios

The SQL files prioritize clear execution and readable implementation so that each experiment can be independently studied and executed.

---

# Notes

1. The scripts target **MySQL 8.0+**.
2. Execute each experiment independently.
3. Review the SQL before running it against any database containing important data.
4. The scripts intentionally create dedicated experiment databases.
5. The sample data is included so that the queries can be executed immediately.
6. Expected outputs are included as comments inside the SQL files.
7. MySQL does not provide a direct `FULL OUTER JOIN`; the JOIN experiment uses a `UNION`-based equivalent.
8. Stored procedures and functions require appropriate MySQL privileges.
9. When running from Ubuntu, `SOURCE` inside the MySQL client is useful when you want to see the query output interactively.
10. The repository is primarily an academic DBMS laboratory implementation rather than a production database system.

---

# Result

The repository provides a complete set of MySQL DBMS laboratory implementations covering:

```text
SQL Queries
     │
     ├── Simple Queries
     ├── Nested Queries
     └── Subqueries
             │
             ▼
          JOINs
             │
             ▼
       Views & Indexes
             │
             ▼
          Cursors
             │
             ▼
   Procedures & Functions
```

These experiments provide practical exposure to fundamental SQL querying, relational data manipulation, database objects, cursor processing, and stored-program development.

---

# Author

**Thamizh Selvan**

DBMS Laboratory — MySQL

---

## License

This repository is intended primarily for educational and academic purposes.