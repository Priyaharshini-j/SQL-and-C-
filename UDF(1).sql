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
USE [practiceDB];SELECT * FROM StudentTable;SELECT * FROM DeptInfo;SELECT* FROM Employee;CREATE TYPE EmployeTableType AS TABLE (id int, name nchar(50), baseLocation nchar(50));CREATE OR ALTER FUNCTION fetchEmployee (@location nchar(50)) RETURNS TABLE AS return (SELECT id, name, baseLocation FROM Employee WHERE baseLocation = @location);CREATE OR ALTER FUNCTION fetchEmployeeTable (@location nchar(50)) RETURNS TABLE AS return (SELECT id, name, baseLocation FROM Employee WHERE baseLocation = @location);CREATE OR ALTER FUNCTION fetchEmployeeTableUsingTableType (@location nchar(50)) RETURNS @tableType TABLE (empID int, empName nchar(50), empLocation nchar(50))ASBEGIN	INSERT INTO @tableType SELECT id, name, baseLocation FROM Employee WHERE baseLocation = @location;	return;ENDSELECT * FROM Employee WHERE baseLocation = 'New York';SELECT * FROM dbo.fetchEmployeeTable('New York');PRINT substring('New York', 5, 2);SELECT * FROM dbo.fetchEmployeeTableUsingTableType('New York');-------------------------------------------------------------------------------------------------CREATE OR ALTER FUNCTION increaseSalary (@location nchar(50)) RETURNS @tableType TABLE (empID int, empName nchar(50), empLocation nchar(50), increasedSalary float)ASBEGIN	DECLARE @temp nchar(50) = 'India';	DECLARE @percentage float = 0.1;	INSERT INTO @tableType SELECT id, name, CONCAT(baseLocation, @temp), salary + (salary * @percentage) FROM Employee WHERE baseLocation = @location;	return;ENDSELECT * FROM Employee WHERE baseLocation = 'New York';SELECT * FROM dbo.increaseSalary('New York');CREATE OR ALTER PROCEDURE callingFunc @location nchar(50) ASBEGIN	SELECT * FROM dbo.increaseSalary(@location);ENDEXEC callingFunc 'New York';
*/