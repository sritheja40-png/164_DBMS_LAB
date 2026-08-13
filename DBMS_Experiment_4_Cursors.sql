-- =====================================================================
-- DBMS LAB - EXPERIMENT 4
-- =====================================================================
-- TITLE : IMPLEMENTATION OF IMPLICIT AND EXPLICIT CURSORS
-- DBMS  : MySQL 8.0+
-- FILE  : DBMS_Experiment_4_Cursors.sql
-- =====================================================================

DROP DATABASE IF EXISTS dbms_experiment_4;
CREATE DATABASE dbms_experiment_4;
USE dbms_experiment_4;

-- =====================================================================
-- 1. CREATE TABLE
-- =====================================================================

CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(100),
    salary DECIMAL(10,2)
);

-- =====================================================================
-- 2. INSERT SAMPLE DATA
-- =====================================================================

INSERT INTO customers (id, name, address, salary) VALUES
(1, 'John', 'New York', 5000.00),
(2, 'Alice', 'Los Angeles', 6000.00),
(3, 'Bob', 'Chicago', 4500.00),
(4, 'David', 'Houston', 7000.00),
(5, 'Emma', 'Boston', 5500.00);

-- =====================================================================
-- 3. DISPLAY CUSTOMER RECORDS
-- =====================================================================

SELECT * FROM customers;

-- Expected Output:
-- +----+-------+-------------+---------+
-- | id | name  | address     | salary  |
-- +----+-------+-------------+---------+
-- | 1  | John  | New York    | 5000.00 |
-- | 2  | Alice | Los Angeles | 6000.00 |
-- | 3  | Bob   | Chicago     | 4500.00 |
-- | 4  | David | Houston     | 7000.00 |
-- | 5  | Emma  | Boston      | 5500.00 |
-- +----+-------+-------------+---------+

-- =====================================================================
-- 4. IMPLICIT CURSOR
-- =====================================================================
-- Update the salary of every customer by 500.

UPDATE customers
SET salary = salary + 500;

-- ROW_COUNT() returns the number of rows affected by the UPDATE.

SELECT ROW_COUNT() AS Rows_Updated;

-- Expected Output:
-- +--------------+
-- | Rows_Updated |
-- +--------------+
-- |      5       |
-- +--------------+

-- =====================================================================
-- 5. EXPLICIT CURSOR
-- =====================================================================
-- A stored procedure is used to explicitly declare, open, fetch from,
-- and close a cursor.

DELIMITER //

CREATE PROCEDURE p()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE c_id INT;
    DECLARE c_name VARCHAR(50);
    DECLARE c_salary DECIMAL(10,2);

    DECLARE cur CURSOR FOR
        SELECT id, name, salary
        FROM customers;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO c_id, c_name, c_salary;

        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT
            c_id AS ID,
            c_name AS Name,
            c_salary AS Salary;
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;

-- =====================================================================
-- 6. CALL THE EXPLICIT CURSOR PROCEDURE
-- =====================================================================

CALL p();

-- Expected Output:
-- ID | Name  | Salary
-- 1  | John  | 5500.00
-- 2  | Alice | 6500.00
-- 3  | Bob   | 5000.00
-- 4  | David | 7500.00
-- 5  | Emma  | 6000.00

-- =====================================================================
-- 7. CLEANUP
-- =====================================================================
-- Uncomment the following command if the procedure needs to be removed.
-- DROP PROCEDURE IF EXISTS p;

-- =====================================================================
-- RESULT
-- =====================================================================
-- The implicit cursor was successfully demonstrated using UPDATE and
-- ROW_COUNT(). The explicit cursor was successfully implemented using
-- DECLARE CURSOR, OPEN, FETCH, LOOP, HANDLER and CLOSE.

-- =====================================================================
-- END OF EXPERIMENT 4
-- =====================================================================
