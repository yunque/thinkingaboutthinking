-- Define table schema from a CSV
head -n100 $csv | csvsql -i postgresql

-- Retrieve a table's colums names
SELECT
  column_name
FROM
  information_schema.columns
WHERE
  table_schema = 'scheman'
  AND
  table_name   = 'tablen'

-- Size of a database
SELECT pg_size_pretty(pg_database_size('<database>'));

-- Size of table (MB)
SELECT pg_size_pretty(pg_total_relation_size('"scheman"."tablen"'));


-- Size of all tables (in a schema, e.g. "dbo")
SELECT
  table_schema || '.' || table_name AS table_full_name,
  pg_size_pretty(pg_total_relation_size('"' || table_schema || '"."' || table_name || '"')) AS SIZE
FROM
  information_schema.tables
WHERE
  table_schema = 'dbo'
ORDER BY
  pg_total_relation_size('"dbo"."' || table_name || '"') DESC


-- Size of all materialized views
-- cf. https://dba.stackexchange.com/questions/96534/postgres-check-disk-space-taken-by-materialized-view#96540
SELECT
  relname   AS objectname
, relkind   AS objecttype
, reltuples AS entries
, pg_size_pretty(pg_table_size(oid)) AS size  -- depending - see below
FROM
  pg_class
WHERE
  relkind IN ('m')
ORDER BY
  pg_table_size(oid) DESC;


-- Query plan + planning/execution time
EXPLAIN ANALYZE
<QUERY>

-- Export/copy table to file
-- SQL
COPY schema.table TO 'file_name'
-- psql
\copy schema.table to 'file_name' csv;
-- NB. In SQL, must be superuser, but not in psql shell


-- Change table owner
ALTER TABLE <table> OWNER TO <new_owner>;

-- Dump DB from one server to another
pg_dump -h host1 dbname | psql -h host2 dbname

-- Check status of running queries
SELECT
	query_start
	,state_change
	,query
	,state
    ,pid
FROM
	pg_stat_activity
WHERE
	usename = '<username>'
	AND
	datname = '<database>';

-- Cancel a query using process ID
SELECT pg_cancel_backend(<pid>)


-- Create a new user
CREATE USER <uname> WITH PASSWORD <pw>;

-- Give admin inherited role of other user
GRANT <other_user> TO <admin_role>;
