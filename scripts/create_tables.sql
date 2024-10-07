-- Create the accounts table with additional details
CREATE TABLE accounts
(
    ID              INT AUTO_INCREMENT PRIMARY KEY,
    email           VARCHAR(255) NOT NULL UNIQUE,
    password_hash   VARCHAR(255) NOT NULL,
    salt            VARCHAR(255) NOT NULL,
    name            VARCHAR(100) NOT NULL,
    created_at      TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
    modified_at     TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
    active          tinyint(1) DEFAULT 1,
    receive_updates tinyint(1) DEFAULT 1,
    verified tinyint(1) DEFAULT 0,
    KEY `accounts_active_idx` (`active`),
    KEY `accounts_email_idx` (`email`)
);

-- Create the addresses table
CREATE TABLE addresses
(
    ID            INT AUTO_INCREMENT PRIMARY KEY,
    account_ID    INT NOT NULL,
    name          VARCHAR(255) NOT NULL,
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    city          VARCHAR(100) NOT NULL,
    state         VARCHAR(100),
    postal_code   VARCHAR(20) NOT NULL,
    country       VARCHAR(100) NOT NULL,
    created_at      TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
    modified_at     TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
    active        tinyint(1) DEFAULT 1,
    verified tinyint(1) DEFAULT 0,
    KEY `addresses_active_idx` (`active`),
    KEY `addresses_account_ID_idx` (`account_ID`)
);

-- Create the accounts table with additional details
CREATE TABLE users
(
    ID              INT AUTO_INCREMENT PRIMARY KEY,
    account_ID      INT          NOT NULL,
    email           VARCHAR(255) NOT NULL,
    cell            VARCHAR(20)  NOT NULL,
    first_name      VARCHAR(100),
    last_name       VARCHAR(100),
    created_at      TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
    modified_at     TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
    active          tinyint(1) DEFAULT 1,
    verified tinyint(1) DEFAULT 0,
    receive_updates tinyint(1) DEFAULT 1,
    KEY `users_active_idx` (`active`),
    KEY `users_email_idx` (`email`),
    KEY `users_cell_idx` (`cell`)
);

-- Create the units table
CREATE TABLE units
(
    ID     INT AUTO_INCREMENT PRIMARY KEY,
    name   VARCHAR(50) NOT NULL,
    symbol VARCHAR(10) NOT NULL,
    KEY `units_name_idx` (`name`)
);

-- Create the sensor table
CREATE TABLE sensor
(
    ID      INT AUTO_INCREMENT PRIMARY KEY,
    unit_id INT          NOT NULL,
    code    VARCHAR(100) NOT NULL,
    name    VARCHAR(100) NOT NULL,
    KEY `models_code_idx` (`code`),
    KEY `models_name_idx` (`name`),
    KEY `models_unit_id_idx` (`unit_id`)
);

-- Create the models table
CREATE TABLE models
(
    ID   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(100) NOT NULL,
    KEY `models_name_idx` (`name`),
    KEY `models_code_idx` (`code`)
);

-- Create the devices table
CREATE TABLE devices
(
    ID            INT AUTO_INCREMENT PRIMARY KEY,
    account_ID    INT          NOT NULL,
    device_name   VARCHAR(100) NOT NULL,
    serial_number VARCHAR(100) NOT NULL,
    model_id      INT,
    active    tinyint(1) DEFAULT 1,
    KEY `devices_active_idx` (`active`),
    KEY `devices_model_id_idx` (`model_id`),
    KEY `devices_serial_number_idx` (`serial_number`)
);

-- Create the devices table
CREATE TABLE device_attachements
(
    ID        INT AUTO_INCREMENT PRIMARY KEY,
    device_ID INT NOT NULL,
    sensor_ID INT NOT NULL,
    active    tinyint(1) DEFAULT 1,
    KEY `device_attachements_device_ID_idx` (`device_ID`),
    KEY `device_attachements_sensor_ID_idx` (`sensor_ID`),
    KEY `device_attachements_active_idx` (`active`)
);
