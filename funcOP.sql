USE [Practice]
GO

/****** Object:  UserDefinedFunction [dbo].[FetchStudentInDept]    Script Date: 07-04-2023 10:15:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[FetchStudentInDept] (@Dept nchar(25)) RETURNS TABLE AS
	RETURN (SELECT Name,Id FROM StudentDB WHERE @Dept=Dept);
GO


SELECT * FROM FetchStudentInDept('CSE');