-- Users Table
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  role VARCHAR(25),
  oauth_tokens JSONB
);
-- Teams Table
CREATE TABLE IF NOT EXISTS teams (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);
-- Team Members Table
CREATE TABLE IF NOT EXISTS team_members (
  team_id INTEGER REFERENCES teams(id),
  user_id INTEGER REFERENCES users(id),
  permissions VARCHAR(100),
  PRIMARY KEY(team_id, user_id)
);
-- Posts Table
CREATE TABLE IF NOT EXISTS posts (
  id SERIAL PRIMARY KEY,
  team_id INTEGER REFERENCES teams(id),
  content TEXT,
  media_url TEXT,
  scheduled_time TIMESTAMPTZ,
  status VARCHAR(20),
  platform VARCHAR(30)
);
-- Post Analytics Table
CREATE TABLE IF NOT EXISTS post_analytics (
  id SERIAL PRIMARY KEY,
  post_id INTEGER REFERENCES posts(id),
  platform VARCHAR(30),
  views INTEGER,
  likes INTEGER,
  comments INTEGER,
  shares INTEGER
);
-- Assets Table
CREATE TABLE IF NOT EXISTS assets (
  id SERIAL PRIMARY KEY,
  team_id INTEGER REFERENCES teams(id),
  file_url TEXT,
  type VARCHAR(30),
  created_at TIMESTAMPTZ DEFAULT NOW()
);
-- Approvals Table
CREATE TABLE IF NOT EXISTS approvals (
  post_id INTEGER REFERENCES posts(id),
  approver_id INTEGER REFERENCES users(id),
  approved BOOLEAN,
  approved_at TIMESTAMPTZ,
  PRIMARY KEY(post_id, approver_id)
);