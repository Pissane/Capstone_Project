SELECT "date", average_temp_c, minimum_temp_c, maximum_temp_c, precipitation_mm, snow_mm, wind_direction_deg, windspeed_kmh, peak_wind_gust_kmh, air_pressure_hpa, sunshine_min, station_id, weather_station_name, states
FROM capstone_wildfire.combined_weather_data_v4;

CREATE TABLE combined_weather_data_v5  AS
SELECT *
FROM combined_weather_data_v4;

-- Kreiiere Column Lat & Lon
ALTER TABLE combined_weather_data_v4
ADD COLUMN latitude DECIMAL(9, 6),
ADD COLUMN longitude DECIMAL(9, 6);

-- Füge Spalten für latitude und longitude hinzu
ALTER TABLE combined_weather_data_v4
ADD COLUMN latitude DECIMAL(9, 6),
ADD COLUMN longitude DECIMAL(9, 6);

-- Aktualisiere die Werte in den neuen Spalten basierend auf dem Dictionary
UPDATE combined_weather_data_v4
SET
  latitude = CASE
    WHEN station_id = 'KBFI0' THEN 47.53
    WHEN station_id = '72494' THEN 37.6167
    WHEN station_id = '72295' THEN 33.9333
    WHEN station_id = '72278' THEN 33.4333
    WHEN station_id = '72365' THEN 35.0333
    WHEN station_id = 'KIWS0' THEN 29.8182
    WHEN station_id = '72356' THEN 36.2
    WHEN station_id = '72334' THEN 35.0333
    WHEN station_id = '72223' THEN 30.6833
    WHEN station_id = '72211' THEN 27.9667
    WHEN station_id = '72202' THEN 25.7833
    WHEN station_id = '72327' THEN 36.1167
    WHEN station_id = '72219' THEN 33.65
    WHEN station_id = '72314' THEN 35.214
    WHEN station_id = '72785' THEN 47.6167
    WHEN station_id = '72681' THEN 43.5667
    WHEN station_id = '72775' THEN 47.4667
    WHEN station_id = 'KP600' THEN 44.55
    WHEN station_id = '72572' THEN 40.7833
    WHEN station_id = 'KMIB0' THEN 48.4158
    WHEN station_id = '72662' THEN 44.05
    WHEN station_id = '71850' THEN 49.79
    WHEN station_id = '72658' THEN 44.8667
    WHEN station_id = 'KYIP0' THEN 42.2393
    WHEN station_id = '72405' THEN 38.85
    WHEN station_id = 'CYMX0' THEN 45.6667
    WHEN station_id = '72534' THEN 41.7833
    WHEN station_id = '72421' THEN 39.05
    WHEN station_id = '72434' THEN 38.75
    WHEN station_id = '72446' THEN 39.2972
    WHEN station_id = '72562' THEN 41.1167
    WHEN station_id = 'KBKF0' THEN 39.7017
    WHEN station_id = '72476' THEN 39.1333
    WHEN station_id = 'KCDC0' THEN 37.701
    WHEN station_id = '72218' THEN 33.3667
    WHEN station_id = 'KCSG0' THEN 32.5163
    WHEN station_id = '71954' THEN 69.45
    WHEN station_id = '70219' THEN 60.7833
    WHEN station_id = '70030' THEN 70.6333
    WHEN station_id = '70194' THEN 66.5667
    WHEN station_id = '70261' THEN 64.8
    WHEN station_id = '70362' THEN 59.4667
    WHEN station_id = '70340' THEN 59.75
    WHEN station_id = '70273' THEN 61.1667
    WHEN station_id = 'KJXN0' THEN 42.2604
    WHEN station_id = 'KLRF0' THEN 34.9168
    WHEN station_id = '72509' THEN 42.3667
    WHEN station_id = '72518' THEN 42.75
    WHEN station_id = '72519' THEN 43.1167
    WHEN station_id = '72528' THEN 42.9333
    WHEN station_id = 'KFLO0' THEN 34.1854
    WHEN station_id = '74756' THEN 29.6901
    WHEN station_id = '72302' THEN 34.2706
    WHEN station_id = 'KNTU0' THEN 36.8227
    WHEN station_id = '72306' THEN 35.9
    WHEN station_id = '72315' THEN 35.4333
    WHEN station_id = '72258' THEN 32.8471
    WHEN station_id = '72253' THEN 29.5333
    WHEN station_id = '72248' THEN 32.45
    WHEN station_id = '72783' THEN 46.3667
    WHEN station_id = 'KBKE0' THEN 44.8373
    WHEN station_id = 'KRDM0' THEN 44.2541
    WHEN station_id = '72694' THEN 44.9
    WHEN station_id = 'KLMT0' THEN 42.1561
    WHEN station_id = '72290' THEN 32.7333
    WHEN station_id = '72384' THEN 35.4333
    WHEN station_id = '72389' THEN 36.7833
    WHEN station_id = '72488' THEN 39.4833
    WHEN station_id = 'KMCC0' THEN 38.6676
    WHEN station_id = '72594' THEN 40.8
    WHEN station_id = '72214' THEN 30.4
    WHEN station_id = '72207' THEN 32.1167
    ELSE NULL
  END,
  longitude = CASE
    WHEN station_id = 'KBFI0' THEN -122.302
    WHEN station_id = '72494' THEN -122.3667
    WHEN station_id = '72295' THEN -118.3833
    WHEN station_id = '72278' THEN -112.05
    WHEN station_id = '72365' THEN -106.6
    WHEN station_id = 'KIWS0' THEN -95.6726
    WHEN station_id = '72356' THEN -95.8881
    WHEN station_id = '72334' THEN -89.9833
    WHEN station_id = '72223' THEN -88.0667
    WHEN station_id = '72211' THEN -82.5333
    WHEN station_id = '72202' THEN -80.3167
    WHEN station_id = '72327' THEN -86.6833
    WHEN station_id = '72219' THEN -84.1
    WHEN station_id = '72314' THEN -80.9431
    WHEN station_id = '72785' THEN -117.5333
    WHEN station_id = '72681' THEN -116.2333
    WHEN station_id = '72775' THEN -111.3833
    WHEN station_id = 'KP600' THEN -110.4167
    WHEN station_id = '72572' THEN -111.9667
    WHEN station_id = 'KMIB0' THEN -101.358
    WHEN station_id = '72662' THEN -103.05
    WHEN station_id = '71850' THEN -94.36
    WHEN station_id = '72658' THEN -93.05
    WHEN station_id = 'KYIP0' THEN -83.531
    WHEN station_id = '72405' THEN -77.0333
    WHEN station_id = 'CYMX0' THEN -74.0333
    WHEN station_id = '72534' THEN -87.75
    WHEN station_id = '72421' THEN -84.6667
    WHEN station_id = '72434' THEN -90.0333
    WHEN station_id = '72446' THEN -94.7306
    WHEN station_id = '72562' THEN -100.6667
    WHEN station_id = 'KBKF0' THEN -104.7517
    WHEN station_id = '72476' THEN -108.5333
    WHEN station_id = 'KCDC0' THEN -113.0988
    WHEN station_id = '72218' THEN -81.9667
    WHEN station_id = 'KCSG0' THEN -84.9389
    WHEN station_id = '71954' THEN -133.0167
    WHEN station_id = '70219' THEN -161.8333
    WHEN station_id = '70030' THEN -160.0333
    WHEN station_id = '70194' THEN -145.2667
    WHEN station_id = '70261' THEN -147.8667
    WHEN station_id = '70362' THEN -135.3167
    WHEN station_id = '70340' THEN -154.9167
    WHEN station_id = '70273' THEN -150.0333
    WHEN station_id = 'KJXN0' THEN -84.4604
    WHEN station_id = 'KLRF0' THEN -92.1465
    WHEN station_id = '72509' THEN -71.0167
    WHEN station_id = '72518' THEN -73.1333
    WHEN station_id = '72519' THEN -76.1
    WHEN station_id = '72528' THEN -78.7333
    WHEN station_id = 'KFLO0' THEN -79.7239
    WHEN station_id = '74756' THEN -82.2718
    WHEN station_id = '72302' THEN -77.9026
    WHEN station_id = 'KNTU0' THEN -76.0319
    WHEN station_id = '72306' THEN -78.7667
    WHEN station_id = '72315' THEN -82.0333
    WHEN station_id = '72258' THEN -96.8518
    WHEN station_id = '72253' THEN -98.4667
    WHEN station_id = '72248' THEN -93.0
    WHEN station_id = '72783' THEN -117.0167
    WHEN station_id = 'KBKE0' THEN -117.8091
    WHEN station_id = 'KRDM0' THEN -121.15
    WHEN station_id = '72694' THEN -123.0
    WHEN station_id = 'KLMT0' THEN -121.7332
    WHEN station_id = '72290' THEN -117.1833
    WHEN station_id = '72384' THEN -119.05
    WHEN station_id = '72389' THEN -119.7167
    WHEN station_id = '72488' THEN -119.7667
    WHEN station_id = 'KMCC0' THEN -121.4006
    WHEN station_id = '72594' THEN -124.1667
    WHEN station_id = '72214' THEN -84.0167
    WHEN station_id = '72207' THEN -81.0333
    ELSE NULL
    END;
