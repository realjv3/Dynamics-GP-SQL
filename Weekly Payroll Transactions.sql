--setting these variables so fields between these UNION ALL'd queries are the same data types
DECLARE @TRXBEGDT date; SET @TRXBEGDT = '02-09-2015'; --MANUALLY SET DATE get pay period begin date from first query
DECLARE @TRXENDDT date; SET @TRXENDDT = '02-15-2015'; --MANUALLY SET DATE get pay period end date from first query
DECLARE @UNTSTOPY numeric; SET @UNTSTOPY = 0;
DECLARE @PAYRATE numeric; SET @PAYRATE = 0;

/*Getting employee & pay trx fields for all pertinent pay datte, without federal tax codes*/

SELECT 'Company' = DB_NAME(), b.DEPRTMNT, a.EMPLOYID, b.FRSTNAME, b.LASTNAME, 
a.CHEKNMBR, CONVERT(DATE, a.CHEKDATE, 101) AS Checkdate, a.PYRLRTYP ,a.PAYROLCD, CONVERT(DATE, a.TRXBEGDT, 101) AS [Pay period begin], CONVERT(DATE, a.TRXENDDT, 101) AS [Pay period end], a.UNTSTOPY, a.PAYRATE, a.UPRTRXAM
FROM UPR30300 a JOIN UPR00100 b 
	ON a.EMPLOYID = b.EMPLOYID
WHERE a.CHEKDATE >= '02-16-2015'	--from Monday to Sunday MANUALLY SET DATE 
AND a.CHEKDATE < '02-22-2015'

UNION ALL

/*Getting employee & pay trx fields (only b/c # of columns must be the same for UNIONs) and federal income tax withheld*/

SELECT 'Company' = DB_NAME(), b.DEPRTMNT, a.EMPLOYID, b.FRSTNAME, b.LASTNAME,  
a.CHEKNMBR, CONVERT(DATE, a.CHEKDATE, 101) AS Checkdate, '6' PYRLRTYP, 'FED' PAYROLCD, @TRXBEGDT TRXBEGDT, @TRXENDDT TRXENDDT, @UNTSTOPY UNTSTOPY, @PAYRATE PAYRATE, a.FDWDGPRN + a.FDTXTIPS UPRTRXAM
FROM UPR30100 a JOIN UPR00100 b 
	ON a.EMPLOYID = b.EMPLOYID					
WHERE a.CHEKDATE >='02-16-2015'	--from Monday to Sunday MANUALLY SET DATE 
AND a.CHEKDATE <'02-22-2015'

UNION ALL

/*Getting employee & pay trx fields (only b/c # of columns must be the same for UNIONs) and fica medicare tax withheld*/

SELECT 'Company' = DB_NAME(), b.DEPRTMNT, a.EMPLOYID, b.FRSTNAME, b.LASTNAME,  
a.CHEKNMBR, CONVERT(DATE, a.CHEKDATE, 101) AS Checkdate, '6' PYRLRTYP, 'FICAM' PAYROLCD, @TRXBEGDT TRXBEGDT, @TRXENDDT TRXENDDT, @UNTSTOPY UNTSTOPY, @PAYRATE PAYRATE, a.FICAMWPR + a.FICMTPTX UPRTRXAM
FROM UPR30100 a JOIN UPR00100 b 
	ON a.EMPLOYID = b.EMPLOYID					
WHERE a.CHEKDATE >='02-16-2015'	--from Monday to Sunday MANUALLY SET DATE 
AND a.CHEKDATE <'02-22-2015'

UNION ALL

/*Getting employee & pay trx fields (only b/c # of columns must be the same for UNIONs) and fica social security tax withheld*/

SELECT 'Company' = DB_NAME(), b.DEPRTMNT, a.EMPLOYID, b.FRSTNAME, b.LASTNAME,  
a.CHEKNMBR, CONVERT(DATE, a.CHEKDATE, 101) AS Checkdate, '6' PYRLRTYP, 'FICAS' PAYROLCD, @TRXBEGDT TRXBEGDT, @TRXENDDT TRXENDDT, @UNTSTOPY UNTSTOPY, @PAYRATE PAYRATE, a.FCASWPR + a.FICSTPTX UPRTRXAM
FROM UPR30100 a JOIN UPR00100 b 
	ON a.EMPLOYID = b.EMPLOYID					
WHERE a.CHEKDATE >='02-16-2015'	--from Monday to Sunday MANUALLY SET DATE 
AND a.CHEKDATE <'02-22-2015'

UNION ALL

/*Getting employee & pay trx fields (only b/c # of columns must be the same for UNIONs) and employer fica medicare tax liability*/

SELECT 'Company' = DB_NAME(), b.DEPRTMNT, a.EMPLOYID, b.FRSTNAME, b.LASTNAME,  
a.CHEKNMBR, CONVERT(DATE, a.CHEKDATE, 101) AS Checkdate, '7' PYRLRTYP, 'EFICAM' PAYROLCD, @TRXBEGDT TRXBEGDT, @TRXENDDT TRXENDDT, @UNTSTOPY UNTSTOPY, @PAYRATE PAYRATE, a.EFICAMed_Tax_On_Tips + a.EFICAMWPR + a.Uncollected_FICAMed_TaxP UPRTRXAM
FROM UPR30100 a JOIN UPR00100 b 
	ON a.EMPLOYID = b.EMPLOYID					
WHERE a.CHEKDATE >='02-16-2015'	--from Monday to Sunday MANUALLY SET DATE 
AND a.CHEKDATE <'02-22-2015'

UNION ALL

/*Getting employee & pay trx fields (only b/c # of columns must be the same for UNIONs) and employer fica social security tax liability*/

SELECT 'Company' = DB_NAME(), b.DEPRTMNT, a.EMPLOYID, b.FRSTNAME, b.LASTNAME,  
a.CHEKNMBR, CONVERT(DATE, a.CHEKDATE, 101) AS Checkdate, '7' PYRLRTYP, 'EFICAS' PAYROLCD, @TRXBEGDT TRXBEGDT, @TRXENDDT TRXENDDT, @UNTSTOPY UNTSTOPY, @PAYRATE PAYRATE, a.EFICASS_Tax_On_Tips + a.EFICASSWH + a.Uncollected_FICASS_TaxP UPRTRXAM
FROM UPR30100 a JOIN UPR00100 b 
	ON a.EMPLOYID = b.EMPLOYID					
WHERE a.CHEKDATE >='02-16-2015'	--from Monday to Sunday MANUALLY SET DATE 
AND a.CHEKDATE <'02-22-2015'

ORDER BY a.EMPLOYID, a.CHEKNMBR