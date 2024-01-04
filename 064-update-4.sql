-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-11-18
-- File: 064-update-4.sql

-- Update John Doe's city to Miami using id
UPDATE PERSON
SET city = 'Miami'
WHERE id = (SELECT id FROM PERSON WHERE last = 'Doe' AND first = 'John');

-- End of file
