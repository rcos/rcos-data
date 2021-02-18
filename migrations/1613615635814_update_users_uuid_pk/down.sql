-- First anything that references users
ALTER TABLE bonus_attendances DROP COLUMN user_id;
ALTER TABLE bonus_attendances ADD username REFERENCES users (username);

ALTER TABLE enrollments DROP COLUMN user_id;
ALTER TABLE enrollments ADD username REFERENCES users (username);

ALTER TABLE final_grade_appeal DROP COLUMN user_id;
ALTER TABLE final_grade_appeal ADD username REFERENCES users (username);

ALTER TABLE meeting_attendances DROP COLUMN user_id;
ALTER TABLE meeting_attendances ADD username REFERENCES users (username);

ALTER TABLE meeting_attendances DROP COLUMN host_user_id;
ALTER TABLE meeting_attendances ADD host_username REFERENCES users (username);

ALTER TABLE mentor_proposals DROP COLUMN user_id;
ALTER TABLE mentor_proposals ADD username REFERENCES users (username);
ALTER TABLE mentor_proposals DROP COLUMN reviewer_user_id;
ALTER TABLE mentor_proposals ADD reviewer_username REFERENCES users (username);

ALTER TABLE pay_requests DROP COLUMN user_id;
ALTER TABLE pay_requests ADD username REFERENCES users (username);

ALTER TABLE project_pitches DROP COLUMN user_id;
ALTER TABLE project_pitches ADD username REFERENCES users (username);

ALTER TABLE project_presentation_grades DROP COLUMN grader_username;
ALTER TABLE project_presentation_grades ADD grader_user_id REFERENCES users (user_id);

ALTER TABLE small_group_mentors DROP COLUMN user_id;
ALTER TABLE small_group_mentors ADD username REFERENCES users (username);

ALTER TABLE status_update_submissions DROP COLUMN user_id;
ALTER TABLE status_update_submissions ADD username REFERENCES users (username);
ALTER TABLE status_update_submissions DROP COLUMN grader_user_id;
ALTER TABLE status_update_submissions ADD grader_username REFERENCES users (username);

ALTER TABLE user_accounts DROP COLUMN user_id;
ALTER TABLE user_accounts ADD username REFERENCES users (username);

ALTER TABLE workshop_proposals DROP COLUMN user_id;
ALTER TABLE workshop_proposals ADD username REFERENCES users (username);
ALTER TABLE workshop_proposals ROP COLUMN reviewer_user_id;
ALTER TABLE workshop_proposals ADD reviewer_username REFERENCES users (username);

-- Finally the main users table
ALTER TABLE users DROP CONSTRAINT users_pkey;
ALTER TABLE users ADD PRIMARY KEY (user_id);
ALTER TABLE users DROP COLUMN user_id;
