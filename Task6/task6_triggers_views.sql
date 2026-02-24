CREATE DATABASE  audit_system;
USE audit_system;
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(100),
    amount DECIMAL(10,2),
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE audit_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    action_type VARCHAR(20),
    transaction_id INT,
    user_name VARCHAR(100),
    amount DECIMAL(10,2),
    log_time DATETIME DEFAULT CURRENT_TIMESTAMP
);
DELIMITER //

CREATE TRIGGER after_transaction_insert
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (action_type, transaction_id, user_name, amount)
    VALUES ('INSERT', NEW.transaction_id, NEW.user_name, NEW.amount);
END //

DELIMITER ;
DELIMITER //

CREATE TRIGGER after_transaction_update
AFTER UPDATE ON transactions
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (action_type, transaction_id, user_name, amount)
    VALUES ('UPDATE', NEW.transaction_id, NEW.user_name, NEW.amount);
END //

DELIMITER ;
INSERT INTO transactions (user_name, amount)
VALUES ('Kavyasri', 2500);
SELECT * FROM audit_log;
UPDATE transactions
SET amount = 3000
WHERE transaction_id = 1;
SELECT * FROM audit_log;
CREATE VIEW daily_activity_report AS
SELECT 
    DATE(log_time) AS activity_date,
    COUNT(*) AS total_actions,
    SUM(amount) AS total_amount
FROM audit_log
GROUP BY DATE(log_time);
SELECT * FROM daily_activity_report;
