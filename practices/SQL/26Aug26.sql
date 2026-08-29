select 'select * from '||table_name||';' from user_tables;
show user;
select * from EMPLOYEES;
select * from DEPT;
select * from BONUS;
select * from SALGRADE;
select * from DUMMY;
select * from TEST_AWS_PY_PIP_BOTO3;
select * from TABLE1;
select * from LOCATION;
desc emp;
insert into emp (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
  select 7839, 'KING',   'PRESIDENT', null, to_date('17-11-1981','dd-mm-yyyy'),    5000, null, 10 from dummy union all
  select 7698, 'BLAKE',  'MANAGER',   7839, to_date('1-5-1981','dd-mm-yyyy'),      2850, null, 30 from dummy union all
  select 7782, 'CLARK',  'MANAGER',   7839, to_date('9-6-1981','dd-mm-yyyy'),      2450, null, 10 from dummy union all
  select 7566, 'JONES',  'MANAGER',   7839, to_date('2-4-1981','dd-mm-yyyy'),      2975, null, 20 from dummy union all
  select 7788, 'SCOTT',  'ANALYST',   7566, to_date('13-JUL-87','dd-mm-rr') - 85,  3000, null, 20 from dummy union all
  select 7902, 'FORD',   'ANALYST',   7566, to_date('3-12-1981','dd-mm-yyyy'),     3000, null, 20 from dummy union all
  select 7369, 'SMITH',  'CLERK',     7902, to_date('17-12-1980','dd-mm-yyyy'),     800, null, 20 from dummy union all
  select 7499, 'ALLEN',  'SALESMAN',  7698, to_date('20-2-1981','dd-mm-yyyy'),     1600,  300, 30 from dummy union all
  select 7521, 'WARD',   'SALESMAN',  7698, to_date('22-2-1981','dd-mm-yyyy'),     1250,  500, 30 from dummy union all
  select 7654, 'MARTIN', 'SALESMAN',  7698, to_date('28-9-1981','dd-mm-yyyy'),     1250, 1400, 30 from dummy union all
  select 7844, 'TURNER', 'SALESMAN',  7698, to_date('8-9-1981','dd-mm-yyyy'),      1500,    0, 30 from dummy union all
  select 7876, 'ADAMS',  'CLERK',     7788, to_date('13-JUL-87', 'dd-mm-rr') - 51, 1100, null, 20 from dummy union all
  select 7900, 'JAMES',  'CLERK',     7698, to_date('3-12-1981','dd-mm-yyyy'),      950, null, 30 from dummy union all
  select 7934, 'MILLER', 'CLERK',     7782, to_date('23-1-1982','dd-mm-yyyy'),     1300, null, 10 from dummy;

  rollback;

SELECT ename, job, SAL AS Sal FROM  employees;

SELECT EMPNO, ename,
sal*12 as "ANNUAL SALARY"
FROM employees;

select distinct JOB from EMPLOYEES;

select * from employees where ename like '%L%';

select listagg(column_name,',') from USER_TAB_COLS where TABLE_NAME='EMPLOYEES';


select * from employees 
where MGR is null OR ename like '_L%';

select * from employees 
where MGR is null and job  in ('PRESIDENT','MANAGER');

EXPLAIN PLAN FOR
select 1 from employees 
where MGR is not null and job  not in ('PRESIDENT','MANAGER');

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR SELECT * FROM emp WHERE deptno = 10;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXEC DBMS_STATS.GATHER_TABLE_STATS('C##SCOTT','EMPLOYEES');

select sum(sal) sala,deptno dept from employees group by dept order by SALA;


select * from employees where ename like '__A%';

select ename,hiredate from employees where to_char(hiredate,'YY') ='81';

SELECT DBMS_CALENDAR.CALENDAR_START_END()
FROM dual;

SELECT object_name, object_type 
FROM all_objects 
WHERE object_name LIKE '%CALENDAR%';

select mgr from employees where mgr is null;

select 
    nvl(dummy,'Rahul') nvl
  ,nvl2(dummy,'Rahul','Shaini') nvl2
  ,NULLIF(dummy,'Rahul') nullif
  ,coalesce(dummy,'Rahul') coalesce
  ,(case when dummy is null then 'Rahul' else 'Shailendra' end) case
  ,decode(dummy,'X','Shailendra','Krishu') decode
 from dual;

select upper(ename),lower(ename),initcap(ename) from employees where rownum<2;

select (select mgr from employees where mgr is null) from dual;