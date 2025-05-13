-- Create the database
CREATE DATABASE library_management;

USE library_management;

-- Publishers table: Stores publisher information
CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Authors table: Stores author information
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(50),
    birth_date DATE
);

-- Books table: Stores book details
CREATE TABLE Books (
    isbn VARCHAR(13) PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    publication_year INT,
    publisher_id INT,
    total_copies INT NOT NULL,
    available_copies INT NOT NULL,
    genre VARCHAR(50),
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);

-- Book_Authors table: Handles many-to-many relationship between Books and Authors
CREATE TABLE Book_Authors (
    isbn VARCHAR(13),
    author_id INT,
    PRIMARY KEY (isbn, author_id),
    FOREIGN KEY (isbn) REFERENCES Books(isbn),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Members table: Stores library member information
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(100),
    email VARCHAR(100) NOT NULL,
    join_date DATE NOT NULL,
    membership_status ENUM('Active', 'Inactive', 'Suspended') DEFAULT 'Active'
);

-- Loans table: Tracks book loans by members
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    isbn VARCHAR(13),
    member_id INT,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    fine_amount DECIMAL(5,2) DEFAULT 0.00,
    status ENUM('Borrowed', 'Returned', 'Overdue') DEFAULT 'Borrowed',
    FOREIGN KEY (isbn) REFERENCES Books(isbn),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Insert sample data into Publishers
INSERT INTO Publishers (publisher_id, name, address, email, phone) VALUES
(1, 'Penguin Books', '123 Publishing St, London', 'contact@penguin.com', '123-456-7890'),
(2, 'HarperCollins', '456 Harper Ave, New York', 'info@harpercollins.com', '987-654-3210');

-- Insert sample data into Authors
INSERT INTO Authors (author_id, name, nationality, birth_date) VALUES
(1, 'Jane Austen', 'British', '1775-12-16'),
(2, 'Mark Twain', 'American', '1835-11-30'),
(3, 'J.K. Rowling', 'British', '1965-07-31');

-- Insert sample data into Books
INSERT INTO Books (isbn, title, publication_year, publisher_id, total_copies, available_copies, genre) VALUES
('9780141439518', 'Pride and Prejudice', 1813, 1, 5, 3, 'Fiction'),
('9780486400778', 'Adventures of Huckleberry Finn', 1884, 1, 3, 2, 'Fiction'),
('9780747532743', 'Harry Potter and the Philosopher\'s Stone', 1997, 2, 10, 8, 'Fantasy'),
('9780141439587', 'Sense and Sensibility', 1811, 1, 4, 4, 'Fiction');

-- Insert sample data into Book_Authors (linking books to authors)
INSERT INTO Book_Authors (isbn, author_id) VALUES
('9780141439518', 1), -- Pride and Prejudice by Jane Austen
('9780486400778', 2), -- Adventures of Huckleberry Finn by Mark Twain
('9780747532743', 3), -- Harry Potter by J.K. Rowling
('9780141439587', 1); -- Sense and Sensibility by Jane Austen

-- Insert sample data into Members
INSERT INTO Members (member_id, name, contact_info, email, join_date, membership_status) VALUES
(1, 'Alice Johnson', '555-1234', 'alice.johnson@email.com', '2024-01-15', 'Active'),
(2, 'Bob Smith', '555-5678', 'bob.smith@email.com', '2023-06-20', 'Active'),
(3, 'Clara Davis', '555-9012', 'clara.davis@email.com', '2025-02-10', 'Suspended');

-- Insert sample data into Loans
INSERT INTO Loans (loan_id, isbn, member_id, loan_date, due_date, return_date, fine_amount, status) VALUES
(1, '9780141439518', 1, '2025-04-01', '2025-04-15', '2025-04-10', 0.00, 'Returned'), -- Returned on time
(2, '9780747532743', 2, '2025-04-20', '2025-05-04', NULL, 0.00, 'Borrowed'), -- Currently borrowed
(3, '9780486400778', 1, '2025-04-10', '2025-04-24', NULL, 2.50, 'Overdue'); -- Overdue with a fine

SHOW tables