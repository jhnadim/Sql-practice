-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-11-14
-- File: 052-index-weather-2.sql

-- Create an index on the 'high' column in the 'WEATHER' table
CREATE INDEX weather__high_index
ON WEATHER (high);

-- End of file
