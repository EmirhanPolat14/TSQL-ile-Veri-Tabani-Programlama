SELECT * FROM LAB_PLAYER
SELECT * FROM LAB_MATCH_PLAYER

ALTER FUNCTION DBO.CURRENTEAM(@ID INT)
RETURNS VARCHAR(50)
AS
BEGIN 
	DECLARE @RESULT AS VARCHAR(50)
	SELECT TOP 1 @RESULT=TEAM FROM LAB_MATCH_PLAYER WHERE PLAYERID=@ID ORDER BY  DATE_ DESC
	RETURN @RESULT
END

CREATE FUNCTION DBO.TEAMCOUNT(@ID INT)
RETURNS INT
AS
BEGIN
	DECLARE @RESULT AS SMALLINT
	SELECT @RESULT=COUNT(DISTINCT TEAM) FROM LAB_MATCH_PLAYER WHERE PLAYERID=@ID
	RETURN @RESULT
END

CREATE FUNCTION DBO.TOTALMATCH(@ID INT)
RETURNS INT
AS
BEGIN
	DECLARE @RESULT AS SMALLINT
	SELECT @RESULT=COUNT(ID) FROM LAB_MATCH_PLAYER WHERE PLAYERID=@ID
	RETURN @RESULT
END

CREATE FUNCTION DBO.TOTALYEAR(@ID INT)
RETURNS INT
AS
BEGIN
	DECLARE @DATE1 AS DATE
	DECLARE @DATE2 AS DATE
	DECLARE @RESULT AS INT

	SELECT TOP 1 @DATE1=DATE_ FROM LAB_MATCH_PLAYER WHERE PLAYERID=@ID ORDER BY  DATE_ DESC
	SELECT TOP 1 @DATE2=DATE_ FROM LAB_MATCH_PLAYER WHERE PLAYERID=@ID ORDER BY  DATE_ 
	
	SET @RESULT= DATEDIFF(YEAR, @DATE2, @DATE1)

	RETURN @RESULT

END

SELECT PLAYER_API_ID,PLAYER_NAME, 
dbo.CURRENTEAM(PLAYER_API_ID) CURRENTTEAM, dbo.TEAMCOUNT(PLAYER_API_ID) TEAMCOUNT, 
DBO.TOTALMATCH(PLAYER_API_ID) TOTALMATCH, DBO.TOTALYEAR(PLAYER_API_ID) TOTALYEAR
FROM LAB_PLAYER
ORDER BY 2

WHERE PLAYER_API_ID = 26166

