DECLARE @PLATE AS VARCHAR(100)='34%'
DECLARE @COLOR AS VARCHAR(100)=''
DECLARE @TITLE AS VARCHAR(100)=''
DECLARE @BRAND AS VARCHAR(100)=''
DECLARE @LICENDATE1 AS DATE
DECLARE @LICENDATE2 AS DATE

IF @PLATE=''
	SET @PLATE='%'
IF @COLOR=''
	SET @COLOR='%'
IF @TITLE=''
	SET @TITLE='%'
IF @BRAND=''
	SET @BRAND='%'

SELECT * FROM LAB01
WHERE PLATE LIKE @PLATE
AND COLOR LIKE @COLOR
AND TITLE LIKE @TITLE
AND BRAND LIKE @BRAND
AND LICENCEDATE BETWEEN ISNULL(@LICENDATE1,'20180101') AND ISNULL(@LICENDATE2,GETDATE())

