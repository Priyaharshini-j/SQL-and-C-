USE Practice;

INSERT INTO dbo.StudentDB VALUES (3,'Name1','Civil',21, 2000-01-05, 'n1@gmail.com');
INSERT INTO dbo.StudentDB VALUES (4,'Name2','CSE',20, 2000-05-4, 'n2@gmail.com');
INSERT INTO dbo.StudentDB VALUES (5,'Name3','ECE',21, 2000-09-29, 'n3@gmail.com');
INSERT INTO dbo.StudentDB VALUES (6,'Name4','EEE',22, 2000-03-7, 'n4@gmail.com');
INSERT INTO dbo.StudentDB VALUES (7,'Name5','MECH',21, 2000-08-19, 'n5@gmail.com');
INSERT INTO dbo.StudentDB VALUES (8,'Name6','Civil',20, 2000-12-8, 'n6@gmail.com');
INSERT INTO dbo.StudentDB VALUES (9,'Name7','CSE',21, 2000-01-05, 'n7@gmail.com');
INSERT INTO dbo.StudentDB VALUES (10,'Name8','EEE',22, 2000-01-05, 'n8@gmail.com');
INSERT INTO dbo.StudentDB VALUES (11,'Name9','MECH',22, 2000-01-05, 'n9@gmail.com');

ALTER TABLE dbo.StudentDB ADD UNIQUE(Id,Email);


CREATE TABLE DeptMaster(DeptId int Primary Key , DeptName nchar(25) NOT NULL, DeptHod nchar(30) );

INSERT INTO DeptMaster Values(101, 'CIVIL','Hod1');
INSERT INTO DeptMaster Values(102,'CSE','Hod2');
INSERT INTO DeptMaster Values(103, 'ECE','Hod3');
INSERT INTO DeptMaster Values(104,'EEE','Hod4');
INSERT INTO DeptMaster Values(105,'IT','Hod5');
INSERT INTO DeptMaster Values(106,'MECH','Hod6');

UPDATE dbo.EmployeeDetails SET DeptId=101 WHERE Dept='CIVIL';
UPDATE dbo.EmployeeDetails SET DeptId=102 WHERE Dept='CSE';
UPDATE dbo.EmployeeDetails SET DeptId=103 WHERE Dept='ECE';
UPDATE dbo.EmployeeDetails SET DeptId=104 WHERE Dept='EEE';
UPDATE dbo.EmployeeDetails SET DeptId=105 WHERE Dept='IT';
UPDATE dbo.EmployeeDetails SET DeptId=106 WHERE Dept='MECH';

UPDATE dbo.EmployeeDetails SET Position='Asst.Prof' WHERE Position='Asst.Prof2'

ALTER TABLE EmployeeDetails ADD FOREIGN KEY (DeptId) REFERENCES dbo.DeptMaster.DeptId;


ALTER TABLE dbo.EmployeeDetails 

SELECT * FROM DeptMaster;
SELECT * FROM EmployeeDetails;
SELECT * FROM StudentDB;