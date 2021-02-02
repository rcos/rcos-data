-- migrate:up
-- Add new single name field
ALTER TABLE users ADD COLUMN full_name VARCHAR;
COMMENT ON COLUMN users.full_name IS 'Name of user, may or may not be full name.';

-- Migrate names over
UPDATE users SET full_name = COALESCE(users.first_name, '') || ' ' || COALESCE(users.last_name, '');

ALTER TABLE users ALTER COLUMN full_name SET NOT NULL;

-- Drop old name fields
ALTER TABLE users DROP COLUMN first_name CASCADE, DROP COLUMN last_name CASCADE;

-- Display name is either full name or preferred name if set
ALTER TABLE users
  ADD COLUMN display_name VARCHAR
    GENERATED ALWAYS AS (COALESCE(preferred_name, full_name)) STORED;

COMMENT ON COLUMN users.display_name IS 'Name to use in UIs for user.';

-- migrate:down

ALTER TABLE users DROP COLUMN full_name CASCADE; -- Also drops display_name

ALTER TABLE users
  ADD COLUMN
    first_name VARCHAR,
  ADD COLUMN
    last_name VARCHAR;