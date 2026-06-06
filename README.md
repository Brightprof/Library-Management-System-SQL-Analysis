#📚 Library Management System | SQL Project

#📖 Project Overview

The Library Management System is a SQL-based database project designed to manage and analyze library operations efficiently. The system tracks books, members, employees, branches, book issuance, and returns while providing insights into library performance through analytical SQL queries.

This project demonstrates end-to-end SQL development skills, including database design, data manipulation, reporting, stored procedures, and business analysis.

---

#🎯 Project Objectives

The primary objectives of this project are to:

- Design a relational database for library operations.
- Manage book inventory and availability.
- Track book borrowing and return transactions.
- Monitor member registration and activity.
- Analyze rental revenue and branch performance.
- Identify overdue books and calculate fines.
- Automate library processes using stored procedures.

---

#🗂 Database Schema

The database consists of six interconnected tables:

##Books

Stores information about books available in the library.

Column| Description
isbn| Unique book identifier
book_title| Book title
category| Book category
rental_price| Rental fee
status| Availability status
author| Book author
publisher| Publisher name

##Branch

Stores library branch information.

##Employees

Stores employee records and branch assignments.

Members
##
Stores registered library members.

Issued_Status

Tracks books issued to members.

Return_Status

Tracks returned books.

---

##🔗 Entity Relationship Diagram (ERD)

"Library ERD" (screenshots/erd.png)

##Key Relationships

- One Branch can have multiple Employees.
- One Employee can process multiple Book Issues.
- One Member can borrow multiple Books.
- One Book can be issued multiple times.
- One Issued Transaction can have one Return Transaction.
- One Book can have multiple Return Records.

---

##🛠 Tools & Technologies

- SQL Server
- SQL Server Management Studio (SSMS)
- Git
- GitHub

---

##📂 Project Structure

Library-Management-System/
│
├── dataset/
│   ├── books.csv
│   ├── branch.csv
│   ├── employees.csv
│   ├── members.csv
│   ├── issued_status.csv
│   └── return_status.csv
│
├── sql_scripts/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_data_import.sql
│   ├── 04_crud_operations.sql
│   ├── 05_business_analysis.sql
│   ├── 06_stored_procedures.sql
│   └── 07_advanced_analytics.sql
│
├── screenshots/
│
│   ├── branch_report.png
│   ├── overdue_books.png
│   ├── revenue_analysis.png
│
│
└── README.md

---

#📌 SQL Concepts Demonstrated

##Database Design

- CREATE DATABASE
- CREATE TABLE
- Primary Keys
- Foreign Keys
- Referential Integrity

##Data Manipulation

- INSERT
- UPDATE
- DELETE
- SELECT

##Data Analysis

- GROUP BY
- HAVING
- Aggregations
- INNER JOIN
- LEFT JOIN
- EXISTS
- Date Functions

##Advanced SQL

- Stored Procedures
- CTAS (Create Table As Select)
- Conditional Logic
- Error Handling (RAISERROR)

---

## 📊 Business Questions Solved

CRUD Operations

1. Add New Book Records

Inserted new books into the library inventory.

2. Update Member Information

Modified existing member details.

3. Delete Issued Records

Removed specific issue records.

4. Retrieve Books Issued by Employees

Tracked books processed by individual employees.

5. Identify Frequent Borrowers

Found members who borrowed more than one book.

---

## Reporting & Analysis

6. Book Issue Summary

Created a summary table showing how many times each book has been issued.

7. Books by Category

Retrieved books belonging to a specific category.

8. Rental Revenue by Category

Calculated rental income generated from each category.

9. Recently Registered Members

Identified members who registered within the last five years.

10. Employee & Branch Reporting

Displayed employees alongside their branch and manager details.

11. Premium Books Analysis

Created a table containing books with rental prices greater than $5.

12. Books Not Yet Returned

Identified books currently on loan.

---

## Advanced Analytics

13. Overdue Books Detection

Identified overdue books based on a 30-day borrowing period.

14. Automated Return Processing

Developed a stored procedure to:

- Record returned books
- Update book availability
- Generate confirmation messages

15. Branch Performance Report

Generated branch-level performance metrics including:

- Number of books issued
- Number of books returned
- Total rental revenue

16. Active Members Identification

Created a table containing members who borrowed books within the last three months.

17. Top Performing Employees

Identified employees who processed the highest number of book issues.

18. Automated Book Issuance Procedure

Built a stored procedure that:

- Verifies book availability
- Updates book status
- Prevents duplicate issuance

19. Overdue Fines Analysis

Calculated fines for overdue books at a rate of $0.50 per day.

---

📈 Key Insights

- Identified the most active library members.
- Measured employee productivity.
- Evaluated branch-level performance.
- Tracked book demand and circulation.
- Calculated rental revenue by category.
- Detected overdue books and estimated fines.
- Improved inventory visibility through automated status updates.

---

🚀 Future Enhancements

- Implement triggers for automated auditing.
- Develop SQL views for reporting.
- Build a Power BI dashboard connected to the database.
- Add role-based access control.
- Create a web-based front-end application.

---

👨‍💻 Author

TOPE ARONINUOLA

Business Analyst | Data Analyst | Power BI Developer

📧 Email: topearoninuola@gmail.com

💼 Linkdln: https://www.linkedin.com/in/tope-aroninuola-064531237?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app

💻 GitHub: https://github.com/Brightprof

---

⭐ If you found this project useful, please consider giving it a star.