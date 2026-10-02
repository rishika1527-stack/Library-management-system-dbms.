# Library Management System – DBMS

## DBMS Capstone Project

A Library Management System database developed using PostgreSQL to manage publishers, authors, books, members, book loans, and fines.

---

## 📌 Project Overview

The Library Management System is designed to store and manage library information efficiently.

The database keeps track of:

- Publishers
- Authors
- Books
- Book–Author relationships
- Library members
- Book loans
- Fines

The project demonstrates important DBMS concepts including:

- DDL
- DML
- DQL
- CRUD operations
- Primary Keys
- Foreign Keys
- Constraints
- Joins
- Aggregate Functions
- Views

---

## 🗂️ Database Tables

The database contains the following tables:

| Table | Purpose |
|---|---|
| Publisher | Stores publisher information |
| Author | Stores author information |
| Book | Stores book details |
| Book_Author | Connects books with authors |
| Member | Stores library member information |
| Loan | Stores book borrowing information |
| Fine | Stores fine and payment information |

---

## 🔗 Database Relationships

The main relationships are:

- Publisher → Book
- Book → Book_Author
- Author → Book_Author
- Member → Loan
- Book → Loan
- Loan → Fine
- Member → Fine

The `Book_Author` table handles the relationship between books and authors.

---

## 🛠️ Technologies Used

- PostgreSQL
- SQL
- DB Fiddle
- GitHub

---

## 📁 Project Structure

```text
Library-management-system-dbms/
│
├── diagrams/
│   ├── README.md
│   └── er-diagram.png
│
├── docs/
│
├── screenshots/
│
├── sql/
│   ├── ddl.sql
│   ├── dml.sql
│   ├── library_management.sql
│   └── queries.sql
│
└── README.md
