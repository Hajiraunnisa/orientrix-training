# SQL 
Database- It is a collection of related infromation.\
DBMS- A software that helps user create and maintain database.\
Now,We have 2 tyoes of database- Reational and Non Relational. Relational means Entire data is organised in rows and column.Each row differ from all other row by primary key(example-MYsql,oracle,postgresql,sql server). whereas Non relational means stores data in formats like documents (JSON), key-value pairs and graphs etc.. (mongodb,dynamodb,firebase)\
In RDBMS,Rows represent entry(1 student) and column represent attribute.
Surrogate key has no real world meaning just created to identify a row.\
SQL is used to interact with RDBMS.
Types of SQL Command\
1. DQL (Data Query Language) : Used to retrieve data from databases. (SELECT)\
2. DDL (Data Definition Language) : Used to create, alter, and delete database objects like tables, indexes, etc. (CREATE, DROP, ALTER, RENAME, TRUNCATE)\
3. DML (Data Manipulation Language): Used to modify the database. (INSERT,UPDATE, DELETE)\
4. DCL (Data Control Language): Used to grant & revoke permissions. (GRANT,REVOKE)\
5. TCL (Transaction Control Language): Used to manage transactions. (COMMIT,ROLLBACK, START TRANSACTIONS, SAVEPOINT)\
**CREATE TABLE TABLENAME**  - Used to create a new table in the database.
● ALTER TABLE:
○ Used to modify the structure of an existing table.
○ You can add, modify, or drop columns, constraints, and more.
○ Example: ALTER TABLE employees ADD COLUMN email VARCHAR(100)
● DROP TABLE:
○ Used to delete an existing table along with its data and structure.
○ Example: DROP TABLE employees
CREATE INDEX:
○ Used to create an index on one or more columns in a table.
○ Improves query performance by enabling faster data retrieval.
○ Example: CREATE INDEX idx_employee_name ON employees (name);
● DROP INDEX:
○ Used to remove an existing index from a table.
○ Example: DROP INDEX idx_employee_name
● CREATE CONSTRAINT:
○ Used to define constraints that ensure data integrity.
○ Constraints include PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL,
and CHECK.
○ Example: ALTER TABLE orders ADD CONSTRAINT fk_customer FOREIGN
KEY (customer_id) REFERENCES customers(id)
● DROP CONSTRAINT:
○ Used to remove an existing constraint from a table.
○ Example: ALTER TABLE orders DROP CONSTRAINT fk_customer;
● TRUNCATE TABLE:
○ Used to delete the data inside a table, but not the table itself.
○ Syntax – TRUNCATE TABLE table_name
The SELECT statement is used to select data from a database.SELECT * MEANS select all.\
The WHERE clause is used to filter records.\
DISTINCT -Removes duplicate rows from query results.\
LIKE - The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.\
IN - Filters results based on a list of values in the WHERE clause.\
BETWEEN - Filters results within a specified range in the WHERE clause.\
IS NULL - Checks for NULL values in the WHERE clause.\
AS - Renames columns or expressions in query results.\
The ORDER BY clause is used after the SELECT statement to sort query results. ASC is used for ascending and DESC is used for Descending.b defualt if you dont write anything kit will be ascending\
The GROUP BY clause follows the SELECT statement and is used to group rows based on specified columns.\
Aggregation functions (e.g., COUNT, SUM, AVG, MAX, MIN) are often used with GROUP BY to calculate values for each group.\
You can use both GROUP BY and ORDER BY in the same query to control the order of grouped results.\
The INSERT statement adds new records to a table.\
The UPDATE statement modifies existing records in a table.\
The DELETE statement removes records from a table.
- Syntax: DELETE FROM table_name WHERE condition\
  Joins are used to retrieve data from multiple tables by linking them together using a common
key or column.
