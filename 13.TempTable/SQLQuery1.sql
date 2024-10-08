CREATE TABLE #RESULT 
(MARKA VARCHAR (100), OCAK FLOAT,SUBAT FLOAT ,MART FLOAT, NISAN FLOAT, MAYIS FLOAT, HAZIRAN FLOAT, TEMMUZ FLOAT, AGUSTOS FLOAT, 
EYLUL FLOAT, EKIM FLOAT, KASIM FLOAT, ARALIK FLOAT)


INSERT INTO #RESULT(MARKA)
SELECT DISTINCT BRAND FROM ITEMS

UPDATE #RESULT SET OCAK=
(SELECT sum(OD.LINETOTAL) TOTALSALE FROM ORDERDETAILS OD
JOIN ITEMS I ON I.ID = OD.ITEMID
JOIN ORDERS O ON O.ID=OD.ORDERID
WHERE I.BRAND = #RESULT.MARKA AND MONTH(O.DATE_)=1)

UPDATE #RESULT SET SUBAT=
(SELECT sum(OD.LINETOTAL) TOTALSALE FROM ORDERDETAILS OD
JOIN ITEMS I ON I.ID = OD.ITEMID
JOIN ORDERS O ON O.ID=OD.ORDERID
WHERE I.BRAND = #RESULT.MARKA AND MONTH(O.DATE_)=2)

UPDATE #RESULT SET MART=
(SELECT sum(OD.LINETOTAL) TOTALSALE FROM ORDERDETAILS OD
JOIN ITEMS I ON I.ID = OD.ITEMID
JOIN ORDERS O ON O.ID=OD.ORDERID
WHERE I.BRAND = #RESULT.MARKA AND MONTH(O.DATE_)=3)


UPDATE #RESULT SET NISAN=
(SELECT sum(OD.LINETOTAL) TOTALSALE FROM ORDERDETAILS OD
JOIN ITEMS I ON I.ID = OD.ITEMID
JOIN ORDERS O ON O.ID=OD.ORDERID
WHERE I.BRAND = #RESULT.MARKA AND MONTH(O.DATE_)=4)


UPDATE #RESULT SET MAYIS=
(SELECT sum(OD.LINETOTAL) TOTALSALE FROM ORDERDETAILS OD
JOIN ITEMS I ON I.ID = OD.ITEMID
JOIN ORDERS O ON O.ID=OD.ORDERID
WHERE I.BRAND = #RESULT.MARKA AND MONTH(O.DATE_)=5)


UPDATE #RESULT SET HAZIRAN=
(SELECT sum(OD.LINETOTAL) TOTALSALE FROM ORDERDETAILS OD
JOIN ITEMS I ON I.ID = OD.ITEMID
JOIN ORDERS O ON O.ID=OD.ORDERID
WHERE I.BRAND = #RESULT.MARKA AND MONTH(O.DATE_)=6)

UPDATE #RESULT SET TEMMUZ=
(SELECT sum(OD.LINETOTAL) TOTALSALE FROM ORDERDETAILS OD
JOIN ITEMS I ON I.ID = OD.ITEMID
JOIN ORDERS O ON O.ID=OD.ORDERID
WHERE I.BRAND = #RESULT.MARKA AND MONTH(O.DATE_)=7)

UPDATE #RESULT SET AGUSTOS=
(SELECT sum(OD.LINETOTAL) TOTALSALE FROM ORDERDETAILS OD
JOIN ITEMS I ON I.ID = OD.ITEMID
JOIN ORDERS O ON O.ID=OD.ORDERID
WHERE I.BRAND = #RESULT.MARKA AND MONTH(O.DATE_)=8)

UPDATE #RESULT SET EYLUL=
(SELECT sum(OD.LINETOTAL) TOTALSALE FROM ORDERDETAILS OD
JOIN ITEMS I ON I.ID = OD.ITEMID
JOIN ORDERS O ON O.ID=OD.ORDERID
WHERE I.BRAND = #RESULT.MARKA AND MONTH(O.DATE_)=9)

UPDATE #RESULT SET EKIM=
(SELECT sum(OD.LINETOTAL) TOTALSALE FROM ORDERDETAILS OD
JOIN ITEMS I ON I.ID = OD.ITEMID
JOIN ORDERS O ON O.ID=OD.ORDERID
WHERE I.BRAND = #RESULT.MARKA AND MONTH(O.DATE_)=10)

UPDATE #RESULT SET KASIM=
(SELECT sum(OD.LINETOTAL) TOTALSALE FROM ORDERDETAILS OD
JOIN ITEMS I ON I.ID = OD.ITEMID
JOIN ORDERS O ON O.ID=OD.ORDERID
WHERE I.BRAND = #RESULT.MARKA AND MONTH(O.DATE_)=11)

UPDATE #RESULT SET ARALIK=
(SELECT sum(OD.LINETOTAL) TOTALSALE FROM ORDERDETAILS OD
JOIN ITEMS I ON I.ID = OD.ITEMID
JOIN ORDERS O ON O.ID=OD.ORDERID
WHERE I.BRAND = #RESULT.MARKA AND MONTH(O.DATE_)=12)

SELECT * FROM #RESULT