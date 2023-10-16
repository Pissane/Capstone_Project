SELECT "date", average_temp_c, minimum_temp_c, maximum_temp_c, precipitation_mm, snow_mm, wind_direction_deg, windspeed_kmh, peak_wind_gust_kmh, air_pressure_hpa, sunshine_min, station_id, weather_station_name
FROM capstone_wildfire.combined_weather_data_v4;

CREATE TABLE combined_weather_data_v5 AS
SELECT *
FROM combined_weather_data_v3;

ALTER TABLE combined_weather_data_v5 ADD COLUMN states VARCHAR;

-- Fügen Sie den Bundesstaat basierend auf station_id hinzu
 
UPDATE combined_weather_data_v4
SET states = 
    CASE
        WHEN station_id = 'KBFI0' THEN 'Washington'
        WHEN station_id = '72494' THEN 'California'
        WHEN station_id = '72295' THEN 'California'
        WHEN station_id = '72278' THEN 'Arizona'
        WHEN station_id = '72365' THEN 'New Mexico'
        WHEN station_id = 'KIWS0' THEN 'Texas'
        WHEN station_id = '72356' THEN 'Oklahoma'
        WHEN station_id = '72334' THEN 'Tennessee'
        WHEN station_id = '72223' THEN 'Alabama'
        WHEN station_id = '72211' THEN 'Florida'
        WHEN station_id = '72202' THEN 'Florida'
        WHEN station_id = '72327' THEN 'Tennessee'
        WHEN station_id = '72219' THEN 'Georgia'
        WHEN station_id = '72314' THEN 'North Carolina'
        WHEN station_id = '72785' THEN 'Washington'
        WHEN station_id = '72681' THEN 'Idaho'
        WHEN station_id = '72775' THEN 'Montana'
        WHEN station_id = 'KP600' THEN 'Wyoming'
        WHEN station_id = '72572' THEN 'Utah'
        WHEN station_id = 'KMIB0' THEN 'North Dakota'
        WHEN station_id = '72662' THEN 'South Dakota'
        WHEN station_id = '71850' THEN 'Ontario, Canada'
        WHEN station_id = '72658' THEN 'Minnesota'
        WHEN station_id = 'KYIP0' THEN 'Michigan'
        WHEN station_id = '72405' THEN 'Virginia'
        WHEN station_id = 'CYMX0' THEN 'Quebec, Canada'
        WHEN station_id = '72534' THEN 'Illinois'
        WHEN station_id = '72421' THEN 'Kentucky'
        WHEN station_id = '72434' THEN 'Missouri'
        WHEN station_id = '72446' THEN 'Missouri'
        WHEN station_id = '72562' THEN 'Nebraska'
        WHEN station_id = 'KBKF0' THEN 'Colorado'
        WHEN station_id = '72476' THEN 'Colorado'
        WHEN station_id = 'KCDC0' THEN 'Utah'
        WHEN station_id = '72218' THEN 'Georgia'
        WHEN station_id = 'KCSG0' THEN 'Georgia'
        WHEN station_id = '71954' THEN 'Northwest Territories, Canada'
        WHEN station_id = '70219' THEN 'Alaska'
        WHEN station_id = '70030' THEN 'Alaska'
        WHEN station_id = '70194' THEN 'Alaska'
        WHEN station_id = '70261' THEN 'Alaska'
        WHEN station_id = '70362' THEN 'Alaska'
        WHEN station_id = '70340' THEN 'Alaska'
        WHEN station_id = '70273' THEN 'Alaska'
        WHEN station_id = 'KJXN0' THEN 'Mississippi'
        WHEN station_id = 'KLRF0' THEN 'Arkansas'
        WHEN station_id = '72509' THEN 'Massachusetts'
        WHEN station_id = '72518' THEN 'New York'
        WHEN station_id = '72519' THEN 'New York'
        WHEN station_id = '72528' THEN 'New York'
        WHEN station_id = 'KFLO0' THEN 'South Carolina'
        WHEN station_id = '74756' THEN 'Florida'
        WHEN station_id = '72302' THEN 'North Carolina'
        WHEN station_id = 'KNTU0' THEN 'Virginia'
        WHEN station_id = '72306' THEN 'North Carolina'
        WHEN station_id = '72315' THEN 'North Carolina'
        WHEN station_id = '72258' THEN 'Texas'
        WHEN station_id = '72253' THEN 'Texas'
        WHEN station_id = '72248' THEN 'Louisiana'
        WHEN station_id = '72783' THEN 'Idaho'
        WHEN station_id = 'KBKE0' THEN 'Oregon'
        WHEN station_id = 'KRDM0' THEN 'Oregon'
        WHEN station_id = '72694' THEN 'Oregon'
        WHEN station_id = 'KLMT0' THEN 'Oregon'
        WHEN station_id = '72290' THEN 'California'
        WHEN station_id = '72384' THEN 'California'
        WHEN station_id = '72389' THEN 'California'
        WHEN station_id = '72488' THEN 'Nevada'
        WHEN station_id = 'KMCC0' THEN 'California'
        WHEN station_id = '72594' THEN 'California'
        WHEN station_id = '72214' THEN 'Florida'
        WHEN station_id = '72207' THEN 'Georgia'
    END;


