CREATE TABLE ##1 (socscnum CHAR(9), employid INT, trxbegdt DATETIME, untstopy FLOAT); 

INSERT INTO ##1
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


WITH avgppp AS	(

	SELECT DB_NAME(DB_ID('FRI')) Company, a.SOCSCNUM, a.employid, b.FRSTNAME, b.LASTNAME, avg(a.untstopy) [Avg Hours PPP] 
	FROM ##1 a INNER JOIN FRI.dbo.upr00100 b on a.socscnum = b.SOCSCNUM 
	GROUP BY a.SOCSCNUM, a.employid, b.FRSTNAME, b.LASTNAME

	UNION ALL

	SELECT DB_NAME(DB_ID('FRII')) Company, a.SOCSCNUM, a.employid, b.FRSTNAME, b.LASTNAME, avg(a.untstopy) [Avg Hours PPP] 
	FROM ##1 a INNER JOIN FRII.dbo.upr00100 b on a.socscnum = b.SOCSCNUM 
	GROUP BY a.SOCSCNUM, a.employid, b.FRSTNAME, b.LASTNAME

	UNION ALL

	SELECT DB_NAME(DB_ID('FRNJ')) Company, a.SOCSCNUM, a.employid, b.FRSTNAME, b.LASTNAME, avg(a.untstopy) [Avg Hours PPP] 
	FROM ##1 a INNER JOIN FRNJ.dbo.upr00100 b on a.socscnum = b.SOCSCNUM 
	GROUP BY a.SOCSCNUM, a.employid, b.FRSTNAME, b.LASTNAME

	UNION ALL

	SELECT DB_NAME(DB_ID('HAMPT')) Company, a.SOCSCNUM, a.employid, b.FRSTNAME, b.LASTNAME, avg(a.untstopy) [Avg Hours PPP] 
	FROM ##1 a INNER JOIN HAMPT.dbo.upr00100 b on a.socscnum = b.SOCSCNUM 
	GROUP BY a.SOCSCNUM, a.employid, b.FRSTNAME, b.LASTNAME

	UNION ALL

	SELECT DB_NAME(DB_ID('JB')) Company, a.SOCSCNUM, a.employid, b.FRSTNAME, b.LASTNAME, avg(a.untstopy) [Avg Hours PPP] 
	FROM ##1 a INNER JOIN JB.dbo.upr00100 b on a.socscnum = b.SOCSCNUM 
	GROUP BY a.SOCSCNUM, a.employid, b.FRSTNAME, b.LASTNAME

	UNION ALL

	SELECT DB_NAME(DB_ID('MASPK')) Company, a.SOCSCNUM, a.employid, b.FRSTNAME, b.LASTNAME, avg(a.untstopy) [Avg Hours PPP] 
	FROM ##1 a INNER JOIN MASPK.dbo.upr00100 b on a.socscnum = b.SOCSCNUM 
	GROUP BY a.SOCSCNUM, a.employid, b.FRSTNAME, b.LASTNAME

	UNION ALL

	SELECT DB_NAME(DB_ID('MGMT')) Company, a.SOCSCNUM, a.employid, b.FRSTNAME, b.LASTNAME, avg(a.untstopy) [Avg Hours PPP] 
	FROM ##1 a INNER JOIN MGMT.dbo.upr00100 b on a.socscnum = b.SOCSCNUM 
	GROUP BY a.SOCSCNUM, a.employid, b.FRSTNAME, b.LASTNAME

	UNION ALL

	SELECT DB_NAME(DB_ID('MI')) Company, a.SOCSCNUM, a.employid, b.FRSTNAME, b.LASTNAME, avg(a.untstopy) [Avg Hours PPP] 
	FROM ##1 a INNER JOIN MI.dbo.upr00100 b on a.socscnum = b.SOCSCNUM 
	GROUP BY a.SOCSCNUM, a.employid, b.FRSTNAME, b.LASTNAME

	UNION ALL

	SELECT DB_NAME(DB_ID('NCC')) Company, a.SOCSCNUM, a.employid, b.FRSTNAME, b.LASTNAME, avg(a.untstopy) [Avg Hours PPP] 
	FROM ##1 a INNER JOIN NCC.dbo.upr00100 b on a.socscnum = b.SOCSCNUM 
	GROUP BY a.SOCSCNUM, a.employid, b.FRSTNAME, b.LASTNAME

	UNION ALL

	SELECT DB_NAME(DB_ID('SHIRL')) Company, a.SOCSCNUM, a.employid, b.FRSTNAME, b.LASTNAME, avg(a.untstopy) [Avg Hours PPP] 
	FROM ##1 a INNER JOIN SHIRL.dbo.upr00100 b on a.socscnum = b.SOCSCNUM 
	GROUP BY a.SOCSCNUM, a.employid, b.FRSTNAME, b.LASTNAME
)

SELECT * 
FROM avgppp
ORDER BY socscnum;

DROP TABLE ##1