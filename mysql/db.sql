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




    
    