/* =========
   Task 2
   ========= */

-- find the data types of columns
DESC staging.weather; 

DESC 
SELECT 
  sunriseTime,
  sunsetTime,
  temperatureHighTime,
  temperatureLowTime,
  windGustTime,
  precipIntensityMaxTime
FROM staging.weather;

-- show the UNIX values of these columns
-- the values are the numbers of seconds counted from a reference time point (1970-01-01 00:00:00)
SELECT 
  sunriseTime,
  sunsetTime,
  temperatureHighTime,
  temperatureLowTime,
  windGustTime,
  precipIntensityMaxTime
FROM staging.weather;

/* ========
   Task 3
   ======== */

-- each row in the dataset contains weather data for each combination of Country/Region, Province/State and date (time column)
-- it's important to understand which columns can be used to uniquely identify each row
-- use aggregation function together with group by 
SELECT 
  "Country/Region" AS Country, -- use of "" for column names
  "Province/State" AS State,
  COUNT(*) AS Nr_Records,
FROM staging.weather
GROUP BY Country, State -- you can use the original column names
ORDER BY Country, State; 

/* ========
   Task 4
   ======== */
SELECT 
  to_timestamp(sunriseTime) AS sunrise_utc, -- this function transform numberic columns to timestamp
  to_timestamp(sunriseTime) AT TIME ZONE 'Europe/Stockholm' AS sunrise_swtime,
  to_timestamp(sunsetTime) AS sunset_utc,
  to_timestamp(sunsetTime) AT TIME ZONE 'Europe/Stockholm' AS sunset_swtime,
FROM staging.weather
WHERE "Country/Region" = 'Sweden'; -- note the use of single and double quotations