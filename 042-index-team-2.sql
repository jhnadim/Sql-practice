-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-11-13
-- File: 042-index-team-2.sql

--index on owner column
CREATE INDEX team__owner_index ON TEAM (owner);

-- End of file
