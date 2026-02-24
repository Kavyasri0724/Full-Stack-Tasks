CREATE DATABASE IF NOT EXISTS payment_system;
USE payment_system;
CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    balance DECIMAL(10,2)
);
INSERT INTO accounts (name, balance) VALUES
('Kavyasri', 10000.00),
('Amazon_Merchant', 5000.00);
SELECT * FROM accounts;
START TRANSACTION;
UPDATE accounts
SET balance = balance - 2000
WHERE account_id = 1;
UPDATE accounts
SET balance = balance + 2000
WHERE account_id = 2;
SELECT * FROM accounts;
COMMIT;