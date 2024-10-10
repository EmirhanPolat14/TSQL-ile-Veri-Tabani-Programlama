use LAB_UDF


CREATE FUNCTION DBO.GETAGEGROUP(@BIRTHDATE AS DATE)
RETURNS VARCHAR(25)
AS
BEGIN
	DECLARE @AGE AS INT
	DECLARE @RESULT AS VARCHAR(25)
	SET @AGE = dbo.GETAGE(@BIRTHDATE)
	
	SET @RESULT = CASE
		WHEN @AGE BETWEEN 20 AND 30 THEN  '20-30 YA� ARASI'
		WHEN @AGE BETWEEN 30 AND 40 THEN '30-40 YA� ARASI'
		ELSE '40 TAN B�Y�K'
	END

	RETURN @RESULT
END

SELECT *, dbo.GETAGE(BIRTHDATE) AGE, dbo.GETAGEGROUP(BIRTHDATE) AGEGROUP FROM LAB_PLAYER
WHERE dbo.GETAGE(BIRTHDATE) = 40