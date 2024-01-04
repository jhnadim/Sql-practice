-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-10-22
-- File: 021-domain-constraint-in-person-table.sql

-- Create PERSON table with domain constraints
CREATE TABLE PERSON (
    id INTEGER PRIMARY KEY NOT NULL UNIQUE,
    last VARCHAR(255) NOT NULL,
    first VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL CHECK (LENGTH(phone) > 5),  -- Constraint: PHONE NUMBER is longer than 5 characters
    dob DATE CHECK (YEAR(dob) > 1930),                      -- Constraint: DOB is later than year 1930
    city VARCHAR(255),
    address VARCHAR(255),
    FOREIGN KEY (phone) REFERENCES PHONE(id)
);

-- Successful INSERTs
INSERT INTO PHONE (id, number, comment)
VALUES (1, '+1 111 222 333', 'work');

INSERT INTO PERSON (id, last, first, phone, dob, city, address)
VALUES (1, 'Doe', 'John', '+11111', '1980-01-01', 'New York', '12th Street');

-- Failed INSERT (Phone number is not longer than 5 characters)
INSERT INTO PERSON (id, last, first, phone, dob, city, address)
VALUES (2, 'Jordan', 'Mike', '123', '1990-05-15', 'Washington', 'South Park Bd 3');

-- Failed INSERT (DOB is earlier than 1930)
INSERT INTO PERSON (id, last, first, phone, dob, city, address)
VALUES (3, 'Durak', 'Stephen', '+123456', '1925-08-20', 'Florida', 'Sea Drive 112');

-- End of file
