SELECT db_name(DB_ID('FRI')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name],  
CASE
	WHEN DOCTYPE = 1 THEN 'Invoice'
	WHEN DOCTYPE = 2 THEN 'Finance Charge'
	WHEN DOCTYPE = 3 THEN 'Misc Charge'
	WHEN DOCTYPE = 4 THEN 'Return'
	WHEN DOCTYPE = 5 THEN 'Credit Memo'
	WHEN DOCTYPE = 6 THEN 'Payment'
END [Document Type],
VCHRNMBR [Voucher Number], BACHNUMB [Batch Number], CONVERT(DATE, DOCDATE, 101) [Document Date], 
CONVERT(DATE, DUEDATE, 101) [Due Date], DOCNUMBR [Document Number], a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Document Amount]
FROM FRI.dbo.PM10000 a JOIN FRI.dbo.PM00200 b ON a.VENDORID = b.VENDORID

UNION ALL

SELECT db_name(DB_ID('FRII')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name],  
CASE
	WHEN DOCTYPE = 1 THEN 'Invoice'
	WHEN DOCTYPE = 2 THEN 'Finance Charge'
	WHEN DOCTYPE = 3 THEN 'Misc Charge'
	WHEN DOCTYPE = 4 THEN 'Return'
	WHEN DOCTYPE = 5 THEN 'Credit Memo'
	WHEN DOCTYPE = 6 THEN 'Payment'
END [Document Type],
VCHRNMBR [Voucher Number], BACHNUMB [Batch Number],CONVERT(DATE, DOCDATE, 101), CONVERT(DATE, DUEDATE, 101) [Due Date], 
DOCNUMBR [Document Number], a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Document Amount]
FROM FRII.dbo.PM10000 a JOIN FRII.dbo.PM00200 b ON a.VENDORID = b.VENDORID

UNION ALL

SELECT db_name(DB_ID('FRNJ')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name],  
CASE
	WHEN DOCTYPE = 1 THEN 'Invoice'
	WHEN DOCTYPE = 2 THEN 'Finance Charge'
	WHEN DOCTYPE = 3 THEN 'Misc Charge'
	WHEN DOCTYPE = 4 THEN 'Return'
	WHEN DOCTYPE = 5 THEN 'Credit Memo'
	WHEN DOCTYPE = 6 THEN 'Payment'
END [Document Type],
VCHRNMBR [Voucher Number], BACHNUMB [Batch Number],CONVERT(DATE, DOCDATE, 101), CONVERT(DATE, DUEDATE, 101) [Due Date], 
DOCNUMBR [Document Number], a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Document Amount]
FROM FRNJ.dbo.PM10000 a JOIN FRNJ.dbo.PM00200 b ON a.VENDORID = b.VENDORID

UNION ALL

SELECT db_name(DB_ID('MASPK')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name],  
CASE
	WHEN DOCTYPE = 1 THEN 'Invoice'
	WHEN DOCTYPE = 2 THEN 'Finance Charge'
	WHEN DOCTYPE = 3 THEN 'Misc Charge'
	WHEN DOCTYPE = 4 THEN 'Return'
	WHEN DOCTYPE = 5 THEN 'Credit Memo'
	WHEN DOCTYPE = 6 THEN 'Payment'
END [Document Type],
VCHRNMBR [Voucher Number], BACHNUMB [Batch Number],CONVERT(DATE, DOCDATE, 101), CONVERT(DATE, DUEDATE, 101) [Due Date], 
DOCNUMBR [Document Number], a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Document Amount]
FROM MASPK.dbo.PM10000 a JOIN MASPK.dbo.PM00200 b ON a.VENDORID = b.VENDORID

UNION ALL

SELECT db_name(DB_ID('MGMT')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name],  
CASE
	WHEN DOCTYPE = 1 THEN 'Invoice'
	WHEN DOCTYPE = 2 THEN 'Finance Charge'
	WHEN DOCTYPE = 3 THEN 'Misc Charge'
	WHEN DOCTYPE = 4 THEN 'Return'
	WHEN DOCTYPE = 5 THEN 'Credit Memo'
	WHEN DOCTYPE = 6 THEN 'Payment'
END [Document Type],
VCHRNMBR [Voucher Number], BACHNUMB [Batch Number],CONVERT(DATE, DOCDATE, 101), CONVERT(DATE, DUEDATE, 101) [Due Date], 
DOCNUMBR [Document Number], a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Document Amount]
FROM MGMT.dbo.PM10000 a JOIN MGMT.dbo.PM00200 b ON a.VENDORID = b.VENDORID

UNION ALL

SELECT db_name(DB_ID('MI')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name],  
CASE
	WHEN DOCTYPE = 1 THEN 'Invoice'
	WHEN DOCTYPE = 2 THEN 'Finance Charge'
	WHEN DOCTYPE = 3 THEN 'Misc Charge'
	WHEN DOCTYPE = 4 THEN 'Return'
	WHEN DOCTYPE = 5 THEN 'Credit Memo'
	WHEN DOCTYPE = 6 THEN 'Payment'
END [Document Type],
VCHRNMBR [Voucher Number], BACHNUMB [Batch Number],CONVERT(DATE, DOCDATE, 101), CONVERT(DATE, DUEDATE, 101) [Due Date], 
DOCNUMBR [Document Number], a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Document Amount]
FROM MI.dbo.PM10000 a JOIN MI.dbo.PM00200 b ON a.VENDORID = b.VENDORID

UNION ALL

SELECT db_name(DB_ID('SHIRL')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name],  
CASE
	WHEN DOCTYPE = 1 THEN 'Invoice'
	WHEN DOCTYPE = 2 THEN 'Finance Charge'
	WHEN DOCTYPE = 3 THEN 'Misc Charge'
	WHEN DOCTYPE = 4 THEN 'Return'
	WHEN DOCTYPE = 5 THEN 'Credit Memo'
	WHEN DOCTYPE = 6 THEN 'Payment'
END [Document Type],
VCHRNMBR [Voucher Number], BACHNUMB [Batch Number],CONVERT(DATE, DOCDATE, 101), CONVERT(DATE, DUEDATE, 101) [Due Date], 
DOCNUMBR [Document Number], a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Document Amount]
FROM SHIRL.dbo.PM10000 a JOIN SHIRL.dbo.PM00200 b ON a.VENDORID = b.VENDORID

UNION ALL

SELECT db_name(DB_ID('REI')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name],  
CASE
	WHEN DOCTYPE = 1 THEN 'Invoice'
	WHEN DOCTYPE = 2 THEN 'Finance Charge'
	WHEN DOCTYPE = 3 THEN 'Misc Charge'
	WHEN DOCTYPE = 4 THEN 'Return'
	WHEN DOCTYPE = 5 THEN 'Credit Memo'
	WHEN DOCTYPE = 6 THEN 'Payment'
END [Document Type],
VCHRNMBR [Voucher Number], BACHNUMB [Batch Number],CONVERT(DATE, DOCDATE, 101), CONVERT(DATE, DUEDATE, 101) [Due Date], 
DOCNUMBR [Document Number], a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Document Amount]
FROM REI.dbo.PM10000 a JOIN REI.dbo.PM00200 b ON a.VENDORID = b.VENDORID

UNION ALL

SELECT db_name(DB_ID('REII')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name],  
CASE
	WHEN DOCTYPE = 1 THEN 'Invoice'
	WHEN DOCTYPE = 2 THEN 'Finance Charge'
	WHEN DOCTYPE = 3 THEN 'Misc Charge'
	WHEN DOCTYPE = 4 THEN 'Return'
	WHEN DOCTYPE = 5 THEN 'Credit Memo'
	WHEN DOCTYPE = 6 THEN 'Payment'
END [Document Type],
VCHRNMBR [Voucher Number], BACHNUMB [Batch Number],CONVERT(DATE, DOCDATE, 101), CONVERT(DATE, DUEDATE, 101) [Due Date], 
DOCNUMBR [Document Number], a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Document Amount]
FROM REII.dbo.PM10000 a JOIN REII.dbo.PM00200 b ON a.VENDORID = b.VENDORID

ORDER BY a.VENDORID, [Document Date]