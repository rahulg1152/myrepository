select * from dual;
select * from dba_extents where owner='C##SCOTT';

select unique(segment_type ) from dba_extents where owner='C##SCOTT';
create sequence emp_seq start with 10001 increment by 1 nocache;
select emp_seq.nextval,emp_seq.currval from dual;

select * from v$session;
select * from v$session where username='C##SCOTT';
select a.USERS_EXECUTING,
a.USERS_OPENING,a.USER_IO_WAIT_TIME,a.PARSING_USER_ID,a.* from v$sql a where a.USERS_EXECUTING='C##SCOTT';
select * from v$sql;
SELECT DBMS_SQLTUNE.REPORT_SQL_MONITOR(sql_id=>'YOUR_SQL_ID', report_level=>'ALL', type=>'TEXT') FROM DUAL;
select * from DBA_ADVISOR_TASKS  where owner='C##SCOTT';

select DBMS_SQLTUNE.REPORT_TUNING_TASK(task_name=>'ADDM:1503347112_1_714', type=>'TEXT') from dual;

