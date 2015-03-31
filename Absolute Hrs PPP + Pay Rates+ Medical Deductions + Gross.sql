/**
* Selecting for active employees 
* with 30 or more average hours per pay period, 
* and their active medical deductions,
* and their active pay codes and pay rates
* and their 2014 gross
*
* Run this query once per company.	
*/


CREATE TABLE ##1 (SOCSCNUM CHAR(9), EMPLOYID INT, TRXBEGDT DATETIME, UNTSTOPY FLOAT);  --using this temp table for sum of employee's hours, one row per pay period
CREATE TABLE ##2 (SOCSCNUM CHAR(9), EMPLOYID INT, AbsAvgHrsPPP FLOAT)
CREATE TABLE ##3 (EMPLOYID INT, BUYUPF CHAR(6), BUYUPS CHAR (6), COREF CHAR(5), CORES CHAR(5), DFHR CHAR(4), DFS CHAR(3), DSHR CHAR(4), DSS CHAR(3), VFHR CHAR(4), VFS CHAR(3), VSHR CHAR(4), VSS CHAR(3)); --using this table for pivoted medical deductions per employee
CREATE TABLE ##4 (EMPLOYID INT, SAL DECIMAL (19,2), RG DECIMAL (19,2), R3 DECIMAL (19,2), R4 DECIMAL (19,2)); --using this table for pivoted pay codes/rates

INSERT INTO ##1		--inserting into a temp table for sum of all company's employees' hours, one row per pay period; the sum of hours will then be averaged in below main select statement from all companies
					--specifying lookback period and activ in WHERE clause

	SELECT b.socscnum, a.employid, a.trxbegdt, sum(a.untstopy) untstopy
	FROM FRI.dbo.upr30300 a JOIN FRI.dbo.upr00100 b on a.employid = b.employid 
	WHERE trxbegdt > '2014-03-31' AND b.inactive = 0 AND untstopy > 0
	GROUP BY b.socscnum, a.employid, a.trxbegdt

	UNION ALL

	SELECT b.socscnum, a.employid, a.trxbegdt, sum(a.untstopy) untstopy
	FROM FRII.dbo.upr30300 a JOIN FRII.dbo.upr00100 b on a.employid = b.employid 
	WHERE trxbegdt > '2014-03-31' AND b.inactive = 0 AND untstopy > 0
	GROUP BY b.socscnum, a.employid, a.trxbegdt

	UNION ALL

	SELECT b.socscnum, a.employid, a.trxbegdt, sum(a.untstopy) untstopy
	FROM FRNJ.dbo.upr30300 a JOIN FRNJ.dbo.upr00100 b on a.employid = b.employid 
	WHERE trxbegdt > '2014-03-31' AND b.inactive = 0 AND untstopy > 0
	GROUP BY b.socscnum, a.employid, a.trxbegdt

	UNION ALL

	SELECT b.socscnum, a.employid, a.trxbegdt, sum(a.untstopy) untstopy
	FROM HAMPT.dbo.upr30300 a JOIN HAMPT.dbo.upr00100 b on a.employid = b.employid 
	WHERE trxbegdt > '2014-03-31' AND b.inactive = 0 AND untstopy > 0
	GROUP BY b.socscnum, a.employid, a.trxbegdt

	UNION ALL

	SELECT b.socscnum, a.employid, a.trxbegdt, sum(a.untstopy) untstopy
	FROM JB.dbo.upr30300 a JOIN JB.dbo.upr00100 b on a.employid = b.employid 
	WHERE trxbegdt > '2014-03-31' AND b.inactive = 0 AND untstopy > 0
	GROUP BY b.socscnum, a.employid, a.trxbegdt

	UNION ALL

	SELECT b.socscnum, a.employid, a.trxbegdt, sum(a.untstopy) untstopy
	FROM MASPK.dbo.upr30300 a JOIN MASPK.dbo.upr00100 b on a.employid = b.employid 
	WHERE trxbegdt > '2014-03-31' AND b.inactive = 0 AND untstopy > 0
	GROUP BY b.socscnum, a.employid, a.trxbegdt

	UNION ALL

	SELECT b.socscnum, a.employid, a.trxbegdt, sum(a.untstopy) untstopy
	FROM MGMT.dbo.upr30300 a JOIN MGMT.dbo.upr00100 b on a.employid = b.employid 
	WHERE trxbegdt > '2014-03-31' AND b.inactive = 0 AND untstopy > 0
	GROUP BY b.socscnum, a.employid, a.trxbegdt

	UNION ALL

	SELECT b.socscnum, a.employid, a.trxbegdt, sum(a.untstopy) untstopy
	FROM MI.dbo.upr30300 a JOIN MI.dbo.upr00100 b on a.employid = b.employid 
	WHERE trxbegdt > '2014-03-31' AND b.inactive = 0 AND untstopy > 0
	GROUP BY b.socscnum, a.employid, a.trxbegdt

	UNION ALL

	SELECT b.socscnum, a.employid, a.trxbegdt, sum(a.untstopy) untstopy
	FROM NCC.dbo.upr30300 a JOIN NCC.dbo.upr00100 b on a.employid = b.employid 
	WHERE trxbegdt > '2014-03-31' AND b.inactive = 0 AND untstopy > 0
	GROUP BY b.socscnum, a.employid, a.trxbegdt

	UNION ALL

	SELECT b.socscnum, a.employid, a.trxbegdt, sum(a.untstopy) untstopy
	FROM SHIRL.dbo.upr30300 a JOIN SHIRL.dbo.upr00100 b on a.employid = b.employid 
	WHERE trxbegdt > '2014-03-31' AND b.inactive = 0 AND untstopy > 0
	GROUP BY b.socscnum, a.employid, a.trxbegdt

	ORDER BY b.SOCSCNUM, a.TRXBEGDT;

INSERT INTO ##2		--inserting into temp table absolute average of employee's hours, one row per employee per company; the average is multi-company;
	SELECT SOCSCNUM, EMPLOYID, AVG(UNTSTOPY)
	FROM ##1
	GROUP BY SOCSCNUM, EMPLOYID;

WITH PivotMed AS	--create CTE with grouping, spread and aggregation fields; spreading and aggregation fields happen to be the same in this case - DEDUCTON
(					--this is to get and then pivot employees' active medical deductions
SELECT
EMPLOYID, DEDUCTON
FROM upr00500
WHERE INACTIVE = 0
AND DEDUCtON IN ('BUYUPF', 'BUYUPS', 'COREF', 'CORES', 'DFHR', 'DFS', 'DSHR', 'DSS', 'VFHR', 'VFS', 'VSHR', 'VSS')
)

INSERT INTO ##3
	SELECT *			--Pivot the fields from the PivotMed CTE
	FROM PivotMed
	PIVOT( MAX(DEDUCTON)	
		FOR DEDUCTON IN ([BUYUPF], [BUYUPS], [COREF], [CORES], [DFHR], [DFS], [DSHR], [DSS], [VFHR], [VFS], [VSHR], [VSS]) ) AS P;

WITH PivotPay AS	--create CTE with grouping, spread and aggregation fields to get employees active pay codes amd pay rates
(
	SELECT EMPLOYID, PAYRCORD, PAYRTAMT	
	FROM UPR00400
	WHERE INACTIVE = 0
	AND PAYRCORD IN ('SAL', 'RG', 'R3', 'R4')
)

INSERT INTO ##4		--Pivot the fields from the PivotPay CTE
SELECT *
FROM PivotPay
PIVOT( MAX(PAYRTAMT)
		FOR PAYRCORD in([SAL], [RG], [R3], [R4])) AS PP;

WITH GROSS AS
(
	SELECT EMPLOYID, WGTPCOMP
	FROM UPR10101
	WHERE RPTNGYR = 2014
)

SELECT DB_NAME() Company, a.DEPRTMNT, a.SOCSCNUM, a.EMPLOYID, a.FRSTNAME, a.LASTNAME, a.JOBTITLE, CONVERT(DATE, a.BRTHDATE,101) AS DOB, b.ZIPCODE,
CASE 
      WHEN a.GENDER = 1 THEN 'Male' 
      WHEN a.GENDER = 2 THEN 'Female'
   END AS Gender, 
CONVERT(DATE, a.STRTDATE,101) AS [HIRE DATE], ROUND(##2.AbsAvgHrsPPP, 2) AS [Absolute AVG HOURS PPP], CONVERT(MONEY, GROSS.WGTPCOMP) AS [2014 GROSS],
##4.SAL [SALARY], ##4.RG [RG - REGULAR PAY], ##4.R3 [R3 - PRODUCTION HOURLY RATE], ##4.R4 [R4 - MANAGEMENT HOURLY RATE],
##3.BUYUPF [BUYUP FAM],##3.BUYUPS [BUYUP SNG], ##3.COREF [CORE FAM], ##3.CORES [CORE SNG], 
##3.DFHR [DENTAL FAM HRLY], ##3.DFS [DENTAL FAM SALRY], ##3.DSHR [DENTAL SNG HRLY], ##3.DSS [DENTAL DNG SALRY], 
##3.VFHR [VISION FAM HRLY], ##3.VFS [VISION FAM SALRY], ##3.VSHR [VISION SNG HRLY], ##3.VSS [VISION SNG SALRY]
FROM UPR00100 a JOIN UPR00102 b ON a.EMPLOYID = b.EMPLOYID 
		   LEFT JOIN ##2 ON a.SOCSCNUM = ##2.SOCSCNUM
		   LEFT	JOIN GROSS ON a.EMPLOYID = GROSS.EMPLOYID
				JOIN ##4 ON a.EMPLOYID = ##4.EMPLOYID
		   LEFT	JOIN ##3 ON a.EMPLOYID = ##3.EMPLOYID 
WHERE a.INACTIVE = 0

--cleanup, dropping temporary tables
DROP TABLE ##1
DROP TABLE ##2
DROP TABLE ##3
DROP TABLE ##4