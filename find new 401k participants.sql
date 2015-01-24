select distinct [Employee ID], Concat(EMPL_LAST_NAME, ' ' ,EMPL_FIRST_NAME) as 'Name', SOCSCNUM, DEPARTMENT
from v_MIG_401K_CENSUS
where [Employee ID] in 
(select [Employee ID] 
from v_MIG_401K_CENSUS
where YEAR = '2014' AND [Ben & Ded 401K] <> 0
)
and
[Employee ID] in (select [Employee ID] 
from v_MIG_401K_CENSUS
where YEAR = '2013' AND [Ben & Ded 401K] = 0
)
order by [Employee ID]