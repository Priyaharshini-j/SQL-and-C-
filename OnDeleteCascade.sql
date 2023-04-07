
--CREATING A TABLE WHERE IT IS A CHILD TABLE OF Employee
CREATE TABLE EMPATTENDANCE (
empId int Foreign Key references EmployeeDetails (EmployeeId) ON DELETE CASCADE,-- ON DELETE CASCADE IS THE KEYWORD TO PERFORM THIS
days int
);

INSERT INTO EMPATTENDANCE values (1006,876);
INSERT INTO EMPATTENDANCE values (1003,876);
INSERT INTO EMPATTENDANCE values (1007,876);

SELECT * FROM EMPATTENDANCE;
SELECT * FROM EmployeeDetails;
--WHEN WE DELETE IN EMPLOYEE TABLE IT GET DELETED IN CHILD TABLE TOO
DELETE FROM EmployeeDetails WHERE EmployeeId=1006;
SELECT * FROM EmployeeDetails;
--DISPLAYING THE RESULT OF CHILD TABLE
SELECT * FROM EMPATTENDANCE;