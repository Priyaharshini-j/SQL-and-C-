USE Practice;

CREATE TABLE StudentMarks (
StudentId int Primary Key, Dept nchar(25) NOT NULL, DeptId int NOT NULL, IAT1 float, Email nchar(60) UNIQUE NOT NULL 
);

ALTER TABLE dbo.DeptMaster ADD CONSTRAINT UQ_DeptName UNIQUE (DeptName);
ALTER TABLE dbo.StudentMarks ADD CONSTRAINT UQ_Email UNIQUE (Email);
ALTER TABLE dbo.StudentMarks ADD CONSTRAINT FK_Dept FOREIGN KEY (Dept) REFERENCES dbo.DeptMaster(DeptName);
ALTER TABLE dbo.StudentMarks ADD CONSTRAINT FK_DeptId FOREIGN KEY (DeptId) REFERENCES dbo.DeptMaster(DeptId);

INSERT INTO dbo.StudentMarks VALUES(1,'IT',105,87.89, 'priyadj2001@gmail.com');
INSERT INTO dbo.StudentMarks VALUES(4,'CSE',102,89, 'n2@gmail.com');
INSERT INTO dbo.StudentMarks VALUES(5,'ECE',103,95.64, 'n3@gmail.com');
INSERT INTO dbo.StudentMarks VALUES(8,'Civil',101,80.89, 'n6@gmail.com');
INSERT INTO dbo.StudentMarks VALUES(9,'CSE',102,81.25, 'n7@gmail.com');

-- These data are not in StudentDB
INSERT INTO dbo.StudentMarks VALUES(21,'CSE',102,78.296, 'n19@gmail.com');
INSERT INTO dbo.StudentMarks VALUES(25,'MECH',105,59.24, 'n23@gmail.com');
INSERT INTO dbo.StudentMarks VALUES(27,'EEE',104,81.25, 'n25@gmail.com');




--INNER JOIN

SELECT db1.Name, db2.IAT1 FROM dbo.StudentDB db1 INNER JOIN dbo.StudentMarks db2 ON db1.Id=db2.StudentId;

--LEFT OUTER JOIN
SELECT db1.Name, db2.IAT1 FROM dbo.StudentDB db1 LEFT OUTER JOIN dbo.StudentMarks db2 ON db1.Id=db2.StudentId;

--RIGHT OUTER JOIN
SELECT db1.Name, db2.IAT1 FROM dbo.StudentDB db1 RIGHT OUTER JOIN dbo.StudentMarks db2 ON db1.Id=db2.StudentId;

--FULL OUTER JOIN
SELECT db1.Name, db2.IAT1 FROM dbo.StudentDB db1 FULL OUTER JOIN dbo.StudentMarks db2 ON db1.Id=db2.StudentId;


SELECT * FROM StudentMarks;
SELECT * FROM DeptMaster;
SELECT * FROM EmployeeDetails;

CREATE PROCEDURE FetchEmpDetails  AS 
SELECT * FROM EmployeeDetails 

