USE LAB_STRING_FUNCTIONS
SELECT * FROM LAB01

ALTER TABLE LAB01 ADD NAMESURNAME VARCHAR(50) 

--CTR+SH�FT+r �LE S�STEM� YEN�LEYEB�L�RS�N
UPDATE LAB01
SET NAMESURNAME= CONCAT_WS(' ', NAME_, SURNAME)