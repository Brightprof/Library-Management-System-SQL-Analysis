# 📚 Library Management System SQL Project

## 📖 Project Overview

The Library Management System is a SQL Server database project designed to streamline library operations by managing books, members, employees, branches, book issuance, and return transactions.

Beyond database design, this project leverages SQL for business analysis, reporting, and operational insights, making it a practical demonstration of real-world database management and data analytics skills.

## 🎯 Project Objectives

This project aims to:

* Design a relational database for library operations.
* Manage book inventory and availability.
* Track member registrations and borrowing activities.
* Record book issuance and return transactions.
* Generate branch-level performance reports.
* Identify overdue books and calculate fines.
* Automate library processes using stored procedures.
* Apply SQL analytical techniques to solve business problems.

---

## 🛠 Tools & Technologies

* SQL Server
* SQL Server Management Studio (SSMS)
* GitHub

---

## 🗄 Database Schema

The database consists of six interconnected tables:

### 1. Books

Stores information about books available in the library.

| Column       | Description            |
| ------------ | ---------------------- |
| isbn         | Unique book identifier |
| book_title   | Book title             |
| category     | Book category          |
| rental_price | Book rental fee        |
| status       | Availability status    |
| author       | Author name            |
| publisher    | Publisher name         |

### 2. Branch

Stores branch information.

| Column         | Description       |
| -------------- | ----------------- |
| branch_id      | Branch ID         |
| manager_id     | Branch Manager ID |
| branch_address | Branch location   |
| contact_no     | Contact number    |

### 3. Employees

Stores employee records.

| Column    | Description     |
| --------- | --------------- |
| emp_id    | Employee ID     |
| emp_name  | Employee name   |
| position  | Job role        |
| salary    | Employee salary |
| branch_id | Assigned branch |

### 4. Members

Stores registered library members.

| Column         | Description       |
| -------------- | ----------------- |
| member_id      | Member ID         |
| member_name    | Member name       |
| member_address | Address           |
| reg_date       | Registration date |

### 5. Issued_Status

Tracks books issued to members.

| Column           | Description                        |
| ---------------- | ---------------------------------- |
| issued_id        | Issue transaction ID               |
| issued_member_id | Member who borrowed the book       |
| issued_book_name | Book title                         |
| issued_date      | Date issued                        |
| issued_book_isbn | Book ISBN                          |
| issued_emp_id    | Employee who processed transaction |

### 6. Return_Status

Tracks returned books.

| Column           | Description               |
| ---------------- | ------------------------- |
| return_id        | Return transaction ID     |
| issued_id        | Related issue transaction |
| return_book_name | Returned book             |
| return_date      | Return date               |
| return_book_isbn | Book ISBN                 |

---

## 🔗 Entity Relationship Diagram (ERD)

The database follows a relational structure where:

* One Branch manages many Employees.
* One Employee processes many Book Issues.
* One Member can borrow many Books.
* One Book can be issued multiple times.
* One Issued Transaction can have one corresponding Return Transaction.
* One Book can have multiple return records.

<img width="1536" height="1024" alt="Library management system ERD" src="https://github.com/user-attachments/assets/4a255c76-eccd-498e-b2ee-a1a9e576e690" />

---

## 📂 Project Structure

```text
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
│   ├── erd.png
│   ├── Schema.png
│   ├── branch_report.png
|   ├── overdue_books.png
│   └── Book status update.png
│
└── README.md
```

---

# 📌 SQL Concepts Demonstrated

### Database Design

* CREATE DATABASE
* CREATE TABLE
* PRIMARY KEY
* FOREIGN KEY
* Relational Modeling

### Data Manipulation

* INSERT
* UPDATE
* DELETE
* SELECT

### Data Analysis

* GROUP BY
* HAVING
* COUNT
* SUM
* DATEDIFF
* DATEADD

### Joins

* INNER JOIN
* LEFT JOIN

### Advanced SQL

* CTAS (Create Table As Select)
* EXISTS
* Stored Procedures
* Error Handling using RAISERROR

---

# 📊 Business Problems Solved

### CRUD Operations

✔ Add new books to the library inventory.

✔ Update member information.

✔ Delete obsolete issue records.

✔ Retrieve books issued by specific employees.

✔ Identify members who borrowed multiple books.

---

### Reporting & Analysis

### Book Issue Summary

Created a summary table showing the number of times each book has been issued.

### Rental Revenue Analysis

Calculated total rental income generated by each book category.

### Membership Analysis

Identified members who registered within the last five years.

### Employee & Branch Reporting

Displayed employee information alongside branch and manager details.

### Premium Books Analysis

Created a separate table containing books with rental prices above $5.

### Outstanding Loans

Retrieved books that have not yet been returned.

---

### Advanced Analytics

### Overdue Books Detection

Identified members with books overdue beyond the 30-day borrowing period.

Output includes:

* Member ID
* Member Name
* Book Title
* Issue Date
* Days Overdue

### Automated Return Processing

Developed a stored procedure that:

* Records returned books.
* Updates book availability.
* Generates return confirmation messages.

### Branch Performance Reporting

Generated branch-level KPIs including:

* Number of books issued
* Number of books returned
* Total rental revenue

### Active Member Analysis

Identified members who borrowed books within the last three months.

### Employee Productivity Analysis

Ranked the Top 3 employees based on the number of book issue transactions processed.

### Automated Book Issuance Procedure

Created a stored procedure that:

* Checks book availability.
* Updates book status automatically.
* Prevents unavailable books from being issued.

### Fine Calculation System

Generated a report of overdue members and calculated fines at a rate of **$0.50 per overdue day**.

---

# 📈 Key Insights

The analysis revealed:

* Most active library members.
* Top-performing employees.
* Branches generating the highest rental activity.
* Books with the highest circulation rates.
* Members with overdue books and accumulated fines.
* Revenue generated from book rentals across categories.

---

# 🚀 Future Improvements

* Implement SQL Views for reporting.
* Add database triggers for auditing.
* Develop a Power BI dashboard.
* Integrate a web application front-end.
* Introduce role-based access control.
* Add automated fine-payment tracking.

---

## 👨‍💻 Author

### TOPE ARONINUOLA

**Business Analyst | Data Analyst | Power BI Developer**

📧 Email: topearoninuola@gmail.com

💼 LinkedIn: www.linkedin.com/in/tope-aroninuola-064531237

💻 GitHub: https://github.com/Brightprof

---

## ⭐ Support

If you found this project helpful or insightful, consider giving the repository a ⭐ on GitHub.
