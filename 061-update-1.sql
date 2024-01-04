-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-11-16
-- File: 061-update-1.sql

-- Change John Doe's address
UPDATE PERSON
SET address = '21th Street'
WHERE last = 'Doe' AND first = 'John';

-- End of file
