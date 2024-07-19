USE librarymanagement;

-- Manager queries
-- Count the number of staff of position librarian
SELECT b.position,COUNT(DISTINCT a.ID) AS "Number of staff"
FROM staff_info a
INNER JOIN position b
ON a.position_ID = b.ID
GROUP BY position_ID;

-- Find the book category that is borrow the most
CREATE VIEW Book_genre AS
SELECT a.ISBN,b.Title,c.Genre
FROM borrow_detail a
INNER JOIN book_data b
ON a.ISBN = b.ISBN
INNER JOIN genre_info c
ON b.Genre_ID = c.ID;
SELECT *
FROM Book_genre;

SELECT genre_info.*,
(SELECT COUNT(*) FROM Book_genre WHERE Book_genre.Genre = genre_info.Genre) AS "Frequency"
FROM genre_info
ORDER BY Frequency DESC;

-- Assistant Queries
-- Display the customer ID 30 with full information: name, book name, all date, staff name
-- DROP PROCEDURE IF EXISTS FindCustomer
DELIMITER //
CREATE PROCEDURE FindCustomer (IN customer int(11))
BEGIN
SELECT a.*, b.ISBN,b.borrow_date,b.return_date,c.borrow_status,b.staff_ID
FROM customer_info a 
INNER JOIN borrow_detail b
ON a.ID = b.customer_ID
INNER JOIN borrow_status_info c
ON b.borrow_status_ID = c.ID

WHERE a.ID = customer;
END
// DELIMITER /
CALL FindCustomer(30);  

-- Delete a borrow detail information from the borrow detail table
-- DROP PROCEDURE IF EXISTS deleteBorrowDetail

DELIMITER //
CREATE PROCEDURE deleteBorrowDetail(IN deleteID int(11))
BEGIN
DELETE FROM borrow_detail 
WHERE ID = deleteID;
END
// DELIMITER /
-- Example: Delete a borrow detail with ID 201
CALL deleteBorrowDetail(201); 

-- Delete a customer
-- DROP PROCEDURE IF EXISTS deleteCustomer;
DELIMITER //
CREATE PROCEDURE deleteCustomer(IN deleteID int(11))
BEGIN
DELETE FROM customer_info
WHERE ID = deleteID;
END
// DELIMITER /
-- Example: Delete a customer with ID 201
CALL deleteCustomer(201); 


-- Archivist Queries
-- Count for number of books of each genre
SELECT b.Genre, COUNT(Genre_ID) AS "Number of books"
FROM book_data a
INNER JOIN genre_info b
ON a.Genre_ID = b.ID
GROUP BY Genre_ID;

-- Insert a new book data
-- DROP PROCEDURE IF EXISTS insertNewBook;
DELIMITER //
CREATE PROCEDURE insertNewBook
(IN newISBN bigint(20),newTitle varchar(100), newAuthor varchar(45), newYear year(4), newNo_of_actual_copy int(11), newNo_of_current_copy int(11), 
newGenre_ID int(11), newShelf_ID int(11), newRating varchar(10), newRecommendation_label_ID int(11))
BEGIN
INSERT INTO book_data VALUE(newISBN,newTitle, newAuthor, newYear, newNo_of_actual_copy, newNo_of_current_copy, 
newGenre_ID , newShelf_ID , newRating , newRecommendation_label_ID );
SELECT * 
FROM book_data
WHERE 
ISBN = newISBN;
END
// DELIMITER /
-- Example: Insert a new book with the following information
CALL insertNewBook(1234567890,"New Book","New Author",1999,10,20,4,1,"5/5",305);  

-- Delete a specific book 
-- DROP PROCEDURE IF EXISTS deleteBook;
DELIMITER //
CREATE PROCEDURE deleteBook(IN deleteID bigint(20))
BEGIN
DELETE FROM book_data
WHERE ISBN = deleteID;
END
// DELIMITER /

-- Example: Delete a book with ISBN 1234567890
CALL deleteBook(1234567890); 


-- Librarian Queries
-- Display information of customers who return late, order by name
SELECT c.*,a.ISBN,b.borrow_status
FROM borrow_detail a
	INNER JOIN borrow_status_info b
	ON a.borrow_status_ID = b.ID
	INNER JOIN customer_info c
	ON a.customer_ID = c.ID
WHERE a.borrow_status_ID = 3
ORDER BY c.full_name;

-- Update the current shelf information for correspoding book
-- DROP PROCEDURE IF EXISTS updateShelf;
DELIMITER //
CREATE PROCEDURE updateShelf (IN bookName varchar(255),shelfNew int(5))
BEGIN
UPDATE book_data
SET Shelf_ID = shelfNew
WHERE Title = bookName;

SELECT ISBN,Title,Author,Year,Shelf_ID
FROM book_data
WHERE Title = bookName;
END;
// DELIMITER /
CALL updateShelf("The Wind", 6); 





 




