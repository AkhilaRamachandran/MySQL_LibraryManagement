#PYTHON PROJECT- LIBRARY MANAGEMENT


/*CREATE TABLES
1. Branch
∙Branch_no - Set as PRIMARY KEY
∙Manager_Id
∙Branch_address
∙Contact_no
2. Employee
∙Emp_Id – Set as PRIMARY KEY
∙Emp_name
∙Position
∙Salary
∙Branch_no - Set as FOREIGN KEY and it should refer branch_no in
EMPLOYEE table
3. Customer
∙Customer_Id - Set as PRIMARY KEY
∙Customer_name
∙Customer_address
∙Reg_date

3. Customer
∙Customer_Id - Set as PRIMARY KEY
∙Customer_name
∙Customer_address
∙Reg_date
4. IssueStatus
∙Issue_Id - Set as PRIMARY KEY
∙Issued_cust – Set as FOREIGN KEY and it refer customer_id in
CUSTOMER table
∙Issued_book_name
∙Issue_date
∙Isbn_book – Set as FOREIGN KEY and it should refer isbn in
BOOKS table
5. ReturnStatus
∙Return_Id - Set as PRIMARY KEY
∙Return_cust
∙Return_book_name
∙Return_date
∙Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in
BOOKS table
6. Books
∙ISBN - Set as PRIMARY KEY
∙Book_title
∙Category
∙Rental_Price
∙Status [Give yes if book available and no if book not available] ∙
Author
∙Publisher
Write the queries for the following:
1. Retrieve the book title, category, and rental price of all available
books.
2. List the employee names and their respective salaries in descending
order of salary.
3. Retrieve the book titles and the corresponding customers who have
issued those books.
4. Display the total count of books in each category.
5. Retrieve the employee names and their positions for the employees
whose salaries are above Rs.50,000.
6. List the customer names who registered before 2022-01-01 and have
not issued any books yet.
7. Display the branch numbers and the total count of employees in each
branch.
8. Display the names of customers who have issued books in the month
of June 2023.
9. Retrieve book_title from book table containing history. 10.Retrieve
the branch numbers along with the count of employees for branches
having more than 5 employees.
10. Retrieve the branch numbers along with the count of employees
for branches having more than 5 employees
*/
drop database LibraryManagent;
CREATE DATABASE LibraryManagent;
USE LibraryManagent;

-- Create Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(20)
);
INSERT INTO Branch (Branch_no,Manager_Id,Branch_address,Contact_no) VALUES
  (1, 101, '123 Main Street, Cityville', '555-1234'),
  (2, 102, '456 Oak Avenue, Townsville', '555-5678'),
  (3, 103, '789 Pine Lane, Villagetown', '555-9012'),
  (4, 104, '321 Elm Street, Hamletville', '555-3456'),
  (5, 105, '654 Birch Road, Countryside', '555-7890'),
  (6, 106, '987 Cedar Lane, Suburbia', '555-2345'),
  (7, 107, '210 Maple Avenue, Riverside', '555-6789'),
  (8, 108, '543 Spruce Boulevard, Lakeside', '555-0123'),
  (9, 109, '876 Pinecrest Drive, Mountainside', '555-4567'),
  (10, 110, '109 Oakwood Circle, Hilltop', '555-8901');

-- Create Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES 
  (1, 'John Doe', 'Manager', 70000.00, 1),
  (2, 'Jane Smith', 'Assistant Manager', 60000.00, 2),
  (3, 'Mike Johnson', 'Sales Representative', 50000.00, 3),
  (4, 'Emily Brown', 'Customer Service Specialist', 45000.00, 1),
  (5, 'Robert Davis', 'Accountant', 55000.00, 4),
  (6, 'Sara Wilson', 'HR Coordinator', 48000.00, 2),
  (7, 'Chris Miller', 'IT Support Specialist', 52000.00, 3),
  (8, 'Amy Robinson', 'Marketing Coordinator', 48000.00, 4),
  (9, 'David White', 'Warehouse Supervisor', 51000.00, 5),
  (10, 'Karen Lee', 'Receptionist', 42000.00, 6);

-- Create Customer table
CREATE TABLE Customer(
	Customer_Id INT PRIMARY KEY,
	Customer_name VARCHAR(255),
	Customer_address VARCHAR(50),
	Reg_date DATE
);
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES 
  (1, 'Alice Johnson', '123 Main Street, Cityville', '2023-01-15'),
  (2, 'Bob Smith', '456 Oak Avenue, Townsville', '2022-05-20'),
  (3, 'Charlie Brown', '789 Pine Lane, Villagetown', '2023-09-08'),
  (4, 'David Wilson', '321 Elm Street, Hamletville', '2021-11-30'),
  (5, 'Emma Davis', '654 Birch Road, Countryside', '2023-03-12'),
  (6, 'Frank Miller', '987 Cedar Lane, Suburbia', '2022-07-25'),
  (7, 'Grace Robinson', '210 Maple Avenue, Riverside', '2023-02-18'),
  (8, 'Henry White', '543 Spruce Boulevard, Lakeside', '2022-06-05'),
  (9, 'Ivy Lee', '876 Pinecrest Drive, Mountainside', '2023-10-10'),
  (10, 'Jackie Turner', '109 Oakwood Circle, Hilltop', '2022-12-22');


-- Create table IssueStatus
CREATE TABLE IssueStatus(
	Issue_Id INT PRIMARY KEY,
	Customer_Id INT, FOREIGN KEY (Customer_Id) REFERENCES Customer(Customer_Id),
	Issued_book_name VARCHAR (250),
	Issue_date DATE,
	Isbn_book INT,FOREIGN KEY (Isbn_book) REFERENCES Book(Isbn_book)
);
INSERT INTO IssueStatus (Issue_Id, Customer_Id, Issued_book_name, Issue_date, Isbn_book)
VALUES 
  (1, 1, 'The History of Ancient Civilizations', '2023-02-01', 1001),
  (2, 3, 'World War II: A Comprehensive Overview', '2023-03-15', 1002),
  (3, 5, 'Mystery at Midnight', '2023-05-20', 1004),
  (4, 2, 'Exploring the Cosmos', '2023-06-10', 1005),
  (5, 5, 'The Art of Painting', '2023-09-05', 1009),
  (6, 6, 'Poetry Collection: Verses of the Heart', '2023-10-18', 1007),
  (7, 8, 'The Science Fiction Saga', '2023-06-30', 1003),
  (8, 10, 'Fitness and Wellness Guide', '2024-01-12', 1008),
  (9, 7, 'Cooking with Flavors', '2024-02-22', 1006),
  (10, 9, 'Programming in Python', '2024-03-30', 1010);


-- Create table ReturnStatus
CREATE TABLE ReturnStatus(
	Return_Id INT PRIMARY KEY,
	Return_cust VARCHAR(50),
	Return_book_name VARCHAR(50),
	Return_date DATE,
	Isbn_book INT, FOREIGN KEY(Isbn_book) REFERENCES Book(Isbn_book)
    );
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book)
VALUES 
  (1, 'Alice Johnson', 'The History of Ancient Civilizations', '2023-02-15', 1001),
  (2, 'Charlie Brown', 'World War II: A Comprehensive Overview', '2023-03-30', 1002),
  (3, 'Emily Davis', 'Mystery at Midnight', '2023-06-05', 1004),
  (4, 'Bob Smith', 'Exploring the Cosmos', '2023-08-20', 1005),
  (5, 'David Wilson', 'The Art of Painting', '2023-10-15', 1009),
  (6, 'Frank Miller', 'Poetry Collection: Verses of the Heart', '2023-11-28', 1007),
  (7, 'Grace Robinson', 'The Science Fiction Saga', '2024-01-10', 1003),
  (8, 'Henry White', 'Fitness and Wellness Guide', '2024-02-18', 1008),
  (9, 'Sara Johnson', 'Cooking with Flavors', '2024-03-25', 1006),
  (10, 'Ivy Lee', 'Programming in Python', '2024-04-30', 1010);

    
-- Create table book
CREATE TABLE Book (
	ISBN_Book INT PRIMARY KEY,
    Book_title VARCHAR(50),
    Category VARCHAR(50),
	Rental_Price INT,
	Status VARCHAR(20) CHECK (Status IN ('yes', 'no')),
	Author VARCHAR(50),
	Publisher VARCHAR(50)
);
INSERT INTO Book (ISBN_Book, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES 
  (1001, 'The History of Ancient Civilizations', 'History', 12, 'yes', 'John Smith', 'History Press'),
  (1002, 'World War II: A Comprehensive Overview', 'History', 15, 'yes', 'Emily Johnson', 'Historical Publications'),
  (1003, 'The Science Fiction Saga', 'Science Fiction', 10, 'no', 'Robert Davis', 'Futuristic Books'),
  (1004, 'Mystery at Midnight', 'Mystery', 14, 'yes', 'Sara Wilson', 'Enigma Publishers'),
  (1005, 'Exploring the Cosmos', 'Science', 18, 'yes', 'Chris Miller', 'Space Explorations Inc.'),
  (1006, 'Cooking with Flavors', 'Cooking', 8, 'no', 'Amy Robinson', 'Tasty Publications'),
  (1007, 'Poetry Collection: Verses of the Heart', 'Poetry', 11, 'yes', 'David White', 'Rhyme and Reason Books'),
  (1008, 'Fitness and Wellness Guide', 'Health', 13, 'no', 'Karen Lee', 'Healthy Living Publications'),
  (1009, 'The Art of Painting', 'Art', 16, 'yes', 'Alex Turner', 'Creative Arts Press'),
  (1010, 'Programming in Python', 'Technology', 20, 'no', 'Jessica Green', 'Tech Genius Publishers');

-- 1. Retrieve the book title, category, and rental price of all available books.

	SELECT Book_title,Category,Rental_Price FROM Book;
    
-- 2. List the employee names and their respective salaries in descending order of salary.
    
    SELECT Emp_name,Salary FROM Employee ORDER BY Salary DESC;
    
-- 3. Retrieve the book titles and the corresponding customers who have issued those books.

	SELECT IssueStatus.Issued_Book_name,customer.customer_name
    FROM customer
    INNER JOIN IssueStatus ON customer.customer_id=IssueStatus.customer_id;


-- 4. Display the total count of books in each category.

	SELECT Category,COUNT(*) AS Number_of_books FROM book GROUP BY category;
	
-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

	SELECT Emp_name,position FROM Employee WHERE salary>50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
	
	SELECT Customer.Customer_name FROM Customer 
    LEFT JOIN IssueStatus ON Customer.Customer_Id=IssueStatus.Customer_Id
    WHERE
    Customer.Reg_Date < 2022-01-01 AND IssueStatus.Issue_Id IS NULL;

-- 7. Display the branch numbers and the total count of employees in each branch.

	SELECT Branch_no,COUNT(*) AS No_of_employees FROM Employee GROUP BY Branch_no;
	
-- 8. Display the names of customers who have issued books in the month of June 2023.
	
    SELECT DISTINCT
    Customer.Customer_Name
	FROM Customer
	JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Customer_Id
	WHERE
    MONTH(IssueStatus.Issue_date) = 6 AND YEAR(IssueStatus.Issue_date) = 2023;

-- 9. Retrieve book_title from book table containing history. 

	SELECT Book_title FROM Book WHERE Category='History';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.

	SELECT Branch_no,COUNT(*) AS No_of_employees FROM Employee GROUP BY Branch_no HAVING COUNT(*)>5;

	




    
    
    
    