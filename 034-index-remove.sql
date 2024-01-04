-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-11-12
-- File: 034-index-remove.sql

-- Remove the index from the 'first' column in the 'PERSON' table
DROP INDEX IF EXISTS users__first_index;

DROP INDEX IF EXISTS users__last_index;

-- Remove the index from the 'number' column in the 'PHONE' table
DROP INDEX IF EXISTS phone__number_index;

-- End of file
