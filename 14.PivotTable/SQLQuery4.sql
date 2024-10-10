SET LANGUAGE Turkish
SELECT CITY, [Ocak], [Þubat], [Mart], [Nisan], [Mayýs], [Haziran], [Temmuz], [Aðustos], [Eylül], [Ekim], [Kasým], [Aralýk]
FROM
(
	SELECT CITY,DATENAME(MONTH, DATE_) MONTH_, TOTALPRICE
	FROM SALES

) ST
PIVOT
(
	SUM(TOTALPRICE) FOR MONTH_ IN ([Ocak], [Þubat], [Mart], [Nisan], [Mayýs], [Haziran], [Temmuz], [Aðustos], [Eylül], [Ekim], [Kasým], [Aralýk])
)PVT