-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-11-18
-- File: 071-alter-1.sql

-- Increase sizes of 'item' and 'comment' columns by 100 characters
ALTER TABLE INVENTORY
ALTER COLUMN item TYPE VARCHAR(255 + 100),
ALTER COLUMN comment TYPE VARCHAR(255 + 100);

-- End of file
