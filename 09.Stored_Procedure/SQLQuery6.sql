alter PROC SP_TERROR
@BEGDATE AS DATE,
@ENDATE AS DATE,
@GNMAE AS VARCHAR(50),
@COUNTRY AS VARCHAR(50)='%'
AS

SELECT COUNTRY_TXT,IYEAR,GNAME,COUNT(*) ATTACKCOUNT
FROM LAB_GLOBALTERROR
WHERE DATE_ BETWEEN @BEGDATE AND @ENDATE 
AND GNAME LIKE @GNMAE AND COUNTRY_TXT LIKE @COUNTRY
GROUP BY COUNTRY_TXT,IYEAR,GNAME
ORDER BY IYEAR

EXEC SP_TERROR '19900101','20160101','taliban','AFGHAN�STAN'

select * from LAB_GLOBALTERROR