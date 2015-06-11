--setting these variables so fields between these UNION ALL'd queries are the same data types
DECLARE @TRXBEGDT date; SET @TRXBEGDT = '05-27-2015'; --MANUALLY SET DATE get pay period begin date from first query
DECLARE @TRXENDDT date; SET @TRXENDDT = '06-02-2015'; --MANUALLY SET DATE get pay period end date from first query
DECLARE @UNTSTOPY numeric; SET @UNTSTOPY = 0;
DECLARE @PAYRATE numeric; SET @PAYRATE = 0;

/*Getting employee & pay trx fields for all pertinent pay date, without federal tax codes*/

SELECT 'Company' = DB_NAME(), b.DEPRTMNT, a.EMPLOYID, b.FRSTNAME, b.LASTNAME, 
a.CHEKNMBR, CONVERT(DATE, a.CHEKDATE, 101) AS Checkdate, a.PYRLRTYP ,a.PAYROLCD, CONVERT(DATE, a.TRXBEGDT, 101) AS [Pay period begin], CONVERT(DATE, a.TRXENDDT, 101) AS [Pay period end], a.UNTSTOPY, 
CONVERT(MONEY, a.PAYRATE) AS Rate, CONVERT(MONEY, a.UPRTRXAM) AS Amount
FROM UPR30300 a JOIN UPR00100 b 
	ON a.EMPLOYID = b.EMPLOYID
WHERE a.CHEKDATE >= '06-08-2015'	--from Monday to Sunday MANUALLY SET DATE 
AND a.CHEKDATE < '06-14-2015'

UNION ALL

/*Getting employee & pay trx fields (only b/c # of columns must be the same for UNIONs) and federal income tax withheld*/

SELECT 'Company' = DB_NAME(), b.DEPRTMNT, a.EMPLOYID, b.FRSTNAME, b.LASTNAME,  
a.CHEKNMBR, CONVERT(DATE, a.CHEKDATE, 101) AS Checkdate, '6' PYRLRTYP, 'FED' PAYROLCD, @TRXBEGDT TRXBEGDT, @TRXENDDT TRXENDDT, @UNTSTOPY UNTSTOPY, 
CONVERT(MONEY, @PAYRATE) AS Rate, CONVERT(MONEY, a.FDWDGPRN + a.FDTXTIPS) AS Amount
FROM UPR30100 a JOIN UPR00100 b 
	ON a.EMPLOYID = b.EMPLOYID					
WHERE a.CHEKDATE >='06-08-2015'	--from Monday to Sunday MANUALLY SET DATE 
AND a.CHEKDATE <'06-14-2015'

UNION ALL

/*Getting employee & pay trx fields (only b/c # of columns must be the same for UNIONs) and fica medicare tax withheld*/

SELECT 'Company' = DB_NAME(), b.DEPRTMNT, a.EMPLOYID, b.FRSTNAME, b.LASTNAME,  
a.CHEKNMBR, CONVERT(DATE, a.CHEKDATE, 101) AS Checkdate, '6' PYRLRTYP, 'FICAM' PAYROLCD, @TRXBEGDT TRXBEGDT, @TRXENDDT TRXENDDT, @UNTSTOPY UNTSTOPY, 
CONVERT(MONEY, @PAYRATE) AS Rate, CONVERT(MONEY, a.FICAMWPR + a.FICMTPTX) AS Amount
FROM UPR30100 a JOIN UPR00100 b 
	ON a.EMPLOYID = b.EMPLOYID					
WHERE a.CHEKDATE >='06-08-2015'	--from Monday to Sunday MANUALLY SET DATE 
AND a.CHEKDATE <'06-14-2015'

UNION ALL

/*Getting employee & pay trx fields (only b/c # of columns must be the same for UNIONs) and fica social security tax withheld*/

SELECT 'Company' = DB_NAME(), b.DEPRTMNT, a.EMPLOYID, b.FRSTNAME, b.LASTNAME,  
a.CHEKNMBR, CONVERT(DATE, a.CHEKDATE, 101) AS Checkdate, '6' PYRLRTYP, 'FICAS' PAYROLCD, @TRXBEGDT TRXBEGDT, @TRXENDDT TRXENDDT, @UNTSTOPY UNTSTOPY, 
CONVERT(MONEY, @PAYRATE) AS Rate, CONVERT(MONEY, a.FCASWPR + a.FICSTPTX) AS Amount
FROM UPR30100 a JOIN UPR00100 b 
	ON a.EMPLOYID = b.EMPLOYID					
WHERE a.CHEKDATE >='06-08-2015'	--from Monday to Sunday MANUALLY SET DATE 
AND a.CHEKDATE <'06-14-2015'

UNION ALL

/*Getting employee & pay trx fields (only b/c # of columns must be the same for UNIONs) and employer fica medicare tax liability*/

SELECT 'Company' = DB_NAME(), b.DEPRTMNT, a.EMPLOYID, b.FRSTNAME, b.LASTNAME,  
a.CHEKNMBR, CONVERT(DATE, a.CHEKDATE, 101) AS Checkdate, '7' PYRLRTYP, 'EFICAM' PAYROLCD, @TRXBEGDT TRXBEGDT, @TRXENDDT TRXENDDT, @UNTSTOPY UNTSTOPY, 
CONVERT(MONEY, @PAYRATE) AS Rate, CONVERT(MONEY, a.EFICAMed_Tax_On_Tips + a.EFICAMWPR + a.Uncollected_FICAMed_TaxP) AS Amount
FROM UPR30100 a JOIN UPR00100 b 
	ON a.EMPLOYID = b.EMPLOYID					
WHERE a.CHEKDATE >='06-08-2015'	--from Monday to Sunday MANUALLY SET DATE 
AND a.CHEKDATE <'06-14-2015'

UNION ALL

/*Getting employee & pay trx fields (only b/c # of columns must be the same for UNIONs) and employer fica social security tax liability*/

SELECT 'Company' = DB_NAME(), b.DEPRTMNT, a.EMPLOYID, b.FRSTNAME, b.LASTNAME,  
a.CHEKNMBR, CONVERT(DATE, a.CHEKDATE, 101) AS Checkdate, '7' PYRLRTYP, 'EFICAS' PAYROLCD, @TRXBEGDT TRXBEGDT, @TRXENDDT TRXENDDT, @UNTSTOPY UNTSTOPY, 
CONVERT(MONEY, @PAYRATE) AS Rate, CONVERT(MONEY, a.EFICASS_Tax_On_Tips + a.EFICASSWH + a.Uncollected_FICASS_TaxP ) AS Amount
FROM UPR30100 a JOIN UPR00100 b 
	ON a.EMPLOYID = b.EMPLOYID					
WHERE a.CHEKDATE >='06-08-2015'	--from Monday to Sunday MANUALLY SET DATE 
AND a.CHEKDATE <'06-14-2015'

ORDER BY a.EMPLOYID, a.CHEKNMBR