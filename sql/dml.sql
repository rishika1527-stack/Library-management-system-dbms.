-- =========================================
-- DML - DATA MANIPULATION LANGUAGE
-- LIBRARY MANAGEMENT SYSTEM
-- =========================================
-- =========================================
-- INSERT 3 PUBLISHERS
-- =========================================

INSERT INTO Publisher
(publisher_name, country, website)
VALUES
('KARMA', 'USA', 'https://www.pearson.com'),
('THE GREEDY ONE ', 'UK', 'https://www.penguin.co.uk'),
('Oxford University Press', 'UK', 'https://global.oup.com');


-- =========================================
-- INSERT 3 AUTHORS
-- =========================================

INSERT INTO Author
(first_name, last_name, nationality)
VALUES
('Abraham', 'Silberschatz', 'American'),
('Robert', 'Martin', 'American'),
('Paulo', 'Coelho', 'Brazilian');

-- =========================================
-- INSERT 3 BOOKS
-- =========================================

INSERT INTO Book
(title, isbn, total_copies, genre, publication_year, publisher_id)
VALUES
('Database System Concepts', '9780073523323', 5, 'Technology', 2019, 1),
('Clean Code', '9780132350884', 3, 'Technology', 2008, 2),
('The Alchemist', '9780062315007', 4, 'Fiction', 1988, 3);


-- =========================================
-- INSERT 3 BOOK_AUTHOR RECORDS
-- =========================================

INSERT INTO Book_Author
(book_id, author_id)
VALUES
(1, 1),
(2, 2),
(3, 3);


-- =========================================
-- INSERT 3 MEMBERS
-- =========================================

INSERT INTO Member
(first_name, last_name, email, membership_type,
 membership_date, membership_expiry)
VALUES
('RISHIKA', 'A', 'rishika@gmail.com',
 'Student', '2026-07-01', '2027-06-30'),

('KIRAN', 'R', 'kiran@gmail.com',
 'Student', '2026-07-01', '2027-06-30'),

('KRISH', 'A', 'krish@gmail.com',
 'Faculty', '2026-07-01', '2027-06-30');


-- =========================================
-- INSERT 3 LOANS
-- =========================================

INSERT INTO Loan
(book_id, member_id, loan_date, due_date, return_date, status)
VALUES
(1, 1, '2026-07-01', '2026-07-15', '2026-07-13', 'Returned'),

(2, 2, '2026-07-10', '2026-07-24', NULL, 'Active'),

(3, 3, '2026-07-20', '2026-08-03', '2026-08-10', 'Returned');

-- =========================================
-- INSERT 3 FINES
-- =========================================

INSERT INTO Fine
(loan_id, member_id, fine_amount, fine_date, payment_status)
VALUES
(1, 1, 0.00, '2026-07-13', 'Paid'),

(2, 2, 50.00, '2026-07-24', 'Unpaid'),

(3, 3, 70.00, '2026-08-10', 'Paid');


-- =========================================================
-- 16. DML - UPDATE
-- =========================================================

UPDATE Member
SET membership_type = 'Faculty'
WHERE member_id = 2;


-- =========================================================
-- 17. CRUD - CREATE / INSERT
-- =========================================================

INSERT INTO Book
(title, isbn, total_copies, genre, publication_year, publisher_id)
VALUES
('Python Basics', '9781234567890', 3,
 'Technology', 2025, 1);


-- =========================================================
-- 18. CRUD - READ
-- =========================================================

SELECT *
FROM Book;

-- =========================================================
-- 19. CRUD - UPDATE
-- =========================================================

UPDATE Book
SET total_copies = 5
WHERE book_id = 4;


-- =========================================================
-- 20. CRUD - DELETE
-- =========================================================

DELETE FROM Book
WHERE book_id = 4;



SELECT *
FROM Book;

