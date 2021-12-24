use Berry_DB
create table Test (id integer not null primary key, some_data varchar(20));
insert into Test values (1, 'foo');


select * from Test;

begin transaction
update Test set some_data = 'update'
  where id = 1;
  rollback tran
sp_who2


select session_id, wait_type, resource_address, resource_description
from sys.dm_os_waiting_tasks
where blocking_session_id is not null;