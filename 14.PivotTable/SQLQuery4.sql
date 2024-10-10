SET LANGUAGE Turkish
SELECT CITY, [Ocak], [�ubat], [Mart], [Nisan], [May�s], [Haziran], [Temmuz], [A�ustos], [Eyl�l], [Ekim], [Kas�m], [Aral�k]
FROM
(
	SELECT CITY,DATENAME(MONTH, DATE_) MONTH_, TOTALPRICE
	FROM SALES

) ST
PIVOT
(
	SUM(TOTALPRICE) FOR MONTH_ IN ([Ocak], [�ubat], [Mart], [Nisan], [May�s], [Haziran], [Temmuz], [A�ustos], [Eyl�l], [Ekim], [Kas�m], [Aral�k])
)PVT