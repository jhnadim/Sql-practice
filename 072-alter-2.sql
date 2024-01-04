-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-11-18
-- File: 072-alter-2.sql

-- Add NOT NULL attribute to the 'item' column
ALTER TABLE INVENTORY
ALTER COLUMN item SET NOT NULL;

-- End of file
