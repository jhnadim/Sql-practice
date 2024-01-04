-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-10-20
-- File: 012-foreign-key-between-lecturer-and-course.sql

-- Create COURSE table
CREATE TABLE COURSE (
    id INTEGER PRIMARY KEY NOT NULL UNIQUE,         
    credits INTEGER NOT NULL,                        
    date_begin DATE NOT NULL,                       
    duration INTEGER NOT NULL,                       
    name VARCHAR(255) NOT NULL                       
);

-- Create LECTURER table
CREATE TABLE LECTURER (
    id INTEGER PRIMARY KEY NOT NULL UNIQUE,          
    name VARCHAR(255) NOT NULL,                      
    course INTEGER NOT NULL,                         -- Foreign key referencing COURSE.id
    FOREIGN KEY (course) REFERENCES COURSE(id)       -- Foreign key constraint
);

-- Successful INSERTs into COURSE table
INSERT INTO COURSE (id, credits, date_begin, duration, name)
VALUES (1, 3, '2020-01-10', 9, 'Economy');          -- Inserting data for Economy course

INSERT INTO COURSE (id, credits, date_begin, duration, name)
VALUES (2, 5, '2020-02-15', 15, 'Mathematics');     -- Inserting data for Mathematics course

INSERT INTO COURSE (id, credits, date_begin, duration, name)
VALUES (3, 2, '2020-02-20', 6, 'Biology');          -- Inserting data for Biology course

-- Successful INSERTs into LECTURER table
INSERT INTO LECTURER (id, name, course)
VALUES (1, 'John Doe', 1);                           -- John Doe lecturing in Economy course

INSERT INTO LECTURER (id, name, course)
VALUES (2, 'Jane Doe', 2);                           -- Jane Doe lecturing in Mathematics course

INSERT INTO LECTURER (id, name, course)
VALUES (3, 'Richard Roe', 3);                        -- Richard Roe lecturing in Biology course

-- End of file
