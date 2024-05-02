--STUDENT INFORMATION SYSTEM (SIS)

--TASK 1 : DATABASE DESIGN

--1. Create the database named "SISDB"
CREATE DATABASE SISDB;

-- Using the database
USE SISDB;

--2.
/* Define the schema for the Students, Courses, Enrollments, Teacher, and Payments tables based 
on the provided schema. Write SQL scripts to create the mentioned tables with appropriate data 
types, constraints, and relationships. */

-- Students Table
CREATE TABLE Students(
student_id int IDENTITY(1,1) PRIMARY KEY,
first_name varchar(30) NOT NULL,
last_name varchar(30) NOT NULL,
date_of_birth DATE,
email VARCHAR(50) UNIQUE,   -- Email id column is Unique
phone_number VARCHAR(15) NOT NULL
);

-- Teacher 
CREATE TABLE Teacher(
teacher_id INT IDENTITY(1,1) PRIMARY KEY,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
email VARCHAR(50) UNIQUE
);

-- Courses
CREATE TABLE Courses (
course_id INT IDENTITY(1,1) PRIMARY KEY,
course_name VARCHAR(100) NOT NULL,
credits INT NOT NULL,
teacher_id INT,
FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

-- Enrollments
CREATE TABLE Enrollments (
enrollment_id INT identity(1,1) PRIMARY KEY,
student_id INT,
course_id INT,
enrollment_date DATE NOT NULL,
FOREIGN KEY (student_id) REFERENCES Students(student_id),
FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Payments
CREATE TABLE Payments (
payment_id INT IDENTITY(1,1) PRIMARY KEY,
student_id INT,
amount DECIMAL(10, 2) NOT NULL,
payment_date DATE NOT NULL,
FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

--3. 
/* Create an ERD (Entity Relationship Diagram) for the database. */
-- Created through Database Diagram 


--4.
/* Create appropriate Primary Key and Foreign Key constraints for referential integrity. */
-- Created 

--5.
/* Insert at least 10 sample records into each of the following tables.
i. Students
ii. Courses
iii. Enrollments
iv. Teacher
v. Payments      */


-- Inserting values into Students table

INSERT INTO Students VALUES
('Anand','Nahar','2001-10-21','anand12@gmail.com',5554442356),
('Manas','Vyas','1999-04-08','vyasmanas@gmail.com',5553467898),
('Meenal','Soni','2001-10-20','meers@gmail.com',2245334567),
('Manay','Agrawal','2002-11-14','xyz.manay@gmail.com',6645234114),
('Piyush','Sharma','2000-08-09','piyushshrma@gmail.com',1776554756),
('Shruti','Joshi','2001-07-20','Sjoshi@gmail.com',6685231345),
('Malay','Thakur','2002-07-06','malayt@gmail.com',7765453378),
('Mohit','Dubey','2003-01-17','Mohitd@gmail.com',7756447736),
('Manish','Arora','1997-02-16','sample1@gmail.com',9748275933),
('Mahi','Nayak','2004-10-12','nayakMahi@gmail.com',6683038544);

SELECT * FROM Students;

-- Inserting values into Teacher table

INSERT INTO TEACHER VALUES
('Kapil','Joshi','joshi.kapil123@gmail.com'),
('Manasvi','Sharma','sharma12manasvi@gmail.com'),
('Palak','Joshi','joshiP91@gmail.com'),
('Sahil','Soni','soni12@example.com'),
('Palak','Sharma','palakSharma@gmail.com'),
('Sneha','Vyas','shr@gmail.com'),
('Manar','Thakur','manar@gmail.com'),
('Johnna','Verma','joh12nna@gmail.com'),
('Malish','Pathak','malish78@gmail.com'),
('Neha','Nayak','ne87ha@gmail.com');


-- Inserting values into Courses table

INSERT INTO Courses VALUES 
('Data Structures and Algorithms', 4, 1),
('Java Programming', 4, 1),
('Python', 4, 9),
('JavaScript Fundamentals', 2, 7),
('C#', 4, 6),
('Machine Learning Fundamentals', 4, 8),
('Cloud Computing', 3, 5),
('Android App Development', 4, 3),
('iOS App Development', 3, 4),
('SQL Fundamentals', 3, 10);


-- Inserting values into Enrollments table
INSERT INTO Enrollments VALUES 
(2, 3, '2024-04-01'),
(9, 8, '2023-09-07'),
(5, 3, '2023-10-14'),
(5, 9, '2024-01-28'),
(7, 5, '2024-02-17'),
(2, 10, '2023-11-21'),
(1, 3, '2024-04-17'),
(8, 8, '2023-06-18'),
(9, 5, '2023-07-23'),
(10, 7, '2024-03-10');


-- Inserting values into Payments table

INSERT INTO Payments VALUES 
(10, 2000.00, '2024-04-15'),
(2, 1500.00, '2024-04-11'),
(5, 2500.00, '2023-12-22'),
(2, 1200.00, '2024-01-01'),
(5, 1899.00, '2024-03-08'),
(2, 2200.00, '2024-04-23'),
(8, 1300.00, '2023-11-16'),
(8, 1740.00, '2024-02-27'),
(9, 1990.00, '2023-11-08'),
(10, 2100.00, '2024-04-19');



-- Tasks 2: Select, Where, Between, AND, LIKE

--1. 
/*   Write an SQL query to insert a new student into the "Students" table with the following details:
  a. First Name: John
  b. Last Name: Doe
  c. Date of Birth: 1995-08-15
  d. Email: john.doe@example.com
  e. Phone Number: 1234567890   */

INSERT INTO Students VALUES('John','Doe','1995-08-15','john.doe@example.com',1234567890);


--2.
/* Write an SQL query to enroll a student in a course. Choose an existing student and course and 
insert a record into the "Enrollments" table with the enrollment date. */

INSERT INTO Enrollments VALUES (3,4,'2024-04-20');  -- Enrolled Meenal(student_id = 3) in course JavaScript Fundamentals (course_id = 4)


--3.
/* Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and 
modify their email address.*/

UPDATE Teacher 
SET email='sampleemail123@gmail.com' 
WHERE first_name='Kapil' AND last_name='Joshi';   --Updated email of Aniha Vyas


--4.
/* Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select 
an enrollment record based on the student and course. */

DELETE FROM Enrollments
WHERE student_id = 5 AND course_id = 3;


--5.
/* Update the "Courses" table to assign a specific teacher to a course. Choose any course and 
teacher from the respective tables. */

UPDATE Courses
SET teacher_id = 3
WHERE course_id = 3;


--6.
/* Delete a specific student from the "Students" table and remove all their enrollment records 
from the "Enrollments" table. Be sure to maintain referential integrity */

DELETE FROM Enrollments WHERE student_id = 7;
DELETE FROM Students WHERE student_id = 7;


--7.
/* Update the payment amount for a specific payment record in the "Payments" table. Choose any 
payment record and modify the payment amount */
UPDATE Payments
SET amount = 1999.00
WHERE payment_id = 2;



-- TASK 3 : Aggregate functions, Having, Order By, GroupBy and Joins

--1.
/* Write an SQL query to calculate the total payments made by a specific student. You will need to 
join the "Payments" table with the "Students" table based on the student's ID */

SELECT s.student_id, s.first_name,s.last_name, COALESCE(SUM(p.amount),0) AS Total_Payments
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name;

-- COALESCE(SUM(p.amount),0) : Replace NULL values for total payments with 0, if no payments are made


--2.
/* Write an SQL query to retrieve a list of courses along with the count of students enrolled in each 
course. Use a JOIN operation between the "Courses" table and the "Enrollments" table */

SELECT c.course_id, c.course_name, count(e.student_id) AS Count_of_Enrolled_Students
FROM Courses c
LEFT JOIN Enrollments e
ON c.course_id=e.course_id
GROUP BY c.course_id, c.course_name;


--3.
/* Write an SQL query to find the names of students who have not enrolled in any course. Use a 
LEFT JOIN between the "Students" table and the "Enrollments" table to identify students 
without enrollments */

SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e 
ON s.student_id=e.student_id
WHERE e.Enrollment_id is NULL;


--4.
/* Write an SQL query to retrieve the first name, last name of students, and the names of the 
courses they are enrolled in. Use JOIN operations between the "Students" table and the 
"Enrollments" and "Courses" tables.*/

SELECT s.first_name, s.last_name, c.course_name 
FROM Students s
INNER JOIN Enrollments e ON s.student_id = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id;


--5.
/* Create a query to list the names of teachers and the courses they are assigned to. Join the 
"Teacher" table with the "Courses" table */

SELECT t.first_name, t.last_name, c.course_name
FROM Teacher t
INNER JOIN Courses c
ON t.teacher_id = c.teacher_id;


--6.
/* Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the 
"Students" table with the "Enrollments" and "Courses" tables */

-- Student enrollment details for course id =3

SELECT s.student_id, s.first_name, s.last_name , e.course_id, e.enrollment_date
FROM Students s
INNER JOIN Enrollments e 
ON s.student_id=e.student_id
WHERE course_id = 3
ORDER BY s.student_id;


--7.
/* Find the names of students who have not made any payments. Use a LEFT JOIN between the 
"Students" table and the "Payments" table and filter for students with NULL payment record */

SELECT s.student_id, s.first_name, s.last_name
FROM Students s
LEFT JOIN Payments p
ON s.student_id = p.student_id
WHERE p.student_id IS NULL
ORDER BY s.student_id;


--8.
/* Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN 
between the "Courses" table and the "Enrollments" table and filter for courses with NULL 
enrollment records. */

SELECT c.course_id, c.course_name
FROM Courses c
LEFT JOIN Enrollments e
ON c.course_id=e.course_id
WHERE e.course_id IS NULL;


--9.
/* Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" 
table to find students with multiple enrollment records. */

SELECT e1.student_id, s.first_name, s.last_name
FROM Enrollments e1
JOIN Enrollments e2 ON e1.student_id = e2.student_id
JOIN Students s ON e1.student_id = s.student_id
WHERE e1.course_id != e2.course_id
GROUP BY e1.student_id, s.first_name, s.last_name
HAVING COUNT(DISTINCT e1.course_id) > 1;


--10.
/* Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" 
table and the "Courses" table and filter for teachers with NULL course assignments. */

SELECT t.teacher_id, t.first_name, t.last_name
FROM Teacher t
LEFT JOIN Courses c
ON t.teacher_id = c.teacher_id
WHERE c.teacher_id IS NULL;


-- Task 4. Subquery and its type


--1.
/* Write an SQL query to calculate the average number of students enrolled in each course. Use 
aggregate functions and subqueries to achieve this */

SELECT AVG(No_of_Students_Enrolled) AS Average_No_of_Students
FROM (
SELECT COUNT(*) AS No_of_Students_Enrolled
FROM Enrollments
GROUP BY course_id
) AS No_of_Students_Enrolled;


--2.
/* Identify the student(s) who made the highest payment. Use a subquery to find the maximum 
payment amount and then retrieve the student(s) associated with that amount. */

SELECT student_id , first_name, last_name
FROM Students
WHERE student_id IN(SELECT student_id FROM Payments 
WHERE amount = (SELECT MAX(amount) FROM Payments) );


--3.
/* Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the 
course(s) with the maximum enrollment count */

SELECT course_id, course_name
FROM Courses
WHERE course_id IN (
SELECT course_id FROM Enrollments
GROUP BY course_id
HAVING COUNT(*) = (
   SELECT MAX(enrollment_count)
     FROM (
           SELECT course_id, COUNT(*) AS enrollment_count
		   FROM Enrollments
           GROUP BY course_id
     ) AS max_enrollment
  )
);


--4.
/* Calculate the total payments made to courses taught by each teacher. Use subqueries to sum 
payments for each teacher's courses */

SELECT teacher_id, first_name, last_name, 
(SELECT COALESCE(SUM(amount),0)           -- Replace NULL values for total payments with 0, if no payments are made
   FROM Payments 
   WHERE student_id IN (
     SELECT student_id 
     FROM Enrollments 
     WHERE course_id IN (
         SELECT course_id 
         FROM Courses 
         WHERE teacher_id = Teacher.teacher_id
     )
)) AS total_payments
FROM Teacher;

------- Using Joins-----------
SELECT t.teacher_id, t.first_name, t.last_name, 
COALESCE(SUM(p.amount), 0) AS total_payments        -- Replace NULL values for total payments with 0, if no payments are made
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id
LEFT JOIN Enrollments e ON c.course_id = e.course_id
LEFT JOIN Payments p ON e.student_id = p.student_id
GROUP BY t.teacher_id, t.first_name, t.last_name;


--5.
/* Identify students who are enrolled in all available courses. Use subqueries to compare a 
student's enrollments with the total number of courses. */

SELECT student_id, first_name, last_name
FROM Students s
WHERE (SELECT COUNT(DISTINCT course_id) FROM Courses) = (SELECT COUNT(DISTINCT course_id) 
FROM Enrollments 
WHERE student_id = s.student_id);


--6. 
/* Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to 
find teachers with no course assignments. */

SELECT teacher_id, first_name, last_name
FROM Teacher
WHERE teacher_id NOT IN (SELECT DISTINCT teacher_id FROM Courses);


--7. 
/* Calculate the average age of all students. Use subqueries to calculate the age of each student 
based on their date of birth. */

SELECT AVG(age) AS Average_Age
FROM 
(SELECT DATEDIFF(YEAR, date_of_birth, GETDATE()) AS age
FROM Students) 
AS StudentAges;


--8. 
/* Identify courses with no enrollments. Use subqueries to find courses without enrollment 
records. */

SELECT course_id, course_name
FROM Courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments);


--9. 
/* Calculate the total payments made by each student for each course they are enrolled in. Use 
subqueries and aggregate functions to sum payments. */

SELECT student_id, course_id, 
(
 SELECT COALESCE(SUM(amount),0) 
 FROM Payments 
 WHERE student_id = e.student_id
) AS total_payments
FROM Enrollments e
ORDER BY student_id;


--10. 
/* Identify students who have made more than one payment. Use subqueries and aggregate 
functions to count payments per student and filter for those with counts greater than one. */

SELECT student_id, first_name, last_name
FROM (
    SELECT s.student_id, s.first_name, s.last_name, COUNT(*) AS Number_of_payments
    FROM Students s
    JOIN Payments p ON s.student_id = p.student_id
    GROUP BY s.student_id, s.first_name, s.last_name
) AS Payment_Count
WHERE Number_of_Payments > 1;


--11. 
/* Write an SQL query to calculate the total payments made by each student. Join the "Students" 
table with the "Payments" table and use GROUP BY to calculate the sum of payments for each 
student. */

SELECT s.student_id,s.first_name, s.last_name, COALESCE(SUM(p.amount),0) AS Total_Payments
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id,s.first_name, s.last_name;


--12. 
/* Retrieve a list of course names along with the count of students enrolled in each course. Use 
JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to 
count enrollments. */

SELECT c.course_name, count(e.student_id) AS Number_of_Students_Enrolled
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
ORDER BY c.course_name;


--13. 
/* Calculate the average payment amount made by students. Use JOIN operations between the 
"Students" table and the "Payments" table and GROUP BY to calculate the average. */

SELECT s.student_id, s.first_name, s.last_name, AVG(p.amount) AS Average_Payment_Amount
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name;
