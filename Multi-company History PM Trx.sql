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
CONVERT(DATE, DUEDATE, 101) [Due Date], CONVERT(DATE, POSTEDDT, 1) [Posted Date], CONVERT(DATE, PSTGDATE, 101) [Posting Date], DOCNUMBR [Document Number], a.TRXDSCRN Description,
CONVERT(MONEY, DOCAMNT, 1) [Document Amount], CONVERT(MONEY, PRCHAMNT, 1) [Purchase Amount]
FROM FRI.dbo.PM30200 a JOIN FRI.dbo.PM00200 b ON a.VENDORID = b.VENDORID
WHERE POSTEDDT > '03-01-2015'		--select Sunday before last for lookback period 

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
VCHRNMBR [Voucher Number], BACHNUMB [Batch Number], CONVERT(DATE, DOCDATE, 101) [Document Date], 
CONVERT(DATE, DUEDATE, 101) [Due Date], CONVERT(DATE, POSTEDDT, 1) [Posted Date], CONVERT(DATE, PSTGDATE, 101) [Posting Date], DOCNUMBR [Document Number], a.TRXDSCRN Description,
CONVERT(MONEY, DOCAMNT, 1) [Document Amount], CONVERT(MONEY, PRCHAMNT, 1) [Purchase Amount]
FROM FRII.dbo.PM30200 a JOIN FRII.dbo.PM00200 b ON a.VENDORID = b.VENDORID
WHERE POSTEDDT > '03-01-2015'		--select Sunday before last for lookback period 
 
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
VCHRNMBR [Voucher Number], BACHNUMB [Batch Number], CONVERT(DATE, DOCDATE, 101) [Document Date], 
CONVERT(DATE, DUEDATE, 101) [Due Date], CONVERT(DATE, POSTEDDT, 1) [Posted Date], CONVERT(DATE, PSTGDATE, 101) [Posting Date], DOCNUMBR [Document Number], a.TRXDSCRN Description,
CONVERT(MONEY, DOCAMNT, 1) [Document Amount], CONVERT(MONEY, PRCHAMNT, 1) [Purchase Amount]
FROM FRNJ.dbo.PM30200 a JOIN FRNJ.dbo.PM00200 b ON a.VENDORID = b.VENDORID
WHERE POSTEDDT > '03-01-2015'		--select Sunday before last for lookback period 

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
VCHRNMBR [Voucher Number], BACHNUMB [Batch Number], CONVERT(DATE, DOCDATE, 101) [Document Date], 
CONVERT(DATE, DUEDATE, 101) [Due Date], CONVERT(DATE, POSTEDDT, 1) [Posted Date], CONVERT(DATE, PSTGDATE, 101) [Posting Date], DOCNUMBR [Document Number], a.TRXDSCRN Description,
CONVERT(MONEY, DOCAMNT, 1) [Document Amount], CONVERT(MONEY, PRCHAMNT, 1) [Purchase Amount]
FROM MASPK.dbo.PM30200 a JOIN MASPK.dbo.PM00200 b ON a.VENDORID = b.VENDORID
WHERE POSTEDDT > '03-01-2015'		--select Sunday before last for lookback period 

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
VCHRNMBR [Voucher Number], BACHNUMB [Batch Number], CONVERT(DATE, DOCDATE, 101) [Document Date], 
CONVERT(DATE, DUEDATE, 101) [Due Date], CONVERT(DATE, POSTEDDT, 1) [Posted Date], CONVERT(DATE, PSTGDATE, 101) [Posting Date], DOCNUMBR [Document Number], a.TRXDSCRN Description,
CONVERT(MONEY, DOCAMNT, 1) [Document Amount], CONVERT(MONEY, PRCHAMNT, 1) [Purchase Amount]
FROM MGMT.dbo.PM30200 a JOIN MGMT.dbo.PM00200 b ON a.VENDORID = b.VENDORID
WHERE POSTEDDT > '03-01-2015'		--select Sunday before last for lookback period 
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
VCHRNMBR [Voucher Number], BACHNUMB [Batch Number], CONVERT(DATE, DOCDATE, 101) [Document Date], 
CONVERT(DATE, DUEDATE, 101) [Due Date], CONVERT(DATE, POSTEDDT, 1) [Posted Date], CONVERT(DATE, PSTGDATE, 101) [Posting Date], DOCNUMBR [Document Number], a.TRXDSCRN Description,
CONVERT(MONEY, DOCAMNT, 1) [Document Amount], CONVERT(MONEY, PRCHAMNT, 1) [Purchase Amount]
FROM MI.dbo.PM30200 a JOIN MI.dbo.PM00200 b ON a.VENDORID = b.VENDORID
WHERE POSTEDDT > '03-01-2015'		--select Sunday before last for lookback period 

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
VCHRNMBR [Voucher Number], BACHNUMB [Batch Number], CONVERT(DATE, DOCDATE, 101) [Document Date], 
CONVERT(DATE, DUEDATE, 101) [Due Date], CONVERT(DATE, POSTEDDT, 1) [Posted Date], CONVERT(DATE, PSTGDATE, 101) [Posting Date], DOCNUMBR [Document Number], a.TRXDSCRN Description,
CONVERT(MONEY, DOCAMNT, 1) [Document Amount], CONVERT(MONEY, PRCHAMNT, 1) [Purchase Amount]
FROM SHIRL.dbo.PM30200 a JOIN SHIRL.dbo.PM00200 b ON a.VENDORID = b.VENDORID
WHERE POSTEDDT > '03-01-2015'		--select Sunday before last for lookback period 

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
VCHRNMBR [Voucher Number], BACHNUMB [Batch Number], CONVERT(DATE, DOCDATE, 101) [Document Date], 
CONVERT(DATE, DUEDATE, 101) [Due Date], CONVERT(DATE, POSTEDDT, 1) [Posted Date], CONVERT(DATE, PSTGDATE, 101) [Posting Date], DOCNUMBR [Document Number], a.TRXDSCRN Description,
CONVERT(MONEY, DOCAMNT, 1) [Document Amount], CONVERT(MONEY, PRCHAMNT, 1) [Purchase Amount]
FROM REI.dbo.PM30200 a JOIN REI.dbo.PM00200 b ON a.VENDORID = b.VENDORID
WHERE POSTEDDT > '03-01-2015'		--select Sunday before last for lookback period 

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
VCHRNMBR [Voucher Number], BACHNUMB [Batch Number], CONVERT(DATE, DOCDATE, 101) [Document Date], 
CONVERT(DATE, DUEDATE, 101) [Due Date], CONVERT(DATE, POSTEDDT, 1) [Posted Date], CONVERT(DATE, PSTGDATE, 101) [Posting Date], DOCNUMBR [Document Number], a.TRXDSCRN Description,
CONVERT(MONEY, DOCAMNT, 1) [Document Amount], CONVERT(MONEY, PRCHAMNT, 1) [Purchase Amount]
FROM REII.dbo.PM30200 a JOIN REII.dbo.PM00200 b ON a.VENDORID = b.VENDORID
WHERE POSTEDDT > '03-01-2015'		--select Sunday before last for lookback period 

ORDER BY a.VENDORID, [Document Date]