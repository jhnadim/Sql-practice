-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-11-13
-- File: 043-index-team-remove.sql

-- Remove the 'team__name_index' index from the 'TEAM' table
DROP INDEX IF EXISTS team__name_index;

-- Remove the 'team__owner_index' index from the 'TEAM' table
DROP INDEX IF EXISTS team__owner_index;

-- End of file
