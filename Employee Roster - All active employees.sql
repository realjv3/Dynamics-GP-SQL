SELECT 'Company' = DB_NAME(), DEPRTMNT, EMPLOYID, frstname, LASTNAME, EMPLCLAS, JOBTITLE, USERDEF1, BRTHDATE, STRTDATE, BENADJDATE
FROM UPR00100
WHERE INACTIVE = 0
ORDER BY EMPLOYID