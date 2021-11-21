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
    ('CB.EN.U4EEE18001','aakashkrish2323@gmail.com','akash','Aakash Krishna R','2001-03-23','M','638482534','No.1119, 2nd Floor, Westend Colony, AnnaNagar west, Chennai',7,2022,'EEE','A',FALSE),
	('CB.EN.U4MEC18001','abhiiniit2@gmail.com','abhi','Abhi Suwetha B','2001-05-06','F','803842633','A-6, Cup Street, Block-12, Neyveli',7,2022,'MEC','A',TRUE),
    ('CB.EN.U4ECE18001','sudhamshakula6@gmail.com','sudhamshu','Akula Sudhamshu','2001-10-15','M','994996474','7-1-324, Yashodha Krishna hospital, MankammaThota, karimnagar, Telangana',7,2022,'ECE','A',FALSE),
    ('CB.EN.U4CSE18010','nikhilsai1376@gmail.com','nikhil','Bandi Sai Nikhil Reddy','2001-03-15','M','977442167','H.No: 80-131-92-19, Housing Board Colony, Abbas Nagar, Kurnool',7,2022,'CSE','A',FALSE),
	('CB.EN.U4EEE18019','haran465@gmail.com','haran','Hariharan B','2000-08-25','M','489768715','11/12, GajaPriya House, Alpha Nagar Extension, Karumandapam, Trichy',7,2022,'EEE','A',TRUE),
    ('CB.EN.U4CSE18049','sia@gmail.com','sia','Sia','2001-10-15','F','837619928','Vivekananda Nagar, Hyderabad',7,2022,'CSE','A',FALSE);

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

INSERT INTO Announcements(title, content, date_time, postedBy, attachedDoc) VALUES
	('Payoda 2022 Graduates',
    'Dear Students,<br>
	Please find the requirement from Payoda for 2022 batch.<br>
	Eligibility: BTech CSE, ECE, EEE, EIE and MSc Applied statistics & Data Analytics<br>
    Criteria:<br>
	1. 75% & above in 10th & 12th & above in Degree without standing arrears<br>
	2. Streams: Circuit Branches (CSE, IT, ECE, MSc IT & MSc Software Engineering)<br>
    Job Role:<br>
	3. Associate Software Engineer (Will be hiring under Payoda Technologies Pvt  Ltd)<br>
	Compensation: 4.5 LPA<br><br>
	Note :<br>
    1. During Internship/Trainee the stipend would be paid as  Rs10k (Based on the requirements, we will reach out to the selected candidates for internship opportunities)<br>
	2. Duration of Intern/Trainee: 6 months/3 months (The duration is subjected to change basis requirement & performance of the intern/trainee)
	<br><br>
    Students who are eligible & interested should register on or before 25th Oct 2021, 1 pm : https://forms.gle/G9oaYMS6wr5RNWRw8<br>
	Regards,<br>
	Srikanth<br>
	Joint Director, Placement<br>
	Amrita Vishwa Vidyapeetham<br>', '2021-10-21 22:21:18', 2002, 8001);


INSERT INTO Announcements(title, content, date_time, postedBy, attachedDoc) VALUES
	('Afford Medical Technologies for 2022 batch  ',
    'Dear Students,<br>
	Eligibility Criteria - B.Tech/B.E (CS/IT or comparable streams/specialisations) Gap year after 12th class is not a problem<br>
    Hiring Process: Resume + Github based shortlisting followed by coding test and minimum 2 technical interviews<br>
	Internship Duration - 6 months to 1 year subject to college/university norms Stipend - 15,000 per month<br>
	Compensation: <br>
    CTC for full time employment - Rs. 5,67,000(Salary + Bonus + Employers PF Contribution) + 3 Lakhs Medical Insurance Cover<br>
	Monthly Fixed Pay - 42,000<br>
	Bond or Service Agreement if any - No Bond. Conversion to Full Time Role is subject to performance during the internship
    Students who are eligible & interested should register :  https://forms.gle/8VtLcc6qgQFbmMrs58<br>
	Regards,<br>
	Srikanth<br>
	Joint Director, Placement<br>
	Amrita Vishwa Vidyapeetham<br>', '2021-11-15 16:00:00', 2001, 8001);


INSERT INTO Announcements(title, content, date_time, postedBy, attachedDoc) VALUES
	('HashedIn By Deloitte for 2022 batch  ',
    'Dear Students,<br>
    Please find attached the requirements from Hashedhin. Eligible students may register in the given below link on or before 17th Nov 2.00.p.m.<br>
    Dear Team, Greetings from HashedIn by Deloitte! Hope you are safe and doing good. We will be having virtual campus hiring drive again for 2022 batch for multiple roles with HashedIn by Deloitte. Hence, we will need your support to pick the best students from your campus.<br>
    Eligibility: B.E/B.Tech, MCA, M. E/MTech, (CS, IT, IS,) ECE,EEE with no active backlogs with 60% or 6.0 CGPA in B.Tech/ M.Tech/ MCA<br>
	Note:<br>
    1.Intern (6 Months) + Software Engineer will start immediately and Intern (6 Months) + Integration Engineer will start from end of November.<br>
    2.We are looking forward to starting our virtual campus hiring process from your campus.<br>
	Compensation: <br>
    Criteria Intern (6 Months) + Software Engineer INR 25,000 per month INR 8.1 LPA<br>
    Students who are eligible & interested should register : https://forms.gle/TQLDvu9rnmNMGUrw6<br>
	Regards,<br>
	Srikanth<br>
	Joint Director, Placement<br>
	Amrita Vishwa Vidyapeetham<br>', '2021-11-13 17:30:00', 2003, 8001);


INSERT INTO Announcements(title, content, date_time, postedBy, attachedDoc) VALUES
	('CRMantra for BTech 2022 batch',
    'Dear Students,<br>
    Please find the job requirement from CRMantra for BTech 2022 batch<br>
    Eligibility: BTech - CSE,ECE,EEE,EIE with 6 CGPA and above<br>
	Note:<br>
    1.Internship Stipend :  25K <br>
    2.Note : There will be assessment during the internship period which all the selects have to seriously undertake and clear.<br>
	Compesation:3.5 LPA (Upon Successful conversion of internship)<br>
    Students who are eligible & interested should register by EOD : hhttps://forms.gle/77CYSbLZg5mt5M9X6<br>
	Regards,<br>
	Srikanth<br>
	Joint Director, Placement<br>
	Amrita Vishwa Vidyapeetham<br>', '2021-11-21 13:00:00', 2001, 8001);


    INSERT INTO Announcements(title, content, date_time, postedBy, attachedDoc) VALUES
	('Campus Hiring || Thryve Digital || 2022 Batch',
    'Dear Students,<br>
    Please find the job requirement from Thryve Digital for BTech (CSE) -  2022 batch<br>
    Eligibility Criteria:    B.Tech in CSE<br>
    Job Title: Software Engineer Trainee<br>
	Job Type: Internship & FTE (Candidates successfully completing internship will be converted to Full Time)<br>
	Job Location: Chennai / Hyderabad<br><br>
    Academic Percentage: 50% through out in 10th & 12th (or diploma) , 70% throughout in graduation<br>
    Internship Stipend: INR 15,000 /per month<br>
	Compensation:  7 LPA ( 6 LPA is fixed ; 1 LPA is variable pay)<br>
   Students who are eligible & interested should register on or before 17th Nov 2021, 10 am : https://forms.gle/ZEkSLMfm6Rq8Dnu3A<br>
	Regards,<br>
	Srikanth<br>
	Joint Director, Placement<br>
	Amrita Vishwa Vidyapeetham<br>', '2021-11-16 12:00:00', 2003, 8001);


     INSERT INTO Announcements(title, content, date_time, postedBy, attachedDoc) VALUES
	('Tata Elxsi - 2022 Batch',
    'Dear Students,<br>
    Please find the opportunity from Tata Elxsi. Unplaced students can register with the below link latest by 20 October 10:00AM.<br>
    Eligibility Criteria: Minimum 60% agg in 10th, 10+2, BE/BTech and ME/MTech or MCA with no backlogs and only 2022 Batch.<br>
    Specialisation: CSE, EEE, ECE, Instrumentation, Information Science, Embedded, Cyber Security, Data Science, Artificial Intelligence & Machine Learning, Automotive Electronics, Applied Electronics, Mechatronics, Computer Applications.<br>
    Work location: Trivandrum, Bangalore, Chennai, Pune and Hyderabad (in the order of hiring priorities)<br>
	Form: https://forms.office.com/Pages/ResponsePage.aspx?id=3TlqrbaWaEOC2vLsTZLiasrTo-reirRGt6-_6LOUlmdUMk8wRzRDSUdEUE9DWlFTMjJNSlBYNFk2SS4u
<br>
	Regards,<br>
	Srikanth<br>
	Joint Director, Placement<br>
	Amrita Vishwa Vidyapeetham<br>', '2021-10-19 10:00:00', 2003, 8001);



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



SELECT * FROM activities WHERE studentId=1000 ORDER BY date_time DESC;
-- drop table activities;

/****************************************************************
job profile
****************************************************************/

CREATE TABLE JobProfile(id INT PRIMARY KEY AUTO_INCREMENT,
 title VARCHAR(100),
 descriptions VARCHAR(10000),
 type_int_fte VARCHAR(10),
 CTC DECIMAL,
 organizations VARCHAR(50),
 location VARCHAR(40),
 end_date DATE,
 posted_on DATE,
 depts VARCHAR(10),
 YOG INT NOT NULL,
 minimum_cgpa DECIMAL NOT NULL,
 gender VARCHAR(10) NOT NULL,
 postedby INT,
 attached_doc INT,
 FOREIGN KEY (attached_doc) REFERENCES Documents(id), FOREIGN KEY (postedby) REFERENCES Coordinator(id) );


ALTER TABLE JobProfile AUTO_INCREMENT=9000;
INSERT INTO JobProfile(title,descriptions,type_int_fte,CTC,organizations,location,end_date,posted_on,depts,YOG,minimum_cgpa,gender,postedby,attached_doc ) VALUES
('Amazon SDE','Knowledge of professional software engineering best practices for the full software development life cycle, including coding standards,testing.','FTE',14,'Amazon','Pune','2021-11-20','2021-08-03','CSE,ECE',2022,8,'ALL',2000,8000),
('Data Engineer','SKILLS:Strong fundamentals on Data Structures and Algorithms,Basic understanding of AWS,Good understanding of SQL ,Programming knowledge on C/Python/Java ','FTE',6,'Knowledge Lens','Banglore','2021-11-10','2021-10-28','B.Tech',2022,8,'ALL',2000,8001),
('Microsoft SDE', 'Looking for SDE role','FTE',30,'Microsoft','Hyderabad','2021-07-13','2021-07-20','CSE', 2022, 8, 'ALL', 2001, 8001);

SELECT * FROM jobprofile ORDER BY end_date DESC;


/*****************************************************************
interviews
******************************************************************/
CREATE TABLE interviews(id INT PRIMARY KEY AUTO_INCREMENT,
                       student_id INT,
                       job_id INT,
                       ondate DATE,
                       ontime TIME,
                       interview_status VARCHAR(20) ,
                       FOREIGN KEY (student_id) REFERENCES Student(id),
                       FOREIGN KEY (job_id) REFERENCES JobProfile(id));
ALTER TABLE interviews AUTO_INCREMENT=5000;
INSERT INTO interviews( student_id , job_id , ondate, ontime, interview_status) VALUES( 1000,9000 ,'2021-10-29', '10:30:00','Completed');
INSERT INTO interviews( student_id , job_id , ondate, ontime, interview_status) VALUES( 1001,9001,'2021-10-31', '11:30:00','Pending');

/*****************************************************************
applications
******************************************************************/

 create table application(id int primary key AUTO_INCREMENT, student_id int, job_id int, app_status varchar(20) DEFAULT 'Inprogress',applied_on DATETIME ,applicant_review LONGTEXT, FOREIGN KEY (student_id) REFERENCES Student(id), FOREIGN KEY (job_id) REFERENCES JobProfile(id));
 ALTER TABLE application AUTO_INCREMENT=3000;

INSERT INTO application( student_id , job_id) VALUES ( 1000, 9000);
INSERT INTO application( student_id , job_id) VALUES ( 1001, 9000);
INSERT INTO application( student_id , job_id) VALUES ( 1002, 9000);
INSERT INTO application( student_id , job_id) VALUES ( 1003, 9001);
INSERT INTO application( student_id , job_id) VALUES ( 1004, 9001);
INSERT INTO application( student_id , job_id) VALUES ( 1005, 9001);
INSERT INTO application( student_id , job_id) VALUES ( 1006, 9002);
INSERT INTO application( student_id , job_id) VALUES ( 1007, 9002);
INSERT INTO application( student_id , job_id) VALUES ( 1008, 9002);
update application set app_status="Completed" where student_id=1006;
select * from application;