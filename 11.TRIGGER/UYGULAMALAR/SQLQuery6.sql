ALTER TRIGGER TRG_UPDATES_DELETE_ITEMS
ON ITEMS
-- INSTEAD OF'DA DELETE UPDATE VS. ��LEMLER� YAPMAK YER�NE BEGIN END BLO�UNDA VER�LEN ��LEMLER� YAPAR. YAN� ANA TABLOMUZDA DELETE UPDATE G�B� ��LEMLER GER�EKLE�MEZ
INSTEAD OF UPDATE,DELETE
AS
BEGIN
	DECLARE @LOG_ACTIONTYPE AS varchar(10)
	DECLARE @INSERTEDCOUNT AS INT
	DECLARE @DELETEDCOUNT AS INT
	DECLARE @LOG_DATE AS datetime
	DECLARE @LOG_HOSTNAME AS varchar(100)
	DECLARE @LOG_PROGRAMNAME AS varchar(100)
	DECLARE @LOG_USERNAME AS varchar(100)

	SELECT @DELETEDCOUNT=COUNT(*) FROM deleted 
	SELECT @INSERTEDCOUNT = COUNT(*) FROM inserted
	
	IF @DELETEDCOUNT = 0 AND @INSERTEDCOUNT > 0
		SET @LOG_ACTIONTYPE = 'INSERT'
	IF @DELETEDCOUNT > 0 AND @INSERTEDCOUNT = 0
		SET @LOG_ACTIONTYPE = 'DELETE'
	IF @DELETEDCOUNT > 0 AND @INSERTEDCOUNT > 0
		SET @LOG_ACTIONTYPE = 'UPDATE'

	SET @LOG_DATE = GETDATE()
	SET @LOG_HOSTNAME = HOST_NAME()
	SET @LOG_PROGRAMNAME = PROGRAM_NAME()
	SET @LOG_USERNAME = SUSER_NAME()

	INSERT INTO LOGDB.dbo.ITEMS
	(ID, ITEMCODE, ITEMNAME, UNITPRICE, CATEGORY1, CATEGORY2, CATEGORY3, CATEGORY4, BRAND, LOG_ACTIONTYPE, LOG_DATE, LOG_HOSTNAME, LOG_PROGRAMNAME, LOG_USERNAME)

	SELECT
	ID, ITEMCODE, ITEMNAME, UNITPRICE, CATEGORY1, CATEGORY2, CATEGORY3, CATEGORY4, BRAND, @LOG_ACTIONTYPE, @LOG_DATE, @LOG_HOSTNAME, @LOG_PROGRAMNAME, @LOG_USERNAME
	FROM deleted
END