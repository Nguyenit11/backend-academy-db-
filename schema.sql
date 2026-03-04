-- Create users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    full_name VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert 5 users 
INSERT INTO users (email, password_hash, full_name)
VALUES
('user1@example.com', 'hash1', 'User One'),
('user2@example.com', 'hash2', 'User Two'),
('user3@example.com', 'hash3', 'User Three'),
('user4@example.com', 'hash4', 'User Four'),
('user5@example.com', 'hash5', 'User Five');

-- INSERT INTO users (trùng)
VALUES ('user1@example.com', 'hash6');

-- Viết 3 select query:  
SELECT * FROM users;

SELECT email, full_name FROM users;

SELECT * FROM users WHERE id = 3;