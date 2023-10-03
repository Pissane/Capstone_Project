SELECT weather_date, weather_tavg, weather_tmin, weather_tmax, weather_prcp, weather_snow, weather_wdir, weather_wspd, weather_wpgt, weather_pres, weather_tsun, station_id, weather_station_name
FROM capstone_wildfire.baris_table;

-- Create new table

CREATE TABLE baris_table2 AS
SELECT *
FROM baris_table;

-- Convert weather_date text into date format

ALTER TABLE baris_table2
ALTER COLUMN weather_date TYPE date
USING TO_DATE(weather_date, 'YYYY-MM-DD');

-- Convert weather_date text into date float

ALTER TABLE baris_table2
ALTER COLUMN weather_tavg TYPE float USING weather_tavg::float;

ALTER TABLE baris_table2
ALTER COLUMN weather_prcp TYPE float USING weather_prcp::float;

ALTER TABLE baris_table2
ALTER COLUMN weather_snow TYPE float USING weather_snow::float;

ALTER TABLE baris_table2
ALTER COLUMN weather_wdir TYPE float USING weather_wdir::float;

ALTER TABLE baris_table2
ALTER COLUMN weather_wspd TYPE float USING weather_wspd::float;

ALTER TABLE baris_table2
ALTER COLUMN weather_wpgt TYPE float USING weather_wpgt::float;

ALTER TABLE baris_table2
ALTER COLUMN weather_pres TYPE float USING weather_pres::float;

ALTER TABLE baris_table2
ALTER COLUMN weather_tsun TYPE float USING weather_tsun::float;

-- Rename Table

ALTER TABLE baris_table2
RENAME COLUMN average_temp TO average_temp_C;

ALTER TABLE baris_table2
RENAME COLUMN weather_date TO date;

ALTER TABLE baris_table2
RENAME COLUMN weather_prcp TO precipitation_mm;

ALTER TABLE baris_table2
RENAME COLUMN weather_tmin TO minimum_temp_C;

ALTER TABLE combined_weather_data_v3
RENAME COLUMN weather_tmax TO maximum_temp_C;

ALTER TABLE baris_table2
RENAME COLUMN weather_snow TO snow_mm;

ALTER TABLE baris_table2
RENAME COLUMN weather_wdir TO wind_direction_DEG;

ALTER TABLE baris_table2
RENAME COLUMN weather_wspd TO windspeed_kmh;

ALTER TABLE baris_table2
RENAME COLUMN weather_wpgt TO peak_wind_gust_kmh;

ALTER TABLE baris_table2
RENAME COLUMN weather_pres TO air_pressure_hPa;

ALTER TABLE baris_table2
RENAME COLUMN weather_tsun TO sunshine_min;

SELECT DISTINCT weather_station_name
FROM baris_table2 bt;

SELECT DISTINCT weather_station_name
FROM combined_weather_data cwd ;

SELECT COUNT(*)
FROM baris_table2;

ALTER TABLE neue_tabelle 
RENAME TO zwischenspeicher_tabelle;

ALTER TABLE combined_weather_data_cleaned1996
RENAME TO combined_weather_data_v2;

ALTER TABLE baris_table2
RENAME TO combined_weather_data_v3;

-- Ändere Date in timestamp data typ

CREATE TABLE combined_weather_data_v4 AS
SELECT *
FROM combined_weather_data_v3;

ALTER TABLE combined_weather_data_v4
ALTER COLUMN "date" TYPE timestamp without time zone;




