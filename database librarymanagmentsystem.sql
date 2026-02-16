create database librarymanagmentsystems
use librarymanagmentsystems;


-- 1. Library Table
CREATE TABLE Library (
    LibraryID INT PRIMARY KEY IDENTITY(10,1),
    Name VARCHAR(100),
    Location VARCHAR(100),
    ContactNumber VARCHAR(20)
);
-- Library Data
INSERT INTO Library VALUES ('Main Campus Library', 'Debre Markos', '0111223344');
INSERT INTO Library VALUES('Computer scince Library','Burie',0222116633);
select *from Library
-- 2. Category Table (ለመጽሐፍት ዘርፍ)
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY IDENTITY(20,1),
    CategoryName VARCHAR(50)
);
-- Category Data
INSERT INTO Category (CategoryName) VALUES ('Programming'), ('History'), ('Fiction'), ('Science');
select *from Category
-- 3. Manager Table
CREATE TABLE Manager (
    ManagerID INT PRIMARY KEY IDENTITY(30,1),
    FirstName VARCHAR(50),  
    LastName VARCHAR(50),   
    OfficeRoom VARCHAR(50),
    Phone VARCHAR(20)
);
-- Manager Data
INSERT INTO Manager (FirstName, LastName, OfficeRoom, Phone) VALUES 
('Abebe', 'Kebede', 'Room 101', '0911223344'),
('Hiwot', 'Tesfaye', 'Room 102', '0922334455'),
('Belayneh', 'G/Mariam', 'Room 103', '0933445566'),
('Martha', 'Alemu', 'Room 104', '0944556677');
select *from Manager
-- 4. Librarian Table
CREATE TABLE Librarians (
    LibrarianID INT PRIMARY KEY IDENTITY(40,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Shift VARCHAR(50),
    ManagerID INT FOREIGN KEY REFERENCES Manager(ManagerID));

-- Librarian Data
INSERT INTO Librarians VALUES 
('Tigist', 'Yohannes', 'Morning', 30),
('Dawit', 'Teklu', 'Afternoon', 31),
('Helen', 'Berhe', 'Morning', 32),
('Solomon', 'Kassa', 'Afternoon', 33);
select *from Librarians
-- 5. Student Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(100,1),
    LibrarianID INT FOREIGN KEY REFERENCES Librarians(LibrarianID),--forign key
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Email VARCHAR(100)
);
-- Student Data
INSERT INTO Students VALUES 
(40,'Yilkal ', 'Meku', 'Computer Science', 'sam@email.com'),
(41,'Lidetu', 'Kassahun', 'Engineering', 'lidet@email.com'),
(42,'Hana', 'Yilma', 'Economics', 'hana@email.com'),
(43,'Biniyam', 'Tekle', 'Medicine', 'bini@email.com');
select *from Students
DELETE FROM Students
WHERE StudentID = 103;
-- 6. Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(67,1),
    Title VARCHAR(200),
    Author VARCHAR(100),
    ISBN VARCHAR(50),
    CategoryID INT FOREIGN KEY REFERENCES Category(CategoryID),--forign key
    LibraryID INT FOREIGN KEY REFERENCES Library(LibraryID),--forign key
    TotalCopies INT,
    AvailableCopies INT
);

-- Books Data
INSERT INTO Books (Title, Author, ISBN, CategoryID, LibraryID, TotalCopies, AvailableCopies)
VALUES 
('SQL Server Basics','John Doe','978-123', 20, 10, 50, 10),
('Ethiopian History','Abebe B.','978-456', 21, 11, 5, 5),
('Database', 'Dr Kebede', '978-789', 22, 10, 80, 20),
('Physics ','Isaac N.','978-000', 23, 11, 100, 12);
select *from Books
update Books set Title='Advanced Database'
    where BookID=71
-- 7. Borrow Table (ብድርን የሚመዘግብ)
CREATE TABLE Borrow (
    BookID INT FOREIGN KEY REFERENCES Books(BookID),
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID),--forign key
    LibrarianID INT FOREIGN KEY REFERENCES Librarians(LibrarianID),--forign key
    BorrowDate DATE DEFAULT GETDATE(),
    DueDate DATE,
    ReturnDate DATE NULL
);
-- Borrow Records
INSERT INTO Borrow  (BookID, StudentID, LibrarianID, BorrowDate, DueDate) VALUES 
(68, 100, 40, '2024-05-10', '2024-05-20'),
(69, 101, 41, '2024-05-12', '2024-05-22'),
(70, 102, 42, '2024-05-15', '2024-05-25'),
(71, 103, 43, '2024-05-16', '2024-05-26');
select *from Borrow 
update Borrow set ReturnDate='2024-05-15' where BookID=70
-- 8. LibraryService Table
CREATE TABLE LibraryService (
    ServiceID INT PRIMARY KEY IDENTITY(80,1),
    ServiceName VARCHAR(100),
    ServiceFee DECIMAL(10,2)
);
-- Library Services
INSERT INTO LibraryService VALUES 
('Photocopy', 2.00),
('Printing', 5.00),
('Digital Archive', 0.00),
('Reference Search', 10.00);
select *from LibraryService
CREATE TABLE Fine (
    FineID INT PRIMARY KEY IDENTITY(90,1),
     StudentID INT FOREIGN KEY REFERENCES Students(StudentID),--forign key
    Amount DECIMAL(10,2),
    PaymentStatus NVARCHAR(20) DEFAULT 'Unpaid', -- 'Paid' or 'Unpaid'
    FineDate DATE DEFAULT GETDATE()
);
INSERT INTO Fine ( StudentID, Amount, PaymentStatus) VALUES 
(100, 20.00, 'Unpaid'),
(101, 5.00, 'Paid'),
(102, 15.50, 'Unpaid'),
(103, 10.00, 'Paid');
select *from Fine
