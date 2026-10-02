-- =========================================
-- LIBRARY MANAGEMENT SYSTEM
-- DDL - Data Definition Language
-- =========================================
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

- =========================================================
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


