# wap for 2nd highest salary using limit and offset 

select distinct salary from employees order by salary desc;



#wap to find 2nd highest salary using dense rank function
select * from (select a.*, dense_rank() over (order by salary desc) as salary_rank from employees a) where salary_rank = 2;
select * from (select employee_id,salary, dense_rank() over (order by salary desc) as salary_rank from employees) where salary_rank=2;
select salary, rank() over (order by salary desc) as salary_rank from employees;

#wap using level function

desc employees;

select employee_id,salary from employees order by salary desc;

-----------

declare
v_str varchar2(20):='Rahul';
begin
for i in 1 .. length(v_str)
loop
dbms_output.put_line(substr(v_str,i,1));
end loop;
end;
/

set serveroutput on;
declare 
v_rec employees%rowtype;
v_str varchar2(200);
begin
for i in 1 .. 10 loop
v_str := 'select employee_id,salary from (select employee_id,salary, dense_rank() over (order by salary desc) as salary_rank from employees) a where salary_rank = :i';
execute immediate v_str into v_rec.employee_id,v_rec.salary using i;
dbms_output.put_line('top '||i||' rank salary is '||v_rec.salary);
end loop;
dbms_output.put_line(SQL%ROWCOUNT);
end;
/


set serveroutput on;
declare 
v_rec employees%rowtype;
v_str varchar2(200);
v_rank number :=&n;
begin
v_str := 'select employee_id,salary from (select employee_id,salary, dense_rank() over (order by salary desc) as salary_rank from employees) a where salary_rank = :i';
execute immediate v_str into v_rec.employee_id,v_rec.salary using v_rank;
dbms_output.put_line('top '||v_rank||'th rank salary is '||v_rec.salary);
end;
/

drop function get_nth_sal;

#WAP a oracle PLS Function to push a number and get that rank salary in same parameter 
create or replace function get_nth_sal(p_rank_sal in number) 
Return number 
is
v_empid employees.employee_id%type;
v_salary employees.salary%type;
v_str varchar2(200);
begin
v_str := 'select employee_id,salary 
          from (select employee_id,salary, dense_rank() over (order by salary desc) as salary_rank from employees) 
          where salary_rank = :p_rank_sal';
execute immediate v_str into v_empid,v_salary using p_rank_sal;
return v_salary;
dbms_output.put_line('top '||p_rank_sal||'th rank salary is '||v_salary);
exception
when others then
dbms_output.put_line('Error: '||sqlerrm);
return null;
end;
/

select * from user_errors where name ='GET_NTH_SAL';
 
select  get_nth_sal(2) from dual;



drop procedure set_nth_sal;

create or replace procedure set_nth_sal(p_rank_sal in out number) is 
v_empid employees.employee_id%type;
v_salary employees.salary%type;
v_str varchar2(500);
begin
v_str := 'select employee_id,salary
        from (select employee_id,salary, dense_rank() over (order by salary desc) as salary_rank from employees) 
        where salary_rank = :p_rank_sal';

execute immediate v_str into v_empid,v_salary using p_rank_sal;
dbms_output.put_line('the rank salary is '||v_salary|| ' Employee id is '||v_empid);
p_rank_sal:=v_salary*100;
exception
when others then
dbms_output.put_line('Error: '||sqlerrm);
end;
/

select * from user_errors where name ='SET_NTH_SAL';
select * from all_objects where object_name like '%_NTH_SAL';

BEGIN 
    exec set_nth_sal(2); 
END;
/

DECLARE
    v_rank NUMBER := 2;  -- input rank
BEGIN
    set_nth_sal(v_rank); -- procedure will overwrite v_rank
    DBMS_OUTPUT.PUT_LINE('Returned salary: ' || v_rank);
END;
/


create or replace procedure set_nth_sal_outparam(p_rank in number,P_Sal out number) is 
v_empid employees.employee_id%type;
v_salary employees.salary%type;
v_str varchar2(500);
begin
v_str := 'select employee_id,salary
        from (select employee_id,salary, dense_rank() over (order by salary desc) as salary_rank from employees) 
        where salary_rank = :p_rank_sal';

execute immediate v_str into v_empid,v_salary using p_rank;
dbms_output.put_line('the rank salary is '||v_salary|| ' for Employee id is '||v_empid);
p_sal:=v_salary;
exception
when others then
dbms_output.put_line('Error: '||sqlerrm);
end;
/

declare
p_sal number :=0;
begin 
set_nth_sal_outparam(2,p_sal); 
dbms_output.put_line('Returned salary: ' || p_sal);
end;
/

##########################Normal Cursor####################
declare
cursor c1 is select employee_id,salary from employees order by salary desc;
v_rec c1%rowtype;
begin
open c1;
loop
fetch c1 into v_rec;
exit when c1%notfound;
dbms_output.put_line('Employee id is '||v_rec.employee_id||' salary is '||v_rec.salary);
end loop;
close c1;
end;
/


