DECLARE @ID AS INT
DECLARE @NAMESURNAME AS VARCHAR(100)
DECLARE @GENDER AS CHAR(1)
DECLARE @BIRTHDATE AS DATE
DECLARE @MSG AS VARCHAR(1000)


DECLARE CRS CURSOR FOR
	SELECT ID,NAMESURNAME,GENDER,BIRTHDATE FROM CUSTOMERS
	WHERE DATEPART(MONTH,BIRTHDATE) = DATEPART(MONTH, GETDATE())
	AND DATEPART(DAY, BIRTHDATE) = DATEPART(MONTH, GETDATE())
OPEN CRS
	FETCH NEXT FROM CRS INTO @ID,@NAMESURNAME,@GENDER,@BIRTHDATE
	WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @MSG = CONCAT_WS(' ', 'Say�n', @NAMESURNAME, IIF(@GENDER='K', 'Han�m;', 'Bey;'),CHAR(13)+ CONVERT(VARCHAR, DATEDIFF(YEAR,@BIRTHDATE,GETDATE()))+'.', 'ya��n�z� kutlar, sa�l�kl� �m�rler dileriz.')
			PRINT @MSG
			FETCH NEXT FROM CRS INTO @ID,@NAMESURNAME,@GENDER,@BIRTHDATE
		END
CLOSE CRS
DEALLOCATE CRS
