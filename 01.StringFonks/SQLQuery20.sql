SELECT * FROM LAB09


SELECT *,
(SELECT COUNT(*)  FROM string_split(FULLTEXT, ' ') ) AS WORDCOUNT
FROM LAB09