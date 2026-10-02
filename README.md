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
- CRUD Operations
- Primary Keys
- Foreign Keys
- Constraints
- Joins
- Aggregate Functions
- Views

---

## 🗂️ Database Tables

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

## 👥 Team Members and Responsibilities

| Team Member | Responsibility |
|---|---|
| T Rishika | ER Diagram and Database Schema |
| V Deepika | DDL – Table Creation and Constraints |
| U Dharani | DML, CRUD Operations, Joins and Aggregate Functions |
|M.Chandra sekhar reddy| Documentation and Screenshots |

---

## 📁 Project Structure

```text
Library-management-system-dbms/
│
├── diagrams/
│   └── er-diagram.png
│
├── docs/
│   └── Project_Documentation.docx
│
├── screenshots/
│   ├── query1_output.png
│   └── query2_output.png
│
├── sql/
│   ├── ddl.sql
│   ├── dml.sql
│   ├── library_management.sql
│   └── queries.sql
│
└── README.md
