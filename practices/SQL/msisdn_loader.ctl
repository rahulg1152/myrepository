-- SQL*Loader control file for a one-column MSISDN file.
-- Expected input: one MSISDN per line, optionally surrounded by whitespace.
OPTIONS (ERRORS=1000)
LOAD DATA
INFILE 'msisdn.txt'
BADFILE 'msisdn.bad'
DISCARDFILE 'msisdn.dsc'
APPEND
INTO TABLE msisdn_load_tmp
FIELDS TERMINATED BY WHITESPACE
TRAILING NULLCOLS
(
  msisdn varchar2(10) "TRIM(:msisdn)"
)