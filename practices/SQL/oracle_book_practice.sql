declare
v_var varchar2(100) := '&v_var';
v_num number := 0;
begin
for i in 1 .. length(v_var) loop
  dbms_output.put_line(substr(v_var, 1, i));
end loop;
end;
/


select * from user_objects where object_name like 'EMP%';
select * from employees;
create table employees_history as select * from employees;
select * from employees_history;
alter table employees_history add (history_id number, history_date date default sysdate,old_salary number);
select * from employees_history;
drop sequence employees_history_seq;
create sequence employees_history_seq start with 1 increment by 1;
update employees_history set history_id = empno||employees_history_seq.Currval,old_salary=sal;
select a.ename,a.SAL,a.hiredate effective_date from employees a;
alter table employees rename column Empno to emp_id;
alter table employees rename column ENAME to emp_name;
alter table employees rename column job to job_id;
alter table employees rename column SAL to salary;
alter table employees rename column DEPTNO to Dept_id;
alter table employees rename column HIREDATE  to hire_date;

desc employees;
select e.EMP_ID||e.hiredate||e.emp_name,e.* from employees e;

select emp_id,emp_name,salary*12 as "Annual Salary" from employees;
rename department to departments;
select * from departments;
select unique job_id from employees;
select distinct job_id from employees;

declare
--v_record employees%rowtype;
v_num number := 0;
begin
for i in (select emp_id+employees_history_seq.Nextval as emp_id,
                 trim(emp_name||employees_history_seq.currval) as emp_name,
                 job_id,
                 MGR+employees_history_seq.currval MGR,
                 Hire_date+10 as hire_date,
                 salary+200 as salary,
                 comm,
                 dept_id from employees) 
loop
insert into employees values (i.emp_id,i.emp_name,i.job_id,i.MGR,i.hire_date,i.salary,i.comm,i.dept_id);
dbms_output.put_line(i.emp_id||','||i.emp_name||','||i.job_id||','||i.MGR||','||i.hire_date||','||i.salary||','||i.comm||','||i.dept_id);
v_num:=1+v_num;
end loop;
dbms_output.put_line('Total Records Inserted: '||v_num);
exception
when others then
dbms_output.put_line(DBMS_UTILITY.FORMAT_ERROR_STACK);
dbms_output.put_line('ERROR BACKTRACE : ');
dbms_output.put_line(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
dbms_output.put_line(DBMS_UTILITY.FORMAT_CALL_STACK);
end;
/

select * from employees;
update employees set emp_name = substr(emp_name,1,11),
emp_id=substr(emp_id,1,11),
MGR=substr(mgr,1,11);

desc employees;
select * from user_constraints where table_name='EMPLOYEES';
alter table employees enable constraint SYS_C008731;
alter table employees modify MGR Number;

CREATE TABLE sales_auto_interval (
    sale_id      NUMBER,
    sale_date    DATE NOT NULL,
    amount       NUMBER(10, 2)
)
PARTITION BY RANGE (sale_date)
INTERVAL (NUMTODSINTERVAL(1, 'DAY')) -- Automatically creates a new partition for every new day
(
    -- At least one initial partition is required as a baseline anchor
    PARTITION p_initial VALUES LESS THAN (TO_DATE('2026-01-01', 'YYYY-MM-DD'))
);

select * from sales_auto_interval;

select count(1) from employees where comm is null and emp_name like 'S%';  --54
select count(1) from employees where comm is null OR emp_name like 'S%';  --404
select count(1) from employees where comm is null and emp_name not like 'S%';  --350
select count(1) from employees where comm is null and emp_name not like 'S%' and salary > 2000;  --277
select upper(emp_name),lower(emp_name),initcap(emp_name),
       substr(emp_name,length(emp_name)),substr(emp_name,-1,length(emp_name)),substr(emp_name,-1*length(emp_name)+1),
       INSTR(emp_name,'K'),INSTR(emp_name,'I'),INSTR(emp_name,'K',-3),INSTR(emp_name,'K',2),
       REPLACE(emp_name,'K','X'),REPLACE(emp_name,'K',''),REPLACE(emp_name,'K','*'),REPLACE(emp_name,'I','-'),
       LENGTH(emp_name),LENGTHB(emp_name),LENGTHC(emp_name),LENGTH2(emp_name),
       trim(emp_name),ltrim(emp_name),rtrim(emp_name),
       RPAD(emp_name,20,'*'),LPAD(emp_name,20,'*')
from employees where rownum <=1;

SELECT 
    LENGTH('rahulgupta') - LENGTH(REPLACE('rahulgupta', 'a', '')) AS count_of_a
FROM dual;

select emp_id,emp_name,concat('Emp Name: ',emp_name) ,
       
from employees where rownum <=1;

select 92,trunc(92/60),remainder(92,60),mod(92,60),trunc(92/60) from dual;


declare
v_number number := 3805;
v_hr number := 0;
v_min number := 0;
v_sec number := 0;
begin
if v_number is not null and v_number >= 60 then
  v_sec := mod(v_number,60);
  v_min := trunc(v_number/60);
   if v_min is not null and v_min >= 60 then
     v_hr := trunc(v_min/60);
     v_min := mod(v_min,60);
   end if;
   end if;
  dbms_output.put_line('Hours: '||v_hr||' Minutes: '||v_min||' Seconds: '||v_sec);
end;
/

select to_char(sysdate,'DDSPTH MONYYYY HH24MISSSSS A.M.'),next_day(sysdate,'MONDAY'),last_day(sysdate),trunc(sysdate,'month'),
round(sysdate, 'MONTH'),round(sysdate, 'YEAR'),add_months(sysdate,3),months_between(sysdate,add_months(sysdate,-3))
 from dual;

SELECT '3200',
    CASE WHEN VALIDATE_CONVERSION('Rahul' AS NUMBER) = 1 
         THEN TO_CHAR(TO_NUMBER('3200') / 100)
         ELSE 'RAHUL' 
    END AS output
FROM dual;

select * from dual;

insert into employees(emp_id,emp_name,job_id,MGR,hire_date,salary,comm,dept_id) values(1154,'Shaini','AVP',null,'17-02-2022',50000,1650,20);
select * from employees where emp_id=7839;
commit;

select decode(emp_id,1152,'my name is Rahul',1153,'My name is Shaini',1154,'My name is Bhagwaan Shailu','Deen Duniya') as message
from employees order by message desc; 
--where emp_id like '115%';

select row_number() over (order by salary desc) as rownumber,dense_rank() over (order by salary desc) as salary_rank,emp_id,emp_name,salary from employees order by salary_rank;

---using With clause (for nth salary)

with nth_salary as(
    select row_number() over (order by salary desc) as rownumber,
    dense_rank() over (order by salary desc) as salary_rank,
    emp_id,    emp_name,    salary 
    from employees
) select rownumber,salary_rank,emp_id,emp_name,salary from nth_salary where rownumber=3;


select case when emp_id=1152 then 'My Name is Rahul in case statement'
            when emp_id=1153 then 'My Name is Shaini in case statement'
            when emp_id=1154 then 'My Name is Bhagwaan Shailu in case statement'
            else 'Deen Duniya in case statement' end as message
from employees order by message desc;