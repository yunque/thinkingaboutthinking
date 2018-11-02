-- List all tables and role privileges
\l

-- List all schemas (name; owner; access privileges; descrip.)
\dn+

-- Change database, once connected to server
\connect <other_db>

-- Subshell command invocation
\! pwd
\! ls -l
etc.

-- Run a .sql script within psql
\i /path/to/script.sql

-- Toggle timing
\timing
