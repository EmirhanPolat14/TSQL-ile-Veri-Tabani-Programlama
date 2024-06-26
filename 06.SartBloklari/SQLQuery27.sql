-- DYNAM�C V�EW

DECLARE @ERKEK AS FLOAT
DECLARE @KADIN AS FLOAT
DECLARE @TOPLAM AS FLOAT

SET @KADIN = (SELECT SUM(TOTALPRICE) FROM LAB03 WHERE CUSTOMERGENDER='K')
SET @ERKEK = (SELECT SUM(TOTALPRICE) FROM LAB03 WHERE CUSTOMERGENDER='E')
SET @TOPLAM = @KADIN / @ERKEK



SELECT *,FEMALESALE / MALESALE AS RATIO,
IIF(FEMALESALE / MALESALE > @TOPLAM, 'ORTALAMDAN Y�KSEK', 'ORTALAMADAN D���K') AS STATUS_
FROM
(
SELECT DISTINCT CITY,
	(SELECT SUM(TOTALPRICE) FROM LAB03 WHERE CUSTOMERGENDER='K' AND CITY = S.CITY) FEMALESALE,
	(SELECT SUM(TOTALPRICE) FROM LAB03 WHERE CUSTOMERGENDER='E' AND CITY = S.CITY) MALESALE

FROM LAB03 S
) T
ORDER BY 1