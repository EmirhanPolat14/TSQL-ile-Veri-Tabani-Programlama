SELECT * FROM LAB03

SELECT MONTH(DATE_) AY, DATENAME(MONTH, DATE_) AS MONTH_, SUM(TOTALPRICE) TOPLAMSATIS
FROM LAB03
WHERE YEAR(DATE_) = '2022'
GROUP BY DATENAME(MONTH, DATE_),MONTH(DATE_)
ORDER BY MONTH(DATE_) 

