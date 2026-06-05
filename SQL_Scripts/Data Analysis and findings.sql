* DATA ANALYSIS AND FINDINGS*/

/*Task 1: List Members Who Have Issued More Than One Book */

SELECT 
	issued_member_id,
	COUNT(*) AS members_count
FROM issued_status
GROUP BY issued_member_id
HAVING COUNT(*) > 1




---### 3. CTAS (Create Table As Select)

/*Task 2: Create Summary Tables**: Used CTAS to generate new tables based on query results - 
each book and total book_issued_cnt**/

SELECT b.isbn,
	b.book_title, 
	COUNT(issued_id) AS Issue_count
INTO book_issued_count 
FROM books AS b
JOIN issued_status AS iss
ON b.isbn = iss.issued_book_isbn
GROUP BY b.isbn, book_title



-- Task 3. **Retrieve All Books in a Specific Category**:

SELECT * FROM books
WHERE category = 'History'


-- **Task 4: Find Total Rental Income by Category**:

SELECT 
	b.category,
	COUNT(b.rental_price) AS Count_of_each_book,
	SUM(rental_price) AS Total_rental_price
FROM books AS b
JOIN issued_status AS iss
ON b.isbn = iss.issued_book_isbn
GROUP BY b.category;


--Task 5: **List Members Who Registered in the Last 5 years**:
SELECT member_name,
DATEDIFF(YEAR, reg_date, GETDATE()) AS Year_registered
FROM members
WHERE DATEDIFF(YEAR, reg_date, GETDATE()) <= 5


---Task 6. **List Employees with Their Branch Manager's Name and their branch details**:
SELECT 
	e.emp_id,
	e.emp_name,
	e.position,
	e.salary,
	b.*,
	e2.emp_name AS manager_name
FROM employees AS e
JOIN branch AS b
ON e.branch_id = b.branch_id
JOIN
employees AS e2 
ON e2.emp_id = b.manager_id



--Task 7: **Create a Table of Books with Rental Price Above a Certain Threshold**:
SELECT * 
INTO books_greater_than_$5
FROM books
WHERE rental_price > 5


SELECT *
FROM
books_greater_than_$5


--Task 8: **Retrieve the List of Books Not Yet Returned**
SELECT * 
FROM issued_status AS iss
LEFT JOIN 
ReturnStatus AS Re
ON iss.issued_id = Re.issued_id
WHERE Re.return_id IS NULL;