-- ============================================================================
-- Layer: Bronze (Raw Ingestion / Staging)
-- Description: Truncating target tables and performing bulk data loads from 
--              source CSV files using LOAD DATA LOCAL INFILE.
-- ============================================================================

-- 1. Load Data into Raw Claims Type Table
TRUNCATE TABLE mc_bronze.claim_type;

LOAD DATA LOCAL INFILE '/Users/yeswanthbattina/Downloads/sample type claim.csv'
INTO TABLE mc_bronze.claim_type
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 2. Load Data into Raw Motor Vehicle Insurance Data Table
TRUNCATE TABLE mc_bronze.mv_insurance;

LOAD DATA LOCAL INFILE '/Users/yeswanthbattina/Downloads/Motor vehicle insurance data.csv'
INTO TABLE mc_bronze.mv_insurance
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
