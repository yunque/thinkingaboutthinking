-- Retrieve a table's colums names
SELECT
  column_name
FROM
  information_schema.columns
WHERE
  table_schema = 'scheman'
  AND
  table_name   = 'tablen'


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
