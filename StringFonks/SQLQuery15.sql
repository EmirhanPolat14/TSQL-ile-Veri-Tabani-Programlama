SELECT CITY,TOWN FROM LAB03

UPDATE LAB03
SET CITY=UPPER(CITY), TOWN=UPPER(TOWN)

--YAZILARI �NG�L�ZCE HARFLER� OLARAK GET�RME

SELECT UPPER('washington' COLLATE sql_latin1_general_cp1_ci_as)