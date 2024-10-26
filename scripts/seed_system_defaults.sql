-- Insert more data into the units table
INSERT INTO units (name, symbol)
VALUES ('None', '');
SET @NoneUnitsId = last_insert_id();
INSERT INTO units (name, symbol)
VALUES ('Percentage', '%');
SET @PercentageUnitsId = last_insert_id();
INSERT INTO units (name, symbol)
VALUES ('Celsius', '°C');
SET @CelsiusUnitsId = last_insert_id();
INSERT INTO units (name, symbol)
VALUES ('Fahrenheit', '°F');
SET @FahrenheitUnitsId = last_insert_id();
INSERT INTO units (name, symbol)
VALUES ('Kelvin', 'K');
SET @KelvinUnitsId = last_insert_id();
INSERT INTO units (name, symbol)
VALUES ('Liters', 'L');
SET @LitersUnitsId = last_insert_id();
INSERT INTO units (name, symbol)
VALUES ('Milliliters', 'mL');
SET @MillilitersUnitsId = last_insert_id();
INSERT INTO units (name, symbol)
VALUES ('Lumens', 'lm');
SET @LumensUnitsId = last_insert_id();
-- Insert data into the sensors table
INSERT INTO sensors (code, unit_id, name, config_required, config_default)
VALUES ('S00001', @PercentageUnitsId, 'Soil sensors', JSON_OBJECT('min', 0, 'max', 100), JSON_OBJECT('min', 0, 'max', 100));
SET @SolisensorsId = last_insert_id();
INSERT INTO sensors (code, unit_id, name,  config_required, config_default)
VALUES ('T00001', @CelsiusUnitsId, 'Temparture sensors', JSON_OBJECT('min', -50, 'max', 50), JSON_OBJECT('min', -50, 'max', 50));
SET @Temperaturesensors = last_insert_id();
INSERT INTO sensors (code, unit_id, name, config_required, config_default)
VALUES ('L00001', @LumensUnitsId, 'Light sensors', JSON_OBJECT('min', 0, 'max', 1000), JSON_OBJECT('min', 0, 'max', 1000));
SET @Lightsensors = last_insert_id();
-- Insert data into the models table
INSERT INTO models (code, name)
VALUES ('CHIP0001', 'ESP32');
SET @ESP32ModelId = last_insert_id();