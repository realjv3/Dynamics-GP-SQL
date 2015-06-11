SELECT db_name(DB_ID('FRI')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name], 
CASE
	WHEN DOCTYPE = 1 THEN 'Invoice'
	WHEN DOCTYPE = 2 THEN 'Finance Charge'
	WHEN DOCTYPE = 3 THEN 'Misc Charge'
	WHEN DOCTYPE = 4 THEN 'Return'
	WHEN DOCTYPE = 5 THEN 'Credit Memo'
	WHEN DOCTYPE = 6 THEN 'Payment'
END [Document Type],
a.VCHRNMBR [Voucher Number], BACHNUMB [Batch Number], CONVERT(DATE, DOCDATE, 101) [Document Date], 
CONVERT(DATE, DUEDATE, 101) [Due Date], DOCNUMBR [Document Number],
CASE
	WHEN a.hold = 0 THEN ' '
	WHEN a.hold = 1 THEN 'HOLD'
END Hold,
a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Original Amt], CONVERT(MONEY, a.CURTRXAM, 1) [Unapplied Amt],
CONVERT(MONEY, c.CRDTAMNT, 1) [Credit Amt], CONVERT(MONEY, c.DEBITAMT, 1) [Debit Amt], d.ACTNUMBR_1 [Acct Seg 1], d.ACTNUMBR_2 [Act Seg 2], d.ACTDESCR
FROM FRI.dbo.PM20000 a JOIN FRI.dbo.PM00200 b ON a.VENDORID = b.VENDORID
					   JOIN FRI.dbo.PM10100 c
							JOIN FRI.dbo.GL00100 d ON c.DSTINDX = d.ACTINDX
					   ON a.VCHRNMBR = c.VCHRNMBR
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
a.VCHRNMBR [Voucher Number], BACHNUMB [Batch Number],CONVERT(DATE, DOCDATE, 101), CONVERT(DATE, DUEDATE, 101) [Due Date], 
DOCNUMBR [Document Number],  
CASE
	WHEN a.hold = 0 THEN ' '
	WHEN a.hold = 1 THEN 'HOLD'
END Hold,
a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Original Amt],  CONVERT(MONEY, a.CURTRXAM, 1) [Unapplied Amt],
CONVERT(MONEY, c.CRDTAMNT, 1) [Credit Amt], CONVERT(MONEY, c.DEBITAMT, 1) [Debit Amt], d.ACTNUMBR_1 [Acct Seg 1], d.ACTNUMBR_2 [Act Seg 2], d.ACTDESCR
FROM FRII.dbo.PM20000 a JOIN FRII.dbo.PM00200 b ON a.VENDORID = b.VENDORID
					   JOIN FRII.dbo.PM10100 c
							JOIN FRII.dbo.GL00100 d ON c.DSTINDX = d.ACTINDX
					   ON a.VCHRNMBR = c.VCHRNMBR
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
a.VCHRNMBR [Voucher Number], BACHNUMB [Batch Number],CONVERT(DATE, DOCDATE, 101), CONVERT(DATE, DUEDATE, 101) [Due Date], 
DOCNUMBR [Document Number],  
CASE
	WHEN a.hold = 0 THEN ' '
	WHEN a.hold = 1 THEN 'HOLD'
END Hold,
a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Original Amt],  CONVERT(MONEY, a.CURTRXAM, 1) [Unapplied Amt],
CONVERT(MONEY, c.CRDTAMNT, 1) [Credit Amt], CONVERT(MONEY, c.DEBITAMT, 1) [Debit Amt], d.ACTNUMBR_1 [Acct Seg 1], d.ACTNUMBR_2 [Act Seg 2], d.ACTDESCR
FROM FRNJ.dbo.PM20000 a JOIN FRNJ.dbo.PM00200 b ON a.VENDORID = b.VENDORID
					   JOIN FRNJ.dbo.PM10100 c
							JOIN FRNJ.dbo.GL00100 d ON c.DSTINDX = d.ACTINDX
					   ON a.VCHRNMBR = c.VCHRNMBR
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
a.VCHRNMBR [Voucher Number], BACHNUMB [Batch Number],CONVERT(DATE, DOCDATE, 101), CONVERT(DATE, DUEDATE, 101) [Due Date], 
DOCNUMBR [Document Number],  
CASE
	WHEN a.hold = 0 THEN ' '
	WHEN a.hold = 1 THEN 'HOLD'
END Hold,
a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Original Amt],  CONVERT(MONEY, a.CURTRXAM, 1) [Unapplied Amt],
CONVERT(MONEY, c.CRDTAMNT, 1) [Credit Amt], CONVERT(MONEY, c.DEBITAMT, 1) [Debit Amt], d.ACTNUMBR_1 [Acct Seg 1], d.ACTNUMBR_2 [Act Seg 2], d.ACTDESCR
FROM MASPK.dbo.PM20000 a JOIN MASPK.dbo.PM00200 b ON a.VENDORID = b.VENDORID
					   JOIN MASPK.dbo.PM10100 c
							JOIN MASPK.dbo.GL00100 d ON c.DSTINDX = d.ACTINDX
					   ON a.VCHRNMBR = c.VCHRNMBR
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
a.VCHRNMBR [Voucher Number], BACHNUMB [Batch Number],CONVERT(DATE, DOCDATE, 101), CONVERT(DATE, DUEDATE, 101) [Due Date], 
DOCNUMBR [Document Number],  
CASE
	WHEN a.hold = 0 THEN ' '
	WHEN a.hold = 1 THEN 'HOLD'
END Hold,
a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Original Amt],  CONVERT(MONEY, a.CURTRXAM, 1) [Unapplied Amt],
CONVERT(MONEY, c.CRDTAMNT, 1) [Credit Amt], CONVERT(MONEY, c.DEBITAMT, 1) [Debit Amt], d.ACTNUMBR_1 [Acct Seg 1], d.ACTNUMBR_2 [Act Seg 2], d.ACTDESCR
FROM MGMT.dbo.PM20000 a JOIN MGMT.dbo.PM00200 b ON a.VENDORID = b.VENDORID
					   JOIN MGMT.dbo.PM10100 c
							JOIN MGMT.dbo.GL00100 d ON c.DSTINDX = d.ACTINDX
					   ON a.VCHRNMBR = c.VCHRNMBR
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
a.VCHRNMBR [Voucher Number], BACHNUMB [Batch Number],CONVERT(DATE, DOCDATE, 101), CONVERT(DATE, DUEDATE, 101) [Due Date], 
DOCNUMBR [Document Number],  
CASE
	WHEN a.hold = 0 THEN ' '
	WHEN a.hold = 1 THEN 'HOLD'
END Hold,
a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Original Amt],  CONVERT(MONEY, a.CURTRXAM, 1) [Unapplied Amt],
CONVERT(MONEY, c.CRDTAMNT, 1) [Credit Amt], CONVERT(MONEY, c.DEBITAMT, 1) [Debit Amt], d.ACTNUMBR_1 [Acct Seg 1], d.ACTNUMBR_2 [Act Seg 2], d.ACTDESCR
FROM MI.dbo.PM20000 a JOIN MI.dbo.PM00200 b ON a.VENDORID = b.VENDORID
					   JOIN MI.dbo.PM10100 c
							JOIN MI.dbo.GL00100 d ON c.DSTINDX = d.ACTINDX
					   ON a.VCHRNMBR = c.VCHRNMBR
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
a.VCHRNMBR [Voucher Number], BACHNUMB [Batch Number],CONVERT(DATE, DOCDATE, 101), CONVERT(DATE, DUEDATE, 101) [Due Date], 
DOCNUMBR [Document Number],  
CASE
	WHEN a.hold = 0 THEN ' '
	WHEN a.hold = 1 THEN 'HOLD'
END Hold,
a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Original Amt],  CONVERT(MONEY, a.CURTRXAM, 1) [Unapplied Amt],
CONVERT(MONEY, c.CRDTAMNT, 1) [Credit Amt], CONVERT(MONEY, c.DEBITAMT, 1) [Debit Amt], d.ACTNUMBR_1 [Acct Seg 1], d.ACTNUMBR_2 [Act Seg 2], d.ACTDESCR
FROM SHIRL.dbo.PM20000 a JOIN SHIRL.dbo.PM00200 b ON a.VENDORID = b.VENDORID
					   JOIN SHIRL.dbo.PM10100 c
							JOIN SHIRL.dbo.GL00100 d ON c.DSTINDX = d.ACTINDX
					   ON a.VCHRNMBR = c.VCHRNMBR
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
a.VCHRNMBR [Voucher Number], BACHNUMB [Batch Number],CONVERT(DATE, DOCDATE, 101), CONVERT(DATE, DUEDATE, 101) [Due Date], 
DOCNUMBR [Document Number],  
CASE
	WHEN a.hold = 0 THEN ' '
	WHEN a.hold = 1 THEN 'HOLD'
END Hold,
a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Original Amt],  CONVERT(MONEY, a.CURTRXAM, 1) [Unapplied Amt],
CONVERT(MONEY, c.CRDTAMNT, 1) [Credit Amt], CONVERT(MONEY, c.DEBITAMT, 1) [Debit Amt], d.ACTNUMBR_1 [Acct Seg 1], d.ACTNUMBR_2 [Act Seg 2], d.ACTDESCR
FROM REI.dbo.PM20000 a JOIN REI.dbo.PM00200 b ON a.VENDORID = b.VENDORID
					   JOIN REI.dbo.PM10100 c
							JOIN REI.dbo.GL00100 d ON c.DSTINDX = d.ACTINDX
					   ON a.VCHRNMBR = c.VCHRNMBR
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
a.VCHRNMBR [Voucher Number], BACHNUMB [Batch Number],CONVERT(DATE, DOCDATE, 101), CONVERT(DATE, DUEDATE, 101) [Due Date], 
DOCNUMBR [Document Number],  
CASE
	WHEN a.hold = 0 THEN ' '
	WHEN a.hold = 1 THEN 'HOLD'
END Hold,
a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Original Amt],  CONVERT(MONEY, a.CURTRXAM, 1) [Unapplied Amt],
CONVERT(MONEY, c.CRDTAMNT, 1) [Credit Amt], CONVERT(MONEY, c.DEBITAMT, 1) [Debit Amt], d.ACTNUMBR_1 [Acct Seg 1], d.ACTNUMBR_2 [Act Seg 2], d.ACTDESCR
FROM REII.dbo.PM20000 a JOIN REII.dbo.PM00200 b ON a.VENDORID = b.VENDORID
					   JOIN REII.dbo.PM10100 c
							JOIN REII.dbo.GL00100 d ON c.DSTINDX = d.ACTINDX
					   ON a.VCHRNMBR = c.VCHRNMBR
AND VOIDED = 0

ORDER BY b.vendname, [Document Date]