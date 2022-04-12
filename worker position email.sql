
select x.recid, X.PERSONNELNUMBER,[Employee Name],EMAil, Y.DESCRIPTION ,Y.VALIDFROM,y.VALIDTO,X.DESCRIPTION,X.VALIDFROM,X.VALIDTO,DepartmentName,DepartmentNameEN,PMCGROUPDEPARTMENT from
(select a.recid ,d.PERSONNELNUMBER,H.EMAIL, G.NAMEALIAS as [Employee Name], b.DESCRIPTION,C.VALIDFROM,c.VALIDTO,F.Name DepartmentName,F.NAMEALIAS as DepartmentNameEN,F.PMCGROUPDEPARTMENT from HcmPosition A
join hcmPositionDetail B
on b.POSITION = a.RECID and b.VALIDTO>=getdate() 
join  HcmPositionWorkerAssignment C on C.POSITION = b.POSITION and C.VALIDTO>=getdate()
and c.VALIDTO >= DATEADD(HOUR,-7, getdate())
join HCMWORKER D on D.recid = c.WORKER
and b.STORENUMBER=''
join   DIRPARTYTABLE F
on F.PARTITION=5637144576 and F.INSTANCERELATIONTYPE =2377 and PMCGROUPDEPARTMENT='SSC' 
and F.recid = b.DEPARTMENT
join DIRPARTYTABLE G
on G.recid = d.PERSON

join DIRPERSONUSER K
on K.PERSONPARTY = G.RECID
left join SYSUSERINFO H
on h.ID = k.USER_ and k.VALIDTO>=getdate()
)X
left join 
( 
select * from (select d.PERSONNELNUMBER, b.DESCRIPTION,C.VALIDFROM,c.VALIDTO,ROW_NUMBER() over ( partition by d.PERSONNELNUMBER order by  c.VALIDTO desc)as STT from HcmPosition A
join hcmPositionDetail B
on b.POSITION = a.RECID and b.VALIDTO>=getdate()
join  HcmPositionWorkerAssignment C on C.POSITION = b.POSITION 
and c.validto <= DATEADD(hour,-7, getdate())

join HCMWORKER D on D.recid = c.WORKER
and b.STORENUMBER=''
--where PERSONNELNUMBER='800090'
) T where T.STT=1) Y

on X.PERSONNELNUMBER = Y.PERSONNELNUMBER
--where X.PERSONNELNUMBER='800090'
order by X.DepartmentName,  X.VALIDFROM desc,  X.PERSONNELNUMBER


