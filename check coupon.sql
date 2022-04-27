select
X.STORENUMBER,count(x.recid) as total
 from
(
select a.STORENUMBER,b.RECID from RETAILCHANNELTABLE A
left join retailGiftCardTable B
on a.recid % 40 = b.recid % 40
and b.PMCGIFTCARDPROGRAMID='GC-001052'
and a.PARTITION=5637144576 
and b.PARTITION=5637144576 and b.DATAAREAID='phct'
and b.PMCGIFTCARDSTATUS=0
) X

group by x.STORENUMBER
--having count(x.recid)<=0
order by x.STORENUMBER
---
select top 1000 c.TRANSDATE,c. * from retailGiftCardTable B
join
RETAILGIFTCARDTRANSACTIONS C
on b.ENTRYID=c.CARDNUMBER and c.OPERATION=1  
and b.PMCGIFTCARDPROGRAMID='GC-001052'
and c.PARTITION=5637144576 
and b.PARTITION=5637144576 and b.DATAAREAID='phct'
--and c.PMCGIFTCARDSTATUS=0 
and c.CHANNEL=5637274326
order by c.TRANSDATE desc



