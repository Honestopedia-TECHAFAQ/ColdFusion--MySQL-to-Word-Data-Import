-- db_setup.sql
CREATE DATABASE IF NOT EXISTS yourDatabase;

USE yourDatabase;

CREATE TABLE IF NOT EXISTS yourTable (
    id INT AUTO_INCREMENT PRIMARY KEY,
    yourField VARCHAR(255) NOT NULL
);

INSERT INTO yourTable (yourField) VALUES
('Sample Data 1'),
('Sample Data 2'),
('Sample Data 3'),
('This is a long string that will be truncated because it exceeds the defined length of 100 characters in this example.');
