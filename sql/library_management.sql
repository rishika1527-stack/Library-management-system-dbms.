-- =========================================
-- 1. REMOVE OLD TABLES
-- =========================================

DROP TABLE IF EXISTS Fine;
DROP TABLE IF EXISTS Loan;
DROP TABLE IF EXISTS Book_Author;
DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS Publisher;


-- =========================================
-- 2. CREATE PUBLISHER TABLE
-- =========================================

CREATE TABLE Publisher (
    publisher_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    website VARCHAR(200)
);


-- =========================================
-- 3. CREATE AUTHOR TABLE
-- =========================================

CREATE TABLE Author (
    author_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    nationality VARCHAR(50)
);


-- =========================================
-- 4. CREATE BOOK TABLE
-- =========================================

CREATE TABLE Book (
    book_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    total_copies INT DEFAULT 1,
    genre VARCHAR(50),
    publication_year INT,
    publisher_id INT,

    FOREIGN KEY (publisher_id)
    REFERENCES Publisher(publisher_id)
);


-- =========================================
-- 5. CREATE BOOK_AUTHOR TABLE
-- =========================================

CREATE TABLE Book_Author (
    book_id INT NOT NULL,
    author_id INT NOT NULL,

    PRIMARY KEY (book_id, author_id),

    FOREIGN KEY (book_id)
    REFERENCES Book(book_id),

    FOREIGN KEY (author_id)
    REFERENCES Author(author_id)
);


-- =========================================
-- 6. CREATE MEMBER TABLE
-- =========================================

CREATE TABLE Member (
    member_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    membership_type VARCHAR(30),
    membership_date DATE,
    membership_expiry DATE
);


-- =========================================
-- 7. CREATE LOAN TABLE
-- =========================================

CREATE TABLE Loan (
    loan_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    status VARCHAR(20) DEFAULT 'Active',

    FOREIGN KEY (book_id)
    REFERENCES Book(book_id),

    FOREIGN KEY (member_id)
    REFERENCES Member(member_id)
);


-- =========================================
-- 8. CREATE FINE TABLE
-- =========================================

CREATE TABLE Fine (
    fine_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    loan_id INT UNIQUE NOT NULL,
    member_id INT NOT NULL,
    fine_amount DECIMAL(8,2) CHECK (fine_amount >= 0),
    fine_date DATE,
    payment_status VARCHAR(20) DEFAULT 'Unpaid',

    FOREIGN KEY (loan_id)
    REFERENCES Loan(loan_id),

    FOREIGN KEY (member_id)
    REFERENCES Member(member_id)
);


-- =========================================
-- INSERT 3 PUBLISHERS
-- =========================================

INSERT INTO Publisher
(publisher_name, country, website)
VALUES
('Pearson', 'USA', 'https://www.pearson.com'),
('Penguin Books', 'UK', 'https://www.penguin.co.uk'),
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
('VENKATA SURYA', 'A', 'venkatasurya@gmail.com',
 'Student', '2026-07-01', '2027-06-30'),

('RUPA DEVIKA', 'R', 'rupadevika@gmail.com',
 'Student', '2026-07-01', '2027-06-30'),

('KAVYA', 'A', 'kavya@gmail.com',
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


-- =========================================
-- CHECK ALL TABLES
-- =========================================

SELECT * FROM Publisher;
SELECT * FROM Author;
SELECT * FROM Book;
SELECT * FROM Book_Author;
SELECT * FROM Member;
SELECT * FROM Loan;
SELECT * FROM Fine;
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
