-- Database setup for SuperStore with password reset
CREATE DATABASE IF NOT EXISTS superstore_v2;
USE superstore_v2;

-- Users table with reset token fields
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    reset_token VARCHAR(255) DEFAULT NULL,
    token_expires DATETIME DEFAULT NULL,
    role ENUM('admin', 'cashier') DEFAULT 'cashier'
);

-- Default admin (password: admin123)
INSERT INTO users (username, password, email, role) VALUES (
    'admin',
    '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
    'admin@superstore.com',
    'admin'
);