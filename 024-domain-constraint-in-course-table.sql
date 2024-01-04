-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-10-26
-- File: 024-domain-constraint-in-course-table.sql

-- Create COURSE table with domain constraints
CREATE TABLE COURSE (
    id INTEGER PRIMARY KEY NOT NULL UNIQUE,
    credits INTEGER CHECK (credits BETWEEN 1 AND 30),                     -- Constraint: CREDIT range is between 1 and 30, inclusive
    date_begin DATE NOT NULL,
    duration INTEGER CHECK (duration > 0),                               -- Constraint: DURATION must be a positive integer and not zero
    name VARCHAR(255) NOT NULL
);

-- Successful INSERTs
INSERT INTO COURSE (id, credits, date_begin, duration, name)
VALUES (1, 3, '2022-01-10', 9, 'Economy');

-- Failed INSERT (Credit range is less than 1)
INSERT INTO COURSE (id, credits, date_begin, duration, name)
VALUES (2, 0, '2022-02-15', 15, 'Mathematics');

-- Failed INSERT (Credit range is greater than 30)
INSERT INTO COURSE (id, credits, date_begin, duration, name)
VALUES (3, 35, '2022-02-20', 6, 'Biology');

-- Failed INSERT (Duration is zero)
INSERT INTO COURSE (id, credits, date_begin, duration, name)
VALUES (4, 5, '2022-02-20', 0, 'Computer Science');

-- End of file
