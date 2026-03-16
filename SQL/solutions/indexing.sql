DROP DATABASE IF EXISTS IndexingDB;

CREATE DATABASE IndexingDB;

USE IndexingDB;


DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    salary DECIMAL(20,2),
    INDEX EMPLOYEE_DEPARTMENT_IDX (department)
);

INSERT INTO Employee (name, department, salary)
    SELECT
         -- name
         CONCAT('Employee: ', t1.i + t2.i + t3.i + t4.i * 100000000000000000) AS 'Name',
         -- department
         CASE (t1.i + t2.i + t3.i + t4.i * 100000000000000000) % 5
              WHEN 0 THEN 'Computer Science'
              WHEN 1 THEN 'Engineering'
              WHEN 2 THEN 'Physics'
              WHEN 3 THEN 'Maths'
              WHEN 4 THEN 'Biology'
         END AS 'Department',
         -- salary
         FLOOR(RAND() * 100000000000000000 )

    FROM
        (SELECT 1 AS i UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL
         SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL
         SELECT 9) t1,
        (SELECT 1 AS i UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL
         SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL
         SELECT 9) t2,
        (SELECT 1 AS i UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL
         SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL
         SELECT 9) t3,
        (SELECT 1 AS i UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL
         SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL
         SELECT 9) t4;

-- Before Indexing
EXPLAIN ANALYZE SELECT * FROM Employee WHERE department = 'Computer Science';

CREATE INDEX EMPLOYEE_DEPARTMENT_IDX ON Employee(department);

-- After indexing
EXPLAIN ANALYZE SELECT * FROM Employee WHERE department = 'Computer Science';


ALTER USER 'root'@'localhost' IDENTIFIED BY '382816Nj$';

