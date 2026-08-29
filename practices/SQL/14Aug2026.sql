drop procedure set_proc_age;
create or replace procedure set_proc_age (p_num out number,
                                    p_date in date,
                                    p_gen in char) as
v_age number;
invalid_date Exception;
invalid_gender Exception;
Begin
if p_gen not in ('M','F') then
 Raise invalid_gender;
else 
 Dbms_output.put_line ('Valid gender');
end if;

if p_date > sysdate then
 raise invalid_date;
else 
 Dbms_output.put_line ('Valid date choosen is : '||p_date);
end if;
select months_between(sysdate,p_date)/12 into v_age from dual;

if v_age<=4 then 
dbms_output.put_line('You are either newborn or a toddler');
end if;

p_num:=v_age;

dbms_output.put_line('Your age is -:'||v_age);
exception
when invalid_gender then
NUll;
dbms_output.put_line('invalid gender,kindly choose either M or F');
when invalid_date then
null;
dbms_output.put_line ('Invalid Date choosen');
when others then 
dbms_output.put_line(SQLERRM);
end;
/

show error;


set serveroutput on;
declare 
my_age number;
begin
set_proc_age(my_age,'28-02-1987','M');
end;
/


select sysdate,months_between(sysdate,'28-02-1987')/12 from dual;

select * from user_objects;
select * from PRODUCT_ORDERS;
select product_name,count(1) from (select product_name,rank() over (order by total_sales) as rank,
                    Dense_rank() over (order by total_sales) as dense,
                    row_number() over (order by total_sales) as row_id,
                    TOTAL_SALES,
                    lag(TOTAL_SALES,1) over (order by ORDER_COUNT) lag_value
                    ,Lead(TOTAL_SALES,1) over (order by ORDER_COUNT) lead_value
from PRODUCT_ORDERS) group by product_name having count(1) >1;



select user,a.* from All_TAB_COLUMNS a where column_name like '%AVAI%';

select * from CUSTOMERS;
select unit_price,count(1) from products group by UNIT_PRICE having count(1) >1 order by unit_price desc;
select Rank() over (order by unit_price desc) product_cost_range,unit_price,product_name from PRODUCTS;

#wap for varray

select to_char(sysdate,'DDD') DDD
       ,to_char(sysdate,'DAY') DAY
       ,to_char(sysdate,'D') D
       ,to_char(sysdate,'DL') DL
       ,to_char(sysdate,'DS') DS
       ,to_char(sysdate,'DY') DY
      ,to_char(sysdate,'DD') E
     ,to_char(sysdate,'X') X
    -- ,to_char(sysdate,'DDD') DDD
    -- ,to_char(sysdate,'DDD') DDD
    -- ,to_char(sysdate,'DDD') DDD
from dual;
 
SELECT TO_CHAR(1234, 'TM9e') FROM DUAL;

show all;
show user;
SHOW ERRORS;
show system_variables;
startup;
describe schema;

select * from all_users where username like '%SCOTT%';

select * from all_objects where owner='C##SCOTT';
