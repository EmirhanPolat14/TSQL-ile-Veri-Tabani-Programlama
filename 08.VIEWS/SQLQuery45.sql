--SET LANGUAGE turkish
ALTER VIEW VWSATISLAR
AS
SELECT 
OD.ORDERID SIPARSISNOOO,O.DATE_ TARIH,DATEPART(YEAR,O.DATE_) YIL,DATENAME(DW,O.DATE_) GUN,DATENAME(MONTH,O.DATE_) AY, DATEPART(MONTH,O.DATE_) AYNR,
U.USERNAME_ KULLANICIAD,U.NAMESURNAME ADSOYAD,U.GENDER CINSIYET,U.EMAIL,U.TELNR1 TELEFON1,A.ADDRESSTEXT ACIKADRES,A.POSTALCODE POSTAKODU,
CT.CITY SEHIR, T.TOWN ILCE,I.ITEMCODE URUNKODU,I.ITEMNAME URUNADI,I.BRAND MARKA,I.CATEGORY1 KATEGORI1,OD.AMOUNT MIKTAR,OD.UNITPRICE BIRIMFIYAT,
OD.LINETOTAL SATIRTOPLAMI
FROM ORDERDETAILS OD
JOIN ORDERS O ON O.ID=OD.ORDERID
JOIN USERS U ON U.ID=O.USERID
JOIN ADDRESS A ON A.USERID=U.ID
JOIN COUNTRIES C ON C.ID = A.COUNTRYID
JOIN CITIES CT ON CT.ID=A.CITYID
JOIN TOWNS T ON T.ID=A.TOWNID
JOIN DISTRICTS D ON D.ID=A.DISTRICTID
JOIN ITEMS I ON I.ID=OD.ITEMID