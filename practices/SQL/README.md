# MSISDN SQL*Loader

Run `create_msisdn_temp_table.sql` once as the target schema owner, then load a
file containing one MSISDN per line:

```sh
export ORACLE_CONNECT='user/password@//dbhost:1521/service'
./load_msisdn.sh msisdns.txt
```

You can also pass the connect string as the second argument.

`msisdn_loader.ctl` appends values to `MSISDN_LOAD_TMP`; it does not truncate
the table. The wrapper uses conventional path loading (`direct=false`) because
it is appropriate for a temporary-table target.

## Critical temporary-table behaviour

Oracle global temporary table data belongs to the database session. `sqlldr`
creates a session, loads the rows, and then exits; the rows are therefore not
available from a later `sqlplus` invocation or application connection. Even
`ON COMMIT PRESERVE ROWS` retains the rows only until the SQL*Loader session
ends.

Use this design only when the SQL*Loader session itself is the consumer (which
SQL*Loader alone cannot extend with arbitrary SQL). If another process needs
the values, load into a normal staging table with a `load_batch_id` column and
delete that batch after processing, or have the consuming application insert
the numbers into its own temporary-table session.
