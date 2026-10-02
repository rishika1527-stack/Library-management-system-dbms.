-- =========================================
-- LIBRARY MANAGEMENT SYSTEM
-- DDL - Data Definition Language
-- =========================================

-- Remove existing tables
DROP TABLE IF EXISTS Fine;
DROP TABLE IF EXISTS Loan;
DROP TABLE IF EXISTS Book_Author;
DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS Publisher;


-- =========================================
-- 1. PUBLISHER TABLE
-- =========================================

CREATE TABLE Publisher (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL,
    address VARCHAR(200)
);


-- =========================================
-- 2. AUTHOR TABLE
-- =========================================

CREATE TABLE Author (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);


-- =========================================
-- 3. BOOK TABLE
-- =========================================

CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    publisher_id INT,
    total_copies INT DEFAULT 1,

    FOREIGN KEY (publisher_id)
        REFERENCES Publisher(publisher_id)
);


-- =========================================
-- 4. BOOK_AUTHOR TABLE
-- =========================================

CREATE TABLE Book_Author (
    book_id INT,
    author_id INT,

    PRIMARY KEY (book_id, author_id),

    FOREIGN KEY (book_id)
        REFERENCES Book(book_id),

    FOREIGN KEY (author_id)
        REFERENCES Author(author_id)
);


-- =========================================
-- 5. MEMBER TABLE
-- =========================================

CREATE TABLE Member (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    membership_type VARCHAR(50)
);


-- =========================================
-- 6. LOAN TABLE
-- =========================================

CREATE TABLE Loan (
    loan_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    status VARCHAR(20),

    FOREIGN KEY (member_id)
        REFERENCES Member(member_id),

    FOREIGN KEY (book_id)
        REFERENCES Book(book_id)
);


-- =========================================
-- 7. FINE TABLE
-- =========================================

CREATE TABLE Fine (
    fine_id INT PRIMARY KEY,
    loan_id INT,
    fine_amount DECIMAL(10,2),
    payment_status VARCHAR(20),

    FOREIGN KEY (loan_id)
        REFERENCES Loan(loan_id)
);
