/*
Selecting for active employees with 30 or more average hours per pay period, and their active medical deductions
*/


create table ##1 (employid int, trxbegdt datetime, untstopy float); --using this temp table for sum of employee's hours, one row per pay period
CREATE TABLE ##2 (EMPLOYID INT, BUYUPF CHAR(6), BUYUPS CHAR (6), COREF CHAR(5), CORES CHAR(5), DFHR CHAR(4), DFS CHAR(3), DSHR CHAR(4), DSS CHAR(3), VFHR CHAR(4), VFS CHAR(3), VSHR CHAR(4), VSS CHAR(3)); --using this table for pivoted medical deductions per employee

WITH PivotData AS	--create CTE with grouping, spread and aggregation fields; spreading and aggregation fields happen to be the same in this case - DEDUCTON
(
SELECT
EMPLOYID,
DEDUCTON
FROM upr00500
WHERE INACTIVE = 0
AND DEDUCtON IN ('BUYUPF', 'BUYUPS', 'COREF', 'CORES', 'DFHR', 'DFS', 'DSHR', 'DSS', 'VFHR', 'VFS', 'VSHR', 'VSS')
)

INSERT INTO ##2
SELECT *			--Pivot the fields from the CTE
FROM PivotData
PIVOT( MAX(DEDUCTON)	
	FOR DEDUCTON IN ([BUYUPF], [BUYUPS], [COREF], [CORES], [DFHR], [DFS], [DSHR], [DSS], [VFHR], [VFS], [VSHR], [VSS]) ) AS P;


INSERT INTO ##1		--inserting into temp table for sum of employee's hours, one row per pay period
SELECT a.employid, a.trxbegdt, sum(a.untstopy)
FROM upr30300 a join upr00100 b on a.employid = b.employid 
WHERE trxbegdt > '2014-02-09'
AND b.inactive = 0 
AND untstopy > 0
GROUP BY a.employid, a.trxbegdt

SELECT DB_NAME() [Company], b.deprtmnt, a.employid, b.jobtitle,
CASE 
      WHEN b.EMPLOYMENTTYPE = 1 THEN 'Full Time Regular' 
      WHEN b.EMPLOYMENTTYPE = 2 THEN 'Full Time Temp'
	  WHEN b.EMPLOYMENTTYPE = 3 THEN 'Part Time Regular'
	  WHEN b.EMPLOYMENTTYPE = 4 THEN 'Part Time Temp'
	  WHEN b.EMPLOYMENTTYPE = 5 THEN 'Intern'
	  WHEN b.EMPLOYMENTTYPE = 6 THEN 'Other' 
   END AS [Employment Type],
b.frstname, b.lastname, CONVERT(DATE, b.BRTHDATE,101) AS DOB, 
CASE 
      WHEN b.GENDER = 1 THEN 'Male' 
      WHEN b.GENDER = 2 THEN 'Female'
   END AS Gender, 
CONVERT(DATE, b.STRTDATE,101) AS [Hire Date], 
ROUND(AVG(a.untstopy), 2) AS [AVG Hours PPP], c.ZIPCODE, d.BUYUPF [BuyUp Fam],
d.BUYUPS [BuyUp Sng], d.COREF [Core Fam], d.CORES [Core Sng], 
d.DFHR [Dental Fam Hrly], d.DFS [Dental Fam Salry], d.DSHR [Dental Sng Hrly], d.DSS [Dental Dng Salry], 
d.VFHR [Vision Fam Hrly], d.VFS [Vision Fam Salry], d.VSHR [Vision Sng Hrly], d.VSS [Vision Sng Salry]

from ##1 a join upr00100 b on a.employid = b.employid 
		   JOIN UPR00102 c ON a.employid = c.EMPLOYID
		   LEFT JOIN ##2 d ON a.employid = d.EMPLOYID	--using left join because not all active employees in ##1 are in ##2 (only empl. with med deds. are in ##2) 

--have to put all fields in 'group by' clause b/c using avg() on units to pay field; if one field gets aggregated, all fields get aggregated		
GROUP BY a.employid, b.frstname, b.lastname, b.BRTHDATE, b.EMPLOYMENTTYPE, b.deprtmnt, b.jobtitle, b.GENDER, b.STRTDATE, c.ZIPCODE,
d.BUYUPF, d.BUYUPS, d.COREF, d.CORES, d.DFHR, d.DFS, d.DSHR, d.DSS, d.VFHR, d.VFS, d.VSHR, d.VSS

HAVING AVG(a.untstopy) >= 30	--WHERE can't use aggregate function, so using HAVING instead

--cleanup, dropping temporary tables
drop table ##1
drop table ##2