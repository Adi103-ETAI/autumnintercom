-- Run as autumn_intercom_migrator after every successful database migrate.
-- These roles have no grants on another product's tables.
\set ON_ERROR_STOP on
BEGIN;
GRANT USAGE ON SCHEMA autumn_intercom TO autumn_intercom_runtime;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA autumn_intercom TO autumn_intercom_runtime;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA autumn_intercom TO autumn_intercom_runtime;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA autumn_intercom TO autumn_intercom_runtime;
REVOKE INSERT, UPDATE, DELETE ON autumn_intercom.schema_migrations FROM autumn_intercom_runtime;
REVOKE ALL ON SCHEMA autumn_intercom FROM PUBLIC;
REVOKE ALL ON ALL TABLES IN SCHEMA autumn_intercom FROM PUBLIC;
REVOKE ALL ON ALL FUNCTIONS IN SCHEMA autumn_intercom FROM PUBLIC;
COMMIT;
