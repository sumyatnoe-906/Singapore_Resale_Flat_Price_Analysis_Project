#Create a database for Singapore resale flat prices.
CREATE DATABASE IF NOT EXISTS SG_resale_flat_prices;

#Declare the name of the database to be used.
USE SG_resale_flat_prices;

#Create Table first before importing the data.
CREATE TABLE ResaleFlatPrices (
    month VARCHAR(100),
    town VARCHAR(50),
    flat_type VARCHAR(20),
    block VARCHAR(10),
    street_name VARCHAR(100),
    storey_range VARCHAR(20),
    floor_area_sqm DECIMAL(6,2),
    flat_model VARCHAR(50),
    lease_commence_date INT,
    remaining_lease VARCHAR(50),
    resale_price DECIMAL(12,2)
);

#Import data(CSV File) into the created table.
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ResaleFlatPrices_1990_Onwards.csv'
INTO TABLE ResaleFlatPrices
FIELDS TERMINATED BY ',' -- split columns by commas
LINES TERMINATED BY '\n' -- one row = one line in the CSV
IGNORE 1 ROWS; -- skip the header role.

#Retrieve the table to check if it contains valid data.
SELECT *
FROM ResaleFlatPrices;

#Count the number of records to check if they match the data points in the CSV file.
SELECT COUNT(*)
FROM ResaleFlatPrices;

#Safety feature in MYSQL <When you intentionally want to update all rows(like removing quotes from every records), workbench blocks it because it looks risky>
SET SQL_SAFE_UPDATES = 0;

#Removed all double quotes(") from each field in every records.
-- town field
UPDATE ResaleFlatPrices
SET town = REPLACE(town, '"', '')
WHERE town LIKE '%"%';

-- month field
UPDATE ResaleFlatPrices
SET month = REPLACE(month, '"', '')
WHERE month LIKE '%"%';

-- block field
UPDATE ResaleFlatPrices
SET block = REPLACE(block, '"','')
WHERE block LIKE '%"%';

-- flat_type field
UPDATE ResaleFlatPrices
SET flat_type = REPLACE(flat_type, '"','')
WHERE flat_type LIKE '%"%';

-- street_name field
UPDATE ResaleFlatPrices
SET street_name = REPLACE(street_name, '"','')
WHERE street_name LIKE '%"%';

-- storey_range field
UPDATE ResaleFlatPrices
SET storey_range = REPLACE(storey_range, '"','')
WHERE storey_range LIKE '%"%';


-- flat_model field
UPDATE ResaleFlatPrices
SET flat_model = REPLACE(flat_model, '"','')
WHERE flat_model LIKE '%"%';

-- remaining_lease field
UPDATE ResaleFlatPrices
SET remaining_lease = REPLACE(remaining_lease, '"','')
WHERE remaining_lease LIKE '%"%';

#Retrieve the table to check if it has the valid data.
SELECT *
FROM resaleflatprices;

#Re-count to check if they match the data points in the CSV file.
SELECT COUNT(*)
FROM resaleflatprices;

#Date Formatting
UPDATE resaleFlatPrices
SET month = CASE
			WHEN month LIKE '%/%/%' 
				THEN DATE_FORMAT(STR_TO_DATE(month, '%m/%d/%Y'), '%Y-%m')
			WHEN month LIKE '%-%' 
				THEN DATE_FORMAT(STR_TO_DATE(CONCAT(month,'-01'), '%Y-%m-%d'), '%Y-%m')
			ELSE NULL
			END;

#Retrieve the table to check if it has the valid data.
SELECT *
FROM resaleflatprices;

#Access detailed HDB resale price and transaction data from 1990 to 2025. 
#Prior to March 2012, the data are based on the date of approval for the resale transactions.
#From March 2012 onwards, the data are based on the date of registration of the resale transactions.

#Adds a new column date_type to classify the type of date.
ALTER TABLE resaleflatprices ADD COLUMN date_type VARCHAR(20);

#Marks records before March 2012 as Approval Date.
UPDATE resaleflatprices
SET date_type = 'Approval Date'
WHERE month < '2012-03';
SET SQL_SAFE_UPDATES = 0;
#Marks records from March 2012 onwards as Registration Date.
UPDATE resaleflatprices
SET date_type = 'Registration Date'
WHERE month >= '2012-03';

#Retrieve the table to check if it has the added data.
SELECT *
FROM resaleflatprices;
		
#Retrieve the folder path to save.
SHOW VARIABLES LIKE 'secure_file_priv';

#Export locally the cleaned data as csv file.
SELECT * FROM resaleFlatPrices
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\ResaleFlatPrices_1990_Onwards(Latest).csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';


