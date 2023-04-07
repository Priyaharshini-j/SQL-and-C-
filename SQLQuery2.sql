ALTER TABLE dbo.EmployeeDetails ADD Location nchar(30) NULL;

INSERT INTO dbo.EmployeeDetails VALUES (1004,'efg',104, 'CSE',73478, 'Prof', 'Madurai');
INSERT INTO dbo.EmployeeDetails VALUES (1004,'gthtj',104, 'CSE',7348.78, 'Prof', 'Madurai');
INSERT INTO dbo.EmployeeDetails VALUES (1005, 'ighnu', 106, 'MECH', 79450.55,'Asso.Prof','Chennai');
INSERT INTO dbo.EmployeeDetails VALUES (1006,'bhi',103, 'EEE',73478.87, 'Prof', 'Banglore');
INSERT INTO dbo.EmployeeDetails VALUES (1007,'jagu',106, 'CIVIL',73478.35, 'Prof', 'Banglore');
INSERT INTO dbo.EmployeeDetails VALUES (1008,'Sar',102,'EEE',78086,'Asst.Prof','Chennai');
INSERT INTO dbo.EmployeeDetails VALUES (1009,'Prb',104, 'IT',732428, 'Prof', 'Coimbatore');
INSERT INTO dbo.EmployeeDetails VALUES (1010,'efg',103, 'CSE',73348, 'Prof', 'Chennai');
INSERT INTO dbo.EmployeeDetails VALUES (1011,'sfsf',105, 'CIVIL',734238.78, 'Asso.Prof', 'Madurai');
INSERT INTO dbo.EmployeeDetails VALUES (1012, 'ighnu', 106, 'MECH', 79450.55,'Asso.Prof','Chennai');
INSERT INTO dbo.EmployeeDetails VALUES (1013,'bhi',103, 'EEE',73478.87, 'Prof', 'Banglore');
INSERT INTO dbo.EmployeeDetails VALUES (1014,'jagu',106, 'CIVIL',73478.35, 'Prof', 'Banglore');
INSERT INTO dbo.EmployeeDetails VALUES (1015,'Sar',102,'EEE',78086,'Asst.Prof','Chennai');
INSERT INTO dbo.EmployeeDetails VALUES (1016,'Prb',104, 'IT',732428, 'Prof', 'Coimbatore');

UPDATE dbo.EmployeeDetails SET EmployeeId=1017 WHERE EmployeeName='gthtj';

UPDATE dbo.EmployeeDetails SET Location='Chennai' WHERE [EmployeeId] =1001;
UPDATE dbo.EmployeeDetails SET Location='Coimbatore' WHERE [EmployeeId] =1002;
UPDATE dbo.EmployeeDetails SET Location='Banglore' WHERE [EmployeeId] =1003;

ALTER TABLE dbo.EmployeeDetails ADD CONSTRAINT PK_EMPID PRIMARY KEY (EmployeeID);

CREATE TABLE DupEmployeeDetails (EmployeeId int PRIMARY KEY NOT NULL, EmployeeName nchar(30), DeptID int NOT NULL, Dept nchar(25) NOT NULL, Salary Float, Position nchar(25), Location nchar(30) );

INSERT INTO dbo.DupEmployeeDetails VALUES (1014,'jagu',106, 'CIVIL',73478.35, 'Prof', 'Banglore');
INSERT INTO dbo.DupEmployeeDetails VALUES (1016,'Prb',104, 'IT',732428, 'Prof', 'Coimbatore');
INSERT INTO dbo.DupEmployeeDetails VALUES (1005, 'ighnu', 106, 'MECH', 79450.55,'Asso.Prof','Chennai');
INSERT INTO dbo.DupEmployeeDetails VALUES (1011,'sfsf',105, 'CIVIL',734238.78, 'Asso.Prof', NULL);
INSERT INTO dbo.DupEmployeeDetails VALUES (1019,'ssff',101, 'EEE',734238.78, 'Asso.Prof', 'Madurai');
INSERT INTO dbo.DupEmployeeDetails VALUES (1020,'sdvn',105, 'CIVIL',734238.78, 'Asso.Prof', 'Chennai');
INSERT INTO dbo.DupEmployeeDetails VALUES (1031,'sfcmf',102, 'ECE',723238.78, 'Asso.Prof', NULL);


UPDATE dbo.DupEmployeeDetails SET Salary=50000 WHERE Position='Asso.Prof';
UPDATE dbo.DupEmployeeDetails SET Salary=25000 WHERE Position='Prof';
UPDATE dbo.EmployeeDetails SET Salary=25000 WHERE Position='Prof';
UPDATE dbo.EmployeeDetails SET Salary=50000 WHERE Position='Asso.Prof';
UPDATE dbo.EmployeeDetails SET Salary=40000 WHERE Position='Asst.Prof';

SELECT * FROM EmployeeDetails INTERSECT (SELECT * FROM DupEmployeeDetails WHERE Salary>75000);
SELECT * FROM EmployeeDetails INTERSECT (SELECT * FROM DupEmployeeDetails);

SELECT * FROM EmployeeDetails UNION (SELECT * FROM DupEmployeeDetails WHERE Salary>75000);
SELECT * FROM EmployeeDetails UNION ALL (SELECT * FROM DupEmployeeDetails WHERE Salary>75000);

SELECT * FROM EmployeeDetails EXCEPT (SELECT * FROM DupEmployeeDetails WHERE  Location='Chennai');
SELECT * FROM EmployeeDetails EXCEPT (SELECT * FROM DupEmployeeDetails);

UPDATE dbo.DupEmployeeDetails SET DeptId=101 WHERE Dept='ECE';
UPDATE dbo.DupEmployeeDetails SET DeptId=102 WHERE Dept='EEE';
UPDATE dbo.DupEmployeeDetails SET DeptId=103 WHERE Dept='CSE';
UPDATE dbo.DupEmployeeDetails SET DeptId=104 WHERE Dept='IT';
UPDATE dbo.DupEmployeeDetails SET DeptId=105 WHERE Dept='MECH';
UPDATE dbo.DupEmployeeDetails SET DeptId=106 WHERE Dept='CIVIL';

UPDATE dbo.EmployeeDetails SET DeptId=101 WHERE Dept='ECE';
UPDATE dbo.EmployeeDetails SET DeptId=102 WHERE Dept='EEE';
UPDATE dbo.EmployeeDetails SET DeptId=103 WHERE Dept='CSE';
UPDATE dbo.EmployeeDetails SET DeptId=104 WHERE Dept='IT';
UPDATE dbo.EmployeeDetails SET DeptId=105 WHERE Dept='MECH';
UPDATE dbo.EmployeeDetails SET DeptId=106 WHERE Dept='CIVIL';


CREATE VIEW IT_Staff AS SELECT EmployeeId, EmployeeName, Dept,Location FROM EmployeeDetails WHERE DeptId=104;
SELECT * FROM IT_Staff;

ALTER VIEW IT_Staff SET Location='Chennai' WHERE EmployeeId=1016;


DROP VIEW IT_Staff;

SELECT * FROM [dbo].[EmployeeDetails];
SELECT * FROM dbo.DupEmployeeDetails;
SELECT * FROM DeptDetails;
