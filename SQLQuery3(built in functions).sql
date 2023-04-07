USE [Practice]
--NUMERIC FUNCTIONS
SELECT ABS(-1234);
SELECT 12%5;
SELECT FLOOR (1234.54);
SELECT CEILING (1234.54);
SELECT POWER(3,3);
SELECT ROUND(1245.58359779,-1);
SELECT ROUND(1245.58359779,2); -- SO its actually returning the nearest 10th Value 
SELECT ROUND(1245.58359779,0);
SELECT ROUND(1245.58359779,3,1);
SELECT ROUND(1245.5839779,3,1);

--DATE FUNCTIONS
SELECT CURRENT_TIMESTAMP;
SELECT DATEADD (DAY,1,'2023-04-04'); -- For Adding the number of day/month/year to the date we specified
SELECT DATEADD(HOUR, 3, CURRENT_TIMESTAMP);
SELECT DATEDIFF(DAY,'2023-04-04','2023-10-21');
SELECT DATEDIFF(SECOND, '1900-04-04 12:00:00','2023-04-04 11:59:59 ');
SELECT DATEDIFF_BIG(SECOND, '1900-04-04 12:00:00','2023-04-04 11:59:59 ');--This is used to calculate the big difference in the date eg. period of 100 year difference
SELECT DATEPART(HOUR,CURRENT_TIMESTAMP);

--STRING FUNCTIONS
SELECT CONCAT('HI!',' It ME');

SELECT CONCAT_WS(' HI!',' It ME','I am the PROBLEM'); -- In here it take the first arg to be added between arg2 and arg 3
SELECT CONCAT_WS('First Argument ',' Second Argument ',' THIRD ARGUMENT '); 
SELECT CONCAT(DeptID,DeptName) FROM DeptDetails ORDER BY DeptID ASC;
SELECT CONCAT(DeptID,DeptName,DeptHod) FROM DeptDetails ORDER BY DeptID ASC;

SELECT CONCAT(EmployeeDetails.EmployeeName,EmployeeDetails.Position) FROM EmployeeDetails Order BY EmployeeName ;
SELECT CONCAT(TRIM(EmployeeDetails.EmployeeName),' ',TRIM(EmployeeDetails.Position)) AS  EmployeePosition  FROM EmployeeDetails Order BY EmployeeName ;

SELECT REPLACE(EmployeeDetails.Location,'a','e') FROM EmployeeDetails; --TO replace specific char 
SELECT REPLACE('CAT','a','e') FROM EmployeeDetails;

SELECT REVERSE(EmployeeDetails.Location) FROM EmployeeDetails;

SELECT LTRIM('                      I am Using LTRIM Function                ~~~~~');-- Removes Left Spcae to put it simple
SELECT RTRIM('                      I am Using RTRIM Function~~~~~                   ');-- REmoves RIght space to put it simple

SELECT SUBSTRING('This is Fun to work with', 5, 10);-- 2 arg starting index 3rd arg interval if its like 10 so it takes the string at 5-15
SELECT SUBSTRING('This is Fun to work with', -1,10);
SELECT SUBSTRING('This is Fun to work with', 0,10);
SELECT SUBSTRING('This is Fun to work with', 10,100);

SELECT TRANSLATE('EVERYONE','E', 'A');-- here the replacing char should be of same size as the replaced char 
SELECT REPLACE('EVERYONE','E', 'A'); -- Incase of REPLACE we need not worry about the length of replacing and replaced string
SELECT TRANSLATE('EVERYVONE','EV', 'AL');-- but in this case it map each char to replaced char 'e' mapped to 'a' and  'v' mapped to 'l' 
SELECT REPLACE('EVERYVONE','EV', 'AL');

SELECT DISTINCT UPPER(EmployeeDetails.Location) FROM EmployeeDetails;

SELECT APPROX_COUNT_DISTINCT(EmployeeDetails.EmployeeName) FROM EmployeeDetails;
SELECT COUNT(EmployeeDetails.EmployeeName) FROM EmployeeDetails;

SELECT STR(468697.90897867,7,1);

SELECT RIGHT('THIS IS EPIC MOMENT',11); --this is same way as SUBSTRING but it takes the character from right side upto the limit we specified
SELECT LEFT('THIS IS EPIC MOMENT',12);--this is same way as RIGHT but it takes the character from left side upto the limit we specified

SELECT LEN('HIS IS EPIC MOMENT'); -- To return the length of the string
