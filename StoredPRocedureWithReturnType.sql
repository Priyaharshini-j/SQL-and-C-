-- Displaying Employee details based on empid
ALTER PROCEDURE FetchEmpDetails @empId int 
AS
SELECT * FROM EmployeeDetails WHERE EmployeeId = @empId;


EXEC FetchEmpDetails 1009;
GO


--Removing the details based on empid and dept name
CREATE OR ALTER PROCEDURE RemoveEmp @empId INT , @dept nchar(25)
AS
DELETE FROM EmployeeDetails WHERE EmployeeId=@empId AND Dept=@dept;

EXEC RemoveEmp 1009,'IT';

SELECT * FROM EmployeeDetails;
GO


--Setting the defalut value to one of the paramater They can also pass their own value to the paramaeter too
CREATE OR ALTER PROCEDURE UpdateEmpSalary @empId int, @Salary float = 50000.00 ,@Position nchar(25)= 'Asso.Prof'
AS
UPDATE EmployeeDetails SET Salary=@Salary, Position=@Position WHERE EmployeeId=@empId;

EXEC UpdateEmpSalary 1004;
SELECT * FROM EmployeeDetails;
GO


-- SINGLE RETURN OUTPUT FROM THE STORED PROCEDURE FUNCTION
CREATE OR ALTER PROCEDURE FetchDeptName @DeptId int, @DeptName nchar(25) OUTPUT AS 
SELECT @DeptName=DeptName FROM dbo.DeptMaster 
WHERE DeptName=(SELECT DeptName FROM DeptMaster WHERE DeptId=@DeptId);

DECLARE @dName nchar(25);
EXEC FetchDeptName 103,@dName OUTPUT;
PRINT (@dName)
GO

--OUTPUT PARAMETER 
CREATE OR ALTER PROCEDURE FetchDeptEmployee @DeptId int, @EmployeeName nchar(25) OUTPUT AS 
(SELECT @EmployeeName = ISNULL(CONCAT(@EmployeeName,',') , ' ')+ CAST(EmployeeName as varchar(25)) FROM EmployeeDetails 
WHERE DeptId=@DeptId);

DECLARE @EmpName nchar(30);
EXEC FetchDeptEmployee 104, @EmpName OUTPUT;
PRINT (TRIM(@EmpName));
GO


--Stored Procedure to another procedure
SELECT * FROM StudentDB;
-- Stored procedure to add student details
CREATE OR ALTER PROCEDURE InsertStudent @id int, @name nchar(25), @dept nchar(25), @age int, @DoB datetime, @email nchar(60) 
AS
INSERT INTO StudentDB VALUES (@id , @name , @dept , @age, @DoB , @email  );
-- I have created a stored procedure in which it call another stored procedure InsertStudent by placing the values to other
CREATE or ALTER PROCEDURE CallInsertStudent @id int, @name nchar(25), @dept nchar(25) 
AS
DECLARE @DoB datetime, @age int, @email nchar(60)
SET @DoB='2002-09-08' SET @age=20 SET @email='n10@gmail.com';
EXEC InsertStudent @id , @name , @dept , @age, @DoB , @email -- this is the line to call another procedure

--triggering this procedure to call other procedure too
EXEC CallInsertStudent 12,'Name10', 'Civil';

SELECT * FROM StudentDB;
GO



--Try catch block 

/*
use EmployeeDetails;
*/