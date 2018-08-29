DECLARE @ITEM_ID NVARCHAR(50)

DECLARE ITEM_CURSOR CURSOR
FOR
SELECT ItemCode
FROM OITM
WHERE QryGroup64 <> 'Y'
	AND validFor = 'Y'

OPEN ITEM_CURSOR

FETCH NEXT
FROM ITEM_CURSOR
INTO @ITEM_ID                     -- We fetch the first result 
        
WHILE @@FETCH_STATUS = 0          --If the fetch went well then we go for it
BEGIN       
	EXEC se_DIES_Code '4',          -- Object Type
		'U',                          -- Action (A - Add, U - Update, C - Canceled, L - Close, M - Manual)
		1,                            -- Number of Key Fields
		'ItemCode',                   -- Key fields (Tab seperated)
		@item_id,                     -- Key values (Tab Seperated)
		'1.DIM_OITM_TO_HAV_OITM'      -- Code @Dies_Objects

	FETCH NEXT
	FROM ITEM_CURSOR
	INTO @ITEM_ID
END

CLOSE ITEM_CURSOR

DEALLOCATE ITEM_CURSOR
