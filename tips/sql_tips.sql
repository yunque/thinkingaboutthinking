-- Retrieve a table's colums names
SELECT column_name
FROM   information_schema.columns
WHERE  table_schema = 'scheman'
AND    table_name   = 'tablen'

-- Size of table (MB)
SELECT pg_size_pretty(pg_total_relation_size('"scheman"."tablen"'));

-- Query plan + planning/execution time
EXPLAIN ANALYZE
<QUERY>
