--setting these variables so fields between these UNION ALL'd queries are the same data types
DECLARE @TRXBEGDT datetime; SET @TRXBEGDT = '01-28-2015'; --MANUALLY SET DATE get pay period begin date from first query
DECLARE @TRXENDDT datetime; SET @TRXENDDT = '02-03-2015'; --MANUALLY SET DATE get pay period end date from first query
DECLARE @UNTSTOPY numeric; SET @UNTSTOPY = 0;
DECLARE @PAYRATE numeric; SET @PAYRATE = 0;

/*Getting employee & pay trx fields for all pertinent pay datte, without federal tax codes*/

SELECT 'Company' = DB_NAME(), b.DEPRTMNT, a.EMPLOYID, b.FRSTNAME, b.LASTNAME, 
a.CHEKNMBR, a.CHEKDATE, a.PYRLRTYP ,a.PAYROLCD, a.TRXBEGDT, a.TRXENDDT, a.UNTSTOPY, a.PAYRATE, a.UPRTRXAM
FROM UPR30300 a JOIN UPR00100 b 
	ON a.EMPLOYID = b.EMPLOYID
WHERE a.CHEKDATE >= '02-09-2015'	--from Monday to Sunday MANUALLY SET DATE 
AND a.CHEKDATE < '02-15-2015'

UNION ALL

/*Getting employee & pay trx fields (only b/c # of columns must be the same for UNIONs) and federal income tax withheld*/

SELECT 'Company' = DB_NAME(), b.DEPRTMNT, a.EMPLOYID, b.FRSTNAME, b.LASTNAME,  
a.CHEKNMBR, a.CHEKDATE, '6' PYRLRTYP, 'FED' PAYROLCD, @TRXBEGDT TRXBEGDT, @TRXENDDT TRXENDDT, @UNTSTOPY UNTSTOPY, @PAYRATE PAYRATE, a.FDWDGPRN + a.FDTXTIPS UPRTRXAM
FROM UPR30100 a JOIN UPR00100 b 
	ON a.EMPLOYID = b.EMPLOYID					
WHERE a.CHEKDATE >='02-09-2015'	--from Monday to Sunday MANUALLY SET DATE 
AND a.CHEKDATE <'02-15-2015'

UNION ALL

/*Getting employee & pay trx fields (only b/c # of columns must be the same for UNIONs) and fica medicare tax withheld*/

SELECT 'Company' = DB_NAME(), b.DEPRTMNT, a.EMPLOYID, b.FRSTNAME, b.LASTNAME,  
a.CHEKNMBR, a.CHEKDATE, '6' PYRLRTYP, 'FICAM' PAYROLCD, @TRXBEGDT TRXBEGDT, @TRXENDDT TRXENDDT, @UNTSTOPY UNTSTOPY, @PAYRATE PAYRATE, a.FICAMWPR + a.FICMTPTX UPRTRXAM
FROM UPR30100 a JOIN UPR00100 b 
	ON a.EMPLOYID = b.EMPLOYID					
WHERE a.CHEKDATE >='02-09-2015'	--from Monday to Sunday MANUALLY SET DATE 
AND a.CHEKDATE <'02-15-2015'

UNION ALL

/*Getting employee & pay trx fields (only b/c # of columns must be the same for UNIONs) and fica social security tax withheld*/

SELECT 'Company' = DB_NAME(), b.DEPRTMNT, a.EMPLOYID, b.FRSTNAME, b.LASTNAME,  
a.CHEKNMBR, a.CHEKDATE, '6' PYRLRTYP, 'FICAS' PAYROLCD, @TRXBEGDT TRXBEGDT, @TRXENDDT TRXENDDT, @UNTSTOPY UNTSTOPY, @PAYRATE PAYRATE, a.FCASWPR + a.FICSTPTX UPRTRXAM
FROM UPR30100 a JOIN UPR00100 b 
	ON a.EMPLOYID = b.EMPLOYID					
WHERE a.CHEKDATE >='02-09-2015'	--from Monday to Sunday MANUALLY SET DATE 
AND a.CHEKDATE <'02-15-2015'

UNION ALL

/*Getting employee & pay trx fields (only b/c # of columns must be the same for UNIONs) and employer fica medicare tax liability*/

SELECT 'Company' = DB_NAME(), b.DEPRTMNT, a.EMPLOYID, b.FRSTNAME, b.LASTNAME,  
a.CHEKNMBR, a.CHEKDATE, '7' PYRLRTYP, 'EFICAM' PAYROLCD, @TRXBEGDT TRXBEGDT, @TRXENDDT TRXENDDT, @UNTSTOPY UNTSTOPY, @PAYRATE PAYRATE, a.EFICAMed_Tax_On_Tips + a.EFICAMWPR + a.Uncollected_FICAMed_TaxP UPRTRXAM
FROM UPR30100 a JOIN UPR00100 b 
	ON a.EMPLOYID = b.EMPLOYID					
WHERE a.CHEKDATE >='02-09-2015'	--from Monday to Sunday MANUALLY SET DATE 
AND a.CHEKDATE <'02-15-2015'

UNION ALL

/*Getting employee & pay trx fields (only b/c # of columns must be the same for UNIONs) and employer fica social security tax liability*/

SELECT 'Company' = DB_NAME(), b.DEPRTMNT, a.EMPLOYID, b.FRSTNAME, b.LASTNAME,  
a.CHEKNMBR, a.CHEKDATE, '7' PYRLRTYP, 'EFICAS' PAYROLCD, @TRXBEGDT TRXBEGDT, @TRXENDDT TRXENDDT, @UNTSTOPY UNTSTOPY, @PAYRATE PAYRATE, a.EFICASS_Tax_On_Tips + a.EFICASSWH + a.Uncollected_FICASS_TaxP UPRTRXAM
FROM UPR30100 a JOIN UPR00100 b 
	ON a.EMPLOYID = b.EMPLOYID					
WHERE a.CHEKDATE >='02-09-2015'	--from Monday to Sunday MANUALLY SET DATE 
AND a.CHEKDATE <'02-15-2015'

ORDER BY a.EMPLOYID, a.CHEKNMBR