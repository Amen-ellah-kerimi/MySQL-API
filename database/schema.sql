CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO users (name, email) VALUES
('Jean Dupont', 'jean.dupont@example.com'),
('Marie Martin', 'marie.martin@example.com'),
('Pierre Durand', 'pierre.durand@example.com')
ON DUPLICATE KEY UPDATE name=VALUES(name);
