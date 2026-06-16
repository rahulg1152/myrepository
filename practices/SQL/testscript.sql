select * from dual;
select * from all_objects where owner='MDSYS';
select user,owner, count(1) from ALL_OBJECTS group by owner;
select owner,object_type, count(1) from ALL_OBJECTS where owner='MDSYS' group by owner,object_type;
select * from all_objects where owner='MDSYS' and object_type='TABLE';

select * from user_objects;

select * from all_privileges where grantee='DIP;

#give all priviliges for MDSYS schema to  DIP schema


select * from user_tables;

CREATE TABLE employees (
  emp_id NUMBER PRIMARY KEY,
  first_name VARCHAR2(50) NOT NULL,
  last_name VARCHAR2(50),
  hire_date DATE DEFAULT SYSDATE
);


CREATE TABLE person_table OF person_type (
  CONSTRAINT pk_person PRIMARY KEY (ssn));

CREATE TABLE sales (
  sale_id NUMBER,
  sale_date DATE,
  amount NUMBER
)
PARTITION BY RANGE (sale_date) (
  PARTITION p1 VALUES LESS THAN (TO_DATE(sysdate,'YYYY-MM-DD')),
  PARTITION p2 VALUES LESS THAN (TO_DATE(sysdate+365,'YYYY-MM-DD'))
);


CREATE TABLE sales (
  sale_id   NUMBER,
  sale_date DATE,
  amount    NUMBER
)
PARTITION BY RANGE (sale_date) (
  PARTITION p1 VALUES LESS THAN (DATE '2025-01-01'),
  PARTITION p2 VALUES LESS THAN (DATE '2026-01-01'),
  PARTITION pmax VALUES LESS THAN (MAXVALUE)
);

select dbms_metadata.get_ddl('TABLE','SALES','DIP')  from dual;

CREATE GLOBAL TEMPORARY TABLE temp_orders (
  order_id NUMBER,
  product_id NUMBER
) ON COMMIT DELETE ROWS;

CREATE OR REPLACE DIRECTORY ext_dir AS '/u01/app/oracle/external_data';

CREATE TABLE ext_employees (
  emp_id NUMBER,
  name VARCHAR2(50),
  dept VARCHAR2(20)
)
ORGANIZATION EXTERNAL (
  TYPE ORACLE_LOADER
  DEFAULT DIRECTORY ext_dir
  ACCESS PARAMETERS (
    RECORDS DELIMITED BY NEWLINE
    FIELDS TERMINATED BY ','
  )
  LOCATION ('employees.csv')
);

CREATE TABLE big_data (
  id NUMBER,
  payload CLOB
)
TABLESPACE users
STORAGE (INITIAL 1M NEXT 1M MAXEXTENTS UNLIMITED);

CREATE TABLE orders (
  order_id NUMBER,
  emp_id NUMBER,
  order_date DATE,
  CONSTRAINT fk_emp FOREIGN KEY (emp_id)
    REFERENCES employees(emp_id)
);

CREATE TABLE sales (
  sale_id   NUMBER,
  sale_date DATE,
  amount    NUMBER
)
COMPRESS;

ALTER TABLE sales COMPRESS;

CREATE TABLE sales_1 (
  sale_id NUMBER,
  sale_date DATE,
  amount NUMBER
)
COMPRESS;

dro p


CREATE or replace TABLE sales (
  sale_id NUMBER,
  sale_date DATE,
  amount NUMBER
)
COMPRESS FOR OLTP;

CREATE TABLE sales (
  sale_id NUMBER,
  sale_date DATE,
  amount NUMBER
)
COMPRESS FOR QUERY LOW;

CREATE TABLE sales (
  sale_id NUMBER,
  sale_date DATE,
  amount NUMBER
)
PARTITION BY RANGE (sale_date) (
  PARTITION p1 VALUES LESS THAN (DATE '2025-01-01') COMPRESS FOR OLTP,
  PARTITION p2 VALUES LESS THAN (DATE '2026-01-01') COMPRESS FOR QUERY HIGH,
  PARTITION pmax VALUES LESS THAN (MAXVALUE) NOCOMPRESS
);


