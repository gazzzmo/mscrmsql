use Default_MSCRM
go
create table ##tmpRowSize (TableName varchar(100),RowSizeDefinitionBytes int)
exec sp_msforeachtable 'INSERT INTO ##tmpRowSize Select ''?'' As TableName, SUM(C.Length) as Length from dbo.SysColumns C where C.id = object_id(''?'') '
select * from ##tmpRowSize order by TableName asc
drop table ##tmpRowSize