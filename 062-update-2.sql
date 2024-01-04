-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-11-17
-- File: 062-update-2.sql

-- Change phone number for Mike Jordan
UPDATE PERSON
SET phone = (SELECT id FROM PHONE WHERE number = '+1 222 333 444')
WHERE last = 'Jordan' AND first = 'Mike';

-- OR Update Mike Jordan's phone number
UPDATE PHONE
SET number = '+1 222 333 444'
WHERE id = 2;  -- Assuming Mike Jordan's phone entry has an id of 2

-- End of file
