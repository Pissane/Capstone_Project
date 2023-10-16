SELECT weather_date, weather_tavg, weather_tmin, weather_tmax, weather_prcp, weather_snow, weather_wdir, weather_wspd, weather_wpgt, weather_pres, weather_tsun, station_id, weather_station_name
FROM capstone_wildfire.combined_weather_data;

-- Kopie combined_weather_data als baris_table 

CREATE TABLE baris_table AS
SELECT *
FROM combined_weather_data;


-- Duplikate wurden zum für weather_date 2006-01-01 festgestellt 

SELECT *
FROM baris_table bt 
WHERE weather_date = '1996-01-01'
ORDER BY weather_tavg DESC;

-- neue_tabelle zeigt mir alle Werte, inkl Duplikate, zum weather_date 1996-01-01 an

CREATE TABLE neue_tabelle AS
SELECT *
FROM baris_table
WHERE weather_date = '1996-01-01'
ORDER BY weather_tavg DESC;

-- Lösche Duplikate in neue_tabelle 

DELETE FROM neue_tabelle
WHERE ctid NOT IN (
    SELECT MIN(ctid)
    FROM neue_tabelle
    WHERE weather_date = '1996-01-01'
    GROUP BY weather_station_name
    HAVING COUNT(*) > 1
);

-- Lösche alle Werte für weather_station_name für weather_date 1996-01-01

DELETE FROM baris_table
WHERE (weather_station_name, weather_date) IN (
    SELECT weather_station_name, weather_date
    FROM (
        SELECT weather_station_name, weather_date, ROW_NUMBER() OVER (PARTITION BY weather_station_name, weather_date ORDER BY ctid) AS row_num
        FROM baris_table
        WHERE weather_date = '1996-01-01'
    ) AS temp
    WHERE row_num > 1
);

-- Füge Infos aus neue_tabelle in baris_table ein 

INSERT INTO baris_table
SELECT * FROM neue_tabelle;

-- Überprüfe, dass 1996-01-01 wirklich einmal vorkommt - CHECK

SELECT *
FROM baris_table
WHERE weather_station_name  = 'Seattle / South Park'
ORDER BY weather_date ASC;
