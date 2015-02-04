/*
Selecting for active employees' average hours per pay period, and their active medical deductions
*/

create table ##1 (employid int, trxbegdt datetime, untstopy float); 

insert into ##1
select a.employid, a.trxbegdt, sum(a.untstopy)
from upr30300 a join upr00100 b on a.employid = b.employid 
where trxbegdt > '2013-12-26' and b.inactive = 0 and untstopy > 0
group by a.employid, a.trxbegdt

select DB_NAME() [Company], b.deprtmnt, a.employid, b.jobtitle, 
CASE 
      WHEN b.EMPLOYMENTTYPE = 1 THEN 'Full Time Regular' 
      WHEN b.EMPLOYMENTTYPE = 2 THEN 'Full Time Temp'
	  WHEN b.EMPLOYMENTTYPE = 3 THEN 'Part Time Regular'
	  WHEN b.EMPLOYMENTTYPE = 4 THEN 'Part Time Temp'
	  WHEN b.EMPLOYMENTTYPE = 5 THEN 'Intern'
	  WHEN b.EMPLOYMENTTYPE = 6 THEN 'Other' 
   END AS [Employment Type],
b.frstname, b.lastname, b.BRTHDATE, 
CASE 
      WHEN b.GENDER = 1 THEN 'Male' 
      WHEN b.GENDER = 2 THEN 'Female'
   END AS Gender, 
b.STRTDATE, avg(a.untstopy) [Avg Hours PPP], c.ZIPCODE, 'No Medical/Dental/Vision'

from ##1 a join upr00100 b on a.employid = b.employid 
		   JOIN UPR00102 c ON a.employid = c.EMPLOYID
	
WHERE b.INACTIVE = 0
		
group by a.employid, b.frstname, b.lastname, b.BRTHDATE, b.EMPLOYMENTTYPE, b.deprtmnt, b.jobtitle, b.GENDER, b.STRTDATE, c.ZIPCODE

UNION ALL

SELECT DB_NAME(), b.DEPRTMNT, a.EMPLOYID, b.JOBTITLE, 
CASE 
      WHEN b.EMPLOYMENTTYPE = 1 THEN 'Full Time Regular' 
      WHEN b.EMPLOYMENTTYPE = 2 THEN 'Full Time Temp'
	  WHEN b.EMPLOYMENTTYPE = 3 THEN 'Part Time Regular'
	  WHEN b.EMPLOYMENTTYPE = 4 THEN 'Part Time Temp'
	  WHEN b.EMPLOYMENTTYPE = 5 THEN 'Intern'
	  WHEN b.EMPLOYMENTTYPE = 6 THEN 'Other' 
   END AS [Employment Type], 
b.FRSTNAME, b.LASTNAME, b.BRTHDATE, 
CASE 
      WHEN b.GENDER = 1 THEN 'Male' 
      WHEN b.GENDER = 2 THEN 'Female'
   END AS Gender, 
b.STRTDATE, AVG(c.untstopy), d.ZIPCODE, a.DEDUCTON

FROM UPR00500 a JOIN UPR00100 b ON a.EMPLOYID = b.EMPLOYID
				JOIN ##1 c ON a.EMPLOYID = c.employid
				JOIN UPR00102 d ON a.EMPLOYID = d.EMPLOYID

WHERE a.DEDUCTON IN ('BUYUPF', 'BUYUPS', 'COREF', 'CORES', 'DFHR', 'DFS', 'DSHR', 'DSS', 'VFHR', 'VFS', 'VSHR', 'VSS')
AND a.INACTIVE = 0
AND b.INACTIVE = 0

GROUP BY b.DEPRTMNT, a.EMPLOYID, b.JOBTITLE, b.EMPLOYMENTTYPE, b.FRSTNAME, b.LASTNAME, b.BRTHDATE, b.GENDER, b.STRTDATE, d.ZIPCODE, a.DEDUCTON

ORDER BY a.employid

drop table ##1