SELECT * FROM LAB_PLAYER
SELECT * FROM LAB_MATCH_PLAYER

CREATE FUNCTION PLAYERINFO(@ID INT)
RETURNS TABLE
AS
RETURN
(
	SELECT * FROM LAB_PLA
)
GO