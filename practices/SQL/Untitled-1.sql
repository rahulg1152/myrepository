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



