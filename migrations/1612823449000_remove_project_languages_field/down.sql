ALTER TABLE projects
    ADD COLUMN languages VARCHAR[] DEFAULT '{}'::VARCHAR[] NOT NULL;