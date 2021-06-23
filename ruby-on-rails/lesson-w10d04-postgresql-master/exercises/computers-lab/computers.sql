-- Open up psql and create a sql_lab database if you haven't already done so. 
-- If you already have a sql_lab database, no need to create it again.

CREATE TABLE computers (
  id SERIAL PRIMARY KEY,
  make VARCHAR NOT NULL,
  model VARCHAR NOT NULL,
  cpu_speed INT NOT NULL
);
-- Write SQL commands under the prompts below, and run the file to get results.

-- In case there is already a computers table, drop it

-- Create a computers table


-- The table should have id, make, model, cpu_speed, memory_size,
--  price, release_date, photo_url, storage_amount, number_usb_ports,
--  number_firewire_ports, number_thunderbolt_ports


-- Insert 4 computers into the computers table
INSERT INTO computers (make, model, cpu_speed) VALUES ('Apple', 'MacBook', 10);


-- Select all entries from the computers table


-- HUNGRY FOR MORE? 
-- Look at this afternoon's instructor notes and read on altering tables before attempting below

-- Alter the computers_models, removing the storage_amount column
-- and add storage_type and storage_size columns
