/* ### CRUD Operations

- **Create**: Insert sample records into the `books` table.
- **Read**: Retrieve and display data from various tables.
- **Update**: Update records in the `employees` table.
- **Delete**: Remove records from the `members` table as needed.
*/


/**Task 1. Create a New Book Record**/
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

INSERT INTO books(isbn
      ,book_title
      ,category
      ,rental_price
      ,status
      ,author
      ,publisher)
VALUES
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')


/* Task 2: Update an Existing Member's Address */
	
  UPDATE members
  SET member_name = 'Sammy James' 
  WHERE member_id = 'C118'

  /*Task 3: Delete a Record from the Issued Status Table**
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.*/

DELETE FROM issued_status
WHERE issued_id = 'IS121'

/*Task 4: Retrieve All Books Issued by a Specific Employee**
-- Objective: Select all books issued by the employee with emp_id = 'E101'.*/

SELECT * FROM issued_status
WHERE issued_emp_id = 'E101'
