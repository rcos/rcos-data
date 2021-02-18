-- This migration replaces the usage of username as user's primary key and
-- identifier with a UUID
-- This does not remove the username field, so it should avoid broken foriegn
-- keys in the transition period

-- First the main users table
ALTER TABLE users ADD user_id UUID NOT NULL DEFAULT uuid_generate_v4();
ALTER TABLE users DROP CONSTRAINT users_pkey;
ALTER TABLE users ADD PRIMARY KEY (user_id);

-- Then anything that references it
ALTER TABLE bonus_attendances DROP COLUMN username;
ALTER TABLE bonus_attendances ADD user_id REFERENCES users (user_id);

ALTER TABLE enrollments DROP COLUMN username;
ALTER TABLE enrollments ADD user_id REFERENCES users (user_id);

ALTER TABLE final_grade_appeal DROP COLUMN username;
ALTER TABLE final_grade_appeal ADD user_id REFERENCES users (user_id);

ALTER TABLE meeting_attendances DROP COLUMN username;
ALTER TABLE meeting_attendances ADD user_id REFERENCES users (user_id);

ALTER TABLE meeting_attendances DROP COLUMN host_username;
ALTER TABLE meeting_attendances ADD host_user_id REFERENCES users (user_id);

ALTER TABLE mentor_proposals DROP COLUMN username;
ALTER TABLE mentor_proposals ADD user_id REFERENCES users (user_id);
ALTER TABLE mentor_proposals DROP COLUMN reviewer_username;
ALTER TABLE mentor_proposals ADD reviewer_user_id REFERENCES users (user_id);

ALTER TABLE pay_requests DROP COLUMN username;
ALTER TABLE pay_requests ADD user_id REFERENCES users (user_id);

ALTER TABLE project_pitches DROP COLUMN username;
ALTER TABLE project_pitches ADD user_id REFERENCES users (user_id);

ALTER TABLE project_presentation_grades DROP COLUMN grader_username;
ALTER TABLE project_presentation_grades ADD grader_user_id REFERENCES users (user_id);

ALTER TABLE small_group_mentors DROP COLUMN username;
ALTER TABLE small_group_mentors ADD user_id REFERENCES users (user_id);

ALTER TABLE status_update_submissions DROP COLUMN username;
ALTER TABLE status_update_submissions ADD user_id REFERENCES users (user_id);
ALTER TABLE status_update_submissions DROP COLUMN grader_username;
ALTER TABLE status_update_submissions ADD grader_user_id REFERENCES users (user_id);

ALTER TABLE user_accounts DROP COLUMN username;
ALTER TABLE user_accounts ADD user_id REFERENCES users (user_id);

ALTER TABLE workshop_proposals DROP COLUMN username;
ALTER TABLE workshop_proposals ADD user_id REFERENCES users (user_id);
ALTER TABLE workshop_proposals ROP COLUMN reviewer_username;
ALTER TABLE workshop_proposals ADD reviewer_user_id REFERENCES users (user_id);
