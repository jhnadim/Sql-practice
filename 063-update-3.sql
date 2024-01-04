-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-11-17
-- File: 063-update-3.sql

-- Change Stephen's city to Denver using a subquery
UPDATE PERSON
SET city = 'Denver'
WHERE id = (SELECT id FROM PERSON WHERE last = 'Durak' AND first = 'Stephen');

-- End of file
