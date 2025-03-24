 create database PaymentAppdb;
 use PaymentAppdb;
 
 -- creating users table
 
 CREATE TABLE user_details (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    address VARCHAR(255),
    phone_number VARCHAR(15),
    email VARCHAR(255)
);

-- inserting some dummy data into users table

-- Insert dummy data
INSERT INTO user_details (user_id, user_name, password, first_name, last_name, address, phone_number, email) VALUES
(1, 'arjun_patel', 'password123', 'Arjun', 'Patel', '123 Gandhi Road, Mumbai, Maharashtra', '9876543210', 'arjun.patel@example.com'),
(2, 'meera_sharma', 'securePass456', 'Meera', 'Sharma', '456 Nehru Street, Delhi', '8765432109', 'meera.sharma@example.com'),
(3, 'raj_kumar', 'myPassword789', 'Raj', 'Kumar', '789 Patel Avenue, Chennai, Tamil Nadu', '7654321098', 'raj.kumar@example.com'),
(4, 'priya_singh', 'superSecret321', 'Priya', 'Singh', '321 Tagore Lane, Kolkata, West Bengal', '6543210987', 'priya.singh@example.com'),
(5, 'ravi_desai', 'passWord555', 'Ravi', 'Desai', '555 Bose Boulevard, Hyderabad, Telangana', '5432109876', 'ravi.desai@example.com'),
(6, 'suman_raju', 'newPass321', 'Suman', 'Raju', '678 Gandhi Nagar, Bengaluru, Karnataka', '4321098765', 'suman.raju@example.com');

-- creating an accounts table to store user's account details
CREATE TABLE user_account_details (
    user_account_id INT PRIMARY KEY,
    account_open_date DATE,
    user_id INT,
    current_wallet_balance DECIMAL(10, 2),
    wallet_pin VARCHAR(50),
    linked_bank_accounts_count INT,
    FOREIGN KEY (user_id) REFERENCES user_details(user_id)
);

-- Insert dummy data
INSERT INTO user_account_details (user_account_id, account_open_date, user_id, current_wallet_balance, wallet_pin, linked_bank_accounts_count) VALUES
(1, '2023-01-10', 1, 5000.00, '1234', 2),  
(2, '2023-02-15', 2, 3000.00, '2345', 1), 
(3, '2023-03-20', 3, 4500.00, '3456', 2),  
(4, '2023-04-25', 4, 2000.00, '4567', 1), 
(5, '2023-05-30', 5, 3500.00, '5678', 1), 
(6, '2023-06-05', 6, 4000.00, '6789', 2); 

-- creating a table to store data on user's bank acounts 
CREATE TABLE bank_accounts (
    bank_account_id INT PRIMARY KEY,
    user_id INT,
    account_number VARCHAR(50) NOT NULL,
    ifsc_code VARCHAR(20),
    bank_name VARCHAR(100),
    branch_location VARCHAR(255),
    is_active VARCHAR(10),
    FOREIGN KEY (user_id) REFERENCES user_details(user_id)
);

-- Inserting dummy data
INSERT INTO bank_accounts (bank_account_id, user_id, account_number, ifsc_code, bank_name, branch_location, is_active) VALUES
(1, 1, '1234567890', 'SBIN0001234', 'State Bank of India', 'Mumbai, Maharashtra', 'yes'),
(2, 2, '2345678901', 'ICIC0005678', 'ICICI Bank', 'Delhi', 'yes'),
(3, 3, '3456789012', 'HDFC0009876', 'HDFC Bank', 'Chennai, Tamil Nadu', 'yes'),
(4, 4, '4567890123', 'AXIS0006543', 'Axis Bank', 'Kolkata, West Bengal', 'yes'),
(5, 5, '5678901234', 'PNB0004321', 'Punjab National Bank', 'Hyderabad, Telangana', 'yes'),
(6, 6, '6789012345', 'CANB0006789', 'Canara Bank', 'Bengaluru, Karnataka', 'yes'),
(7, 1, '7890123456', 'BOBI0008765', 'Bank of Baroda', 'Mumbai, Maharashtra', 'no'),
(8, 3, '8901234567', 'UBIN0001234', 'Union Bank of India', 'Chennai, Tamil Nadu', 'no'),
(9, 6, '9012345678', 'INDB0004567', 'IndusInd Bank', 'Bengaluru, Karnataka', 'yes'),
(10, 4, '0123456789', 'IDFC0007654', 'IDFC First Bank', 'Kolkata, West Bengal', 'no');

-- transactions table creation

CREATE TABLE transaction_details (
    transaction_id INT PRIMARY KEY,
    transaction_date_time TIMESTAMP,
    source_id INT,
    target_id INT,
    source_type VARCHAR(50), 
    destination_type VARCHAR(50), 
    transaction_amount DECIMAL(10, 2)
);

-- Inserting dummy data
INSERT INTO transaction_details (transaction_id, transaction_date_time, source_id, target_id, source_type, destination_type, transaction_amount) VALUES
(1, '2023-01-15 10:30:00', 1, 2, 'BA', 'WA', 1500.00),
(2, '2023-02-20 14:45:00', 3, 4, 'WA', 'BA', 2000.00),
(3, '2023-03-25 09:20:00', 5, 6, 'BA', 'BA', 2500.00),
(4, '2023-04-30 16:10:00', 6, 1, 'WA', 'WA', 1000.00),
(5, '2023-05-05 12:55:00', 2, 3, 'BA', 'WA', 3000.00),
(6, '2023-06-10 08:35:00', 4, 5, 'WA', 'BA', 1800.00);


-- creating sourcetypes table

CREATE TABLE source_types (
    source_id INT PRIMARY KEY,
    source_type VARCHAR(50)
);

-- Sample data for source_types
INSERT INTO source_types (source_id, source_type) VALUES (1, 'BA');  -- BA-Bank Account
INSERT INTO source_types (source_id, source_type) VALUES (2, 'WA');  -- WA- Wallet account

ALTER TABLE bank_accounts
ADD COLUMN balance DECIMAL(15, 2) DEFAULT 0.00;

UPDATE bank_accounts SET balance = 5000.00 WHERE bank_account_id = 1;
UPDATE bank_accounts SET balance = 10000.00 WHERE bank_account_id = 2;
UPDATE bank_accounts SET balance = 7500.00 WHERE bank_account_id = 3;
UPDATE bank_accounts SET balance = 12000.00 WHERE bank_account_id = 4;
UPDATE bank_accounts SET balance = 3000.00 WHERE bank_account_id = 5;
UPDATE bank_accounts SET balance = 8000.00 WHERE bank_account_id = 6;
UPDATE bank_accounts SET balance = 0.00 WHERE bank_account_id = 7; -- Inactive account
UPDATE bank_accounts SET balance = 0.00 WHERE bank_account_id = 8; -- Inactive account
UPDATE bank_accounts SET balance = 15000.00 WHERE bank_account_id = 9;
UPDATE bank_accounts SET balance = 0.00 WHERE bank_account_id = 10; -- Inactive account

update bank_accounts set balance=balance+10000 where account_number=9012345678 LIMIT 1;
 -- adding AUTO INCREMENT constraint to banck_account_id
ALTER TABLE bank_accounts MODIFY COLUMN bank_account_id INT AUTO_INCREMENT;

SELECT * FROM user_details;
SELECT * FROM user_account_details;
SELECT * FROM bank_accounts;
SELECT * FROM transaction_details;

-- retrieving user_id ,current_balance and their no.of accounts

SELECT u.user_name,a.current_wallet_balance, a.linked_bank_accounts_count
FROM user_details u
JOIN user_account_details a ON u.user_id = a.user_id;

-- retrieving users bank account details

SELECT u.user_name,b.bank_name, b.account_number, b.is_active
FROM user_details u
JOIN bank_accounts b ON u.user_id = b.user_id;

-- transaction details of an user

SELECT t.transaction_id, t.source_id, t.target_id, t.source_type, t.destination_type, t.transaction_amount
FROM transaction_details t
WHERE t.source_id = 1 OR t.target_id = 1;

SELECT * FROM bank_accounts WHERE user_id = 1;

