ALTER PROC SP_SEARCH
@BEGDATE AS DATETIME,
@ENDATE AS DATETIME, 
@STRTOSEARCH AS VARCHAR(200)
AS
DECLARE @USERNAME_	AS VARCHAR(50)
DECLARE @PROCNAME AS VARCHAR(100)='SP_SEARCH'	
DECLARE @PARAMETERS	AS VARCHAR(250)
DECLARE @PBEGDATE AS DATETIME
DECLARE @PENDATE	AS DATETIME
DECLARE @DURATION AS INT

SET @USERNAME_ = SUSER_NAME()
SET @PARAMETERS = CONCAT('@BEGDATE:',CONVERT(VARCHAR,@BEGDATE,104),' ','ENDATE:',CONVERT(VARCHAR,@ENDATE,104),' ','STRTOSTRING:',@STRTOSEARCH)
SET @PBEGDATE = GETDATE()

SELECT * FROM LAB_STACKOVERFLOW
WHERE Text LIKE '%'+ @STRTOSEARCH +'%'
AND CreationDate BETWEEN @BEGDATE AND @ENDATE

SET @PENDATE = GETDATE()
SET @DURATION = DATEDIFF(SECOND,@BEGDATE,@ENDATE)

INSERT INTO PROCEDURE_EXACUTION_LOG
(USERNAME_, PROCNAME, PARAMETERS, BEGDATE, ENDATE, DURATION)
VALUES
(@USERNAME_, @PROCNAME, @PARAMETERS, @PBEGDATE, @PENDATE, @DURATION)

EXEC SP_SEARCH @BEGDATE='20100101',@ENDATE='20101231',@STRTOSEARCH='Microsoft SQL Server'

select * FROM PROCEDURE_EXACUTION_LOG