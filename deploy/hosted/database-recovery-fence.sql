-- Apply only to a newly restored, private service before reconnecting clients.
-- A snapshot can predate revocations. Retain work/history, invalidate connection
-- authority, and require operator review before each workspace is re-enabled.
\set ON_ERROR_STOP on
BEGIN;
UPDATE autumn_intercom.hosted_workspaces
SET disabled_at = (extract(epoch FROM clock_timestamp()) * 1000)::bigint
WHERE disabled_at = 0;
UPDATE autumn_intercom.hosted_devices
SET revoked_at = (extract(epoch FROM clock_timestamp()) * 1000)::bigint
WHERE revoked_at = 0;
UPDATE autumn_intercom.hosted_invites
SET revoked_at = (extract(epoch FROM clock_timestamp()) * 1000)::bigint
WHERE revoked_at = 0;
DELETE FROM autumn_intercom.oauth_tokens;
DELETE FROM autumn_intercom.oauth_requests;
DELETE FROM autumn_intercom.hosted_pairings;
UPDATE autumn_intercom.agents
SET lease_expires_at=0,ready=0,lifecycle='offline';
UPDATE autumn_intercom.reservations SET expires_at=0;
COMMIT;
