SELECT db_name(DB_ID('HAMPT')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name], VCHRNMBR [Voucher Number], BACHNUMB [Batch Number], DOCDATE [Document Date], DUEDATE [Due Date], 
DOCNUMBR [Document Number], DOCAMNT [Document Amount], DUEDATE [Due Date]
FROM HAMPT.dbo.PM20000 a JOIN HAMPT.dbo.PM00200 b ON a.VENDORID = b.VENDORID

UNION ALL

SELECT db_name(DB_ID('MGMT')) Company, a.VENDORID [Vendor ID], b.VENDNAME [Vendor Name], VCHRNMBR [Voucher Number], BACHNUMB [Batch Number], DOCDATE [Document Date], DUEDATE [Due Date], 
DOCNUMBR [Document Number], DOCAMNT [Document Amount], DUEDATE [Due Date]
FROM MGMT.dbo.PM20000 a JOIN MGMT.dbo.PM00200 b ON a.VENDORID = b.VENDORID

ORDER BY a.VENDORID, a.DOCDATE