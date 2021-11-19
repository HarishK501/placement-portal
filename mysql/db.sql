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
    address VARCHAR(500), 
    currentSem INT NOT NULL, 
    yearOfGrad INT NOT NULL, 
    dept VARCHAR(10) NOT NULL, 
    section VARCHAR(3) NOT NULL, 
    isPlaced BOOLEAN NOT NULL);
ALTER TABLE Student AUTO_INCREMENT=1000;

INSERT INTO student(regNo,email,passwd,fullname,DOB,gender,phone,address,currentSem,yearOfGrad,dept,section,isPlaced) VALUES
	('CB.EN.U4CSE18501','harishcse18501@gmail.com','harry','Harish K','2000-09-22','M','677340574','Narasimhanaickenpalayam, Coimbatore',7,2022,'CSE','A',TRUE),
	('CB.EN.U4CSE18054','sridharantablet@gmail.com','SRI','Sridharan A R','2000-12-06','M','960078264','Saibaba colony, Coimbatore',7,2022,'CSE','A',TRUE),
    ('CB.EN.U4CSE18041','divyasri@gmail.com','Divya','Parripati Divyasri','2001-10-15','F','83746928','Vivekananda Nagar, Hyderabad',7,2022,'CSE','A',TRUE),
    ('CB.EN.U4EEE18001','aakashkrish2323@gmail.com','akash','Aakash Krishna R','2001-03-23','M','638482534','No.1119, 2nd Floor, Westend Colony, AnnaNagar west, Chennai',7,2022,'EEE','A',false),
	('CB.EN.U4MEC18001','abhiiniit2@gmail.com','abhi','Abhi Suwetha B','2001-05-06','F','803842633','A-6, Cup Street, Block-12, Neyveli',7,2022,'MEC','A',TRUE),
    ('CB.EN.U4ECE18001','sudhamshakula6@gmail.com','sudhamshu','Akula Sudhamshu','2001-10-15','M','994996474','7-1-324, Yashodha Krishna hospital, MankammaThota, karimnagar, Telangana',7,2022,'ECE','A',false),
    ('CB.EN.U4CSE18010','nikhilsai1376@gmail.com','nikhil','Bandi Sai Nikhil Reddy','2001-03-15','M','977442167','H.No: 80-131-92-19, Housing Board Colony, Abbas Nagar, Kurnool',7,2022,'CSE','A',false),
	('CB.EN.U4EEE18019','haran465@gmail.com','haran','Hariharan B','2000-08-25','M','489768715','11/12, GajaPriya House, Alpha Nagar Extension, Karumandapam, Trichy',7,2022,'EEE','A',TRUE),
    ('CB.EN.U4CSE18049','sia@gmail.com','sia','Sia','2001-10-15','F','837619928','Vivekananda Nagar, Hyderabad',7,2022,'CSE','A',false);

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
	('baskaran@gmail.com', 'baski','Baskaran V', '987085341'),
    ('srikanthcir@gmail.com', 'srikanth','Srikanth', '999786234'),
    ('maya@gmail.com', 'maya','Maya R', '879085341'),
    ('senthil@gmail.com', 'senthil','Senthil K', '923456789');
    
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
-- INSERT INTO Announcements(title, content, date_time, postedBy) VALUES('hello', '1221212', '2021-11-19 20:38:11', 2000);

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

SELECT * FROM activities where studentId=1000 ORDER BY date_time DESC;
-- drop table activities;

/****************************************************************
job profile 
****************************************************************/

create table JobProfile(id int primary key AUTO_INCREMENT,
 title varchar(100),
 descriptions varchar(10000),
 type_int_fte varchar(10),
 CTC decimal,
 organizations varchar(50),
 location varchar(40),
 end_date date,
 posted_on date,
 depts varchar(10),
 YOG int not null,
 minimum_cgpa decimal not null,
 gender varchar(10) not null,
 postedby int, 
 attached_doc int,
 FOREIGN KEY (attached_doc) REFERENCES Documents(id), FOREIGN KEY (postedby) REFERENCES Coordinator(id) );


ALTER TABLE JobProfile AUTO_INCREMENT=9000;
insert into JobProfile(title,descriptions,type_int_fte,CTC,organizations,location,end_date,posted_on,depts,YOG,minimum_cgpa,gender,postedby,attached_doc ) values
('Amazon SDE','Knowledge of professional software engineering best practices for the full software development life cycle, including coding standards,testing.','FTE',14,'Amazon','Pune','2021-11-20','2021-08-03','CSE,ECE',2022,8,'ALL',2000,8000),
('Data Engineer','SKILLS:Strong fundamentals on Data Structures and Algorithms,Basic understanding of AWS,Good understanding of SQL ,Programming knowledge on C/Python/Java ','FTE',6,'Knowledge Lens','Banglore','2021-11-10','2021-10-28','B.Tech',2022,8,'ALL',2000,8001),
('Microsoft SDE', 'Looking for SDE role','FTE',30,'Microsoft','Hyderabad','2021-07-13','2021-07-20','CSE', 2022, 8, 'ALL', 2001, 8001); 

select * from jobprofile order by end_date desc;


/*****************************************************************
interviews
******************************************************************/
create table interviews(id int primary key AUTO_INCREMENT,
                       student_id int, 
                       job_id int,
                       ondate date,
                       ontime time,
                       interview_status varchar(20) ,
                       FOREIGN KEY (student_id) REFERENCES Student(id),
                       FOREIGN KEY (job_id) REFERENCES JobProfile(id));
ALTER TABLE interviews AUTO_INCREMENT=5000;  
 insert into interviews( student_id , job_id , ondate, ontime, interview_status) values( 1000,9000 ,'2021-10-29', '10:30:00','Completed'); 
 insert into interviews( student_id , job_id , ondate, ontime, interview_status) values( 1001,9001,'2021-10-31', '11:30:00','Pending');
 
 /*****************************************************************
applications
******************************************************************/
 create table application(id int primary key AUTO_INCREMENT, student_id int, job_id int, app_status varchar(20) , FOREIGN KEY (student_id) REFERENCES Student(id), FOREIGN KEY (job_id) REFERENCES JobProfile(id));
 ALTER TABLE application AUTO_INCREMENT=3000;  
     insert into application( student_id , job_id , app_status) values ( 1000, 9000,'offered');
     insert into application( student_id , job_id , app_status) values ( 1001, 9001,'offered');
