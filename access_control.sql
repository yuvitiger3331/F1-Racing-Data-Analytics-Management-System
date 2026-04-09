-- ============================================================
-- F1 Racing Data Analytics & Management System
-- DCL: Data Control Language – User Roles & Permissions
-- ============================================================

-- ============================================================
-- Create roles / users
-- ============================================================

-- Read-only analyst (BI / reporting team)
CREATE USER IF NOT EXISTS 'f1_analyst'@'localhost' IDENTIFIED BY 'Analyst@2025!';

-- Race data entry operator
CREATE USER IF NOT EXISTS 'f1_operator'@'localhost' IDENTIFIED BY 'Operator@2025!';

-- Admin (full access)
CREATE USER IF NOT EXISTS 'f1_admin'@'localhost' IDENTIFIED BY 'Admin@2025!';

-- ============================================================
-- Grant privileges
-- ============================================================

-- Analyst: SELECT only on all tables
GRANT SELECT ON f1_analytics.* TO 'f1_analyst'@'localhost';

-- Operator: INSERT & UPDATE on RaceResults and Races; SELECT everywhere
GRANT SELECT              ON f1_analytics.*             TO 'f1_operator'@'localhost';
GRANT INSERT, UPDATE      ON f1_analytics.RaceResults   TO 'f1_operator'@'localhost';
GRANT INSERT, UPDATE      ON f1_analytics.Races         TO 'f1_operator'@'localhost';

-- Admin: all privileges
GRANT ALL PRIVILEGES ON f1_analytics.* TO 'f1_admin'@'localhost';

-- Apply changes
FLUSH PRIVILEGES;

-- ============================================================
-- Revoke example (remove INSERT from operator on Races)
-- Uncomment if needed:
-- REVOKE INSERT ON f1_analytics.Races FROM 'f1_operator'@'localhost';
-- ============================================================

-- View current grants
SHOW GRANTS FOR 'f1_analyst'@'localhost';
SHOW GRANTS FOR 'f1_operator'@'localhost';
SHOW GRANTS FOR 'f1_admin'@'localhost';
