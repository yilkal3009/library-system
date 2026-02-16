📚 Library Management System (SQL Server Database)
A comprehensive relational database system built using MS SQL Server (T-SQL).
This project is designed to manage the core operations of a university or public library,
including inventory tracking, student memberships, staff management, and transaction logging for borrowed books and fines.

🌟 Key Features
Hierarchical Management: Tracks different library branches and their respective managers and librarians.

Inventory Control: Categorizes books and manages stock levels (TotalCopies vs. AvailableCopies).

Transaction Tracking: Logs book borrowing with automated BorrowDate and customizable DueDate.

Financial Records: Includes a Fine system to track unpaid late fees and a LibraryServices table for auxiliary costs like printing and photocopying.

Data Integrity: Utilizes Primary Keys, Foreign Keys, and IDENTITY seeds to ensure relational consistency.

🛠️ Tech Stack
Engine: Microsoft SQL Server

Language: T-SQL (Transact-SQL)

Tool: SQL Server Management Studio (SSMS)

📂 Database Schema (9 Core Tables)
Library: Information about library branches and locations.

Category: Classification for books (e.g., Programming, Science).

Manager: Details of high-level library administrators.

Librarians: Staff members managed by specific managers.

Students: Registered members authorized to borrow books.

Books: The central repository for book titles, authors, and ISBNs.

Borrow: The transaction engine tracking which student borrowed which book and when it is due.

LibraryServices: Records of additional services (Photocopy, Printing) provided to students.

Fine: A dedicated table for managing penalties and payment statuses.

🚀 How to Setup and Use
To get this database running on your local machine, follow these steps:

Prerequisites: Ensure you have SQL Server and SQL Server Management Studio (SSMS) installed.

Clone/Copy: Copy the SQL script provided in this repository.

Execute:

Open SSMS and connect to your server.

Open a New Query window.

Paste the script and press F5 (or click Execute).

Verification: Run the following commands to see the sample data:

SQL
USE librarymanagmentsystems;
SELECT * FROM Books;
SELECT * FROM Students;
SELECT * FROM Borrow;
