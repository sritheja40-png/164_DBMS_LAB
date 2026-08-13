-- =====================================================================
-- DBMS LAB - EXPERIMENT 5
-- =====================================================================
-- TITLE : IMPLEMENTATION OF PROCEDURES AND FUNCTIONS
-- DBMS  : MySQL 8.0+
-- FILE  : DBMS_Experiment_5_Procedures_and_Functions.sql
-- =====================================================================


-- =====================================================================
-- 1. CREATE DATABASE
-- =====================================================================

DROP DATABASE IF EXISTS dbms_experiment_5;

CREATE DATABASE dbms_experiment_5;

USE dbms_experiment_5;


-- =====================================================================
-- 2. CREATE EMPLOYEE TABLE
-- =====================================================================

CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2)
);


-- =====================================================================
-- 3. INSERT SAMPLE DATA
-- =====================================================================

INSERT INTO employee (id, name, salary) VALUES
(1, 'John', 5000.00),
(2, 'Alice', 6000.00),
(3, 'Bob', 4500.00);


-- =====================================================================
-- 4. DISPLAY EMPLOYEE RECORDS
-- =====================================================================

SELECT * FROM employee;


-- Expected Output:
--
-- +----+-------+---------+
-- | id | name  | salary  |
-- +----+-------+---------+
-- |  1 | John  | 5000.00 |
-- |  2 | Alice | 6000.00 |
-- |  3 | Bob   | 4500.00 |
-- +----+-------+---------+


-- =====================================================================
-- 5. CREATE PROCEDURE
-- =====================================================================
-- Procedure : SumProcedure
-- Purpose   : Calculate and display the sum of two integers.
-- =====================================================================

DROP PROCEDURE IF EXISTS SumProcedure;

DELIMITER //

CREATE PROCEDURE SumProcedure(IN a INT, IN b INT)
BEGIN
    DECLARE c INT;

    SET c = a + b;

    SELECT CONCAT('Sum of two numbers = ', c) AS Result;
END //

DELIMITER ;


-- =====================================================================
-- 6. CALL THE PROCEDURE
-- =====================================================================

CALL SumProcedure(10, 20);


-- Expected Output:
--
-- +--------------------------+
-- | Result                   |
-- +--------------------------+
-- | Sum of two numbers = 30  |
-- +--------------------------+


-- =====================================================================
-- 7. CREATE FUNCTION
-- =====================================================================
-- Function  : SumFunction
-- Purpose   : Return the sum of two integers.
-- =====================================================================

DROP FUNCTION IF EXISTS SumFunction;

DELIMITER //

CREATE FUNCTION SumFunction(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE c INT;

    SET c = a + b;

    RETURN c;
END //

DELIMITER ;


-- =====================================================================
-- 8. CALL THE FUNCTION
-- =====================================================================

SELECT SumFunction(5, 5) AS Result;


-- Expected Output:
--
-- +--------+
-- | Result |
-- +--------+
-- |     10 |
-- +--------+


-- =====================================================================
-- RESULT
-- =====================================================================
-- The stored procedure was successfully created and executed to
-- calculate the sum of two numbers.
--
-- The stored function was successfully created and executed to
-- return the sum of two numbers.
-- =====================================================================

-- END OF EXPERIMENT 5
-- =====================================================================