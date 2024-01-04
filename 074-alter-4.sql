-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-11-19
-- File: 074-alter-4.sql

-- Modify 'comment' column to use default value "No comment" and allow NULL values
ALTER TABLE INVENTORY
ALTER COLUMN comment TYPE VARCHAR(255 + 100) DEFAULT 'No comment';

-- End of file
