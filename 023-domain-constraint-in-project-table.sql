-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-10-25
-- File: 023-domain-constraint-in-project-table.sql

-- Create PROJECT table with domain constraints
CREATE TABLE PROJECT (
    id INTEGER PRIMARY KEY NOT NULL UNIQUE,
    project_name VARCHAR(255) NOT NULL CHECK (LENGTH(project_name) > 5),     
    manager_name VARCHAR(255) NOT NULL CHECK (LENGTH(manager_name) > 5),    
    manager_phone VARCHAR(255) NOT NULL,                                     -- Assuming a phone number can have various formats, no specific constraint on length
    manager_job_title VARCHAR(255) CHECK (
        manager_job_title IN ('sales manager', 'office manager', 'facilities manager', 'business manager')
    )                                                                       -- Constraint: JOB TITLE is one of the accepted values
);

--INSERTS
-- Failed: PROJECT NAME is too short
INSERT INTO PROJECT (project_name, manager_name, manager_phone, job_title)
VALUES ('Proj', 'John Doe', '+123456789', 'sales manager');

-- Failed: MANAGER's name is too short
INSERT INTO PROJECT (project_name, manager_name, manager_phone, job_title)
VALUES ('Project1', 'Jane', '+123456789', 'office manager');

-- Failed: JOB TITLE unaccepted value
INSERT INTO PROJECT (project_name, manager_name, manager_phone, job_title)
VALUES ('Project2', 'Bob Manager', '+123456789', 'manager');

-- Successful:
INSERT INTO PROJECT (project_name, manager_name, manager_phone, job_title)
VALUES ('Project3', 'Alice Manager', '+123456789', 'business manager');

-- End of file
