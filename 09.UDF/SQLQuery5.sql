ALTER FUNCTION DBO.GETPLAYERINF(@ID AS INT)
RETURNS 
@RESULT TABLE 
(
	AGE SMALLINT, AGEGROUP VARCHAR(50),RATE SMALLINT,
	TOTALMATCH SMALLINT, BACKUPCOUNT SMALLINT, REALCOUNT SMALLINT,
	TEAMCOUNT SMALLINT, YEAREXP SMALLINT
)
AS
BEGIN
	INSERT INTO @RESULT
	SELECT DATEDIFF(YEAR, P.BIRTHDATE, GETDATE()) AGE, 
	CASE
		WHEN DATEDIFF(YEAR, P.BIRTHDATE, GETDATE()) BETWEEN 20 AND 30 THEN '20-30 YA� ARASI'
		WHEN DATEDIFF(YEAR, P.BIRTHDATE, GETDATE()) BETWEEN 30 AND 40 THEN '30-40 YA� ARASI'
		WHEN DATEDIFF(YEAR, P.BIRTHDATE, GETDATE()) BETWEEN 40 AND 50 THEN '40-50 YA� ARASI'
		WHEN DATEDIFF(YEAR, P.BIRTHDATE, GETDATE()) BETWEEN 50 AND 60 THEN '50-60 YA� ARASI'
	END AGEGROUP, P.RATING,
	(SELECT COUNT(ID) FROM LAB_MATCH_PLAYER WHERE PLAYERID=@ID) TOTALMATCH,
	(SELECT COUNT(ID) FROM LAB_MATCH_PLAYER WHERE PLAYERTYPE = 'BACKUP' AND PLAYERID=@ID) BACKUPCOUNT,
	(SELECT COUNT(ID) FROM LAB_MATCH_PLAYER WHERE PLAYERTYPE = 'REAL' AND PLAYERID=@ID) REALCOUNT,
	(SELECT COUNT(DISTINCT TEAM) FROM LAB_MATCH_PLAYER WHERE PLAYERID=@ID),
	(SELECT DATEDIFF(YEAR, MIN(DATE_), MAX(DATE_)) FROM LAB_MATCH_PLAYER WHERE PLAYERID=@ID) YEAREXP
	FROM LAB_PLAYER P
	WHERE @ID = P.PLAYER_API_ID


	
	RETURN 
END
GO

SELECT * FROM LAB_MATCH_PLAYER WHERE PLAYER_NAME LIKE '%KAR%BELH%'
SELECT * FROM LAB_PLAYER

SELECT P.PLAYER_NAME, P.BIRTHDATE, I.* FROM LAB_PLAYER P
CROSS APPLY DBO.GETPLAYERINF(P.PLAYER_API_ID) I