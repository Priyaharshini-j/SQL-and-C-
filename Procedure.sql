USE [Practice]
GO
/****** Object:  StoredProcedure [dbo].[FetchEmpDetails]    Script Date: 04-04-2023 14:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[FetchEmpDetails] @EmpLocation nchar(25), @HoD nchar(30)
AS 
SELECT e.EmployeeName, d.DeptName, e.Salary, e.Location 
FROM EmployeeDetails e, DeptMaster d  
WHERE e.DeptId=d.DeptId AND e.Location=@EmpLocation AND d.DeptHod=@HoD;