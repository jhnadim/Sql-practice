-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-10-10
-- File: 011-foreign-key-between-person-and-phone.sql

-- Create PERSON table
CREATE TABLE PERSON (
    id INTEGER PRIMARY KEY NOT NULL UNIQUE,
    last VARCHAR(255) NOT NULL,
    first VARCHAR(255) NOT NULL,
    phone INTEGER NOT NULL,
    city VARCHAR(255),
    address VARCHAR(255),
    FOREIGN KEY (phone) REFERENCES PHONE(id)
);

-- Create PHONE table
CREATE TABLE PHONE (
    id INTEGER PRIMARY KEY NOT NULL UNIQUE,
    number VARCHAR(255) NOT NULL,
    comment VARCHAR(255)
);

-- Successful INSERTs
INSERT INTO PHONE (id, number, comment)
VALUES (1, '+1 111 222 333', 'work');

INSERT INTO PERSON (id, last, first, phone, city, address)
VALUES (1, 'Doe', 'John', 1, 'New York', '12th Street');

-- Failed INSERT
-- The phone value '2' does not exist in the PHONE table
-- You can either insert '2' into the PHONE table first or use an existing valid phone id
INSERT INTO PERSON (id, last, first, phone, city, address)
VALUES (2, 'Jordan', 'Mike', 2, 'Washington', 'South Park Bd 3');

-- End of file
