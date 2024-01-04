-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-11-13
-- File: 051-index-weather-1.sql

-- Create an index on the 'time_of_reading' column in the 'WEATHER' table
CREATE INDEX weather__time_of_reading_index
ON WEATHER (time_of_reading);

-- End of file
