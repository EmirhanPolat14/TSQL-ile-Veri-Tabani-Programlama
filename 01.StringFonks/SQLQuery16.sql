SELECT * FROM LAB04

SELECT UPPER(SUBSTRING(CITY,1,1)) + LOWER(SUBSTRING(CITY,2,LEN(CITY))) FROM LAB04 

SELECT LOWER(SUBSTRING(CITY,2,LEN(CITY))) FROM LAB04

UPDATE LAB04
SET CITY=UPPER(SUBSTRING(CITY,1,1)) + LOWER(SUBSTRING(CITY,2,LEN(CITY))),
TOWN = UPPER(SUBSTRING(TOWN,1,1)) + LOWER(SUBSTRING(TOWN,2,LEN(TOWN)))

--��Z�M2
UPDATE LAB04
SET CITY=UPPER(LEFT(CITY,1)) + LOWER(RIGHT(CITY,LEN(CITY)-1)),
TOWN = UPPER(LEFT(TOWN,1)) + LOWER(RIGHT(TOWN,LEN(TOWN)-1))