SELECT * FROM LAB05

SELECT RIGHT(EMAIL,LEN(EMAIL) - CHARINDEX('@',EMAIL,1)) SERVIS,
COUNT(*) SERVISADETI
FROM LAB05
GROUP BY RIGHT(EMAIL,LEN(EMAIL) - CHARINDEX('@',EMAIL,1))
ORDER BY 2 DESC