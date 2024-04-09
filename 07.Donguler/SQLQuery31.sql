DECLARE @I AS INT = 1
DECLARE @SICAKLIK AS FLOAT 
DECLARE @ISIM AS VARCHAR(50) = 'THERMOMETER_'

WHILE @I <= 100
BEGIN
	SET @SICAKLIK = ROUND((18 + RAND() * 5),2)
	INSERT INTO LAB01(DEVICENAME,CURRENTVALUE)
	VALUES (@ISIM+REPLICATE('0',3-LEN(@I))+CONVERT(VARCHAR(50),@I),@SICAKLIK)
	SET @I = @I+1
END

SELECT * FROM LAB01
ORDER BY 1 



TRUNCATE TABLE LAB01