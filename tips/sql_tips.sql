-- Retrieve a table's colums names
SELECT column_name
FROM   information_schema.columns
WHERE  table_schema = 'schema_name'
AND    table_name   = 'table_name'
