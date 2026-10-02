-- =========================================
-- SQL QUERIES
-- LIBRARY MANAGEMENT SYSTEM
-- =========================================


-- =========================================
-- 1. DISPLAY ALL MEMBERS
-- =========================================

SELECT *
FROM Member;


-- =========================================
-- 2. DISPLAY ALL BOOKS
-- =========================================

SELECT *
FROM Book;


-- =========================================
-- 3. FILTER BOOKS
-- =========================================

SELECT *
FROM Book
WHERE total_copies > 2;


-- =========================================
-- 4. SORT BOOKS BY TITLE
-- =========================================

SELECT *
FROM Book
ORDER BY title;


-- =========================================
-- 5. JOIN MEMBER, LOAN AND BOOK
-- =========================================

SELECT
    m.member_id,
    m.member_name,
    b.title,
    l.issue_date,
    l.return_date,
    l.status
FROM Member m
JOIN Loan l
    ON m.member_id = l.member_id
JOIN Book b
    ON l.book_id = b.book_id;


-- =========================================
-- 6. COUNT TOTAL BOOKS
-- =========================================

SELECT COUNT(*) AS total_books
FROM Book;


-- =========================================
-- 7. SUM OF TOTAL BOOK COPIES
-- =========================================

SELECT SUM(total_copies) AS total_copies
FROM Book;


-- =========================================
-- 8. AVERAGE BOOK COPIES
-- =========================================

SELECT AVG(total_copies) AS average_copies
FROM Book;


-- =========================================
-- 9. TOTAL FINE AMOUNT
-- =========================================

SELECT SUM(fine_amount) AS total_fine
FROM Fine;


-- =========================================
-- 10. CREATE LOAN DETAILS VIEW
-- =========================================

CREATE OR REPLACE VIEW Loan_Details AS
SELECT
    m.member_id,
    m.member_name,
    b.title,
    l.issue_date,
    l.return_date,
    l.status
FROM Member m
JOIN Loan l
    ON m.member_id = l.member_id
JOIN Book b
    ON l.book_id = b.book_id;


-- =========================================
-- 11. DISPLAY LOAN DETAILS
-- =========================================

SELECT *
FROM Loan_Details;


-- =========================================
-- 12. DISPLAY ACTIVE LOANS
-- =========================================

SELECT *
FROM Loan_Details
WHERE status = 'Active';
