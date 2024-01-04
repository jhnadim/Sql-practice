-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-11-18
-- File: 073-alter-3.sql

-- Remove NOT NULL attribute and increase size of 'item' column by 100 characters
ALTER TABLE INVENTORY
ALTER COLUMN item TYPE VARCHAR(255 + 100) DROP NOT NULL;

-- End of file
