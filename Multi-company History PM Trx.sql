SELECT db_name(DB_ID('FRI')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name],
CASE
	WHEN a.DOCTYPE = 1 THEN 'Invoice'
	WHEN a.DOCTYPE = 2 THEN 'Finance Charge'
	WHEN a.DOCTYPE = 3 THEN 'Misc Charge'
	WHEN a.DOCTYPE = 4 THEN 'Return'
	WHEN a.DOCTYPE = 5 THEN 'Credit Memo'
	WHEN a.DOCTYPE = 6 THEN 'Payment'
END [Document Type],
a.VCHRNMBR [Voucher Number],  a.DOCNUMBR [Document Number], a.BACHNUMB [Batch Number], CONVERT(DATE, a.DOCDATE, 101) [Document Date], 
CONVERT(DATE, DUEDATE, 101) [Due Date], CONVERT(DATE, POSTEDDT, 1) [Posted Date], CONVERT(DATE, a.PSTGDATE, 101) [Posting Date], a.TRXDSCRN Description,
CONVERT(MONEY, DOCAMNT, 1) [Document Amount], CONVERT(MONEY, PRCHAMNT, 1) [Purchase Amount], c.APTVCHNM [Applied to Voucher], c.APTODCNM [Applied to Doc Name]
FROM FRI.dbo.PM30200 a JOIN FRI.dbo.PM00200 b ON a.VENDORID = b.VENDORID
				  LEFT JOIN FRI.dbo.PM30300 c ON a.VCHRNMBR = c.VCHRNMBR

WHERE POSTEDDT > '05-24-2015'	--select Sunday before last for lookback period 
AND VOIDED = 0

UNION ALL

SELECT db_name(DB_ID('FRII')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name],
CASE
	WHEN a.DOCTYPE = 1 THEN 'Invoice'
	WHEN a.DOCTYPE = 2 THEN 'Finance Charge'
	WHEN a.DOCTYPE = 3 THEN 'Misc Charge'
	WHEN a.DOCTYPE = 4 THEN 'Return'
	WHEN a.DOCTYPE = 5 THEN 'Credit Memo'
	WHEN a.DOCTYPE = 6 THEN 'Payment'
END [Document Type],
a.VCHRNMBR [Voucher Number], DOCNUMBR [Document Number], BACHNUMB [Batch Number], CONVERT(DATE, a.DOCDATE, 101) [Document Date], 
CONVERT(DATE, DUEDATE, 101) [Due Date], CONVERT(DATE, POSTEDDT, 1) [Posted Date], CONVERT(DATE, a.PSTGDATE, 101) [Posting Date], a.TRXDSCRN Description,
CONVERT(MONEY, DOCAMNT, 1) [Document Amount], CONVERT(MONEY, PRCHAMNT, 1) [Purchase Amount], c.APTVCHNM [Applied to Voucher], c.APTODCNM [Applied to Doc Name]

FROM FRII.dbo.PM30200 a JOIN FRII.dbo.PM00200 b ON a.VENDORID = b.VENDORID
				  LEFT JOIN FRII.dbo.PM30300 c ON a.VCHRNMBR = c.VCHRNMBR

WHERE POSTEDDT > '05-24-2015'	--select Sunday before last for lookback period 
AND VOIDED = 0
 
UNION ALL

SELECT db_name(DB_ID('FRNJ')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name],
CASE
	WHEN a.DOCTYPE = 1 THEN 'Invoice'
	WHEN a.DOCTYPE = 2 THEN 'Finance Charge'
	WHEN a.DOCTYPE = 3 THEN 'Misc Charge'
	WHEN a.DOCTYPE = 4 THEN 'Return'
	WHEN a.DOCTYPE = 5 THEN 'Credit Memo'
	WHEN a.DOCTYPE = 6 THEN 'Payment'
END [Document Type],
a.VCHRNMBR [Voucher Number], DOCNUMBR [Document Number], BACHNUMB [Batch Number], CONVERT(DATE, a.DOCDATE, 101) [Document Date], 
CONVERT(DATE, DUEDATE, 101) [Due Date], CONVERT(DATE, POSTEDDT, 1) [Posted Date], CONVERT(DATE, a.PSTGDATE, 101) [Posting Date], a.TRXDSCRN Description,
CONVERT(MONEY, DOCAMNT, 1) [Document Amount], CONVERT(MONEY, PRCHAMNT, 1) [Purchase Amount], c.APTVCHNM [Applied to Voucher], c.APTODCNM [Applied to Doc Name]

FROM FRNJ.dbo.PM30200 a JOIN FRNJ.dbo.PM00200 b ON a.VENDORID = b.VENDORID
				  LEFT JOIN FRNJ.dbo.PM30300 c ON a.VCHRNMBR = c.VCHRNMBR

WHERE POSTEDDT > '05-24-2015'	--select Sunday before last for lookback period 
AND VOIDED = 0

UNION ALL

SELECT db_name(DB_ID('MASPK')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name],
CASE
	WHEN a.DOCTYPE = 1 THEN 'Invoice'
	WHEN a.DOCTYPE = 2 THEN 'Finance Charge'
	WHEN a.DOCTYPE = 3 THEN 'Misc Charge'
	WHEN a.DOCTYPE = 4 THEN 'Return'
	WHEN a.DOCTYPE = 5 THEN 'Credit Memo'
	WHEN a.DOCTYPE = 6 THEN 'Payment'
END [Document Type],
a.VCHRNMBR [Voucher Number], DOCNUMBR [Document Number], BACHNUMB [Batch Number], CONVERT(DATE, a.DOCDATE, 101) [Document Date], 
CONVERT(DATE, DUEDATE, 101) [Due Date], CONVERT(DATE, POSTEDDT, 1) [Posted Date], CONVERT(DATE, a.PSTGDATE, 101) [Posting Date], a.TRXDSCRN Description,
CONVERT(MONEY, DOCAMNT, 1) [Document Amount], CONVERT(MONEY, PRCHAMNT, 1) [Purchase Amount], c.APTVCHNM [Applied to Voucher], c.APTODCNM [Applied to Doc Name]

FROM MASPK.dbo.PM30200 a JOIN MASPK.dbo.PM00200 b ON a.VENDORID = b.VENDORID
				  LEFT JOIN MASPK.dbo.PM30300 c ON a.VCHRNMBR = c.VCHRNMBR

WHERE POSTEDDT > '05-24-2015'	--select Sunday before last for lookback period 
AND VOIDED = 0

UNION ALL

SELECT db_name(DB_ID('MGMT')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name],
CASE
	WHEN a.DOCTYPE = 1 THEN 'Invoice'
	WHEN a.DOCTYPE = 2 THEN 'Finance Charge'
	WHEN a.DOCTYPE = 3 THEN 'Misc Charge'
	WHEN a.DOCTYPE = 4 THEN 'Return'
	WHEN a.DOCTYPE = 5 THEN 'Credit Memo'
	WHEN a.DOCTYPE = 6 THEN 'Payment'
END [Document Type],
a.VCHRNMBR [Voucher Number], DOCNUMBR [Document Number], BACHNUMB [Batch Number], CONVERT(DATE, a.DOCDATE, 101) [Document Date], 
CONVERT(DATE, DUEDATE, 101) [Due Date], CONVERT(DATE, POSTEDDT, 1) [Posted Date], CONVERT(DATE, a.PSTGDATE, 101) [Posting Date], a.TRXDSCRN Description,
CONVERT(MONEY, DOCAMNT, 1) [Document Amount], CONVERT(MONEY, PRCHAMNT, 1) [Purchase Amount], c.APTVCHNM [Applied to Voucher], c.APTODCNM [Applied to Doc Name]

FROM MGMT.dbo.PM30200 a JOIN MGMT.dbo.PM00200 b ON a.VENDORID = b.VENDORID
				  LEFT JOIN MGMT.dbo.PM30300 c ON a.VCHRNMBR = c.VCHRNMBR

WHERE POSTEDDT > '05-24-2015'	--select Sunday before last for lookback period 
AND VOIDED = 0

UNION ALL

SELECT db_name(DB_ID('MI')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name],
CASE
	WHEN a.DOCTYPE = 1 THEN 'Invoice'
	WHEN a.DOCTYPE = 2 THEN 'Finance Charge'
	WHEN a.DOCTYPE = 3 THEN 'Misc Charge'
	WHEN a.DOCTYPE = 4 THEN 'Return'
	WHEN a.DOCTYPE = 5 THEN 'Credit Memo'
	WHEN a.DOCTYPE = 6 THEN 'Payment'
END [Document Type],
a.VCHRNMBR [Voucher Number], DOCNUMBR [Document Number], BACHNUMB [Batch Number], CONVERT(DATE, a.DOCDATE, 101) [Document Date], 
CONVERT(DATE, DUEDATE, 101) [Due Date], CONVERT(DATE, POSTEDDT, 1) [Posted Date], CONVERT(DATE, a.PSTGDATE, 101) [Posting Date], a.TRXDSCRN Description,
CONVERT(MONEY, DOCAMNT, 1) [Document Amount], CONVERT(MONEY, PRCHAMNT, 1) [Purchase Amount], c.APTVCHNM [Applied to Voucher], c.APTODCNM [Applied to Doc Name]

FROM MI.dbo.PM30200 a JOIN MI.dbo.PM00200 b ON a.VENDORID = b.VENDORID
				  LEFT JOIN MI.dbo.PM30300 c ON a.VCHRNMBR = c.VCHRNMBR

WHERE POSTEDDT > '05-24-2015'	--select Sunday before last for lookback period 
AND VOIDED = 0

UNION ALL

SELECT db_name(DB_ID('SHIRL')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name],
CASE
	WHEN a.DOCTYPE = 1 THEN 'Invoice'
	WHEN a.DOCTYPE = 2 THEN 'Finance Charge'
	WHEN a.DOCTYPE = 3 THEN 'Misc Charge'
	WHEN a.DOCTYPE = 4 THEN 'Return'
	WHEN a.DOCTYPE = 5 THEN 'Credit Memo'
	WHEN a.DOCTYPE = 6 THEN 'Payment'
END [Document Type],
a.VCHRNMBR [Voucher Number], DOCNUMBR [Document Number], BACHNUMB [Batch Number], CONVERT(DATE, a.DOCDATE, 101) [Document Date], 
CONVERT(DATE, DUEDATE, 101) [Due Date], CONVERT(DATE, POSTEDDT, 1) [Posted Date], CONVERT(DATE, a.PSTGDATE, 101) [Posting Date], a.TRXDSCRN Description,
CONVERT(MONEY, DOCAMNT, 1) [Document Amount], CONVERT(MONEY, PRCHAMNT, 1) [Purchase Amount], c.APTVCHNM [Applied to Voucher], c.APTODCNM [Applied to Doc Name]

FROM SHIRL.dbo.PM30200 a JOIN SHIRL.dbo.PM00200 b ON a.VENDORID = b.VENDORID
				  LEFT JOIN SHIRL.dbo.PM30300 c ON a.VCHRNMBR = c.VCHRNMBR

WHERE POSTEDDT > '05-24-2015'	--select Sunday before last for lookback period 
AND VOIDED = 0

UNION ALL

SELECT db_name(DB_ID('REI')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name],
CASE
	WHEN a.DOCTYPE = 1 THEN 'Invoice'
	WHEN a.DOCTYPE = 2 THEN 'Finance Charge'
	WHEN a.DOCTYPE = 3 THEN 'Misc Charge'
	WHEN a.DOCTYPE = 4 THEN 'Return'
	WHEN a.DOCTYPE = 5 THEN 'Credit Memo'
	WHEN a.DOCTYPE = 6 THEN 'Payment'
END [Document Type],
a.VCHRNMBR [Voucher Number], DOCNUMBR [Document Number], BACHNUMB [Batch Number], CONVERT(DATE, a.DOCDATE, 101) [Document Date], 
CONVERT(DATE, DUEDATE, 101) [Due Date], CONVERT(DATE, POSTEDDT, 1) [Posted Date], CONVERT(DATE, a.PSTGDATE, 101) [Posting Date], a.TRXDSCRN Description,
CONVERT(MONEY, DOCAMNT, 1) [Document Amount], CONVERT(MONEY, PRCHAMNT, 1) [Purchase Amount], c.APTVCHNM [Applied to Voucher], c.APTODCNM [Applied to Doc Name]

FROM REI.dbo.PM30200 a JOIN REI.dbo.PM00200 b ON a.VENDORID = b.VENDORID
				  LEFT JOIN REI.dbo.PM30300 c ON a.VCHRNMBR = c.VCHRNMBR

WHERE POSTEDDT > '05-24-2015'	--select Sunday before last for lookback period 
AND VOIDED = 0

UNION ALL

SELECT db_name(DB_ID('REII')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name],
CASE
	WHEN a.DOCTYPE = 1 THEN 'Invoice'
	WHEN a.DOCTYPE = 2 THEN 'Finance Charge'
	WHEN a.DOCTYPE = 3 THEN 'Misc Charge'
	WHEN a.DOCTYPE = 4 THEN 'Return'
	WHEN a.DOCTYPE = 5 THEN 'Credit Memo'
	WHEN a.DOCTYPE = 6 THEN 'Payment'
END [Document Type],
a.VCHRNMBR [Voucher Number], DOCNUMBR [Document Number], BACHNUMB [Batch Number], CONVERT(DATE, a.DOCDATE, 101) [Document Date], 
CONVERT(DATE, DUEDATE, 101) [Due Date], CONVERT(DATE, POSTEDDT, 1) [Posted Date], CONVERT(DATE, a.PSTGDATE, 101) [Posting Date], a.TRXDSCRN Description,
CONVERT(MONEY, DOCAMNT, 1) [Document Amount], CONVERT(MONEY, PRCHAMNT, 1) [Purchase Amount], c.APTVCHNM [Applied to Voucher], c.APTODCNM [Applied to Doc Name]

FROM REII.dbo.PM30200 a JOIN REII.dbo.PM00200 b ON a.VENDORID = b.VENDORID
				  LEFT JOIN REII.dbo.PM30300 c ON a.VCHRNMBR = c.VCHRNMBR

WHERE POSTEDDT > '05-24-2015'	--select Sunday before last for lookback period 
AND VOIDED = 0

ORDER BY b.VENDNAME, [Document Date]