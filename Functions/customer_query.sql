USE librarymanagement;
SET SQL_SAFE_UPDATES = 0;

-- Procedure to insert new customer information
-- DROP PROCEDURE IF EXISTS insertNewCustomer;
DELIMITER //
CREATE PROCEDURE insertNewCustomer
(IN newID int(11), newFullName varchar(45), newDOB date, newEmail varchar(70), newGender varchar(5),phone_number bigint(20),address varchar(80))
BEGIN
INSERT INTO customer_info VALUE(newID,newFullName, newDOB, newEmail, newGender,phone_number,address);
SELECT * 
FROM customer_info
WHERE 
ID = newID;
END
// DELIMITER /
-- Example: Insert a new customer with the following information
CALL insertNewCustomer(201,"Taylor Swift","1990-01-01","TaylorSwift@gmail.com","F",0987654322,"21 Timber Street");  


-- Procedure to insert new data when there's new borrow detail 
-- DROP PROCEDURE IF EXISTS insertBorrowDetail;
DELIMITER //
CREATE PROCEDURE insertBorrowDetail 
(IN newID int(11), newCustomerID int(11), newISBN bigint(20), 
newBorrowDate date, newReturnDate date,newDeadline date, newBorrowStatusID int(11), newStaffID int(11))
BEGIN
INSERT INTO borrow_detail VALUE(newID,newCustomerID,newISBN,newBorrowDate,newReturnDate,newDeadline,newBorrowStatusID,newStaffID);
SELECT * 
FROM borrow_detail
WHERE 
ID = newID;
END
// DELIMITER /
-- Example: Insert a new borrow detail with the following information
CALL insertBorrowDetail(201,35,1189893438,"2022-01-01","2022-01-03","2022-01-14",1,5);  


-- Find book which author is "Dan Brown"
-- DROP PROCEDURE IF EXISTS FindAuthor
DELIMITER //
CREATE PROCEDURE FindAuthor (IN AuthorName varchar(255))
BEGIN
SELECT *
FROM book_data
WHERE Author = AuthorName;
END
// DELIMITER /
CALL FindAuthor("Dan Brown");  

-- Find all information of the book name “Little Woman”

-- DROP PROCEDURE IF EXISTS FindBook
DELIMITER //
CREATE PROCEDURE FindBook (IN book_name varchar(255))
BEGIN
SELECT *
FROM book_data
WHERE Title = book_name;
END
// DELIMITER /
CALL FindBook("Little Women"); 

-- Find all books published in 2000, order from highest to lowest rating

-- DROP PROCEDURE IF EXIST FindBookRating
DELIMITER //
CREATE PROCEDURE FindBookRating (IN book_year int(5))
BEGIN
SELECT *
FROM book_data
WHERE Year = book_year
ORDER BY Rating DESC;
END
// DELIMITER /
CALL FindBookRating(2000); 

-- Find all books with genre Science & Technology for age group 13 to 18 (id 304)
-- DROP PROCEDURE IF EXISTS FindGenreAge;
DELIMITER //
CREATE PROCEDURE FindGenreAge (IN book_genre varchar(255),age_group int(5))
BEGIN
SELECT Title,Author,Year,
b.Genre AS "Category",
c.recommendation_label AS "Age group",
No_of_actual_copy,No_of_current_copy,Rating
FROM book_data a
	INNER JOIN genre_info b
	ON a.Genre_ID = b.IDborrow_detail
    INNER JOIN recommendation_labels c
    ON a.Recommendation_label_ID = c.ID
WHERE 
b.Genre = book_genre
AND
a.Recommendation_label_ID = age_group
ORDER BY Rating DESC;
END
// DELIMITER /
CALL FindGenreAge("Science  & Technology",304); 

-- Enter customer ID information -> check for the deadline to return books.
-- DROP PROCEDURE IF EXISTS checkDeadline;
DELIMITER //
CREATE PROCEDURE checkDeadline (IN id int(11))
BEGIN
SELECT *
FROM borrow_detail
WHERE customer_ID = id ;
END
// DELIMITER /
CALL checkDeadline(2); 

-- Enter help number -> print out the contact information (name,phone, email,position) of staff
-- DROP PROCEDURE IF EXISTS inputHelp;
DELIMITER //
CREATE PROCEDURE inputHelp (IN helpID int(11))
BEGIN

IF(helpID=1)
THEN 
SELECT a.ID,a.full_name,a.email,b.position
FROM staff_info a
	INNER JOIN position b
	ON a.position_ID = b.ID
WHERE b.ID = 3;
END IF;

IF(helpID=2)
THEN
SELECT a.ID,a.full_name,a.email,b.position
FROM staff_info a
	INNER JOIN position b
	ON a.position_ID = b.ID
WHERE b.ID = 5;
END IF;

IF(helpID=3)
THEN
SELECT a.ID,a.full_name,a.email,b.position
FROM staff_info a
	INNER JOIN position b
	ON a.position_ID = b.ID
WHERE b.ID = 1;
END IF;
END;

// DELIMITER /
CALL inputHelp(1); 