SELECT BRAND,
CASE
	WHEN DATEDIFF(YEAR,YEAR_,LICENCEDATE) = 0 THEN 'AYNI YIL TRAF��E �IKMI�'
	WHEN DATEDIFF(YEAR,YEAR_,LICENCEDATE) = 1 THEN 'B�R YIL SONRA TRAF��E �IKMI�'
	WHEN DATEDIFF(YEAR,YEAR_,LICENCEDATE) = 2 THEN '�K� YIL SONRA TRAF��E �IKMI�'
END AS STATUS_
,COUNT(*) COUNT_
FROM LAB02 
GROUP BY BRAND,DATEDIFF(YEAR,YEAR_,LICENCEDATE)
ORDER BY 1 ,2
