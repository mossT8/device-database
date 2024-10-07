-- Insert more data into the units table
INSERT INTO units (name, symbol)
VALUES ('None', '');
SET
    @NoneUnitsId = last_insert_id();
INSERT INTO units (name, symbol)
VALUES ('Percentage', '%');
SET
    @PercentageUnitsId = last_insert_id();
INSERT INTO units (name, symbol)
VALUES ('Celsius', '°C');
SET
    @CelsiusUnitsId = last_insert_id();
INSERT INTO units (name, symbol)
VALUES ('Fahrenheit', '°F');
SET
    @FahrenheitUnitsId = last_insert_id();
INSERT INTO units (name, symbol)
VALUES ('Kelvin', 'K');
SET
    @KelvinUnitsId = last_insert_id();
INSERT INTO units (name, symbol)
VALUES ('Liters', 'L');
SET
    @LitersUnitsId = last_insert_id();
INSERT INTO units (name, symbol)
VALUES ('Milliliters', 'mL');
SET
    @MillilitersUnitsId = last_insert_id();
INSERT INTO units (name, symbol)
VALUES ('Lumens', 'lm');
SET
    @LumensUnitsId = last_insert_id();

-- Insert data into the sensor table
INSERT INTO sensor (code, unit_id, name)
VALUES ('S00001', @PercentageUnitsId, 'Soil Sensor');
SET
    @SoliSensorId = last_insert_id();
INSERT INTO sensor (code, unit_id, name)
VALUES ('T00001',@CelsiusUnitsId, 'Temparture Sensor');
SET
    @TemperatureSensor = last_insert_id();
INSERT INTO sensor (code, unit_id, name)
VALUES ('L00001',@LumensUnitsId, 'Light Sensor');
SET
    @LightSensor = last_insert_id();

-- Insert data into the models table
INSERT INTO models (code, name)
VALUES ('CHIP0001', 'ESP32');
SET
    @ESP32ModelId = last_insert_id();