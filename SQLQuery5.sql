--Adding the sports to the system
CREATE OR ALTER PROCEDURE AddSports @SportsId INT, @SportsName nchar(15)
AS
INSERT SPORTS VALUES(@SportsId,@SportsName);
GO

--Adding the tournament to the system
CREATE OR ALTER PROCEDURE AddTournament @TournamentId INT, @TournamentName nchar(15),@SportId int
AS
INSERT INTO TOURNAMENTLIST VALUES(@TournamentId,@TournamentName)
INSERT TOURNAMENT VALUES(@TournamentId,@TournamentName,@SportId);
GO

Select * from SPORTS  ORDER BY SportsId ASC;
Select * from TOURNAMENT;


--Removing the tournament based on tournamentid
CREATE OR ALTER PROCEDURE RemoveTournament @tournamentId INT 
AS
DELETE FROM TOURNAMENTLIST  WHERE TournamentId=@tournamentId;
GO
--Removing the sport based on sportsid
CREATE OR ALTER PROCEDURE RemoveSport @sportsId INT 
AS
DELETE FROM SPORTS  WHERE SportsId=@sportsId;
GO


/*
CREATE OR ALTER TRIGGER MARKSTRIGGER 
ON StudentMarks
AFTER INSERT
AS
INSERT INTO LOGS VALUES ((SELECT COUNT(*) FROM LOGS)+1, SYSDATETIME());

SELECT * FROM StudentMarks;

--WE ARE INSERTING THE VALUES TO STUDENTMARKS
INSERT INTO StudentMarks VALUES (29,'Mech', 105, 76.20,'n27@gmail.com');

--NOW IF WE SELECT THE THE VALUES TO DISPLAY WE CAN SEE THE ENTRY CREATED USING TRIGGER
select * fROM LOGS;
*/