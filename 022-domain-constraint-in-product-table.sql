-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-10-25
-- File: 022-domain-constraint-in-product-table.sql

-- Create PRODUCT table with domain constraints
CREATE TABLE PRODUCT (
    id INTEGER PRIMARY KEY NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL CHECK (LENGTH(name) > 4),              -- Constraint: NAME is longer than 4 characters
    description VARCHAR(255) NOT NULL CHECK (LENGTH(description) > 10), 
    weight DECIMAL(10, 2) CHECK (weight > 0),                        -- Constraint: WEIGHT is a positive number
    sell_price DECIMAL(10, 2) CHECK (sell_price > 0),                -- Constraint: SELL PRICE is greater than 0
    net_price DECIMAL(10, 2) CHECK (net_price < sell_price),        
    -- Additional columns for other product information
);

-- Successful INSERTs
INSERT INTO PRODUCT (id, name, description, weight, sell_price, net_price)
VALUES (1, 'Product1', 'Description1', 2.5, 10.99, 8.99);

-- Failed INSERT (Name is not longer than 4 characters)
INSERT INTO PRODUCT (id, name, description, weight, sell_price, net_price)
VALUES (2, 'Prod', 'Description2', 1.8, 15.99, 12.99);

-- Failed INSERT (Description is not longer than 10 characters)
INSERT INTO PRODUCT (id, name, description, weight, sell_price, net_price)
VALUES (3, 'Product3', 'Desc', 3.2, 20.99, 18.99);

-- Failed INSERT (Weight is not a positive number)
INSERT INTO PRODUCT (id, name, description, weight, sell_price, net_price)
VALUES (4, 'Product4', 'Description4', -2.0, 25.99, 22.99);

-- Failed INSERT (Sell price is not greater than 0)
INSERT INTO PRODUCT (id, name, description, weight, sell_price, net_price)
VALUES (5, 'Product5', 'Description5', 4.5, 0.0, 3.99);

-- Failed INSERT (Net price is not lower than sell price)
INSERT INTO PRODUCT (id, name, description, weight, sell_price, net_price)
VALUES (6, 'Product6', 'Description6', 5.0, 30.99, 35.99);

-- End of file
