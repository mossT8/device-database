-- Insert data into the accounts table
INSERT INTO accounts (email, password_hash, salt, name)
VALUES ('john.doe@example.com', 'hashed_password_1', 'salt_1', 'John Doe Company');
SET
    @JohnDoeId = last_insert_id();

-- Insert data into the addresses table
INSERT INTO addresses (account_ID, name, address_line1, address_line2, city, state, postal_code, country)
VALUES (@JohnDoeId, 'Home', '123 Main St', 'Apt 4', 'Springfield', 'IL', '62701', 'USA'),
       (@JohnDoeId, 'Office', '456 Elm St', '', 'Metropolis', 'NY', '10001', 'USA');

-- Insert data into the users table
INSERT INTO users (account_ID, email, cell, first_name, last_name)
VALUES (@JohnDoeId, 'john.doe@example.com', '123-456-7890', 'John', 'Doe'),
       (@JohnDoeId, 'jane.smith@example.com', '098-765-4321', 'Jane', 'Smith');

-- Insert data into the devices table
INSERT INTO devices (account_ID, device_name, serial_number, model_id)
VALUES (@JohnDoeId, 'Home Garden', 'SN123456', @ESP32ModelId);
SET
    @DummyDeviceId = last_insert_id();

-- Insert data into the devices attachments table
INSERT INTO device_attachements (device_Id, sensor_ID)
VALUES (@DummyDeviceId, @SoliSensorId),
       (@DummyDeviceId, @SoliSensorId),
       (@DummyDeviceId, @SoliSensorId),
       (@DummyDeviceId, @SoliSensorId),
       (@DummyDeviceId, @TemperatureSensor),
       (@DummyDeviceId, @LightSensor);