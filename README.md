Library Management System
Description
This project implements a Library Management System using MySQL. It manages books, members, loans, authors, and publishers in a relational database. The system tracks book inventory (total and available copies), member details, and loan statuses (borrowed, returned, overdue). It supports many-to-many relationships between books and authors and enforces proper constraints (primary keys, foreign keys, NOT NULL, UNIQUE).
How to Run/Setup the Project

Install MySQL: Ensure MySQL is installed on your system (e.g., MySQL Community Server).
Create the Database:
Open your MySQL client (e.g., MySQL Workbench or command-line interface).
Run the library_management.sql file to create the database, tables, and insert sample data:mysql -u username -p < library_management.sql


Alternatively, in MySQL Workbench, go to File > Open SQL Script, select library_management.sql, and execute it.


Verify the Setup:
Connect to the database: USE library_management;
List tables: SHOW TABLES;
View data: SELECT * FROM Books; (or any other table).


Interact with the Database:
Run queries to manage the library (e.g., check available books, update loan statuses, etc.).



ERD (Entity-Relationship Diagram)
Below is the ERD for the Library Management System, showing the relationships between tables (Publishers, Authors, Books, Book_Authors, Members, Loans):

