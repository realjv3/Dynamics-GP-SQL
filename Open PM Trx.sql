SELECT db_name() Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name], 
CASE
	WHEN DOCTYPE = 1 THEN 'Invoice'
	WHEN DOCTYPE = 2 THEN 'Finance Charge'
	WHEN DOCTYPE = 3 THEN 'Misc Charge'
	WHEN DOCTYPE = 4 THEN 'Return'
	WHEN DOCTYPE = 5 THEN 'Credit Memo'
	WHEN DOCTYPE = 6 THEN 'Payment'
END [Document Type],
VCHRNMBR [Voucher Number], BACHNUMB [Batch Number],CONVERT(DATE, DOCDATE, 101) [Document Date], CONVERT(DATE, DUEDATE, 101) [Due Date], 
DOCNUMBR [Document Number], POSTEDDT [Posted Date], PTDUSRID [Posted By],
CASE
	WHEN a.hold = 0 THEN ' '
	WHEN a.hold = 1 THEN 'HOLD'
END Hold,
a.TRXDSCRN Description, CONVERT(MONEY, DOCAMNT, 1) [Original Amt],  CONVERT(MONEY, a.CURTRXAM, 1) [Unapplied Amt]
FROM PM20000 a JOIN PM00200 b ON a.VENDORID = b.VENDORID
AND VOIDED = 0