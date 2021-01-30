-- migrate:up
-- Add new single name field
ALTER TABLE users ADD COLUMN name VARCHAR;
COMMENT ON COLUMN users.name IS 'Name of user, may or may not be full name.';

-- Migrate names over
UPDATE users SET name = users.first_name || ' ' || users.last_name;

ALTER TABLE users ALTER COLUMN name SET NOT NULL;

-- Drop old name fields
ALTER TABLE users DROP COLUMN first_name CASCADE, DROP COLUMN last_name CASCADE;

-- migrate:down

