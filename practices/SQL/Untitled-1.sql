select * from all_objects_ae where owner='SYS' and object_name='SQL_PLAN_ROW_TYPE';

desc all_objects_ae

#find the object ,which re having multple versions
select object_name,object_type, count(*) as version_count
from all_objects_ae 
--where owner='SYS'   
--and object_type='VIEW'
group by object_name,object_type
having count(*) > 1;

DBMS_crypto.Encrypt('Hello World', DBMS_crypto.DES_CBC_PKCS5, '12345678');

SELECT owner,
       LISTAGG(object_name, ', ')
       WITHIN GROUP (ORDER BY object_name) AS objects
FROM all_objects_ae
where rownum <= 10
GROUP BY owner;

set autotrace on 
explain plan for
select * from user_objects;



select * from all_objects where object_name like 'DBMS_%';

select distinct department_id from employees;

select max(salary) from employees where department_id=5;

select salary,first_name from employees where salary between 10000 and 50000 order by salary desc ;


SELECT employee_id, salary,department_id,
      rank () OVER (partition by department_id ORDER BY salary desc) AS rank_in_department,
      dense_rank () OVER (partition by department_id ORDER BY salary desc) AS rank_in_department
      FROM employees where department_id in (1);



select avg(salary) from employees where department_id in (1);

SELECT salary,department_id,
       AVG(salary) OVER (partition BY salary) AS moving_avg
FROM employees where department_id in (1);

SELECT EMPLOYEE_ID,
       salary,
       LEAD(salary, 1) OVER (ORDER BY EMPLOYEE_ID) AS next_salary
FROM employees;

select a.salary ,  LEAD(salary, 2) over (order by salary), a.* from employees a;