
/*
## Advanced SQL Operations

**Task 1: Identify Members with Overdue Books**  
Write a query to identify members who have overdue books (assume a 30-day return period). 
Display the member's_id, member's name, book title, issue date, and days overdue
*/


SELECT 
	me.member_id, 
	me.member_name, 
	iss.issued_book_name, 
	iss.issued_date,
	DATEDIFF(Day,issued_date, GETDATE()) AS Days_Overdue
FROM members As me
JOIN 
issued_status As iss
ON me.member_id = iss.issued_member_id
LEFT JOIN 
ReturnStatus AS Re
ON Re.issued_id = iss.issued_id
WHERE Re.return_id IS NULL
	AND DATEDIFF(Day,iss.issued_date, GETDATE()) > 30



/**Task 2: Update Book Status on Return**  
Write a query to update the status of books in the books table to "Yes" when they are returned 
(based on entries in the return_status table).*/

CREATE OR ALTER PROCEDURE Add_book_record(
	@issued_id VARCHAR(10),
	@return_id VARCHAR(10))
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @isbn VARCHAR(50);
	DECLARE @book_name VARCHAR(80);

	--Insert books 
	INSERT INTO ReturnStatus (issued_id, return_id, return_date)
	VALUES (@issued_id, @return_id, CAST(GETDATE() AS Date))

	--Retreive books details from issued_status
	SELECT 
	@isbn = issued_book_isbn,
	@book_name = issued_book_name
	FROM issued_status
	WHERE issued_id = @issued_id

	--update book table
	UPDATE books
	SET status = 'Yes'
	WHERE isbn = @isbn 

	-- Message output
	PRINT 'THANKS FOR RETURNING THE BOOK:' + @book_name;
END;
GO


EXEC Add_book_record 
	@issued_id = 'RS112',
	@return_id = 'IS114'

EXEC Add_book_record 'RS138', 'IS135'
EXEC Add_book_record 'RS138', 'IS136'
EXEC Add_book_record 'RS103', 'IS103'

EXEC add_book_record 
    @issued_id = 'IS005',
    @return_id = 'R002'

/**Task 3: Branch Performance Report**  
Create a query that generates a performance report for each branch, showing the number of books issued, 
the number of books returned, and the total revenue generated from book rentals.*/

 
 SELECT 
	 b.branch_id,
	 b.manager_id,
	 COUNT(iss.issued_id) AS Numbers_of_books_issued,
	 COUNT(r.return_id) AS Numbers_books_returned,
	 SUM(bo.rental_price) AS  Total_revenue
	 INTO Branch_report
 FROM issued_status as iss
 JOIN employees AS e
 ON iss.issued_emp_id  = emp_id
 JOIN branch AS b
 ON b.branch_id = e.branch_id
 LEFT JOIN ReturnStatus AS r 
 ON r.issued_id = iss.issued_id
 JOIN books AS bo
 ON bo.isbn = iss.issued_book_isbn
 GROUP BY b.branch_id, b.manager_id 



 
/*Task 4: CTAS: Create a Table of Active Members**  
Use the CREATE TABLE AS (CTAS) statement to create a new table active_members 
containing members who have issued at least one book in the last 3 months.*/


SELECT *
INTO active_member_id
FROM members AS m
WHERE EXISTS (
	SELECT 1
	FROM 
	issued_status AS iss
WHERE m.member_id = iss.issued_member_id
AND iss.issued_date >= DATEADD(MONTH, -3, GETDATE()))



/**Task 5: Find Employees with the Most Book Issues Processed**  
Write a query to find the top 3 employees who have processed the most book issues. 
Display the employee name, number of books processed, and their branch.*/

SELECT TOP 3
e.emp_name,
COUNT(iss.issued_id) AS Number_of_books_processed,
b.branch_id
FROM employees AS e
JOIN issued_status AS iss
ON e.emp_id = iss.issued_emp_id
JOIN branch AS b
ON b.branch_id = e.branch_id
GROUP BY e.emp_name,b.branch_id
ORDER BY COUNT(issued_id) DESC



/**Task 6: Stored Procedure**
Objective:
Create a stored procedure to manage the status of books in a library system.
Description:
Write a stored procedure that updates the status of a book in the library based on its issuance. The procedure should function as follows:
The stored procedure should take the book_id as an input parameter.
The procedure should first check if the book is available (status = 'yes').
If the book is available, it should be issued, and the status in the books table should be updated to 'no'.
If the book is not available (status = 'no'), the procedure should return an error message 
indicating that the book is currently not available. */

CREATE OR ALTER PROCEDURE book_status(
	@isbn VARCHAR(30)
)
AS
BEGIN
	SET NOCOUNT ON;
-- Check if book exist or available
IF EXISTS(	
	SELECT 1
	FROM books 
	WHERE isbn = @isbn
	AND status = 'yes'
	)
	BEGIN
	---2. Update book status to 'no' (issued)
	UPDATE books
	SET status = 'no'
	WHERE isbn = @isbn;
	PRINT 'Book has been successfully issued.';
	END

	ELSE
	BEGIN
	--3. Book not available or does not exist
	RAISERROR('Book is currently not available for issuance.', 16, 1);
	END
END;

EXEC book_status '978-0-06-025492-6'
/*====================================================================
   ADVANCE SQL OPERATION
  ====================================================================
*/

/**Task 7: Create Table As Select (CTAS)**
Objective: Create a CTAS (Create Table As Select) query to identify overdue books and calculate fines.*/

/*Description: Write a CTAS query to create a new table that lists each member and the books they have issued but not returned within 30 days. The table should include:
    The number of overdue books.
    The total fines, with each day's fine calculated at $0.50.
    The number of books issued by each member.
    The resulting table should show:
    Member ID
    Number of overdue books
    Total fines*/

 SELECT 
	me.member_id,
	COUNT (iss.issued_id ) AS Number_of_overdue_books,
	SUM((DATEDIFF(DAY, iss.issued_date, GETDATE())-30)*0.50) AS Total_fine
 FROM books AS b
 JOIN issued_status AS iss
	ON b.isbn = iss.issued_book_isbn
 JOIN members AS me 
	ON me.member_id = iss.issued_member_id
 LEFT JOIN ReturnStatus AS RE 
	 ON RE.issued_id = iss.issued_id
 WHERE RE.return_id IS NULL 
		AND DATEDIFF (DAY, iss.issued_date, GETDATE()) > 30
 GROUP BY me.member_id

