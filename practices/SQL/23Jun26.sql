GRANT CONNECT, RESOURCE TO c##scott;

select * from user_objects;

select * from SYS_C008586;

select * from employee;

rename employee to employees;

select * from dual;

select 1 ,'Rahul' as col1,
       sysdate as col2,
       to_date(sysdate,'YYYY-MM-DD') as col3,
       to_char(sysdate,'yyyy') as col4,
       to_char(sysdate,'mm') as col5,
       to_date(sysdate,'DD-mm-yyyy') as col6,
       instr('Rahul', 'h') as col7,
       instr('Rahulgupta','g') as col8,
       instr('Rahulgupta','g',3) as col9       
from dual;

###########DDL###################
#drop and create table with primary key
create table tab1(
    id number(5) primary key,
    name varchar2(20),
    salary number(10,2)
) nologging,
compress;

select * from user_objects order by created desc;

select dbms_metadata.get_ddl('TABLE', 'TAB1') from dual;

select * from all_constraints where table_name='TAB1';

#alter table tab1 drop constraint SYS_C008591;
declare
 v_sql varchar2(1000);
begin
    select 'alter table tab1 drop constraint '||constraint_name into v_sql 
    from user_constraints where table_name='TAB1' and constraint_type='P';
    execute immediate v_sql;
    dbms_output.put_line('Primary key constraint dropped successfully.');
exception
    when no_data_found then
        dbms_output.put_line('No primary key constraint found for table tab1.');
end ;
/

alter table tab1 add constraint id_pk primary key(id);


select * from all_constraints where table_name='TAB1';

alter table tab1 modify (name varchar2(50));

alter table tab1 add (address varchar2(500));

truncate table tab1;

rename  tab1 to table1;

##########DML#########

select * from table1;

insert into table1 values(2,'Shaini',1000000,'Pune');
insert into table1 values(3,'Rahul',120000.00,'Delhi');
insert into table1 values(4,'Shruti',150000.00,'Mumbai');

commit;

update table1 set salary=salary*10 where id=1;

commit;

delete from table1 where id=4;

select * from table1;
 commit;

 