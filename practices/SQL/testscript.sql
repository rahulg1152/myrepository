select * from dual;
select owner,count(1) from all_catalog group by owner;
select  * from all_catalog where table_name like '%PRIV%' ;

select * from all_privileges where grantee='SCOTT';

create table tab1 (col1 char,col2 int,col3 date,col4 varchar2(20),col5 number(10,2));
