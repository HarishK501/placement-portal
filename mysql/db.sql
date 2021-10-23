DROP DATABASE IF EXISTS apms;
CREATE DATABASE apms;
USE apms;

/*****************************************************************
Student 
******************************************************************/
CREATE TABLE Student(
	id INT PRIMARY KEY AUTO_INCREMENT, 
	regNo VARCHAR(20) UNIQUE NOT NULL, 
    email VARCHAR(40) UNIQUE NOT NULL, 
    passwd VARCHAR(30) NOT NULL, 
    fullname VARCHAR(40) NOT NULL, 
    dob DATE, gender VARCHAR(1) NOT NULL, 
    phone VARCHAR(10) UNIQUE NOT NULL, 
    address VARCHAR(50), 
    currentSem INT NOT NULL, 
    yearOfGrad INT NOT NULL, 
    dept VARCHAR(10) NOT NULL, 
    section VARCHAR(3) NOT NULL, 
    isPlaced BOOLEAN NOT NULL);
ALTER TABLE Student AUTO_INCREMENT=1000;

INSERT INTO student(regNo,email,passwd,fullname,DOB,gender,phone,address,currentSem,yearOfGrad,dept,section,isPlaced) VALUES
	('CB.EN.U4CSE18501','harishcse18501@gmail.com','harry','Harish K','2000-09-22','M','9677340574','Narasimhanaickenpalayam, Coimbatore',7,2022,'CSE','A',TRUE),
	('CB.EN.U4CSE18054','sridharantablet@gmail.com','SRI','Sridharan A R','2000-12-06','M','9600778264','Saibaba colony, Coimbatore',7,2022,'CSE','A',TRUE),
    ('CB.EN.U4CSE18041','divyasri@gmail.com','Divya','Parripati Divyasri','2001-10-15','F','8374619928','Vivekananda Nagar, Hyderabad',7,2022,'CSE','A',TRUE);

SELECT * FROM student;
/*****************************************************************
PCO 
******************************************************************/

CREATE TABLE Coordinator(
	id INT PRIMARY KEY AUTO_INCREMENT,  
    email VARCHAR(40) UNIQUE NOT NULL, 
    passwd VARCHAR(30) NOT NULL, 
    fullname VARCHAR(40) NOT NULL, 
    phone VARCHAR(10) UNIQUE NOT NULL);
ALTER TABLE Coordinator AUTO_INCREMENT=2000;

INSERT INTO coordinator(email,passwd,fullname,phone) VALUES
	('baskaran@gmail.com', 'baski','Baskaran V', '8987085341'),
    ('srikanthcir@gmail.com', 'srikanth','Srikanth', '9999786234');
    
SELECT * FROM Coordinator;


/*****************************************************************
Documents 
******************************************************************/

CREATE TABLE Documents(id INT PRIMARY KEY AUTO_INCREMENT, link VARCHAR(200));
ALTER TABLE Documents AUTO_INCREMENT=8000;

INSERT INTO Documents(link) VALUES
	('https://github.com/HarishK501/my-sample/raw/master/JD%20Managed%20Services%20-%20Versa%20Networks.docx'),
    ('https://github.com/HarishK501/my-sample/raw/master/Zessta_%20Hiring%20Interns.pdf');

SELECT * FROM Documents;
-- drop table Documents;

/*****************************************************************
Announcements 
******************************************************************/
CREATE TABLE Announcements(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    title VARCHAR(200),  
    content VARCHAR(5000), 
    date_time DATETIME, 
    postedBy INT, 
    attachedDoc INT,  
    FOREIGN KEY (attachedDoc) REFERENCES Documents(id), 
    FOREIGN KEY (postedBy) REFERENCES Coordinator(id));
ALTER TABLE Announcements AUTO_INCREMENT=6000;

INSERT INTO Announcements(title, content, date_time, postedBy, attachedDoc) VALUES
	('HCL Technologies Invites 2022 B.E/B. Tech Graduates', 
    'Dear Students,<br>
	Please find attached the JD from HCL Technologies for BTech 2022 batch.<br>
	Eligibility: B.Tech. CSE, ECE, EEE, EIE, Mechanical<br>
	Only with 75% throughout in academics(10th, 12th / Diploma & UG)<br>
	Compensation: 4.75 LPA<br><br>
	Note :<br>
	1. Probation period for selected SE/GET will be of 12 Months.<br>
	2. Also will have a service agreement of 24 Months, if the student leaves before this duration he/she is required to pay 1.25 lacs INR.<br><br>
	<strong><em>Students who are eligible & interested should register on or before 25th August 2021, 5 pm</em></strong>
	<br><br><br>
	Regards,<br>
	Srikanth<br>
	Joint Director, Placement<br>
	Amrita Vishwa Vidyapeetham<br>', '2021-07-23 20:37:20', 2001, 8000),
    ('Zessta Software|| Amrita Vishwa Vidyapeetham <br> Virtual Campus Recruitment for 2021, 2022 Batch',
    'Dear Students,<br>
	Please find the placement opportunity in Zessta Software. <br>
    Unplaced students who are interested may register with the link below latest by tomorrow EOD.<br>
	https://forms.gle/AwbjDjoBeSp2McRV6<br><br>
    Thanks & Regards,<br>
    Anu K Manappuram<br>
    Manager - Corporate Relations<br>
    Corporate & Industry Relations', '2021-08-20 10:37:34', 2000, 8001);
    
SELECT * FROM announcements ORDER BY date_time DESC; 
-- drop table announcements;

/*****************************************************************
Activities
******************************************************************/
CREATE TABLE Activities(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    studentId INT, 
    activity VARCHAR(500), 
    date_time DATETIME, 
    FOREIGN KEY (studentId) REFERENCES Student(id));
ALTER TABLE Activities AUTO_INCREMENT=100;

INSERT INTO activities(studentId, activity, date_time) VALUES
	(1000, 'Applied for Software Engineer role at Atlassian', '2021-07-27 09:37:20'),
    (1000, 'Updated profile', '2021-07-22 10:07:52');

SELECT * FROM activities ORDER BY date_time DESC;
-- drop table activities;

/*****************************************************************
<table name>
******************************************************************/

