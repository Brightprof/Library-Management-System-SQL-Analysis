---CREATE TABLE "BOOK"

DROP TABLE IF EXISTS books;
CREATE TABLE books (
	isbn			VARCHAR(50) PRIMARY KEY,
	book_title		VARCHAR(80),
	category		VARCHAR(30),
	rental_price	DECIMAL(10,2),
	status			VARCHAR(10),
	author			VARCHAR(40),
	publisher		VARCHAR(40)
);


---CREATE TABLE "BRANCH"
DROP TABLE IF EXISTS branch;
CREATE TABLE branch (
	branch_id		VARCHAR(10) PRIMARY KEY,
	manager_id		VARCHAR(10),
	branch_address	VARCHAR(30),
	contact_no	    VARCHAR(15)
);

---CREATE TABLE "EMPLOYEE"
DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
	emp_id	  VARCHAR(10) PRIMARY KEY,
	emp_name  VARCHAR(30),	
	position  VARCHAR(15),
	salary	  DECIMal(10, 2),
	branch_id  VARCHAR(10),
	FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);

---CREATE TABLE "MEMBERS"
DROP TABLE IF EXISTS members;
CREATE TABLE members(
	member_id		VARCHAR(10) PRIMARY KEY,
	member_name		VARCHAR(30),
	member_address	VARCHAR(80),
	reg_date		DATE
);


---CREATE TABLE "ISSUEDSTATUS"
DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status(
	issued_id			VARCHAR(10) PRIMARY KEY,
	issued_member_id	VARCHAR(10),
	issued_book_name	VARCHAR(80),
	issued_date			DATE,
	issued_book_isbn	VARCHAR(50),
	issued_emp_id		VARCHAR(10)
	FOREIGN KEY(issued_member_id) REFERENCES members(member_id),
	FOREIGN KEY(issued_book_isbn) REFERENCES books(isbn),
	FOREIGN KEY(issued_emp_id) REFERENCES employees(emp_id)
);

---CREATE TABLE "ReturnStatus"
DROP TABLE IF EXISTS ReturnStatus;
CREATE TABLE ReturnStatus(
	return_id			VARCHAR(10) PRIMARY KEY,
	issued_id			VARCHAR(10),
	return_book_name	VARCHAR(80),
	return_date			DATE,
	return_book_isbn	VARCHAR(50),
	FOREIGN KEY(return_book_isbn) REFERENCES books(isbn)
);
