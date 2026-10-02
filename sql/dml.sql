-- =========================================
-- DML - DATA MANIPULATION LANGUAGE
-- LIBRARY MANAGEMENT SYSTEM
-- =========================================


-- =========================================
-- 1. INSERT DATA INTO PUBLISHER
-- =========================================

INSERT INTO Publisher (publisher_id, publisher_name, address)
VALUES
(1, 'Penguin Books', 'New York'),
(2, 'Oxford Press', 'London'),
(3, 'Pearson', 'Boston');


-- =========================================
-- 2. INSERT DATA INTO AUTHOR
-- =========================================

INSERT INTO Author (author_id, author_name)
VALUES
(1, 'R.K. Narayan'),
(2, 'J.K. Rowling'),
(3, 'George Orwell');


-- =========================================
-- 3. INSERT DATA INTO BOOK
-- =========================================

INSERT INTO Book (book_id, title, isbn, publisher_id, total_copies)
VALUES
(1, 'Malgudi Days', '9780143039659', 1, 3),
(2, 'Harry Potter', '9780747532743', 2, 4),
(3, '1984', '9780451524935', 3, 2);


-- =========================================
-- 4. INSERT DATA INTO BOOK_AUTHOR
-- =========================================

INSERT INTO Book_Author (book_id, author_id)
VALUES
(1, 1),
(2, 2),
(3, 3);


-- =========================================
-- 5. INSERT DATA INTO MEMBER
-- =========================================

INSERT INTO Member (member_id, member_name, email, membership_type)
VALUES
(1, 'Ravi', 'ravi@gmail.com', 'Regular'),
(2, 'Priya', 'priya@gmail.com', 'Regular'),
(3, 'Arjun', 'arjun@gmail.com', 'Premium');


-- =========================================
-- 6. INSERT DATA INTO LOAN
-- =========================================

INSERT INTO Loan (loan_id, member_id, book_id, issue_date, return_date, status)
VALUES
(1, 1, 1, '2026-09-01', '2026-09-10', 'Returned'),
(2, 2, 2, '2026-09-05', NULL, 'Active'),
(3, 3, 3, '2026-09-07', '2026-09-15', 'Returned');


-- =========================================
-- 7. INSERT DATA INTO FINE
-- =========================================

INSERT INTO Fine (fine_id, loan_id, fine_amount, payment_status)
VALUES
(1, 1, 20.00, 'Paid'),
(2, 2, 0.00, 'Not Applicable'),
(3, 3, 10.00, 'Paid');


-- =========================================
-- 8. UPDATE MEMBER
-- =========================================

UPDATE Member
SET membership_type = 'Premium'
WHERE member_id = 2;


-- =========================================
-- 9. INSERT NEW BOOK
-- =========================================

INSERT INTO Book (book_id, title, isbn, publisher_id, total_copies)
VALUES
(4, 'Python Basics', '9781234567890', 1, 3);


-- =========================================
-- 10. UPDATE BOOK COPIES
-- =========================================

UPDATE Book
SET total_copies = 5
WHERE book_id = 4;


-- =========================================
-- 11. DELETE BOOK
-- =========================================

DELETE FROM Book
WHERE book_id = 4;
