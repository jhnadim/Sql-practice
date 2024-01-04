-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-11-15
-- File: 053-index-weather-3.sql

-- Create an index on the 'low' column in the 'WEATHER' table
CREATE INDEX weather__low_index
ON WEATHER (low);

-- End of file
