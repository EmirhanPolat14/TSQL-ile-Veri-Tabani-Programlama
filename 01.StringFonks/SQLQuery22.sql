SELECT * FROM LAB10


SELECT REPLACE(INFO, '##', CHAR(ASCII('
')))
FROM LAB10

UPDATE LAB10
SET INFO=REPLACE(INFO, '##', CHAR(ASCII('
')))