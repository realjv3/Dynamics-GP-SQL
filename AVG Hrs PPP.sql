create table ##1 (employid int, trxbegdt datetime, untstopy float); 

insert into ##1
select a.employid, a.trxbegdt, sum(a.untstopy)
from upr30300 a join upr00100 b on a.employid = b.employid 
where trxbegdt > '2013-12-26' and b.inactive = 0 and untstopy > 0
group by a.employid, a.trxbegdt

select DB_NAME() [Company], b.deprtmnt, a.employid, b.jobtitle, b.frstname, b.lastname, b.STRTDATE, b.BENADJDATE, avg(a.untstopy) [Avg Hours PPP] 
from ##1 a join upr00100 b on a.employid = b.employid 
group by a.employid, b.frstname, b.lastname, b.STRTDATE, b.BENADJDATE, b.deprtmnt, b.jobtitle

drop table ##1
