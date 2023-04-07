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



--Try catch block create or alter procedure fetchTechnologies asbegin tryinsert into technologies values (8,'python')end trybegin catchdeclare @errorMessage varchar(255);set @errorMessage = 'Duplicate primary key value';print(@errorMessage);end catchcreate or alter procedure fetchTechnologies asinsert into technologies values (1,'python')exec fetchTechnologies;

/*
use EmployeeDetails;select * from dbo.EmployeeInfo;select * from dbo.ProjectDetails;select * from dbo.EmployeeSalary;--insert into dbo.EmployeeSalary Values(2,16000,2000);insert into dbo.ProjectDetails Values(101,2,'Intern','6Months');--select @EmployeeName=Name from dbo.EmployeeInfo where-- @EmployeeListNames EmployeeList readonly Outputcreate procedure FetchEmployeeBasedOnProjectId @id int,@EmployeeName nchar(20) Output asselect @EmployeeName=Name from dbo.EmployeeInfo where id=(Select EmployeeId from dbo.ProjectDetails where ProjectID=@id) alter procedure FetchEmployeeBasedOnProjectId @id int asselect Name,id from dbo.EmployeeInfo where id in (select EmployeeId from dbo.ProjectDetails where ProjectID=@id)--(Select @EmployeeIds = ISNULL(@EmployeeIds + ',', '') + CAST(EmployeeId AS VARCHAR(5)) from dbo.ProjectDetails where ProjectID=@id)declare @OutputEmployeeListNames EmployeeList;insert into @OutputEmployeeListNamesexec FetchEmployeeBasedOnProjectId 101;Select * from @OutputEmployeeListNames;create Type EmployeeList as table (EmployeeName nchar(20),id int) declare @EmployeeName nchar(20);exec FetchEmployeeBasedOnProjectId 101;print(@EmployeeName);declare @EmployeeIds varchar(100);exec FetchEmployeeBasedOnProjectId 101,@EmployeeIds Output;print(@EmployeeIds);declare @@EmployeeListNamesalter procedure FetchEmployeeBasedOnProjectId @id int ,@EmployeeListNames table(id int,Name nchar(20)) Output  asinsert into @EmployeeListNames select Name,id from dbo.EmployeeInfo where id in (select EmployeeId from dbo.ProjectDetails where ProjectID=@id)
*/