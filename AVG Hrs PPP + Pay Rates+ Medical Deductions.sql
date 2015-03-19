/*
Selecting for active employees 
with 30 or more average hours per pay period, 
and their active medical deductions,
and their active pay codes and pay rates
and their 2014 gross
*/


CREATE TABLE ##1 (employid int, trxbegdt datetime, untstopy float); --using this temp table for sum of employee's hours, one row per pay period
CREATE TABLE ##2 (EMPLOYID INT, BUYUPF CHAR(6), BUYUPS CHAR (6), COREF CHAR(5), CORES CHAR(5), DFHR CHAR(4), DFS CHAR(3), DSHR CHAR(4), DSS CHAR(3), VFHR CHAR(4), VFS CHAR(3), VSHR CHAR(4), VSS CHAR(3)); --using this table for pivoted medical deductions per employee
CREATE TABLE ##3 (EMPLOYID INT, SAL DECIMAL (19,2), RG DECIMAL (19,2), R3 DECIMAL (19,2), R4 DECIMAL (19,2)); --using this table for pivoted pay codes/rates


WITH PivotMed AS	--create CTE with grouping, spread and aggregation fields; spreading and aggregation fields happen to be the same in this case - DEDUCTON
(					--this is to get and then pivot employees' active medical deductions
SELECT
EMPLOYID, DEDUCTON
FROM upr00500
WHERE INACTIVE = 0
AND DEDUCtON IN ('BUYUPF', 'BUYUPS', 'COREF', 'CORES', 'DFHR', 'DFS', 'DSHR', 'DSS', 'VFHR', 'VFS', 'VSHR', 'VSS')
)

INSERT INTO ##2
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

INSERT INTO ##3		--Pivot the fields from the PivotPay CTE
SELECT *
FROM PivotPay
PIVOT( MAX(PAYRTAMT)
		FOR PAYRCORD in([SAL], [RG], [R3], [R4])) AS PP;

INSERT INTO ##1		--inserting into a temp table for sum of employee's hours, one row per pay period; the sum of hours will then be averaged in below main select statement
SELECT a.employid, a.trxbegdt, sum(a.untstopy)
FROM upr30300 a join upr00100 b on a.employid = b.employid 
WHERE trxbegdt > '2014-03-01'								--SPECIFY HERE FROM WHICH DATE YOU WANT EMPLOYEES HOURS AVERAGED
AND b.inactive = 0 
AND untstopy > 0
GROUP BY a.employid, a.trxbegdt;

WITH GROSS AS
(
SELECT EMPLOYID, WGTPCOMP
FROM UPR10101
WHERE RPTNGYR = 2014
)

SELECT DB_NAME() [Company], b.deprtmnt, a.employid, b.jobtitle,
b.frstname, b.lastname, CONVERT(DATE, b.BRTHDATE,101) AS DOB, 
CASE 
      WHEN b.GENDER = 1 THEN 'Male' 
      WHEN b.GENDER = 2 THEN 'Female'
   END AS Gender, 
CONVERT(DATE, b.STRTDATE,101) AS [Hire Date], 
ROUND(AVG(a.untstopy), 2) AS [AVG Hours PPP], c.ZIPCODE, CONVERT(MONEY, f.WGTPCOMP) AS [2014 Gross],
e.SAL [Salary], e.RG [RG - Regular Pay], e.R3 [R3 - Production Hourly Rate], e.R4 [R4 - Management Hourly Rate],
d.BUYUPF [BuyUp Fam],d.BUYUPS [BuyUp Sng], d.COREF [Core Fam], d.CORES [Core Sng], 
d.DFHR [Dental Fam Hrly], d.DFS [Dental Fam Salry], d.DSHR [Dental Sng Hrly], d.DSS [Dental Dng Salry], 
d.VFHR [Vision Fam Hrly], d.VFS [Vision Fam Salry], d.VSHR [Vision Sng Hrly], d.VSS [Vision Sng Salry]

from ##1 a JOIN UPR00100 b ON a.employid = b.employid 
		   JOIN UPR00102 c ON a.employid = c.EMPLOYID
	  LEFT JOIN ##2 d ON a.employid = d.EMPLOYID	--using left join because not all active employees in ##1 are in ##2 (only empl. with med deds. are in ##2) 
		   JOIN ##3 e ON a.employid = e.EMPLOYID
		   JOIN GROSS f ON a.employid = f.EMPLOYID

--have to put all fields in 'group by' clause b/c using avg() on units to pay field; if one field gets aggregated, all fields get aggregated		
GROUP BY a.employid, b.frstname, b.lastname, b.BRTHDATE, b.EMPLOYMENTTYPE, b.deprtmnt, b.jobtitle, b.GENDER, b.STRTDATE, c.ZIPCODE, f.WGTPCOMP,
d.BUYUPF, d.BUYUPS, d.COREF, d.CORES, d.DFHR, d.DFS, d.DSHR, d.DSS, d.VFHR, d.VFS, d.VSHR, d.VSS, e.SAL, e.RG, e.R3, e.R4

HAVING AVG(a.untstopy) >= 30	--WHERE can't use aggregate function, so using HAVING instead; EXCLUDING EVERYONE WITH LESS THEN AVG. 30 HOURS PPP

--cleanup, dropping temporary tables
DROP TABLE ##1
DROP TABLE ##2
DROP TABLE ##3