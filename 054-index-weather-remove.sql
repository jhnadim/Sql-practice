-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-11-16
-- File: 054-index-weather-remove.sql

-- remove all created indexes from the WEATHER table

DROP INDEX IF EXISTS weather__time_of_reading_index ON WEATHER;

DROP INDEX IF EXISTS weather__high_index ON WEATHER;

DROP INDEX IF EXISTS weather__low_index ON WEATHER;

-- End of file
