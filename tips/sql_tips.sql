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


-- Size of all schemas in a DB
SELECT
	schema_name, 
	pg_size_pretty(sum(table_size)::bigint) AS schema_size,
	(sum(table_size) / pg_database_size(current_database())) * 100 AS pct_total_DB_size
FROM (
  SELECT pg_catalog.pg_namespace.nspname as schema_name,
         pg_relation_size(pg_catalog.pg_class.oid) as table_size
  FROM   pg_catalog.pg_class
     JOIN pg_catalog.pg_namespace ON relnamespace = pg_catalog.pg_namespace.oid
) t
GROUP BY schema_name
ORDER BY schema_name;


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

-- Show path to DB data directory
GRANT pg_read_all_settings TO dba;
SHOW data_directory;

-- See run-time parameters
SHOW ALL;

-- Find table that contains a given column
SELECT schema_name, table_name FROM all_tab_columns WHERE column_name = 'ID';

					    
-- Terminate idle processes older than 2 days
WITH inactive_connections AS
(
	SELECT
		current_timestamp - state_change AS time_elapsed,
		state,
        pid,
        rank() over (partition by client_addr order by backend_start ASC) as RANK,
        query
    FROM 
        pg_stat_activity AS procs
    WHERE
        -- Exclude the thread owned connection (ie no auto-kill)
        pid <> pg_backend_pid( )
    AND
        -- Exclude known applications connections
        application_name !~ '(?:psql)|(?:pgAdmin.+)'
    AND
        -- Include connections to the same database the thread is connected to
        datname = current_database() 
    AND
        -- Include connections using the same thread username connection
        usename = current_user 
    AND
        -- Include inactive connections only
        state in ('idle', 'idle in transaction', 'idle in transaction (aborted)', 'disabled') 
    AND
        -- Include old connections (found with the state_change field)
        current_timestamp - state_change > interval '2 days'
)
SELECT
    pg_terminate_backend(pid)
FROM
    inactive_connections;
