--Single return type
CREATE FUNCTION FetchStudentCountInDept (@Dept nchar(25)) RETURNS int AS
BEGIN
	RETURN (SELECT COUNT(id) FROM StudentDB WHERE @Dept=Dept)
END;

PRINT dbo.FetchStudentCountInDept ('Mech');
GO

--Returning the table as return type
CREATE FUNCTION FetchStudentInDept (@Dept nchar(25)) RETURNS TABLE AS
	RETURN (SELECT Name,Id FROM StudentDB WHERE @Dept=Dept);

SELECT * FROM dbo.FetchStudentInDept('Mech');
GO

--Inserting the values into the table 
CREATE FUNCTION FetchStudentInDeptTable (@Dept nchar(25)) RETURNS @T TABLE (Name nchar(25), Id int) 
AS
BEGIN
	Insert into @T SELECT Name,Id FROM StudentDB WHERE @Dept=Dept
	RETURN;
END;
SELECT * FROM dbo.FetchStudentInDeptTable('CSE');
GO

--Manipulation of data is also done in function and saving and returning the table

CREATE OR ALTER FUNCTION EmployeeIncrement (@Location nchar(25), @Position nchar(20)) RETURNS @T TABLE (EmployeeName nchar(25), EmployeeId int, BaseLocation nchar(20), IncrementedSalary  float) 
AS
BEGIN
	DECLARE @Increment float=0.10;
	DECLARE @NewLocation nchar(15)='Mumbai';
	Insert into @T  SELECT EmployeeName,EmployeeId,CONCAT_WS(' New: ',TRIM(Location),TRIM( @NewLocation)),Salary+(Salary*@Increment) FROM dbo.EmployeeDetails WHERE @Location=Location And @Position=Position
	RETURN;
END;

SELECT * FROM EmployeeDetails WHERE Location='Chennai' AND Position = 'Asst.Prof';
SELECT * FROM dbo.EmployeeIncrement('Chennai','Asst.Prof');
GO




/*
USE [practiceDB];
*/