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
CONVERT(DATE, DUEDATE, 101) [Due Date], DOCNUMBR [Document Number],
CASE
	WHEN a.hold = 0 THEN ' '
	WHEN a.hold = 1 THEN 'HOLD'
END Hold,
a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Original Amt], a.CURTRXAM [Unapplied Amt]
FROM FRI.dbo.PM20000 a JOIN FRI.dbo.PM00200 b ON a.VENDORID = b.VENDORID
AND VOIDED = 0

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
DOCNUMBR [Document Number],  
CASE
	WHEN a.hold = 0 THEN ' '
	WHEN a.hold = 1 THEN 'HOLD'
END Hold,
a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Original Amt], a.CURTRXAM [Unapplied Amt]
FROM FRII.dbo.PM20000 a JOIN FRII.dbo.PM00200 b ON a.VENDORID = b.VENDORID
AND VOIDED = 0

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
DOCNUMBR [Document Number],  
CASE
	WHEN a.hold = 0 THEN ' '
	WHEN a.hold = 1 THEN 'HOLD'
END Hold,
a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Original Amt], a.CURTRXAM [Unapplied Amt]
FROM FRNJ.dbo.PM20000 a JOIN FRNJ.dbo.PM00200 b ON a.VENDORID = b.VENDORID
AND VOIDED = 0

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
DOCNUMBR [Document Number],  
CASE
	WHEN a.hold = 0 THEN ' '
	WHEN a.hold = 1 THEN 'HOLD'
END Hold,
a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Original Amt], a.CURTRXAM [Unapplied Amt]
FROM MASPK.dbo.PM20000 a JOIN MASPK.dbo.PM00200 b ON a.VENDORID = b.VENDORID
AND VOIDED = 0

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
DOCNUMBR [Document Number],  
CASE
	WHEN a.hold = 0 THEN ' '
	WHEN a.hold = 1 THEN 'HOLD'
END Hold,
a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Original Amt], a.CURTRXAM [Unapplied Amt]
FROM MGMT.dbo.PM20000 a JOIN MGMT.dbo.PM00200 b ON a.VENDORID = b.VENDORID
AND VOIDED = 0

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
DOCNUMBR [Document Number],  
CASE
	WHEN a.hold = 0 THEN ' '
	WHEN a.hold = 1 THEN 'HOLD'
END Hold,
a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Original Amt], a.CURTRXAM [Unapplied Amt]
FROM MI.dbo.PM20000 a JOIN MI.dbo.PM00200 b ON a.VENDORID = b.VENDORID
AND VOIDED = 0

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
DOCNUMBR [Document Number],  
CASE
	WHEN a.hold = 0 THEN ' '
	WHEN a.hold = 1 THEN 'HOLD'
END Hold,
a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Original Amt], a.CURTRXAM [Unapplied Amt]
FROM SHIRL.dbo.PM20000 a JOIN SHIRL.dbo.PM00200 b ON a.VENDORID = b.VENDORID
AND VOIDED = 0

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
DOCNUMBR [Document Number],  
CASE
	WHEN a.hold = 0 THEN ' '
	WHEN a.hold = 1 THEN 'HOLD'
END Hold,
a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Original Amt], a.CURTRXAM [Unapplied Amt]
FROM REI.dbo.PM20000 a JOIN REI.dbo.PM00200 b ON a.VENDORID = b.VENDORID
AND VOIDED = 0

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
DOCNUMBR [Document Number],  
CASE
	WHEN a.hold = 0 THEN ' '
	WHEN a.hold = 1 THEN 'HOLD'
END Hold,
a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Original Amt], a.CURTRXAM [Unapplied Amt]
FROM REII.dbo.PM20000 a JOIN REII.dbo.PM00200 b ON a.VENDORID = b.VENDORID
AND VOIDED = 0

ORDER BY b.vendname, [Document Date]