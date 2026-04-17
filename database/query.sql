CREATE TABLE users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

    username VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    password_hash VARCHAR(255) NOT NULL,

    status user_status NOT NULL DEFAULT 'ACTIVE',
    role user_role NOT NULL DEFAULT 'USER',

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    last_login TIMESTAMPTZ
);
ALTER TABLE users
ADD CONSTRAINT uq_users_username UNIQUE (username);

ALTER TABLE users
ADD CONSTRAINT uq_users_email UNIQUE (email);

CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_users_email ON users(email);
CREATE TABLE login_logs (
    log_id BIGSERIAL PRIMARY KEY,

    user_id UUID REFERENCES users(user_id) ON DELETE CASCADE,
    ip_address INET,
    login_status BOOLEAN, -- true = success, false = failed
    attempted_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
INSERT INTO users (username, email, password_hash)
VALUES (
    'admin',
    'admin@example.com',
    '$2y$10$EXAMPLEHASHVALUEGENERATEDBYPHP'
);
password_hash('admin123', PASSWORD_DEFAULT);
SELECT user_id, password_hash, status
FROM users
WHERE username = $1
LIMIT 1;