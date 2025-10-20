# SQL Practice and Business Requirements

This repository contains SQL practice problems designed to help students develop and refine their skills using SQL in real-world business scenarios. The problems are divided into two main sections: **Select SQL Practice** and **Business Requirements**. 

## SQL Skills from `select.sql` File

In the `select.sql` file, students will develop a variety of SQL skills through hands-on practice with SELECT queries. The following skills will be learned:

1. **Basic Data Retrieval**:
   - Learn how to retrieve data from a database using basic SELECT statements.

2. **Table Joins**:
   - Understand how to join multiple tables using both the `WHERE` clause and the `JOIN` clause, including inner and outer joins (LEFT, RIGHT).

3. **Filtering Data**:
   - Apply conditions with the `WHERE` clause to filter data, exclude specific values, and combine multiple conditions.

4. **Sorting Data**:
   - Sort query results using the `ORDER BY` clause, in both ascending and descending order.

5. **Grouping and Aggregations**:
   - Use aggregate functions like `SUM()`, `COUNT()`, and `AVG()` to summarize data, and group the results with the `GROUP BY` clause.

6. **Subqueries and Nested Queries**:
   - Solve complex problems using subqueries and nested queries, including filtering, calculating, and comparing data.

7. **Advanced Techniques**:
   - Implement advanced SQL techniques such as Common Table Expressions (CTEs), Views, and handling ties in ranked data.

8. **Handling NULLs and OUTER JOINS**:
   - Master the use of various types of joins (e.g., `LEFT JOIN`, `RIGHT JOIN`, `FULL OUTER JOIN`) to handle missing or incomplete data.

9. **Pattern Matching and String Manipulation**:
   - Use SQL string functions to filter and manipulate data based on patterns (e.g., using `LIKE` or `SUBSTRING`).

10. **Multi-Table Relationships**:
    - Work with complex relationships between tables and retrieve related data effectively using joins.

11. **Ranking Functions**:
    - Use ranking functions like `RANK()` and `ROW_NUMBER()` to find specific positions in ordered datasets (e.g., second-highest sales).

12. **Advanced Data Analysis**:
    - Conduct complex analyses involving averages, comparisons, and conditional calculations across multiple tables.



## SQL Skills from `business-requirements.sql` File

**Note: this file will be added later after we cover select.sql**

In the `business-requirements.sql` file, students will learn how to solve real-world business requirements using advanced SQL features. They will focus on the following key components:

1. **Triggers**:
   - Learn how to create and use triggers to automatically execute actions in response to specific events like `INSERT`, `UPDATE`, or `DELETE`.

2. **Functions**:
   - Understand how to create reusable functions that perform specific operations and return results within queries.

3. **Stored Procedures**:
   - Learn how to create and invoke stored procedures to perform complex operations, execute multiple SQL statements, and modify database state.

4. **Scheduled Events**:
   - Use scheduled events to automate tasks that run at specified times or intervals (e.g., for data summarization or report generation).

5. **Permissions**:
   - Understand how to manage access control by assigning permissions to users or roles, ensuring controlled access to database operations like `SELECT`, `INSERT`, `UPDATE`, and `DELETE`.

6. **Business Requirement Solutions**:
   - Implement solutions for common business problems such as updating customer purchases, summarizing sales, preserving data on deletion, and more, while ensuring correct data integrity and security.

## Instructions for Running the `create.sql` and `inserts.sql` Scripts in DataGrip

The repository includes two important SQL scripts: `create.sql` and `inserts.sql`. These scripts are designed to create and populate the database. The **SQL/README.md** file contains detailed instructions on how to connect to the MySQL database and run these scripts in **DataGrip**.

Follow the instructions in the **SQL/README.md** file to connect to your MySQL database and execute the `create.sql` and `inserts.sql` scripts to set up the database before working on the practice problems in `select.sql` and `business-requirements.sql`.