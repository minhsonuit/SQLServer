declare @startdate date = '2022-03-24';

with
  dates as (
    select @startdate as [date]
    union all
    select dateadd(dd, 1, [date]) from dates where [date] < '2022-03-30'
  )
  select a.OPENDATE, b.date,a.STOREID,count(c.recid),sum(grossamount)/1000000.0 from PMCAPPSTOREEXT A
  left join dates B
  on a.PARTITION=5637144576 and a.DATAAREAID='phct'
  left join RETAILTRANSACTIONTABLE C
  on c.STORE = a.STOREID and c.TRANSDATE = b.date  and C.PARTITION=5637144576 and C.DATAAREAID='phct'
  where a.STORESTATUS=1
  and a.OPENDATE<=[date]
  group by STOREID,[date],a.OPENDATE
  order by date desc
-- store
declare @startdate date = '2022-05-14';

with
  dates as (
    select @startdate as [date]
    union all
    select dateadd(dd, 1, [date]) from dates where [date] < '2022-05-17'
  )
  select a.OPENDATE, b.date,a.STOREID,count(c.recid),sum(grossamount)/1000000.0 from PMCAPPSTOREEXT A
  left join dates B
  on a.PARTITION=5637144576 and a.DATAAREAID='phct'
  left join RETAILTRANSACTIONTABLE C
  on c.STORE = a.STOREID and c.TRANSDATE = b.date  and C.PARTITION=5637144576 and C.DATAAREAID='phct'
  where a.STORESTATUS=1
  and a.OPENDATE<=[date]
  and STOREID='sgpmc1004'
  group by STOREID,[date],a.OPENDATE
  order by date desc
