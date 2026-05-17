-- 1. Create the database if it doesn't already exist; run as a privileged admin (e.g. root).
CREATE DATABASE IF NOT EXISTS banking_portal_db;

-- 2. DBA / migration identity: structural changes (DDL) on banking_portal_db only.
--    Requires MySQL 8+ (CREATE USER IF NOT EXISTS). Replace password before real deployment;
--    tighten Host from '%' in production where possible.
CREATE USER IF NOT EXISTS 'banking_portal_dba'@'%' IDENTIFIED BY 'REPLACE_WITH_SECURE_PASSWORD';

GRANT ALL PRIVILEGES ON banking_portal_db.* TO 'banking_portal_dba'@'%';

-- 3. Dev application identity: data changes (DML) and routine execution — no DDL on this grant.
CREATE USER IF NOT EXISTS 'banking_portal_dev'@'%' IDENTIFIED BY 'REPLACE_WITH_SECURE_PASSWORD';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES, EXECUTE
ON banking_portal_db.* TO 'banking_portal_dev'@'%';

FLUSH PRIVILEGES;

-- 4. Verify DBA and dev accounts (requires read access to mysql.user, e.g. admin session).
SELECT User, Host
FROM mysql.user
WHERE User IN ('banking_portal_dba', 'banking_portal_dev')
ORDER BY User, Host;

SHOW GRANTS FOR 'banking_portal_dba'@'%';

SHOW GRANTS FOR 'banking_portal_dev'@'%';
