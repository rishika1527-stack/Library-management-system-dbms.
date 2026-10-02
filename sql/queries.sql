-- =========================================
-- SQL QUERIES
-- LIBRARY MANAGEMENT SYSTEM
-- =========================================
-- =========================================================
-- 21. DQL - SELECT ALL BOOKS
-- =========================================================

SELECT *
FROM Book;


-- =========================================================
-- 22. DQL - SELECT WITH CONDITION
-- =========================================================

SELECT title, genre
FROM Book
WHERE genre = 'Technology';

-- =========================================================
-- 23. DQL - FILTERING AND SORTING
-- =========================================================

SELECT title, total_copies
FROM Book
WHERE total_copies > 2
ORDER BY total_copies DESC;


-- =========================================================
-- 24. DQL - JOIN QUERY
-- =========================================================

SELECT
    Member.first_name,
    Book.title,
    Loan.loan_date,
    Loan.due_date,
    Loan.status
FROM Member
JOIN Loan
    ON Member.member_id = Loan.member_id
JOIN Book
    ON Loan.book_id = Book.book_id;


-- =========================================================
-- 25. DQL - AGGREGATE FUNCTION
-- =========================================================

SELECT COUNT(*) AS total_books
FROM Book;


-- =========================================================
-- 26. DQL - SUM AGGREGATE FUNCTION
-- =========================================================

SELECT SUM(total_copies) AS total_book_copies
FROM Book;


-- =========================================================
-- 27. DQL - AVERAGE
-- =========================================================

SELECT AVG(total_copies) AS average_copies
FROM Book;

-- =========================================================
-- 28. DQL - FINE AGGREGATE
-- =========================================================

SELECT SUM(fine_amount) AS total_fine
FROM Fine;


-- =========================================================
-- 29. DDL - CREATE VIEW
-- =========================================================

CREATE VIEW Loan_Details AS
SELECT
    Loan.loan_id,
    Member.first_name,
    Book.title,
    Loan.loan_date,
    Loan.due_date,
    Loan.status
FROM Loan
JOIN Member
    ON Loan.member_id = Member.member_id
JOIN Book
    ON Loan.book_id = Book.book_id;


-- =========================================================
-- 30. DQL - DISPLAY VIEW
-- =========================================================

SELECT *
FROM Loan_Details;


-- =========================================================
-- 31. DQL - VIEW WITH CONDITION
-- =========================================================

SELECT *
FROM Loan_Details
WHERE status = 'Active';


-- =========================================================
-- 32. CHECK ALL TABLES
-- =========================================================

SELECT * FROM Publisher;

SELECT * FROM Author;

SELECT * FROM Book;

SELECT * FROM Book_Author;

SELECT * FROM Member;

SELECT * FROM Loan;

SELECT * FROM Fine;
