/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/
-- Switch to the 'master' system database, which allows us to manage other databases
USE master;
GO -- Ends the batch that switches database context

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse') 
    -- Set the database to SINGLE_USER mode to forcefully disconnect any active connections
    -- 'WITH ROLLBACK IMMEDIATE' ensures any open transactions are rolled back
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    -- Drop (delete) the existing 'DataWarehouse' database
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO -- Ends the batch that creates a new DB

-- Switch context to use the newly created 'DataWarehouse' database
USE DataWarehouse;
GO -- Starts using the new DB

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
